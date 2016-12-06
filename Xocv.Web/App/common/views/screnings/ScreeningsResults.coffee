(->
	$(->

		_filters = {}

		$('.filterDD').getBySelect()

		$resultModal = $("#resultModal")
		_$resultsTable = $('#ScreeningsResultsTable')
		_resultService = abp.services.app.screening

		_permissions =
			create: abp.auth.hasPermission('Pages.Administration.Companies.Create'),
			edit: abp.auth.hasPermission('Pages.Administration.Companies.Edit'),
			list: abp.auth.hasPermission('Pages.Administration.Companies'),
			'delete': abp.auth.hasPermission('Pages.Administration.Companies.Delete')

		_createOrEditModal = new app.ModalManager(
			viewUrl: abp.appPath + 'Mpa/Users/CreateOrEditModal',
			scriptUrl: abp.appPath + 'Areas/Mpa/Views/Users/_CreateOrEditModal.js',
			modalClass: 'CreateOrEditUserModal'
		)

		userPermissionsModal = new app.ModalManager(
			viewUrl: abp.appPath + 'Mpa/Users/PermissionsModal',
			scriptUrl: abp.appPath + 'Areas/Mpa/Views/Users/_PermissionsModal.js',
			modalClass: 'UserPermissionsModal'
		)

		_$resultsTable.jtable
			title: app.localize('Screenings')
			paging: true,
			sorting: true,
			multiSorting: false,
			actions:
				listAction:
					method: _resultService.screeningsResults
			fields:
				id:
					key: true,
					sort: false,
					title: '#',
					width: '1%'
				dateTime:
					title: app.localize('DateTime')
					width: '10%'
					display: (data) ->
						date = new Date(data.record.dateTime)
						day = date.toLocaleDateString()
						time = date.toLocaleTimeString().replace(/\:\d{2}\ /, ' ')
						"#{day}</br>#{time}"
				account:
					title: app.localize('Account')
					width: '10%'
				patient:
					title: app.localize('Patient')
					width: '20%'
					display: (data) ->
						data.record.patient.fullName
				clinician:
					title: app.localize('Clinician')
					width: '20%'
				payor:
					title: app.localize('Payor')
					width: '10%'
					display: (data) ->
						data.record.patient.payor
				screening:
					title: app.localize('Screening')
					width: '10%'
					display: (data) ->
						data.record.typeScreening.type
				cost:
					title: app.localize('Cost')
					width: '10%'
				totalScore:
					title: app.localize('TotalScore')
					width: '2%'
					display: (data) ->
						backColor = data.record.resultRed
						color = if backColor == 'Yellow' then 'color: black; ' else ' '
						$("<div class='circle score-circle' style='background-color: #{backColor}; #{color}'>#{data.record.totalScore}</div>")
				result:
					title: app.localize('Result')
					width: '1%'
					display: (data) ->
						$span = $('<div style="width:130px;"></div>')
						# if (_permissions.edit)
						style = switch data.record.resultRed
							when 'Green'
								'success'
							when 'Yellow'
								'warning'
							when 'Red'
								'danger'
							else
								'default'
						title = "#{data.record.patient.fullName} / #{data.record.typeScreening.type} / #{data.record.totalScore}"
						$("<button class='btn btn-default btn-xs _actionButton' title='View' type='button' data-action='modal'
              aria-label='Left Align' data-id='#{data.record.id}' data-title='#{title}' data-style='#{style}'>
              <span class='glyphicon glyphicon-modal-window' aria-hidden='true'></span>
              View
            </button>")
							.appendTo($span)
							reports = data.record.reports;
							pdfButton
							if (typeof reports != 'undefined' && reports.length > 0)
								pdfButton = $('<a class="btn btn-default btn-xs" title="PDF" target="_blank" href="' + reports[reports.length - 1].url + '">PDF</a>')
							else
								pdfButton = $('<a class="btn btn-default btn-xs" title="PDF" target="_blank" href="#">PDF</a>')
						pdfButton
							.appendTo($span)
							.click(() ->)
						$span

		ScreeningsResults = (reload) ->
			if (reload)
				_$resultsTable.jtable('reload')
			else
#				console.log(JSON.stringify(_filters))
				_$resultsTable.jtable('load', _filters)

		abp.event.on('app.createOrEditUserModalSaved', () ->
			getCompanies(true)
		)

		ScreeningsResults()

		getScreeningResultByID = (id, title, style) ->
			$resultModal
				.find('.modal-content').addClass("panel-#{style}").data('style', style).end()
				.find('.modal-title').html(title).end()
				.modal('show')
			$modalBody = $('<div></div>')
			_resultService.getAllFullScreening({id: id})
			.then((data) ->
#				console.log('getScreeningResultByID', data)
				questions = data.typeScreening.questions
				for question in questions
					$("</br><h4>#{question.questionStr}</h4>").appendTo($modalBody)
					for answer in question.answers
						checked = if answer.select then 'checked' else ''
						$radio = $("<div class='radio disabled'>
                <label>
                  <input type='radio' name='answer_#{answer.id}' id='optionsRadios3' value='option3' disabled #{checked}>
                  #{answer.optionStr}
                </label>
              </div>")
#              $("<#{tag}>#{answer.optionStr}</#{tag}></br>").appendTo($modalBody)
						$radio.appendTo($modalBody)
				$resultModal
					.find('.progress').fadeOut().end()
					.find('#result').html($modalBody).fadeIn()
			)

		$('body').on('click', '._actionButton', (e)->
			action = $(e.currentTarget).data('action')
#			console.log(action)
			switch (action)
				when 'dateFilter'
					target = $(e.currentTarget)
					if target.hasClass('active')
						target.removeClass('active')
						filter = undefined
					else
						$('._actionButton.active').removeClass('active')
						target.addClass('active')
						filter = e.currentTarget.dataset.filter
					_filters.dateFilter = filter
					getFilters()
					ScreeningsResults()
#					console.log('\t' + filter)
				when 'modal'
					id = e.currentTarget.dataset.id
					title = e.currentTarget.dataset.title
					style = e.currentTarget.dataset.style
#					console.log('\t' + id, style)
					getScreeningResultByID(id, title, style)
		)

		$("#searchButton").on('click', () ->
			getFilters()
			ScreeningsResults()
		)

		getFilters = () ->
			tempObj =
				practice: $('#filterPractice').val() || undefined
				screening: $('#filterScreening').val() || undefined
				name: $('#filterName').val() || undefined
				start: $('#filterStart').val() || undefined
				end: $('#filterEnd').val() || undefined
			Object.assign(_filters, tempObj)

		$resultModal.on('hidden.bs.modal', (e) ->
			$resultModal
				.find('.modal-content').removeClass(()->'panel-'+$(this).data('style')).end()
				.find('#result').hide().end()
				.find('.progress').show()
		)
	))()