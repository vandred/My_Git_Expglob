(->
	$(->
#		console.log(abp.services.app.patient)

		_service = abp.services.app.patient

		_jtable =
			title: app.localize('Patients')
			paging: true,
			sorting: true,
			multiSorting: false,
			actions:
				listAction:
					method: _service.getList
#				createAction: '/GettingStarted/CreatePerson',
#				updateAction: '/GettingStarted/UpdatePerson',
#				deleteAction: '/GettingStarted/DeletePerson'
			fields:
				id:
					key: true,
					list: false
				clinicianId:
					key: true
					list: false
				firstName:
					title: app.localize('FirstName'),
					width: ''
				lastName:
					title: app.localize('LastName'),
					width: ''
				socialSecurityNumber:
					title: 'Security Number'
					width: ''
				gender:
					title: 'Gender'
					width: ''
				language:
					title: 'Language'
					width: ''
				payor:
					title: 'Payor'
					width: ''
				actions:
					title: ''
					width: '1%'
					sorting: false
					display: (data) ->
						form._Table[data.record.id] = data.record
						$("<div class='person-buttons' style='width:78px'>
							<button class='btn btn-circle btn-icon-only green _actionButton' title='#{app.localize('Edit')}'
											data-action='modal' data-modal='edit' data-id='#{data.record.id}' >
								<i class='icon-pencil'></i>
							</button>
							<button title='#{app.localize('Delete')}' class='btn btn-circle btn-icon-only red _actionButton'
								  data-action='delete' data-id='#{data.record.id}'>
								<i class='icon-trash'></i>
							</button>
						</div>")

		form = new Form(
			service: _service
			table: "#PatientsTable",
			jtable: _jtable
			filterForm: "#filterForm",
			modal: "#patientModal",
			saveButton: "#SavePatientButton",
			formField: #"._formFill",
				id: "#Patient_ID"
				clinicianId:
					element: "#Patient_ClinicianId"
					set: () ->
						$("#Patient_ClinicianId").selectpicker('refresh')
				socialSecurityNumber: "#Patient_SocialSecurityNumber"
				firstName: "#Patient_FirstName"
				lastName: "#Patient_LastName"
				gender: "#Patient_Gender"
				language: "#Patient_Language"
				payor: "#Patient_Payor"
				dateOfBirth:
					element: "#Patient_DateOfBirth"
					set: (value) ->
						$("#Patient_DateOfBirth").datepicker('update', value)
					get: () ->
						(new Date($("#Patient_DateOfBirth").val())).toISOString() if $("#Patient_Payor").val()
			formClean: "._formClean",
		)
		form.init()

#		$('.filterDD').getBySelect()

#		EVENTS

		#		$('#CreateNewPatientButton').click (e) ->
		#			e.preventDefault()
		#			location.href = abp.appPath + 'Mpa/Patient/Create'
		#			@$Modal.modal('show')


		$('body').on('click', '._actionButton', (e)->
#			_target = $(e.currentTarget)
			action = e.currentTarget.dataset.action
#			console.log(action)
			switch (action)
				when 'search'
					form.getFilters()
					form.getList()
				when 'save'
					form.getForm()
#				when 'create'
#					getForm()
#				when 'edit'
#					getForm(true)
				when 'modal'
					if e.currentTarget.dataset.modal == 'create'
						form.fillForm()
						form.$saveButton.find(".btnText").text(app.localize('Create'))
						form.$Modal.modal('show')
					else
						id = e.currentTarget.dataset.id
						form.fillForm(id)
						form.$Modal.modal('show')
				when 'delete'
					id = e.currentTarget.dataset.id
					swal(
						{
							title: "Are you sure?",
							text: "Your will not be able to recover this imaginary file!",
							type: "warning",
							showCancelButton: true,
							cancelButtonColor: 'blue',
							cancelButtonText: app.localize("Cancel"),
							confirmButtonClass: "btn-danger",
							confirmButtonColor: 'red',
							confirmButtonText: app.localize("Delete"),
							closeOnConfirm: false
						},
						() ->
							form.deleteItem(id)
					)
		)

	))()