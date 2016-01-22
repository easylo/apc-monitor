
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
<h2>[@name] - Up: [@duration] - Cache full count: [@expunges]</h2>
    <div class="area_chart_left">
        <div class="area_chart_left_main">
            <div class="area_chart_left_l">
                <h3>[@graph1_title]</h3>
            </div>
            <div class="area_chart_left_r">
                <ul>
                    <li class="lab1" data-background="[@graph1_lib1_color]">Free: [@free_display] ([@free_p])</li>
                    <li class="lab2" data-background="[@graph1_lib2_color]">Used: [@used_display] ([@used_p])</li>
                </ul>
            </div>
            <div class="clear"> </div>
        </div>
        <canvas id="pie[@id]" height="300" width="500" style="width: 500px; height: 300px;"></canvas>
         <script>
            var pieData[@id] = [
                    {
                        value: [@free],
                        color:"[@graph1_lib1_color]"
                    },
                    {
                        value : [@used],
                        color : "[@graph1_lib2_color]"
                    }

                ];
                new Chart(document.getElementById("pie[@id]").getContext("2d")).Pie(pieData[@id], {animationEasing: "easeInCubic"});
        </script>
    </div>
    <div class="area_chart_right">
        <div class="area_chart_left_main">
            <div class="area_chart_left_l">
                <h3>[@graph2_title]</h3>
            </div>
            <div class="area_chart_left_r">
                <ul>
                    <li class="lab1" data-background="[@graph2_lib1_color]">Hits: [@hits] ([@hits_p])</li>
                    <li class="lab2" data-background="[@graph2_lib2_color]">Misses: [@misses] ([@misses_p])</li>
                </ul>
            </div>
            <div class="clear"> </div>
        </div>
        <canvas id="doughnut[@id]" height="300" width="500" style="width:500px; height: 300px;"></canvas>
        <script>
        var doughnutData[@id] = [
                {
                    value : [@hits],
                    color : "[@graph2_lib1_color]"
                },
                {
                    value : [@misses],
                    color : "[@graph2_lib2_color]"
                }

            ];
            new Chart(document.getElementById("doughnut[@id]").getContext("2d")).Doughnut(doughnutData[@id], {animationEasing: "easeInCubic"});
        </script>

    </div>
    <div class="clear"> </div>
</div>
