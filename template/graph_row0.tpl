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



<section class="">

    <div class="item">
        <div class="">
            <div class="">
                <h2>[@name] - Cache full count: [@expunges]</h2>
                <h4>Up: [@duration]</h4>
            </div>
            <div class="clear"> </div>
            <div class="area_chart_left_l">
                <ul>
                    <li class="lab1" data-background="[@graph1_lib1_color]">Used: [@used_display] ([@used_p])</li>
                    <li class="lab2" data-background="[@graph1_lib2_color]">Free: [@free_display] ([@free_p])</li>
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
            <div id="pie_in[@id]"  height="400" width="400" style="width: 400px; height: 400px;" class="pie_in"></div>
            <div id="pie_out[@id]" height="280" width="280" style="width: 280px; height: 280px;" class="pie_out"></div>
            <div id="pie_mem[@id]" height="180" width="180" style="width: 180px; height: 180px;" class="pie_out"></div>
        </div>

        <script>
        $(function() {
            var pieData_in[@id] = [
               {
                    data: [@used],
                    color: "[@graph1_lib1_color]",
                    label: "Used"
                },
                {
                      data: [@free],
                      color: "[@graph1_lib2_color]",
                      label: "Free"
                  }

            ];

            var pieData_out[@id] = [
              {
                    data: [@hits],
                    color: "[@graph2_lib1_color]",
                    label: "Hits"
                }, {
                    data: [@misses],
                    color: "[@graph2_lib2_color]",
                    label: "Misses"
                }

            ];

            var pieData_mem[@id] = [
                {
                    data: [@memused],
                    color: "[@graph3_lib1_color]",
                    label: "Used"
                },
              {
                    data: [@memfree],
                    color: "[@graph3_lib2_color]",
                    label: "Free"
                }

            ];

            var options = {
                series: {
                    pie: {
                        innerRadius: 0.75,
                        show: true,
                        label: {
                            show: false,
                      }
                    }
                },
                legend: {
                    show: false
                    }
          		}

            $.plot('#pie_in[@id]', pieData_in[@id], options);

            $.plot('#pie_out[@id]', pieData_out[@id], options);

            $.plot('#pie_mem[@id]', pieData_mem[@id], options);

        });

        </script>
    </div>
    <div class="clear"> </div>
</section>
