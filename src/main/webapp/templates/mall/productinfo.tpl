<div class="infotitle clearfix">
    <img data-src="/static/weipaidai/images/mall/productinfo02.png" class="infotitleimg01 lazy">
    <p class="infotitlep1">{{cname}}</p>
</div>
<ul class="pro-boxs">
	{{#each products}}
    <li>
        <a href="/mall/item?sid={{id}}" target="_blank">
            <div class="pro-boxsbj">
                <img data-src="{{img}}" class="lazy">
            </div>
            <p class="pro-list-title">{{name}}</p>
            <p class="pro-list-wb"><span>{{price}}微币</span></p>
            <button class="pro-list-btn">立即兑换</button>
        </a>
    </li>
    {{/each}}
</ul>