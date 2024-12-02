---
weight: 2
name_excel: "D5_flowchart_exclusion_criteria_ImmDis.xlsx"
description: "Flowchart of the exclusion of person in the study population from D4_study_population to the cohort of the specific ImmDis"
slug: "D5_flowchart_exclusion_criteria_ImmDis"
datetime: 1.7331523e+09
title: D5_flowchart_exclusion_criteria_ImmDis
author: ''
date: '2024-12-02'
categories: []
tags: []
archetype: codebook
output: html_document
---

<script src="/rmarkdown-libs/core-js/shim.min.js"></script>
<script src="/rmarkdown-libs/react/react.min.js"></script>
<script src="/rmarkdown-libs/react/react-dom.min.js"></script>
<script src="/rmarkdown-libs/reactwidget/react-tools.js"></script>
<script src="/rmarkdown-libs/htmlwidgets/htmlwidgets.js"></script>
<link href="/rmarkdown-libs/reactable/reactable.css" rel="stylesheet" />
<script src="/rmarkdown-libs/reactable-binding/reactable.js"></script>
<div class="tab">
<button class="tablinks" onclick="openCity(event, &#39;Metadata&#39;)" id="defaultOpen">Metadata</button>
<button class="tablinks" onclick="openCity(event, &#39;Data Model&#39;)">Data Model</button>
<button class="tablinks" onclick="openCity(event, &#39;Parameters&#39;)">Parameters</button>
<button class="tablinks" onclick="openCity(event, &#39;Example&#39;)">Example</button>
</div>
<div id="Metadata" class="tabcontent">
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:600px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"medatata_name":["Name of the dataset","Content of the dataset","Unit of observation","Dataset where the list of UoOs is fully listed and with 1 record per UoO","How many observations per UoO","Variables capturing the UoO","Primary key","Parameters",null,null,null,null,null,null,null,null,null,null,null,null],"metadata_content":["D5_flowchart_exclusion_criteria_ImmDis","Flowchart of the exclusion of person in the study population from D4_study_population to the cohort of the specific ImmDis","criteria",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"id":"medatata_name","name":"medatata_name","type":"character"},{"id":"metadata_content","name":"metadata_content","type":"character"}],"sortable":false,"searchable":true,"pagination":false,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":1800},"height":"600px","dataKey":"ed047b209d2e0ed15d7c5adc330c8456"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
</div>
<div id="Data Model" class="tabcontent">
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:600px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"VarName":["criteria","N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Description":[null,"frequency of the combination",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Format":["binary",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Vocabulary":["0 = if all the previous value on the same row are 1 then N refers to this column\r\n1= otherwise",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Parameters":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Notes and examples":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Source tables and variables":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Retrieved":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Calculated":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Algorithm_id":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"Rule":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"id":"VarName","name":"VarName","type":"character"},{"id":"Description","name":"Description","type":"character"},{"id":"Format","name":"Format","type":"character"},{"id":"Vocabulary","name":"Vocabulary","type":"character"},{"id":"Parameters","name":"Parameters","type":"logical"},{"id":"Notes and examples","name":"Notes and examples","type":"logical"},{"id":"Source tables and variables","name":"Source tables and variables","type":"logical"},{"id":"Retrieved","name":"Retrieved","type":"logical"},{"id":"Calculated","name":"Calculated","type":"logical"},{"id":"Algorithm_id","name":"Algorithm_id","type":"logical"},{"id":"Rule","name":"Rule","type":"logical"}],"sortable":false,"searchable":true,"pagination":false,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":1800},"height":"600px","dataKey":"6fd3c6475e76696d8eb9feead1e110b3"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
</div>
<div id="Parameters" class="tabcontent">
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:600px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"parameter in the variable name":["criteria","criteria","criteria","criteria","criteria","criteria","criteria","criteria","criteria",null,null,null,null,null,null,null,null,null,null,null],"values":["A_sex_or_birth_date_is_not_defined","B_birth_date_absurd","C_partial_date_of_death","D_no_spells","E_all_spells_start_after_ending","F_no_spell_overlapping_the_study_period","G_no_spell_longer_than_365_days","H_all_spells_include_vax1_but_less_than_365_days_from_it","I_higher_doses_included_but_lower_doses_missing",null,null,null,null,null,null,null,null,null,null,null],"name of macro":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"id":"parameter in the variable name","name":"parameter in the variable name","type":"character"},{"id":"values","name":"values","type":"character"},{"id":"name of macro","name":"name of macro","type":"logical"}],"sortable":false,"searchable":true,"pagination":false,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":1800},"height":"600px","dataKey":"b9d24a781d0b5482a1a1904a000e69aa"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
</div>
<div id="Example" class="tabcontent">
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:600px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"A_has_not_a_code_in_the_study_period_{ImmDis}":[0,1,1,1,"NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA"],"B_exclude_because_exist_code_during_lookback_{ImmDis}":[0,0,1,1,"NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA"],"C_exclude_because_exist_exclusion_criterion_during_lookback_{ImmDis}":[0,0,0,1,"NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA"],"N":[2,1,1,8319,"NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA"]},"columns":[{"id":"A_has_not_a_code_in_the_study_period_{ImmDis}","name":"A_has_not_a_code_in_the_study_period_{ImmDis}","type":"numeric"},{"id":"B_exclude_because_exist_code_during_lookback_{ImmDis}","name":"B_exclude_because_exist_code_during_lookback_{ImmDis}","type":"numeric"},{"id":"C_exclude_because_exist_exclusion_criterion_during_lookback_{ImmDis}","name":"C_exclude_because_exist_exclusion_criterion_during_lookback_{ImmDis}","type":"numeric"},{"id":"N","name":"N","type":"numeric"}],"sortable":false,"searchable":true,"pagination":false,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":1800},"height":"600px","dataKey":"8a4cc916315587fd92b69f6064e0684b"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
</div>
