<li class="select-list" data-stype="投资红包" data-account="0" data-id="" data-apr="0">不使用</li>
{{#each lists}}
{{#equal stype "现金红包"}}

{{else}}
<li class="select-list {{#equal @index 0}}is-select{{/equal}}" data-stype="{{stype}}" data-account="{{account}}" data-id="{{id}}" data-apr="{{apr}}">{{title}}</li>
{{/equal}}
{{/each}}

