class window.Form

	constructor: (params) ->
##		console.log('constructor')
		@_Filters = {}
		@_Table = {}
		@_Service = params.service
		@jtable = params.jtable
		@$Table = $(params.table)
		@$filterForm = $(params.filterForm)
		@$Modal = $(params.modal)
		@_FormField = params.formField
		@sFormClean = params.formClean
		@$saveButton = $(params.saveButton)

	init: (params) ->
#		@initTable()
		@$Table.jtable(@jtable)
		@getList()

	getList: () ->
##		console.log(JSON.stringify(@_Filters))
		@$Table.jtable('load', @_Filters )

	resetList: () ->
		@$Table.jtable('load', {})

	updateList: () ->
		@$Table.jtable('reload')

	getFilters: () ->
		tempObj =
			OrganisationUnitId: $('#filterClinicianId').val() || undefined
			filterName: $('#filterName').val() || undefined
			filterSecurity: $('#filterSecurity').val() || undefined
			filterGender: $('#filterGender').val() || undefined
			filterLanguage: $('#filterLanguage').val() || undefined
			filterPayor: $('#filterPayor').val() || undefined
		Object.assign(@_Filters, tempObj)

	fillForm: (id) ->
		data = @_Table[id] || {}
		#		console.log(data)
		#		$("#Patient_ID").val(data.id || '')
		#		$("#Patient_ClinicianId").val(data.clinicianId).selectpicker('refresh' || '')
		#		$("#Patient_SocialSecurityNumber").val(data.socialSecurityNumber || '')
		#		$("#Patient_FirstName").val(data.firstName || '')
		#		$("#Patient_LastName").val(data.lastName || '')
		#		$("#Patient_Gender").val(data.gender || '')
		#		$("#Patient_Language").val(data.language || '')
		#		$("#Patient_Payor").val(data.payor || '')
		#		$("#Patient_DateOfBirth").val(data.dateOfBirth || '')
		#			@$saveButton.attr('data-action', 'edit').find(".btnText").text(app.localize('Save'))
		for field, obj of @_FormField
			value = data[field]
			if typeof obj == 'string'
				$(obj).val(value || '')
			if typeof obj == 'object'
#				console.log(obj, value)
				if obj.element
					$(obj.element).val(value || '')
				if obj.set
					obj.set(value, field, data)
		@$saveButton.find(".btnText").text(app.localize('Save'))

	getForm: (edit) ->
#		data =
#			clinicianId: $("#Patient_ClinicianId").val() || undefined
#			socialSecurityNumber: $("#Patient_SocialSecurityNumber").val() || undefined
#			firstName: $("#Patient_FirstName").val() || undefined
#			lastName: $("#Patient_LastName").val() || undefined
#			gender: $("#Patient_Gender").val() || undefined
#			language: $("#Patient_Language").val() || undefined
#			payor: $("#Patient_Payor").val() || undefined
#			dateOfBirth: $("#Patient_DateOfBirth").val() || undefined
#			id: $("#Patient_ID").val() || undefined
		data = {}
		for field, obj of @_FormField
			if typeof obj == 'string'
				data[field] = $(obj).val() || undefined
			if typeof obj == 'object'
				if obj.element
					data[field] = $(obj.element).val() || undefined
				if obj.get
					data[field] = obj.get()
#		console.log(JSON.stringify(data), edit)
		@sendForm(data)

	sendForm: (data) ->
		@$Modal
			.find('.result').addClass('hidden').end()
			.find('.progress').removeClass('hidden')
		@_Service.createOrUpdate(data)
		.then (data) =>
#				console.log('Success', data)
			if data.id
				@resetList()
				@clearFilters()
			else
				@updateList()
			@$Modal.modal('hide')
			swal(app.localize('Ok'), app.localize("Data saved!"), "success")
		.fail (data) =>
			try
				console.error('ERROR:', data)
			catch e
				console.log('ERROR:', data)
		.always () =>
			@$Modal
				.find('.progress').addClass('hidden').end()
				.find('.result').removeClass('hidden')

	deleteItem: (id) ->
		@_Service.delete({id: id})
		.then (data) =>
#				console.log(data)
			@updateList()
			swal("Deleted!", "Your imaginary file has been deleted.", "success")
		.fail (data) =>
			try
				console.error('ERROR:', data)
			catch e
				console.log('ERROR:', data)

	clearFilters: () ->
		@$filterForm.find(@sFormClean).val('')
		#filterClinicianId # filterName #filterSecurity #filterGender #filterLanguage #filterPayor
