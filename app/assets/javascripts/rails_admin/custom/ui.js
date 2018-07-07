$(function(){

  var horizontalScrollList = function(){
    var $table = $('#bulk_form').find('table');
    var table = $table[0];

    // Abort if there's nothing to do. Don't repeat ourselves, either.
    if (!table || $table.hasClass('js-horiz-scroll')) { return; }

    // Add our indicator class. Also some enhancements.
    $table.addClass('js-horiz-scroll table-hover');

    ////
    // Make the table horizontally scrollable.
    // Inspiration from bootstrap's table-responsive.
    ////
    var tableWrapper = document.createElement('DIV');
    tableWrapper.style.overflowX = 'auto';
    tableWrapper.style.marginBottom = '20px';
    table.style.marginBottom = '0';
    table.parentElement.insertBefore(tableWrapper, table);
    tableWrapper.appendChild(table);

    // Move the links column to the left.
    $table.find('th.last,td.last').each(function(index, td){
      var tr = td.parentElement;
      tr.insertBefore(td, tr.children[1]);
    });

    // Allow a render before calculating positions.
    setTimeout(function(){
      // Freeze the left columns.
      var numFrozen = 3;
      var $trs = $('#bulk_form').find('table tr');
      var $headerTds = $trs.first().children('th,td');
      var i, bgColor;
      var offsets = [];
      for (i = 0; i < numFrozen; i++) {
        offsets.push($($headerTds[i]).position().left);
      }
      $trs.each(function(index, tr){
        for (i = 0; i < numFrozen; i++) {
          tr.children[i].style.position = 'sticky';
          tr.children[i].style.left = (offsets[i]-offsets[0])+'px';
          if (i === numFrozen-1) {
            tr.children[i].style.boxShadow = '-1px 0 0 0 #ddd inset';
            tr.children[i].style.paddingRight = '6px';
          }
          if (index % 2 === 0) {
            bgColor = '#fff';
            if (index === 0 && tr.children[i].className.indexOf('headerSort') > -1) {
              bgColor = '#e2eff6';
            }
            tr.children[i].style.backgroundColor = bgColor;
          }
        }
      });
    }, 0);

  };

  $(window).on('load', function(){ // on 'load' to allow link icons to load.
    horizontalScrollList();
    $(document).on('rails_admin.dom_ready', horizontalScrollList);
  });

}());