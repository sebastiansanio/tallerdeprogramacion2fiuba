/*
Copyright (c) 2010, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.com/yui/license.html
version: 3.2.0
build: 2676
*/
YUI.add("dom-base",function(d){(function(j){var t="nodeType",g="ownerDocument",f="documentElement",e="defaultView",l="parentWindow",o="tagName",q="parentNode",s="firstChild",n="previousSibling",r="nextSibling",m="contains",i="compareDocumentPosition",h="",p=j.config.doc.documentElement,k=/<([a-z]+)/i;j.DOM={byId:function(v,u){return j.DOM.allById(v,u)[0]||null;},children:function(w,u){var v=[];if(w){u=u||"*";v=j.Selector.query("> "+u,w);}return v;},firstByTag:function(u,v){var w;v=v||j.config.doc;if(u&&v.getElementsByTagName){w=v.getElementsByTagName(u)[0];}return w||null;},getText:(p.textContent!==undefined)?function(v){var u="";if(v){u=v.textContent;}return u||"";}:function(v){var u="";if(v){u=v.innerText;}return u||"";},setText:(p.textContent!==undefined)?function(u,v){if(u){u.textContent=v;}}:function(u,v){if(u){u.innerText=v;}},previous:function(u,w,v){return j.DOM.elementByAxis(u,n,w,v);},next:function(u,w,v){return j.DOM.elementByAxis(u,r,w,v);},ancestor:function(v,w,x){var u=null;if(x){u=(!w||w(v))?v:null;}return u||j.DOM.elementByAxis(v,q,w,null);},elementByAxis:function(u,x,w,v){while(u&&(u=u[x])){if((v||u[o])&&(!w||w(u))){return u;}}return null;},contains:function(v,w){var u=false;if(!w||!v||!w[t]||!v[t]){u=false;}else{if(v[m]){if(j.UA.opera||w[t]===1){u=v[m](w);}else{u=j.DOM._bruteContains(v,w);}}else{if(v[i]){if(v===w||!!(v[i](w)&16)){u=true;}}}}return u;},inDoc:function(w,x){var v=false,u;if(w&&w.nodeType){(x)||(x=w[g]);u=x[f];if(u&&u.contains&&w.tagName){v=u.contains(w);}else{v=j.DOM.contains(u,w);}}return v;},allById:function(z,u){u=u||j.config.doc;var v=[],w=[],x,y;if(u.querySelectorAll){w=u.querySelectorAll('[id="'+z+'"]');}else{if(u.all){v=u.all(z);if(v&&v.nodeType){v=[v];}if(v&&v.length){for(x=0;y=v[x++];){if(y.attributes&&y.attributes.id&&y.attributes.id.value===z){w.push(y);}}}}else{w=[j.DOM._getDoc(u).getElementById(z)];}}return w;},create:function(z,B){if(typeof z==="string"){z=j.Lang.trim(z);}B=B||j.config.doc;var v=k.exec(z),y=j.DOM._create,A=j.DOM.creators,x=null,u,w;if(z!=undefined){if(v&&A[v[1]]){if(typeof A[v[1]]==="function"){y=A[v[1]];}else{u=A[v[1]];}}w=y(z,B,u).childNodes;if(w.length===1){x=w[0].parentNode.removeChild(w[0]);}else{if(w[0]&&w[0].className==="yui3-big-dummy"){if(w.length===2){x=w[0].nextSibling;}else{w[0].parentNode.removeChild(w[0]);x=j.DOM._nl2frag(w,B);}}else{x=j.DOM._nl2frag(w,B);}}}return x;},_nl2frag:function(v,y){var w=null,x,u;if(v&&(v.push||v.item)&&v[0]){y=y||v[0].ownerDocument;w=y.createDocumentFragment();if(v.item){v=j.Array(v,0,true);}for(x=0,u=v.length;x<u;x++){w.appendChild(v[x]);}}return w;},CUSTOM_ATTRIBUTES:(!p.hasAttribute)?{"for":"htmlFor","class":"className"}:{"htmlFor":"for","className":"class"},setAttribute:function(w,u,x,v){if(w&&w.setAttribute){u=j.DOM.CUSTOM_ATTRIBUTES[u]||u;w.setAttribute(u,x,v);}},getAttribute:function(x,u,w){w=(w!==undefined)?w:2;var v="";if(x&&x.getAttribute){u=j.DOM.CUSTOM_ATTRIBUTES[u]||u;v=x.getAttribute(u,w);if(v===null){v="";}}return v;},isWindow:function(u){return u.alert&&u.document;},_fragClones:{},_create:function(v,w,u){u=u||"div";var x=j.DOM._fragClones[u];if(x){x=x.cloneNode(false);}else{x=j.DOM._fragClones[u]=w.createElement(u);}x.innerHTML=v;return x;},_removeChildNodes:function(u){while(u.firstChild){u.removeChild(u.firstChild);}},addHTML:function(y,x,v){var u=y.parentNode,w;if(x!==undefined&&x!==null){if(x.nodeType){w=x;}else{w=j.DOM.create(x);}}if(v){if(v.nodeType){v.parentNode.insertBefore(w,v);}else{switch(v){case"replace":while(y.firstChild){y.removeChild(y.firstChild);}if(w){y.appendChild(w);}break;case"before":u.insertBefore(w,y);break;case"after":if(y.nextSibling){u.insertBefore(w,y.nextSibling);}else{u.appendChild(w);}break;default:y.appendChild(w);}}}else{y.appendChild(w);}return w;},VALUE_SETTERS:{},VALUE_GETTERS:{},getValue:function(w){var v="",u;if(w&&w[o]){u=j.DOM.VALUE_GETTERS[w[o].toLowerCase()];if(u){v=u(w);}else{v=w.value;}}if(v===h){v=h;}return(typeof v==="string")?v:"";},setValue:function(u,v){var w;if(u&&u[o]){w=j.DOM.VALUE_SETTERS[u[o].toLowerCase()];if(w){w(u,v);}else{u.value=v;}}},siblings:function(x,w){var u=[],v=x;while((v=v[n])){if(v[o]&&(!w||w(v))){u.unshift(v);}}v=x;while((v=v[r])){if(v[o]&&(!w||w(v))){u.push(v);}}return u;},_bruteContains:function(u,v){while(v){if(u===v){return true;}v=v.parentNode;}return false;},_getRegExp:function(v,u){u=u||"";j.DOM._regexCache=j.DOM._regexCache||{};if(!j.DOM._regexCache[v+u]){j.DOM._regexCache[v+u]=new RegExp(v,u);}return j.DOM._regexCache[v+u];},_getDoc:function(u){var v=j.config.doc;if(u){v=(u[t]===9)?u:u[g]||u.document||j.config.doc;}return v;},_getWin:function(u){var v=j.DOM._getDoc(u);return v[e]||v[l]||j.config.win;},_batch:function(x,B,A,w,v,z){B=(typeof name==="string")?j.DOM[B]:B;var u,y=[];if(B&&x){j.each(x,function(C){if((u=B.call(j.DOM,C,A,w,v,z))!==undefined){y[y.length]=u;}});}return y.length?y:x;},creators:{},_IESimpleCreate:function(u,v){v=v||j.config.doc;return v.createElement(u);}};(function(y){var z=y.DOM.creators,u=y.DOM.create,x=/(?:\/(?:thead|tfoot|tbody|caption|col|colgroup)>)+\s*<tbody/,w="<table>",v="</table>";if(y.UA.ie){y.mix(z,{tbody:function(B,C){var D=u(w+B+v,C),A=D.children.tags("tbody")[0];if(D.children.length>1&&A&&!x.test(B)){A[q].removeChild(A);}return D;},script:function(A,B){var C=B.createElement("div");C.innerHTML="-"+A;C.removeChild(C[s]);return C;}},true);y.mix(y.DOM.VALUE_GETTERS,{button:function(A){return(A.attributes&&A.attributes.value)?A.attributes.value.value:"";}});y.mix(y.DOM.VALUE_SETTERS,{button:function(B,C){var A=B.attributes.value;if(!A){A=B[g].createAttribute("value");B.setAttributeNode(A);}A.value=C;},select:function(D,E){for(var B=0,A=D.getElementsByTagName("option"),C;C=A[B++];){if(y.DOM.getValue(C)===E){y.DOM.setAttribute(C,"selected",true);break;}}}});y.DOM.creators.style=y.DOM.creators.script;}if(y.UA.gecko||y.UA.ie){y.mix(z,{option:function(A,B){return u('<select><option class="yui3-big-dummy" selected></option>'+A+"</select>",B);},tr:function(A,B){return u("<tbody>"+A+"</tbody>",B);
},td:function(A,B){return u("<tr>"+A+"</tr>",B);},tbody:function(A,B){return u(w+A+v,B);}});y.mix(z,{legend:"fieldset",th:z.td,thead:z.tbody,tfoot:z.tbody,caption:z.tbody,colgroup:z.tbody,col:z.tbody,optgroup:z.option});}y.mix(y.DOM.VALUE_GETTERS,{option:function(B){var A=B.attributes;return(A.value&&A.value.specified)?B.value:B.text;},select:function(B){var C=B.value,A=B.options;if(A&&A.length&&C===""){if(B.multiple){}else{C=y.DOM.getValue(A[B.selectedIndex]);}}return C;}});})(j);})(d);var b,a,c;d.mix(d.DOM,{hasClass:function(g,f){var e=d.DOM._getRegExp("(?:^|\\s+)"+f+"(?:\\s+|$)");return e.test(g.className);},addClass:function(f,e){if(!d.DOM.hasClass(f,e)){f.className=d.Lang.trim([f.className,e].join(" "));}},removeClass:function(f,e){if(e&&a(f,e)){f.className=d.Lang.trim(f.className.replace(d.DOM._getRegExp("(?:^|\\s+)"+e+"(?:\\s+|$)")," "));if(a(f,e)){c(f,e);}}},replaceClass:function(f,e,g){c(f,e);b(f,g);},toggleClass:function(f,e,g){var h=(g!==undefined)?g:!(a(f,e));if(h){b(f,e);}else{c(f,e);}}});a=d.DOM.hasClass;c=d.DOM.removeClass;b=d.DOM.addClass;d.mix(d.DOM,{setWidth:function(f,e){d.DOM._setSize(f,"width",e);},setHeight:function(f,e){d.DOM._setSize(f,"height",e);},_setSize:function(f,h,g){g=(g>0)?g:0;var e=0;f.style[h]=g+"px";e=(h==="height")?f.offsetHeight:f.offsetWidth;if(e>g){g=g-(e-g);if(g<0){g=0;}f.style[h]=g+"px";}}});},"3.2.0",{requires:["oop"]});