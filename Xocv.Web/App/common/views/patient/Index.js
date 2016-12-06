// Generated by CoffeeScript 1.11.1
(function() {
  (function() {
    return $(function() {
      var _jtable, _service, form;
      _service = abp.services.app.patient;
      _jtable = {
        title: app.localize('Patients'),
        paging: true,
        sorting: true,
        multiSorting: false,
        actions: {
          listAction: {
            method: _service.getList
          }
        },
        fields: {
          id: {
            key: true,
            list: false
          },
          clinicianId: {
            key: true,
            list: false
          },
          firstName: {
            title: app.localize('FirstName'),
            width: ''
          },
          lastName: {
            title: app.localize('LastName'),
            width: ''
          },
          socialSecurityNumber: {
            title: 'Security Number',
            width: ''
          },
          gender: {
            title: 'Gender',
            width: ''
          },
          language: {
            title: 'Language',
            width: ''
          },
          payor: {
            title: 'Payor',
            width: ''
          },
          actions: {
            title: '',
            width: '1%',
            sorting: false,
            display: function(data) {
              form._Table[data.record.id] = data.record;
              return $("<div class='person-buttons' style='width:78px'> <button class='btn btn-circle btn-icon-only green _actionButton' title='" + (app.localize('Edit')) + "' data-action='modal' data-modal='edit' data-id='" + data.record.id + "' > <i class='icon-pencil'></i> </button> <button title='" + (app.localize('Delete')) + "' class='btn btn-circle btn-icon-only red _actionButton' data-action='delete' data-id='" + data.record.id + "'> <i class='icon-trash'></i> </button> </div>");
            }
          }
        }
      };
      form = new Form({
        service: _service,
        table: "#PatientsTable",
        jtable: _jtable,
        filterForm: "#filterForm",
        modal: "#patientModal",
        saveButton: "#SavePatientButton",
        formField: {
          id: "#Patient_ID",
          clinicianId: {
            element: "#Patient_ClinicianId",
            set: function() {
              return $("#Patient_ClinicianId").selectpicker('refresh');
            }
          },
          socialSecurityNumber: "#Patient_SocialSecurityNumber",
          firstName: "#Patient_FirstName",
          lastName: "#Patient_LastName",
          gender: "#Patient_Gender",
          language: "#Patient_Language",
          payor: "#Patient_Payor",
          dateOfBirth: {
            element: "#Patient_DateOfBirth",
            set: function(value) {
              return $("#Patient_DateOfBirth").datepicker('update', value);
            },
            get: function() {
              if ($("#Patient_Payor").val()) {
                return (new Date($("#Patient_DateOfBirth").val())).toISOString();
              }
            }
          }
        },
        formClean: "._formClean"
      });
      form.init();
      return $('body').on('click', '._actionButton', function(e) {
        var action, id;
        action = e.currentTarget.dataset.action;
        switch (action) {
          case 'search':
            form.getFilters();
            return form.getList();
          case 'save':
            return form.getForm();
          case 'modal':
            if (e.currentTarget.dataset.modal === 'create') {
              form.fillForm();
              form.$saveButton.find(".btnText").text(app.localize('Create'));
              return form.$Modal.modal('show');
            } else {
              id = e.currentTarget.dataset.id;
              form.fillForm(id);
              return form.$Modal.modal('show');
            }
            break;
          case 'delete':
            id = e.currentTarget.dataset.id;
            return swal({
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
            }, function() {
              return form.deleteItem(id);
            });
        }
      });
    });
  })();

}).call(this);

//# sourceMappingURL=Index.js.map
