// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function textCounter(field, countField){
  if(field.value.length > 140){
    countField.value = 0
    field.value = field.value.substring(0, 140)
  }
  else{
    countField.value = 140 - field.value.length
  }
}
