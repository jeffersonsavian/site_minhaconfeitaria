import{w as c}from"./consent-client.CzG98fRf.js";(function(){const r=document.getElementById("wk-tracking-cfg");if(!r)return;const e=JSON.parse(r.textContent),n=new Set;function a(t,d){const l=document.createElement("template");l.innerHTML=t;for(const o of l.content.childNodes)if(o.nodeName==="SCRIPT"){const i=document.createElement("script");for(const m of o.attributes||[])i.setAttribute(m.name,m.value);i.textContent=o.textContent||"",d.appendChild(i)}else d.appendChild(document.importNode(o,!0))}function g(){if(n.has("ga4")||!e.ga4Id)return;n.add("ga4");const t=document.createElement("script");t.async=!0,t.src=`https://www.googletagmanager.com/gtag/js?id=${e.ga4Id}`,document.head.appendChild(t);const d=document.createElement("script");d.textContent=`
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '${e.ga4Id}');
      `,document.head.appendChild(d)}function u(){if(n.has("gtm")||!e.gtmId)return;n.add("gtm");const t=document.createElement("script");t.textContent=`
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','${e.gtmId}');
      `,document.head.appendChild(t)}function f(){if(n.has("headCode")||!e.headCode)return;n.add("headCode");const t=e.headCategory||"analytics";t==="essential"?a(e.headCode,document.head):c(t,()=>{n.has("headCode_delayed")||(n.add("headCode_delayed"),a(e.headCode,document.head))})}function y(){if(n.has("bodyCode")||!e.bodyCode)return;n.add("bodyCode");const t=e.bodyCategory||"analytics";t==="essential"?a(e.bodyCode,document.body):c(t,()=>{n.has("bodyCode_delayed")||(n.add("bodyCode_delayed"),a(e.bodyCode,document.body))})}function s(){e.ga4Id&&c("analytics",g),e.gtmId&&c("analytics",u),f(),y()}document.readyState==="loading"?document.addEventListener("DOMContentLoaded",s):s()})();
