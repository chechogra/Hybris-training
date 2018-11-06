ACC = ACC || {};

ACC.csvimport.bindImportCSVActions = function() {
    $('#chooseFileButton').on('click', function (event) {
        ACC.csvimport.clearGlobalAlerts();
    });

    $('#importButton').on('click', function (event) {
        event.preventDefault();
        ACC.csvimport.clearGlobalAlerts();

        if (!($('.js-file-upload__input').val().trim().length > 0)) {
            ACC.csvimport.displayGlobalAlert({type: 'error', messageId: 'import-csv-no-file-chosen-error-message'});
            return;
        }

        var selectedFile = document.getElementById('csvFile').files[0];
        if (!ACC.csvimport.isSelectedFileValid(selectedFile)) {
            return;
        }

        var form = document.getElementById('importCSVSavedCartForm');
        var formData = new window.FormData(form);
        formData.append("csvFile", selectedFile);

        ACC.csvimport.displayGlobalAlert({type: 'warning', messageId: 'import-csv-upload-message'});
        ACC.csvimport.enableDisableActionButtons(false);

        $.ajax({
            url: form.action,
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function() {
                ACC.csvimport.displayGlobalAlert({type: 'info', message: ''});
                $('#import-csv-alerts .alert-info > .tc-global-message-wp').append($('#import-csv-success-message').html());
                ACC.csvimport.clearChosenFile();
            },
            error: function(jqXHR) {
                if (jqXHR.status == 400) {
                    if (jqXHR.responseJSON) {
                        ACC.csvimport.displayGlobalAlert({type: 'error', message: jqXHR.responseJSON});
                        return;
                    }
                }

                ACC.csvimport.displayGlobalAlert({type: 'error', messageId: 'import-csv-generic-error-message'});
            },
            complete: function() {
                ACC.csvimport.enableDisableActionButtons(true);
            }
        });
    });
};
