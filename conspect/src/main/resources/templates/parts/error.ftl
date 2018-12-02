V2__Add_admin


insert into usr (id, username, password,email, active)
values (1, 'admin', '$2a$08$FWO9P13x5EyC1JT4Pfl4OePGB/jbZyAeTud1UDXsLN.gw9B4wEUkm', "nastassia.shaypak@mail.ru", true);

insert into user_role (user_id, roles)
values (1, 'USER'), (1, 'ADMIN');



<#import "parts/common.ftl" as c>

<@c.page>


<h3>Sorry, something went wrong...</h3>
<h3>Try to reload this page or come back later. </h3>

<div class="mt-3">
    <h3>Thank you for your patience and understanding!</h3>
</div>


</@c.page>