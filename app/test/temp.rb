

<aside class="span4">
 <div class="span8">


    <% if @map.points.any? %>
      <% if @points_m.any? %>
        <h3>Meditation (<%= @points_m.count %>)</h3>
          <ol class="microposts">
            <%#= render @points_r %>
            <%= render @points_m %>
          </ol>
      <% end %>
      <% if @points_r.any? %>
        <h3>Restaurants (<%= @points_r.count %>)</h3>
          <ol class="microposts">
            <%= render @points_r %>
            <%#= render @points_m %>
          </ol>
      <% end %>
      <%#= will_paginate @points %>
    <% end %>

</div>
</aside>




    <p>
      This is the content.
      This text can go on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
      and on and on and on and on  and on and on and on and on
    </p>  
