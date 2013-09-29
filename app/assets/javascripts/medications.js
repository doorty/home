$(document).on('ready page:change', function() {

  // demo code
  $("#add-medication-title").click(function() {

    $("#medication_name").val("Glucophage");
    $("#medication_strength").val("500 mg");
    $("#medication_dosage").val("1 capsule");
    $("#medication_doctor_id>option:eq(1)").prop('selected', true);
    $("#medication_medication_reminders_attributes_0_time").val("1:00 PM");
    $("#medication_medication_reminders_attributes_0_days_monday").attr('checked', true);
    $("#medication_medication_reminders_attributes_0_days_wednesday").attr('checked', true);
    $("#medication_medication_reminders_attributes_0_days_friday").attr('checked', true);
  });

  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    event.preventDefault();
	});
	
  $('form').on('click', '.add_fields', function(event) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
	});
	
});