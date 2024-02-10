document.addEventListener('DOMContentLoaded', function() {
  const calendarDates = document.querySelectorAll('.calendar-date');
  
  calendarDates.forEach(function(calendarDate) {
    calendarDate.addEventListener('click', function() {
      const date = this.getAttribute('data-date');
      window.location.href = '/records/index?date=' + date;
    });
  });
});