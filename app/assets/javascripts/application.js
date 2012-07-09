// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
function check_validate(min,max)
{

    minval = parseInt(min);
    maxval = parseInt(max);
    if (minval >= maxval)
    {
        alert("最大呼叫号码必须大于最小呼叫号码！");
        return false;
    }
    return true;
}

function set_default_callno_pool(id) {

    $.ajax({
        type:'post',
        url:'/adminpanel/callno_pools/' + id + '/set_default',
        success:function (r) {
            alert('设置成功!');
        },
        error:function (r) {
        //alert('error: ' + r.responseText);
        }
    });
}

function move_down(id,obj){
    $.ajax({
        type:'post',
        dataType:'json',
        url:'/adminpanel/session_levels/' + id + '/move_down',
        success:function (r) {
//            alert(r.new_slevel_code);
//            alert(r.max_slevel_code);
//           alert(r.old_slevel_code);
//            alert(r.min_slevel_code);


            var row = obj.parents("tr:first");
            if (r.old_slevel_code==r.min_slevel_code){
                row.next().find("#moveup").html("");
                row.find("#moveup").html("<a class=\"btn down\" onclick=\"javascript:move_up("+id+",$(this));\" data-remote=\"true\" href=\"#\">向上调整</a>");
            }

            if (r.new_slevel_code==r.max_slevel_code){
                row.next().find("#movedown").html("<a class=\"btn down\" onclick=\"javascript:move_down("+r.last_slevel_id+",$(this));\" data-remote=\"true\" href=\"#\">向下调整</a>");
                row.find("#movedown").html("");
            }

            if (obj.is(".btn.up") && row.prevAll().length > 0) {
 
                row.insertBefore(row.prev());
            //css("background-color","red");
            }
            else if (obj.is(".btn.down") && row.nextAll().length > 0) {
                row.insertAfter(row.next());
                $('.table.table-bordered').find('tr').each(function(){
                    if ($(this).hasClass('movedown'))
                        $(this).removeClass('movedown');
                    if ($(this).hasClass('moveup'))
                        $(this).removeClass('moveup');
                })
                $("a").each(function(){
                    var href = $(this).attr('href');
                    if ((href=="#")&&$(this).hasClass('btn btn-primary'))
                     $(this).removeClass('btn btn-primary').addClass("btn");;
                })
                obj.removeClass('btn').addClass("btn btn-primary");

                row.addClass("movedown");
            }
            else {
                return false;
            }
        },
        error:function (r) {
        //alert('error: ' + r.responseText);
        }
    });


//   var firstrow = $('table tr:first');



}

function move_up(id,obj){
    $.ajax({
        type:'post',
        dataType:'json',
        url:'/adminpanel/session_levels/' + id + '/move_up',
        success:function (r) {
            var row = obj.parents("tr:first");
            if (r.new_slevel_code==r.min_slevel_code){

                row.prev().find("#moveup").html("<a class=\"btn up\" onclick=\"javascript:move_up("+r.first_slevel_id+",$(this));\" data-remote=\"true\" href=\"#\">向上调整</a>");
                row.find("#moveup").html("");
            }

            if (r.old_slevel_code==r.max_slevel_code){
                row.prev().find("#movedown").html("");
                row.find("#movedown").html("<a class=\"btn up\" onclick=\"javascript:move_down("+id+",$(this));\" data-remote=\"true\" href=\"#\">向下调整</a>");

            }
            
            if (obj.is(".btn.up") && row.prevAll().length > 0) {
                row.insertBefore(row.prev());
                $('.table.table-bordered').find('tr').each(function(){
                    if ($(this).hasClass('moveup'))
                        $(this).removeClass('moveup');
                    if ($(this).hasClass('movedown'))
                        $(this).removeClass('movedown');
                })
                $("a").each(function(){
                    var href = $(this).attr('href');
                    if ((href=="#")&&$(this).hasClass('btn btn-primary'))
                     $(this).removeClass('btn btn-primary').addClass("btn");;
                })
                obj.removeClass('btn').addClass("btn btn-primary");

                row.addClass("moveup");//row.css("background-color","yellow");
            }
            else if (obj.is(".btn.down") && row.nextAll().length > 0) {
                row.insertAfter(row.next());

            }
            else {
                return false;
            }
        },
        error:function (r) {
        //alert('error: ' + r.responseText);
        }
    });


//   var firstrow = $('table tr:first');



}