<style>
    [data-background="[@graph1_lib1_color]"]:before {
        background: [@graph1_lib1_color] !important;
    }

    [data-background="[@graph1_lib2_color]"]:before {
        background: [@graph1_lib2_color] !important;
    }

    [data-background="[@graph2_lib1_color]"]:before {
        background: [@graph2_lib1_color] !important;
    }

    [data-background="[@graph2_lib2_color]"]:before {
        background: [@graph2_lib2_color] !important;
    }
</style>



<div class="area_chart pie_chart">
    
    <div class="area_chart_left">
        <div class="area_chart_left_main">
            <div class="area_chart_left_l">
                <h2>[@name]</h2>
                <h4>Up: [@duration]</h4>
                <h4>Cache full count: [@expunges]</h4>
            </div>
            <div class="clear"> </div>
            <div class="area_chart_left_l">
                <ul>
                    <li class="lab1" data-background="[@graph1_lib1_color]">Free: [@free_display] ([@free_p])</li>
                    <li class="lab2" data-background="[@graph1_lib2_color]">Used: [@used_display] ([@used_p])</li>
                </ul>
            </div>
            <div class="area_chart_left_r">
                <ul>
                    <li class="lab1" data-background="[@graph2_lib1_color]">Hits: [@hits] ([@hits_p])</li>
                    <li class="lab2" data-background="[@graph2_lib2_color]">Misses: [@misses] ([@misses_p])</li>
                </ul>
            </div>
        </div>

        <div id="w">
            <canvas id="pie_in[@id]" height="400" width="400" style="width: 400px; height: 400px;" class="pie_in"></canvas>
            <canvas id="pie_out[@id]" height="280" width="280" style="width: 280px; height: 280px;" class="pie_out"></canvas>
        </div>

        <script>
            var pieData_in[@id] = [{
                    value: [@free],
                    color: "[@graph1_lib1_color]",
                    label: "Free"
                }, {
                    value: [@used],
                    color: "[@graph1_lib2_color]",
                    label: "Used"
                }

            ];

            var pieData_out[@id] = [{
                    value: [@hits],
                    color: "[@graph2_lib1_color]",
                    label: "Hits"
                }, {
                    value: [@misses],
                    color: "[@graph2_lib2_color]",
                    label: "Misses"
                }

            ];

            var ctx1 = document.getElementById("pie_in[@id]").getContext("2d");
            var myChart1 = new Chart(ctx1).Doughnut(pieData_in[@id], {
                percentageInnerCutout: 80
            });

            var ctx2 = document.getElementById("pie_out[@id]").getContext("2d");
            var myChart2 = new Chart(ctx2).Doughnut(pieData_out[@id], {
                percentageInnerCutout: 40
            });
        </script>
    </div>
    <div class="clear"> </div>
</div>
