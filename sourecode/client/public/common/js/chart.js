/*
function make table chart
@input: ary_x: array of x axis
        data: object y axis
@return html content
 */
var makeTableChart = function (ary_x, obj_y) {
    var ary_y =[];
    for( var i in obj_y ) {
        if (obj_y.hasOwnProperty(i)){
            if(obj_y[i] !== null && obj_y[i]!= '' && /^-?\d+$/.test(obj_y[i]))  ary_y.push(obj_y[i]);
        }
    }

    var tableChartHtml;
    if(ary_y.length > 0){
        var y_max = BigNumber.max(ary_y);
        var y_min = BigNumber.min(ary_y);
        var height = BigNumber.max(y_max.abs(), y_min.abs());
        if (y_max.mul(y_min).lessThan(0)) {
            height = (y_max.abs()).plus(y_min.abs());
        }
        tableChartHtml = "<table cellspacing='0' cellpadding='0' class='inline-chart'><tbody>";
        var tr1 = '<tr>', tr2 = '<tr>';
        for (var i in ary_x) {
            var y = ( ary_x[i] in obj_y && obj_y[ary_x[i]] !== null && obj_y[ary_x[i]]!= '' && /^-?\d+$/.test(obj_y[ary_x[i]])) ? new BigNumber(obj_y[ary_x[i]]) : new BigNumber(0);
            var y_height= new BigNumber(0);
            if (!height.equals(0))y_height= y.dividedBy(height).times(25);
            tr1 += "<td style='padding-left:2px; vertical-align:bottom'>";
            tr2 += "<td style='padding-left:2px; vertical-align:top'>";
            if(y.lessThan(0)){
                tr2 += "<div style='background-color:#CC0000; border-bottom:solid 1px #CCC; width:5px; height:"+y_height.abs()+"px;'></div>";
            }else{
                tr1 += "<div style='background-color:#92AEBD; border-bottom:solid 1px #CCC; width:5px; height:"+y_height+"px;'></div>";
            }
            tr1 += '</td>';
            tr2 += '</td>';
        }
        tr1 += '</tr>';
        tr2 += '</tr>';
        tableChartHtml += tr1 + tr2 + '</tbody></table>';
    }

    return tableChartHtml;
};