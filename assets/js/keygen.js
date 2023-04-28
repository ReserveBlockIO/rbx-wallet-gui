(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
(function (process,global,Buffer,__argument0,__argument1,__argument2,__argument3,setImmediate){(function (){
(()=>{var F1=Object.create,Lf=Object.defineProperty;var L1=Object.getOwnPropertyDescriptor;var N1=Object.getOwnPropertyNames;var D1=Object.getPrototypeOf,O1=Object.prototype.hasOwnProperty;var H1=r=>Lf(r,"__esModule",{value:!0});var js=r=>{if(typeof require!="undefined")return require(r);throw new Error('Dynamic require of "'+r+'" is not supported')};var L=(r,e)=>()=>(e||r((e={exports:{}}).exports,e),e.exports);var z1=(r,e,t)=>{if(e&&typeof e=="object"||typeof e=="function")for(let i of N1(e))!O1.call(r,i)&&i!=="default"&&Lf(r,i,{get:()=>e[i],enumerable:!(t=L1(e,i))||t.enumerable});return r},m0=r=>z1(H1(Lf(r!=null?F1(D1(r)):{},"default",r&&r.__esModule&&"default"in r?{get:()=>r.default,enumerable:!0}:{value:r,enumerable:!0})),r);var Ks=L((ax,U1)=>{U1.exports={name:"elliptic",version:"6.5.4",description:"EC cryptography",main:"lib/elliptic.js",files:["lib"],scripts:{lint:"eslint lib test","lint:fix":"npm run lint -- --fix",unit:"istanbul test _mocha --reporter=spec test/index.js",test:"npm run lint && npm run unit",version:"grunt dist && git add dist/"},repository:{type:"git",url:"git@github.com:indutny/elliptic"},keywords:["EC","Elliptic","curve","Cryptography"],author:"Fedor Indutny <fedor@indutny.com>",license:"MIT",bugs:{url:"https://github.com/indutny/elliptic/issues"},homepage:"https://github.com/indutny/elliptic",devDependencies:{brfs:"^2.0.2",coveralls:"^3.1.0",eslint:"^7.6.0",grunt:"^1.2.1","grunt-browserify":"^5.3.0","grunt-cli":"^1.3.2","grunt-contrib-connect":"^3.0.0","grunt-contrib-copy":"^1.0.0","grunt-contrib-uglify":"^5.0.0","grunt-mocha-istanbul":"^5.0.2","grunt-saucelabs":"^9.0.1",istanbul:"^0.4.5",mocha:"^8.0.1"},dependencies:{"bn.js":"^4.11.9",brorand:"^1.1.0","hash.js":"^1.0.0","hmac-drbg":"^1.0.1",inherits:"^2.0.4","minimalistic-assert":"^1.0.1","minimalistic-crypto-utils":"^1.0.1"}}});var Js=L(()=>{});var gr=L((Xs,Nf)=>{(function(r,e){"use strict";function t(M,s){if(!M)throw new Error(s||"Assertion failed")}function i(M,s){M.super_=s;var c=function(){};c.prototype=s.prototype,M.prototype=new c,M.prototype.constructor=M}function n(M,s,c){if(n.isBN(M))return M;this.negative=0,this.words=null,this.length=0,this.red=null,M!==null&&((s==="le"||s==="be")&&(c=s,s=10),this._init(M||0,s||10,c||"be"))}typeof r=="object"?r.exports=n:e.BN=n,n.BN=n,n.wordSize=26;var f;try{typeof window!="undefined"&&typeof window.Buffer!="undefined"?f=window.Buffer:f=Js().Buffer}catch(M){}n.isBN=function(s){return s instanceof n?!0:s!==null&&typeof s=="object"&&s.constructor.wordSize===n.wordSize&&Array.isArray(s.words)},n.max=function(s,c){return s.cmp(c)>0?s:c},n.min=function(s,c){return s.cmp(c)<0?s:c},n.prototype._init=function(s,c,b){if(typeof s=="number")return this._initNumber(s,c,b);if(typeof s=="object")return this._initArray(s,c,b);c==="hex"&&(c=16),t(c===(c|0)&&c>=2&&c<=36),s=s.toString().replace(/\s+/g,"");var p=0;s[0]==="-"&&(p++,this.negative=1),p<s.length&&(c===16?this._parseHex(s,p,b):(this._parseBase(s,c,p),b==="le"&&this._initArray(this.toArray(),c,b)))},n.prototype._initNumber=function(s,c,b){s<0&&(this.negative=1,s=-s),s<67108864?(this.words=[s&67108863],this.length=1):s<4503599627370496?(this.words=[s&67108863,s/67108864&67108863],this.length=2):(t(s<9007199254740992),this.words=[s&67108863,s/67108864&67108863,1],this.length=3),b==="le"&&this._initArray(this.toArray(),c,b)},n.prototype._initArray=function(s,c,b){if(t(typeof s.length=="number"),s.length<=0)return this.words=[0],this.length=1,this;this.length=Math.ceil(s.length/3),this.words=new Array(this.length);for(var p=0;p<this.length;p++)this.words[p]=0;var m,B,q=0;if(b==="be")for(p=s.length-1,m=0;p>=0;p-=3)B=s[p]|s[p-1]<<8|s[p-2]<<16,this.words[m]|=B<<q&67108863,this.words[m+1]=B>>>26-q&67108863,q+=24,q>=26&&(q-=26,m++);else if(b==="le")for(p=0,m=0;p<s.length;p+=3)B=s[p]|s[p+1]<<8|s[p+2]<<16,this.words[m]|=B<<q&67108863,this.words[m+1]=B>>>26-q&67108863,q+=24,q>=26&&(q-=26,m++);return this.strip()};function a(M,s){var c=M.charCodeAt(s);return c>=65&&c<=70?c-55:c>=97&&c<=102?c-87:c-48&15}function o(M,s,c){var b=a(M,c);return c-1>=s&&(b|=a(M,c-1)<<4),b}n.prototype._parseHex=function(s,c,b){this.length=Math.ceil((s.length-c)/6),this.words=new Array(this.length);for(var p=0;p<this.length;p++)this.words[p]=0;var m=0,B=0,q;if(b==="be")for(p=s.length-1;p>=c;p-=2)q=o(s,c,p)<<m,this.words[B]|=q&67108863,m>=18?(m-=18,B+=1,this.words[B]|=q>>>26):m+=8;else{var w=s.length-c;for(p=w%2==0?c+1:c;p<s.length;p+=2)q=o(s,c,p)<<m,this.words[B]|=q&67108863,m>=18?(m-=18,B+=1,this.words[B]|=q>>>26):m+=8}this.strip()};function u(M,s,c,b){for(var p=0,m=Math.min(M.length,c),B=s;B<m;B++){var q=M.charCodeAt(B)-48;p*=b,q>=49?p+=q-49+10:q>=17?p+=q-17+10:p+=q}return p}n.prototype._parseBase=function(s,c,b){this.words=[0],this.length=1;for(var p=0,m=1;m<=67108863;m*=c)p++;p--,m=m/c|0;for(var B=s.length-b,q=B%p,w=Math.min(B,B-q)+b,d=0,g=b;g<w;g+=p)d=u(s,g,g+p,c),this.imuln(m),this.words[0]+d<67108864?this.words[0]+=d:this._iaddn(d);if(q!==0){var F=1;for(d=u(s,g,s.length,c),g=0;g<q;g++)F*=c;this.imuln(F),this.words[0]+d<67108864?this.words[0]+=d:this._iaddn(d)}this.strip()},n.prototype.copy=function(s){s.words=new Array(this.length);for(var c=0;c<this.length;c++)s.words[c]=this.words[c];s.length=this.length,s.negative=this.negative,s.red=this.red},n.prototype.clone=function(){var s=new n(null);return this.copy(s),s},n.prototype._expand=function(s){for(;this.length<s;)this.words[this.length++]=0;return this},n.prototype.strip=function(){for(;this.length>1&&this.words[this.length-1]===0;)this.length--;return this._normSign()},n.prototype._normSign=function(){return this.length===1&&this.words[0]===0&&(this.negative=0),this},n.prototype.inspect=function(){return(this.red?"<BN-R: ":"<BN: ")+this.toString(16)+">"};var v=["","0","00","000","0000","00000","000000","0000000","00000000","000000000","0000000000","00000000000","000000000000","0000000000000","00000000000000","000000000000000","0000000000000000","00000000000000000","000000000000000000","0000000000000000000","00000000000000000000","000000000000000000000","0000000000000000000000","00000000000000000000000","000000000000000000000000","0000000000000000000000000"],h=[0,0,25,16,12,11,10,9,8,8,7,7,7,7,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5],l=[0,0,33554432,43046721,16777216,48828125,60466176,40353607,16777216,43046721,1e7,19487171,35831808,62748517,7529536,11390625,16777216,24137569,34012224,47045881,64e6,4084101,5153632,6436343,7962624,9765625,11881376,14348907,17210368,20511149,243e5,28629151,33554432,39135393,45435424,52521875,60466176];n.prototype.toString=function(s,c){s=s||10,c=c|0||1;var b;if(s===16||s==="hex"){b="";for(var p=0,m=0,B=0;B<this.length;B++){var q=this.words[B],w=((q<<p|m)&16777215).toString(16);m=q>>>24-p&16777215,m!==0||B!==this.length-1?b=v[6-w.length]+w+b:b=w+b,p+=2,p>=26&&(p-=26,B--)}for(m!==0&&(b=m.toString(16)+b);b.length%c!=0;)b="0"+b;return this.negative!==0&&(b="-"+b),b}if(s===(s|0)&&s>=2&&s<=36){var d=h[s],g=l[s];b="";var F=this.clone();for(F.negative=0;!F.isZero();){var T=F.modn(g).toString(s);F=F.idivn(g),F.isZero()?b=T+b:b=v[d-T.length]+T+b}for(this.isZero()&&(b="0"+b);b.length%c!=0;)b="0"+b;return this.negative!==0&&(b="-"+b),b}t(!1,"Base should be between 2 and 36")},n.prototype.toNumber=function(){var s=this.words[0];return this.length===2?s+=this.words[1]*67108864:this.length===3&&this.words[2]===1?s+=4503599627370496+this.words[1]*67108864:this.length>2&&t(!1,"Number can only safely store up to 53 bits"),this.negative!==0?-s:s},n.prototype.toJSON=function(){return this.toString(16)},n.prototype.toBuffer=function(s,c){return t(typeof f!="undefined"),this.toArrayLike(f,s,c)},n.prototype.toArray=function(s,c){return this.toArrayLike(Array,s,c)},n.prototype.toArrayLike=function(s,c,b){var p=this.byteLength(),m=b||Math.max(1,p);t(p<=m,"byte array longer than desired length"),t(m>0,"Requested array length <= 0"),this.strip();var B=c==="le",q=new s(m),w,d,g=this.clone();if(B){for(d=0;!g.isZero();d++)w=g.andln(255),g.iushrn(8),q[d]=w;for(;d<m;d++)q[d]=0}else{for(d=0;d<m-p;d++)q[d]=0;for(d=0;!g.isZero();d++)w=g.andln(255),g.iushrn(8),q[m-d-1]=w}return q},Math.clz32?n.prototype._countBits=function(s){return 32-Math.clz32(s)}:n.prototype._countBits=function(s){var c=s,b=0;return c>=4096&&(b+=13,c>>>=13),c>=64&&(b+=7,c>>>=7),c>=8&&(b+=4,c>>>=4),c>=2&&(b+=2,c>>>=2),b+c},n.prototype._zeroBits=function(s){if(s===0)return 26;var c=s,b=0;return(c&8191)==0&&(b+=13,c>>>=13),(c&127)==0&&(b+=7,c>>>=7),(c&15)==0&&(b+=4,c>>>=4),(c&3)==0&&(b+=2,c>>>=2),(c&1)==0&&b++,b},n.prototype.bitLength=function(){var s=this.words[this.length-1],c=this._countBits(s);return(this.length-1)*26+c};function x(M){for(var s=new Array(M.bitLength()),c=0;c<s.length;c++){var b=c/26|0,p=c%26;s[c]=(M.words[b]&1<<p)>>>p}return s}n.prototype.zeroBits=function(){if(this.isZero())return 0;for(var s=0,c=0;c<this.length;c++){var b=this._zeroBits(this.words[c]);if(s+=b,b!==26)break}return s},n.prototype.byteLength=function(){return Math.ceil(this.bitLength()/8)},n.prototype.toTwos=function(s){return this.negative!==0?this.abs().inotn(s).iaddn(1):this.clone()},n.prototype.fromTwos=function(s){return this.testn(s-1)?this.notn(s).iaddn(1).ineg():this.clone()},n.prototype.isNeg=function(){return this.negative!==0},n.prototype.neg=function(){return this.clone().ineg()},n.prototype.ineg=function(){return this.isZero()||(this.negative^=1),this},n.prototype.iuor=function(s){for(;this.length<s.length;)this.words[this.length++]=0;for(var c=0;c<s.length;c++)this.words[c]=this.words[c]|s.words[c];return this.strip()},n.prototype.ior=function(s){return t((this.negative|s.negative)==0),this.iuor(s)},n.prototype.or=function(s){return this.length>s.length?this.clone().ior(s):s.clone().ior(this)},n.prototype.uor=function(s){return this.length>s.length?this.clone().iuor(s):s.clone().iuor(this)},n.prototype.iuand=function(s){var c;this.length>s.length?c=s:c=this;for(var b=0;b<c.length;b++)this.words[b]=this.words[b]&s.words[b];return this.length=c.length,this.strip()},n.prototype.iand=function(s){return t((this.negative|s.negative)==0),this.iuand(s)},n.prototype.and=function(s){return this.length>s.length?this.clone().iand(s):s.clone().iand(this)},n.prototype.uand=function(s){return this.length>s.length?this.clone().iuand(s):s.clone().iuand(this)},n.prototype.iuxor=function(s){var c,b;this.length>s.length?(c=this,b=s):(c=s,b=this);for(var p=0;p<b.length;p++)this.words[p]=c.words[p]^b.words[p];if(this!==c)for(;p<c.length;p++)this.words[p]=c.words[p];return this.length=c.length,this.strip()},n.prototype.ixor=function(s){return t((this.negative|s.negative)==0),this.iuxor(s)},n.prototype.xor=function(s){return this.length>s.length?this.clone().ixor(s):s.clone().ixor(this)},n.prototype.uxor=function(s){return this.length>s.length?this.clone().iuxor(s):s.clone().iuxor(this)},n.prototype.inotn=function(s){t(typeof s=="number"&&s>=0);var c=Math.ceil(s/26)|0,b=s%26;this._expand(c),b>0&&c--;for(var p=0;p<c;p++)this.words[p]=~this.words[p]&67108863;return b>0&&(this.words[p]=~this.words[p]&67108863>>26-b),this.strip()},n.prototype.notn=function(s){return this.clone().inotn(s)},n.prototype.setn=function(s,c){t(typeof s=="number"&&s>=0);var b=s/26|0,p=s%26;return this._expand(b+1),c?this.words[b]=this.words[b]|1<<p:this.words[b]=this.words[b]&~(1<<p),this.strip()},n.prototype.iadd=function(s){var c;if(this.negative!==0&&s.negative===0)return this.negative=0,c=this.isub(s),this.negative^=1,this._normSign();if(this.negative===0&&s.negative!==0)return s.negative=0,c=this.isub(s),s.negative=1,c._normSign();var b,p;this.length>s.length?(b=this,p=s):(b=s,p=this);for(var m=0,B=0;B<p.length;B++)c=(b.words[B]|0)+(p.words[B]|0)+m,this.words[B]=c&67108863,m=c>>>26;for(;m!==0&&B<b.length;B++)c=(b.words[B]|0)+m,this.words[B]=c&67108863,m=c>>>26;if(this.length=b.length,m!==0)this.words[this.length]=m,this.length++;else if(b!==this)for(;B<b.length;B++)this.words[B]=b.words[B];return this},n.prototype.add=function(s){var c;return s.negative!==0&&this.negative===0?(s.negative=0,c=this.sub(s),s.negative^=1,c):s.negative===0&&this.negative!==0?(this.negative=0,c=s.sub(this),this.negative=1,c):this.length>s.length?this.clone().iadd(s):s.clone().iadd(this)},n.prototype.isub=function(s){if(s.negative!==0){s.negative=0;var c=this.iadd(s);return s.negative=1,c._normSign()}else if(this.negative!==0)return this.negative=0,this.iadd(s),this.negative=1,this._normSign();var b=this.cmp(s);if(b===0)return this.negative=0,this.length=1,this.words[0]=0,this;var p,m;b>0?(p=this,m=s):(p=s,m=this);for(var B=0,q=0;q<m.length;q++)c=(p.words[q]|0)-(m.words[q]|0)+B,B=c>>26,this.words[q]=c&67108863;for(;B!==0&&q<p.length;q++)c=(p.words[q]|0)+B,B=c>>26,this.words[q]=c&67108863;if(B===0&&q<p.length&&p!==this)for(;q<p.length;q++)this.words[q]=p.words[q];return this.length=Math.max(this.length,q),p!==this&&(this.negative=1),this.strip()},n.prototype.sub=function(s){return this.clone().isub(s)};function y(M,s,c){c.negative=s.negative^M.negative;var b=M.length+s.length|0;c.length=b,b=b-1|0;var p=M.words[0]|0,m=s.words[0]|0,B=p*m,q=B&67108863,w=B/67108864|0;c.words[0]=q;for(var d=1;d<b;d++){for(var g=w>>>26,F=w&67108863,T=Math.min(d,s.length-1),z=Math.max(0,d-M.length+1);z<=T;z++){var W=d-z|0;p=M.words[W]|0,m=s.words[z]|0,B=p*m+F,g+=B/67108864|0,F=B&67108863}c.words[d]=F|0,w=g|0}return w!==0?c.words[d]=w|0:c.length--,c.strip()}var E=function(s,c,b){var p=s.words,m=c.words,B=b.words,q=0,w,d,g,F=p[0]|0,T=F&8191,z=F>>>13,W=p[1]|0,j=W&8191,U=W>>>13,pe=p[2]|0,J=pe&8191,ee=pe>>>13,Zr=p[3]|0,$=Zr&8191,G=Zr>>>13,gt=p[4]|0,de=gt&8191,le=gt>>>13,Yr=p[5]|0,ve=Yr&8191,ce=Yr>>>13,fr=p[6]|0,Z=fr&8191,re=fr>>>13,yt=p[7]|0,xe=yt&8191,ae=yt>>>13,$r=p[8]|0,Me=$r&8191,ge=$r>>>13,x0=p[9]|0,se=x0&8191,ue=x0>>>13,di=m[0]|0,ye=di&8191,_e=di>>>13,ci=m[1]|0,Ae=ci&8191,me=ci>>>13,ui=m[2]|0,we=ui&8191,Be=ui>>>13,g0=m[3]|0,Re=g0&8191,qe=g0>>>13,hi=m[4]|0,Se=hi&8191,Ce=hi>>>13,li=m[5]|0,Ee=li&8191,Ie=li>>>13,y0=m[6]|0,V=y0&8191,te=y0>>>13,_0=m[7]|0,ke=_0&8191,Fe=_0>>>13,Us=m[8]|0,Le=Us&8191,Ne=Us>>>13,Ws=m[9]|0,De=Ws&8191,Oe=Ws>>>13;b.negative=s.negative^c.negative,b.length=19,w=Math.imul(T,ye),d=Math.imul(T,_e),d=d+Math.imul(z,ye)|0,g=Math.imul(z,_e);var xf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(xf>>>26)|0,xf&=67108863,w=Math.imul(j,ye),d=Math.imul(j,_e),d=d+Math.imul(U,ye)|0,g=Math.imul(U,_e),w=w+Math.imul(T,Ae)|0,d=d+Math.imul(T,me)|0,d=d+Math.imul(z,Ae)|0,g=g+Math.imul(z,me)|0;var gf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(gf>>>26)|0,gf&=67108863,w=Math.imul(J,ye),d=Math.imul(J,_e),d=d+Math.imul(ee,ye)|0,g=Math.imul(ee,_e),w=w+Math.imul(j,Ae)|0,d=d+Math.imul(j,me)|0,d=d+Math.imul(U,Ae)|0,g=g+Math.imul(U,me)|0,w=w+Math.imul(T,we)|0,d=d+Math.imul(T,Be)|0,d=d+Math.imul(z,we)|0,g=g+Math.imul(z,Be)|0;var yf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(yf>>>26)|0,yf&=67108863,w=Math.imul($,ye),d=Math.imul($,_e),d=d+Math.imul(G,ye)|0,g=Math.imul(G,_e),w=w+Math.imul(J,Ae)|0,d=d+Math.imul(J,me)|0,d=d+Math.imul(ee,Ae)|0,g=g+Math.imul(ee,me)|0,w=w+Math.imul(j,we)|0,d=d+Math.imul(j,Be)|0,d=d+Math.imul(U,we)|0,g=g+Math.imul(U,Be)|0,w=w+Math.imul(T,Re)|0,d=d+Math.imul(T,qe)|0,d=d+Math.imul(z,Re)|0,g=g+Math.imul(z,qe)|0;var _f=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(_f>>>26)|0,_f&=67108863,w=Math.imul(de,ye),d=Math.imul(de,_e),d=d+Math.imul(le,ye)|0,g=Math.imul(le,_e),w=w+Math.imul($,Ae)|0,d=d+Math.imul($,me)|0,d=d+Math.imul(G,Ae)|0,g=g+Math.imul(G,me)|0,w=w+Math.imul(J,we)|0,d=d+Math.imul(J,Be)|0,d=d+Math.imul(ee,we)|0,g=g+Math.imul(ee,Be)|0,w=w+Math.imul(j,Re)|0,d=d+Math.imul(j,qe)|0,d=d+Math.imul(U,Re)|0,g=g+Math.imul(U,qe)|0,w=w+Math.imul(T,Se)|0,d=d+Math.imul(T,Ce)|0,d=d+Math.imul(z,Se)|0,g=g+Math.imul(z,Ce)|0;var mf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(mf>>>26)|0,mf&=67108863,w=Math.imul(ve,ye),d=Math.imul(ve,_e),d=d+Math.imul(ce,ye)|0,g=Math.imul(ce,_e),w=w+Math.imul(de,Ae)|0,d=d+Math.imul(de,me)|0,d=d+Math.imul(le,Ae)|0,g=g+Math.imul(le,me)|0,w=w+Math.imul($,we)|0,d=d+Math.imul($,Be)|0,d=d+Math.imul(G,we)|0,g=g+Math.imul(G,Be)|0,w=w+Math.imul(J,Re)|0,d=d+Math.imul(J,qe)|0,d=d+Math.imul(ee,Re)|0,g=g+Math.imul(ee,qe)|0,w=w+Math.imul(j,Se)|0,d=d+Math.imul(j,Ce)|0,d=d+Math.imul(U,Se)|0,g=g+Math.imul(U,Ce)|0,w=w+Math.imul(T,Ee)|0,d=d+Math.imul(T,Ie)|0,d=d+Math.imul(z,Ee)|0,g=g+Math.imul(z,Ie)|0;var wf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(wf>>>26)|0,wf&=67108863,w=Math.imul(Z,ye),d=Math.imul(Z,_e),d=d+Math.imul(re,ye)|0,g=Math.imul(re,_e),w=w+Math.imul(ve,Ae)|0,d=d+Math.imul(ve,me)|0,d=d+Math.imul(ce,Ae)|0,g=g+Math.imul(ce,me)|0,w=w+Math.imul(de,we)|0,d=d+Math.imul(de,Be)|0,d=d+Math.imul(le,we)|0,g=g+Math.imul(le,Be)|0,w=w+Math.imul($,Re)|0,d=d+Math.imul($,qe)|0,d=d+Math.imul(G,Re)|0,g=g+Math.imul(G,qe)|0,w=w+Math.imul(J,Se)|0,d=d+Math.imul(J,Ce)|0,d=d+Math.imul(ee,Se)|0,g=g+Math.imul(ee,Ce)|0,w=w+Math.imul(j,Ee)|0,d=d+Math.imul(j,Ie)|0,d=d+Math.imul(U,Ee)|0,g=g+Math.imul(U,Ie)|0,w=w+Math.imul(T,V)|0,d=d+Math.imul(T,te)|0,d=d+Math.imul(z,V)|0,g=g+Math.imul(z,te)|0;var Sf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Sf>>>26)|0,Sf&=67108863,w=Math.imul(xe,ye),d=Math.imul(xe,_e),d=d+Math.imul(ae,ye)|0,g=Math.imul(ae,_e),w=w+Math.imul(Z,Ae)|0,d=d+Math.imul(Z,me)|0,d=d+Math.imul(re,Ae)|0,g=g+Math.imul(re,me)|0,w=w+Math.imul(ve,we)|0,d=d+Math.imul(ve,Be)|0,d=d+Math.imul(ce,we)|0,g=g+Math.imul(ce,Be)|0,w=w+Math.imul(de,Re)|0,d=d+Math.imul(de,qe)|0,d=d+Math.imul(le,Re)|0,g=g+Math.imul(le,qe)|0,w=w+Math.imul($,Se)|0,d=d+Math.imul($,Ce)|0,d=d+Math.imul(G,Se)|0,g=g+Math.imul(G,Ce)|0,w=w+Math.imul(J,Ee)|0,d=d+Math.imul(J,Ie)|0,d=d+Math.imul(ee,Ee)|0,g=g+Math.imul(ee,Ie)|0,w=w+Math.imul(j,V)|0,d=d+Math.imul(j,te)|0,d=d+Math.imul(U,V)|0,g=g+Math.imul(U,te)|0,w=w+Math.imul(T,ke)|0,d=d+Math.imul(T,Fe)|0,d=d+Math.imul(z,ke)|0,g=g+Math.imul(z,Fe)|0;var Ef=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Ef>>>26)|0,Ef&=67108863,w=Math.imul(Me,ye),d=Math.imul(Me,_e),d=d+Math.imul(ge,ye)|0,g=Math.imul(ge,_e),w=w+Math.imul(xe,Ae)|0,d=d+Math.imul(xe,me)|0,d=d+Math.imul(ae,Ae)|0,g=g+Math.imul(ae,me)|0,w=w+Math.imul(Z,we)|0,d=d+Math.imul(Z,Be)|0,d=d+Math.imul(re,we)|0,g=g+Math.imul(re,Be)|0,w=w+Math.imul(ve,Re)|0,d=d+Math.imul(ve,qe)|0,d=d+Math.imul(ce,Re)|0,g=g+Math.imul(ce,qe)|0,w=w+Math.imul(de,Se)|0,d=d+Math.imul(de,Ce)|0,d=d+Math.imul(le,Se)|0,g=g+Math.imul(le,Ce)|0,w=w+Math.imul($,Ee)|0,d=d+Math.imul($,Ie)|0,d=d+Math.imul(G,Ee)|0,g=g+Math.imul(G,Ie)|0,w=w+Math.imul(J,V)|0,d=d+Math.imul(J,te)|0,d=d+Math.imul(ee,V)|0,g=g+Math.imul(ee,te)|0,w=w+Math.imul(j,ke)|0,d=d+Math.imul(j,Fe)|0,d=d+Math.imul(U,ke)|0,g=g+Math.imul(U,Fe)|0,w=w+Math.imul(T,Le)|0,d=d+Math.imul(T,Ne)|0,d=d+Math.imul(z,Le)|0,g=g+Math.imul(z,Ne)|0;var Mf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Mf>>>26)|0,Mf&=67108863,w=Math.imul(se,ye),d=Math.imul(se,_e),d=d+Math.imul(ue,ye)|0,g=Math.imul(ue,_e),w=w+Math.imul(Me,Ae)|0,d=d+Math.imul(Me,me)|0,d=d+Math.imul(ge,Ae)|0,g=g+Math.imul(ge,me)|0,w=w+Math.imul(xe,we)|0,d=d+Math.imul(xe,Be)|0,d=d+Math.imul(ae,we)|0,g=g+Math.imul(ae,Be)|0,w=w+Math.imul(Z,Re)|0,d=d+Math.imul(Z,qe)|0,d=d+Math.imul(re,Re)|0,g=g+Math.imul(re,qe)|0,w=w+Math.imul(ve,Se)|0,d=d+Math.imul(ve,Ce)|0,d=d+Math.imul(ce,Se)|0,g=g+Math.imul(ce,Ce)|0,w=w+Math.imul(de,Ee)|0,d=d+Math.imul(de,Ie)|0,d=d+Math.imul(le,Ee)|0,g=g+Math.imul(le,Ie)|0,w=w+Math.imul($,V)|0,d=d+Math.imul($,te)|0,d=d+Math.imul(G,V)|0,g=g+Math.imul(G,te)|0,w=w+Math.imul(J,ke)|0,d=d+Math.imul(J,Fe)|0,d=d+Math.imul(ee,ke)|0,g=g+Math.imul(ee,Fe)|0,w=w+Math.imul(j,Le)|0,d=d+Math.imul(j,Ne)|0,d=d+Math.imul(U,Le)|0,g=g+Math.imul(U,Ne)|0,w=w+Math.imul(T,De)|0,d=d+Math.imul(T,Oe)|0,d=d+Math.imul(z,De)|0,g=g+Math.imul(z,Oe)|0;var Af=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Af>>>26)|0,Af&=67108863,w=Math.imul(se,Ae),d=Math.imul(se,me),d=d+Math.imul(ue,Ae)|0,g=Math.imul(ue,me),w=w+Math.imul(Me,we)|0,d=d+Math.imul(Me,Be)|0,d=d+Math.imul(ge,we)|0,g=g+Math.imul(ge,Be)|0,w=w+Math.imul(xe,Re)|0,d=d+Math.imul(xe,qe)|0,d=d+Math.imul(ae,Re)|0,g=g+Math.imul(ae,qe)|0,w=w+Math.imul(Z,Se)|0,d=d+Math.imul(Z,Ce)|0,d=d+Math.imul(re,Se)|0,g=g+Math.imul(re,Ce)|0,w=w+Math.imul(ve,Ee)|0,d=d+Math.imul(ve,Ie)|0,d=d+Math.imul(ce,Ee)|0,g=g+Math.imul(ce,Ie)|0,w=w+Math.imul(de,V)|0,d=d+Math.imul(de,te)|0,d=d+Math.imul(le,V)|0,g=g+Math.imul(le,te)|0,w=w+Math.imul($,ke)|0,d=d+Math.imul($,Fe)|0,d=d+Math.imul(G,ke)|0,g=g+Math.imul(G,Fe)|0,w=w+Math.imul(J,Le)|0,d=d+Math.imul(J,Ne)|0,d=d+Math.imul(ee,Le)|0,g=g+Math.imul(ee,Ne)|0,w=w+Math.imul(j,De)|0,d=d+Math.imul(j,Oe)|0,d=d+Math.imul(U,De)|0,g=g+Math.imul(U,Oe)|0;var Bf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Bf>>>26)|0,Bf&=67108863,w=Math.imul(se,we),d=Math.imul(se,Be),d=d+Math.imul(ue,we)|0,g=Math.imul(ue,Be),w=w+Math.imul(Me,Re)|0,d=d+Math.imul(Me,qe)|0,d=d+Math.imul(ge,Re)|0,g=g+Math.imul(ge,qe)|0,w=w+Math.imul(xe,Se)|0,d=d+Math.imul(xe,Ce)|0,d=d+Math.imul(ae,Se)|0,g=g+Math.imul(ae,Ce)|0,w=w+Math.imul(Z,Ee)|0,d=d+Math.imul(Z,Ie)|0,d=d+Math.imul(re,Ee)|0,g=g+Math.imul(re,Ie)|0,w=w+Math.imul(ve,V)|0,d=d+Math.imul(ve,te)|0,d=d+Math.imul(ce,V)|0,g=g+Math.imul(ce,te)|0,w=w+Math.imul(de,ke)|0,d=d+Math.imul(de,Fe)|0,d=d+Math.imul(le,ke)|0,g=g+Math.imul(le,Fe)|0,w=w+Math.imul($,Le)|0,d=d+Math.imul($,Ne)|0,d=d+Math.imul(G,Le)|0,g=g+Math.imul(G,Ne)|0,w=w+Math.imul(J,De)|0,d=d+Math.imul(J,Oe)|0,d=d+Math.imul(ee,De)|0,g=g+Math.imul(ee,Oe)|0;var Rf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Rf>>>26)|0,Rf&=67108863,w=Math.imul(se,Re),d=Math.imul(se,qe),d=d+Math.imul(ue,Re)|0,g=Math.imul(ue,qe),w=w+Math.imul(Me,Se)|0,d=d+Math.imul(Me,Ce)|0,d=d+Math.imul(ge,Se)|0,g=g+Math.imul(ge,Ce)|0,w=w+Math.imul(xe,Ee)|0,d=d+Math.imul(xe,Ie)|0,d=d+Math.imul(ae,Ee)|0,g=g+Math.imul(ae,Ie)|0,w=w+Math.imul(Z,V)|0,d=d+Math.imul(Z,te)|0,d=d+Math.imul(re,V)|0,g=g+Math.imul(re,te)|0,w=w+Math.imul(ve,ke)|0,d=d+Math.imul(ve,Fe)|0,d=d+Math.imul(ce,ke)|0,g=g+Math.imul(ce,Fe)|0,w=w+Math.imul(de,Le)|0,d=d+Math.imul(de,Ne)|0,d=d+Math.imul(le,Le)|0,g=g+Math.imul(le,Ne)|0,w=w+Math.imul($,De)|0,d=d+Math.imul($,Oe)|0,d=d+Math.imul(G,De)|0,g=g+Math.imul(G,Oe)|0;var qf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(qf>>>26)|0,qf&=67108863,w=Math.imul(se,Se),d=Math.imul(se,Ce),d=d+Math.imul(ue,Se)|0,g=Math.imul(ue,Ce),w=w+Math.imul(Me,Ee)|0,d=d+Math.imul(Me,Ie)|0,d=d+Math.imul(ge,Ee)|0,g=g+Math.imul(ge,Ie)|0,w=w+Math.imul(xe,V)|0,d=d+Math.imul(xe,te)|0,d=d+Math.imul(ae,V)|0,g=g+Math.imul(ae,te)|0,w=w+Math.imul(Z,ke)|0,d=d+Math.imul(Z,Fe)|0,d=d+Math.imul(re,ke)|0,g=g+Math.imul(re,Fe)|0,w=w+Math.imul(ve,Le)|0,d=d+Math.imul(ve,Ne)|0,d=d+Math.imul(ce,Le)|0,g=g+Math.imul(ce,Ne)|0,w=w+Math.imul(de,De)|0,d=d+Math.imul(de,Oe)|0,d=d+Math.imul(le,De)|0,g=g+Math.imul(le,Oe)|0;var Cf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Cf>>>26)|0,Cf&=67108863,w=Math.imul(se,Ee),d=Math.imul(se,Ie),d=d+Math.imul(ue,Ee)|0,g=Math.imul(ue,Ie),w=w+Math.imul(Me,V)|0,d=d+Math.imul(Me,te)|0,d=d+Math.imul(ge,V)|0,g=g+Math.imul(ge,te)|0,w=w+Math.imul(xe,ke)|0,d=d+Math.imul(xe,Fe)|0,d=d+Math.imul(ae,ke)|0,g=g+Math.imul(ae,Fe)|0,w=w+Math.imul(Z,Le)|0,d=d+Math.imul(Z,Ne)|0,d=d+Math.imul(re,Le)|0,g=g+Math.imul(re,Ne)|0,w=w+Math.imul(ve,De)|0,d=d+Math.imul(ve,Oe)|0,d=d+Math.imul(ce,De)|0,g=g+Math.imul(ce,Oe)|0;var If=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(If>>>26)|0,If&=67108863,w=Math.imul(se,V),d=Math.imul(se,te),d=d+Math.imul(ue,V)|0,g=Math.imul(ue,te),w=w+Math.imul(Me,ke)|0,d=d+Math.imul(Me,Fe)|0,d=d+Math.imul(ge,ke)|0,g=g+Math.imul(ge,Fe)|0,w=w+Math.imul(xe,Le)|0,d=d+Math.imul(xe,Ne)|0,d=d+Math.imul(ae,Le)|0,g=g+Math.imul(ae,Ne)|0,w=w+Math.imul(Z,De)|0,d=d+Math.imul(Z,Oe)|0,d=d+Math.imul(re,De)|0,g=g+Math.imul(re,Oe)|0;var kf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(kf>>>26)|0,kf&=67108863,w=Math.imul(se,ke),d=Math.imul(se,Fe),d=d+Math.imul(ue,ke)|0,g=Math.imul(ue,Fe),w=w+Math.imul(Me,Le)|0,d=d+Math.imul(Me,Ne)|0,d=d+Math.imul(ge,Le)|0,g=g+Math.imul(ge,Ne)|0,w=w+Math.imul(xe,De)|0,d=d+Math.imul(xe,Oe)|0,d=d+Math.imul(ae,De)|0,g=g+Math.imul(ae,Oe)|0;var Tf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Tf>>>26)|0,Tf&=67108863,w=Math.imul(se,Le),d=Math.imul(se,Ne),d=d+Math.imul(ue,Le)|0,g=Math.imul(ue,Ne),w=w+Math.imul(Me,De)|0,d=d+Math.imul(Me,Oe)|0,d=d+Math.imul(ge,De)|0,g=g+Math.imul(ge,Oe)|0;var Pf=(q+w|0)+((d&8191)<<13)|0;q=(g+(d>>>13)|0)+(Pf>>>26)|0,Pf&=67108863,w=Math.imul(se,De),d=Math.imul(se,Oe),d=d+Math.imul(ue,De)|0,g=Math.imul(ue,Oe);var Ff=(q+w|0)+((d&8191)<<13)|0;return q=(g+(d>>>13)|0)+(Ff>>>26)|0,Ff&=67108863,B[0]=xf,B[1]=gf,B[2]=yf,B[3]=_f,B[4]=mf,B[5]=wf,B[6]=Sf,B[7]=Ef,B[8]=Mf,B[9]=Af,B[10]=Bf,B[11]=Rf,B[12]=qf,B[13]=Cf,B[14]=If,B[15]=kf,B[16]=Tf,B[17]=Pf,B[18]=Ff,q!==0&&(B[19]=q,b.length++),b};Math.imul||(E=y);function R(M,s,c){c.negative=s.negative^M.negative,c.length=M.length+s.length;for(var b=0,p=0,m=0;m<c.length-1;m++){var B=p;p=0;for(var q=b&67108863,w=Math.min(m,s.length-1),d=Math.max(0,m-M.length+1);d<=w;d++){var g=m-d,F=M.words[g]|0,T=s.words[d]|0,z=F*T,W=z&67108863;B=B+(z/67108864|0)|0,W=W+q|0,q=W&67108863,B=B+(W>>>26)|0,p+=B>>>26,B&=67108863}c.words[m]=q,b=B,B=p}return b!==0?c.words[m]=b:c.length--,c.strip()}function A(M,s,c){var b=new _;return b.mulp(M,s,c)}n.prototype.mulTo=function(s,c){var b,p=this.length+s.length;return this.length===10&&s.length===10?b=E(this,s,c):p<63?b=y(this,s,c):p<1024?b=R(this,s,c):b=A(this,s,c),b};function _(M,s){this.x=M,this.y=s}_.prototype.makeRBT=function(s){for(var c=new Array(s),b=n.prototype._countBits(s)-1,p=0;p<s;p++)c[p]=this.revBin(p,b,s);return c},_.prototype.revBin=function(s,c,b){if(s===0||s===b-1)return s;for(var p=0,m=0;m<c;m++)p|=(s&1)<<c-m-1,s>>=1;return p},_.prototype.permute=function(s,c,b,p,m,B){for(var q=0;q<B;q++)p[q]=c[s[q]],m[q]=b[s[q]]},_.prototype.transform=function(s,c,b,p,m,B){this.permute(B,s,c,b,p,m);for(var q=1;q<m;q<<=1)for(var w=q<<1,d=Math.cos(2*Math.PI/w),g=Math.sin(2*Math.PI/w),F=0;F<m;F+=w)for(var T=d,z=g,W=0;W<q;W++){var j=b[F+W],U=p[F+W],pe=b[F+W+q],J=p[F+W+q],ee=T*pe-z*J;J=T*J+z*pe,pe=ee,b[F+W]=j+pe,p[F+W]=U+J,b[F+W+q]=j-pe,p[F+W+q]=U-J,W!==w&&(ee=d*T-g*z,z=d*z+g*T,T=ee)}},_.prototype.guessLen13b=function(s,c){var b=Math.max(c,s)|1,p=b&1,m=0;for(b=b/2|0;b;b=b>>>1)m++;return 1<<m+1+p},_.prototype.conjugate=function(s,c,b){if(!(b<=1))for(var p=0;p<b/2;p++){var m=s[p];s[p]=s[b-p-1],s[b-p-1]=m,m=c[p],c[p]=-c[b-p-1],c[b-p-1]=-m}},_.prototype.normalize13b=function(s,c){for(var b=0,p=0;p<c/2;p++){var m=Math.round(s[2*p+1]/c)*8192+Math.round(s[2*p]/c)+b;s[p]=m&67108863,m<67108864?b=0:b=m/67108864|0}return s},_.prototype.convert13b=function(s,c,b,p){for(var m=0,B=0;B<c;B++)m=m+(s[B]|0),b[2*B]=m&8191,m=m>>>13,b[2*B+1]=m&8191,m=m>>>13;for(B=2*c;B<p;++B)b[B]=0;t(m===0),t((m&~8191)==0)},_.prototype.stub=function(s){for(var c=new Array(s),b=0;b<s;b++)c[b]=0;return c},_.prototype.mulp=function(s,c,b){var p=2*this.guessLen13b(s.length,c.length),m=this.makeRBT(p),B=this.stub(p),q=new Array(p),w=new Array(p),d=new Array(p),g=new Array(p),F=new Array(p),T=new Array(p),z=b.words;z.length=p,this.convert13b(s.words,s.length,q,p),this.convert13b(c.words,c.length,g,p),this.transform(q,B,w,d,p,m),this.transform(g,B,F,T,p,m);for(var W=0;W<p;W++){var j=w[W]*F[W]-d[W]*T[W];d[W]=w[W]*T[W]+d[W]*F[W],w[W]=j}return this.conjugate(w,d,p),this.transform(w,d,z,B,p,m),this.conjugate(z,B,p),this.normalize13b(z,p),b.negative=s.negative^c.negative,b.length=s.length+c.length,b.strip()},n.prototype.mul=function(s){var c=new n(null);return c.words=new Array(this.length+s.length),this.mulTo(s,c)},n.prototype.mulf=function(s){var c=new n(null);return c.words=new Array(this.length+s.length),A(this,s,c)},n.prototype.imul=function(s){return this.clone().mulTo(s,this)},n.prototype.imuln=function(s){t(typeof s=="number"),t(s<67108864);for(var c=0,b=0;b<this.length;b++){var p=(this.words[b]|0)*s,m=(p&67108863)+(c&67108863);c>>=26,c+=p/67108864|0,c+=m>>>26,this.words[b]=m&67108863}return c!==0&&(this.words[b]=c,this.length++),this},n.prototype.muln=function(s){return this.clone().imuln(s)},n.prototype.sqr=function(){return this.mul(this)},n.prototype.isqr=function(){return this.imul(this.clone())},n.prototype.pow=function(s){var c=x(s);if(c.length===0)return new n(1);for(var b=this,p=0;p<c.length&&c[p]===0;p++,b=b.sqr());if(++p<c.length)for(var m=b.sqr();p<c.length;p++,m=m.sqr())c[p]!==0&&(b=b.mul(m));return b},n.prototype.iushln=function(s){t(typeof s=="number"&&s>=0);var c=s%26,b=(s-c)/26,p=67108863>>>26-c<<26-c,m;if(c!==0){var B=0;for(m=0;m<this.length;m++){var q=this.words[m]&p,w=(this.words[m]|0)-q<<c;this.words[m]=w|B,B=q>>>26-c}B&&(this.words[m]=B,this.length++)}if(b!==0){for(m=this.length-1;m>=0;m--)this.words[m+b]=this.words[m];for(m=0;m<b;m++)this.words[m]=0;this.length+=b}return this.strip()},n.prototype.ishln=function(s){return t(this.negative===0),this.iushln(s)},n.prototype.iushrn=function(s,c,b){t(typeof s=="number"&&s>=0);var p;c?p=(c-c%26)/26:p=0;var m=s%26,B=Math.min((s-m)/26,this.length),q=67108863^67108863>>>m<<m,w=b;if(p-=B,p=Math.max(0,p),w){for(var d=0;d<B;d++)w.words[d]=this.words[d];w.length=B}if(B!==0)if(this.length>B)for(this.length-=B,d=0;d<this.length;d++)this.words[d]=this.words[d+B];else this.words[0]=0,this.length=1;var g=0;for(d=this.length-1;d>=0&&(g!==0||d>=p);d--){var F=this.words[d]|0;this.words[d]=g<<26-m|F>>>m,g=F&q}return w&&g!==0&&(w.words[w.length++]=g),this.length===0&&(this.words[0]=0,this.length=1),this.strip()},n.prototype.ishrn=function(s,c,b){return t(this.negative===0),this.iushrn(s,c,b)},n.prototype.shln=function(s){return this.clone().ishln(s)},n.prototype.ushln=function(s){return this.clone().iushln(s)},n.prototype.shrn=function(s){return this.clone().ishrn(s)},n.prototype.ushrn=function(s){return this.clone().iushrn(s)},n.prototype.testn=function(s){t(typeof s=="number"&&s>=0);var c=s%26,b=(s-c)/26,p=1<<c;if(this.length<=b)return!1;var m=this.words[b];return!!(m&p)},n.prototype.imaskn=function(s){t(typeof s=="number"&&s>=0);var c=s%26,b=(s-c)/26;if(t(this.negative===0,"imaskn works only with positive numbers"),this.length<=b)return this;if(c!==0&&b++,this.length=Math.min(b,this.length),c!==0){var p=67108863^67108863>>>c<<c;this.words[this.length-1]&=p}return this.strip()},n.prototype.maskn=function(s){return this.clone().imaskn(s)},n.prototype.iaddn=function(s){return t(typeof s=="number"),t(s<67108864),s<0?this.isubn(-s):this.negative!==0?this.length===1&&(this.words[0]|0)<s?(this.words[0]=s-(this.words[0]|0),this.negative=0,this):(this.negative=0,this.isubn(s),this.negative=1,this):this._iaddn(s)},n.prototype._iaddn=function(s){this.words[0]+=s;for(var c=0;c<this.length&&this.words[c]>=67108864;c++)this.words[c]-=67108864,c===this.length-1?this.words[c+1]=1:this.words[c+1]++;return this.length=Math.max(this.length,c+1),this},n.prototype.isubn=function(s){if(t(typeof s=="number"),t(s<67108864),s<0)return this.iaddn(-s);if(this.negative!==0)return this.negative=0,this.iaddn(s),this.negative=1,this;if(this.words[0]-=s,this.length===1&&this.words[0]<0)this.words[0]=-this.words[0],this.negative=1;else for(var c=0;c<this.length&&this.words[c]<0;c++)this.words[c]+=67108864,this.words[c+1]-=1;return this.strip()},n.prototype.addn=function(s){return this.clone().iaddn(s)},n.prototype.subn=function(s){return this.clone().isubn(s)},n.prototype.iabs=function(){return this.negative=0,this},n.prototype.abs=function(){return this.clone().iabs()},n.prototype._ishlnsubmul=function(s,c,b){var p=s.length+b,m;this._expand(p);var B,q=0;for(m=0;m<s.length;m++){B=(this.words[m+b]|0)+q;var w=(s.words[m]|0)*c;B-=w&67108863,q=(B>>26)-(w/67108864|0),this.words[m+b]=B&67108863}for(;m<this.length-b;m++)B=(this.words[m+b]|0)+q,q=B>>26,this.words[m+b]=B&67108863;if(q===0)return this.strip();for(t(q===-1),q=0,m=0;m<this.length;m++)B=-(this.words[m]|0)+q,q=B>>26,this.words[m]=B&67108863;return this.negative=1,this.strip()},n.prototype._wordDiv=function(s,c){var b=this.length-s.length,p=this.clone(),m=s,B=m.words[m.length-1]|0,q=this._countBits(B);b=26-q,b!==0&&(m=m.ushln(b),p.iushln(b),B=m.words[m.length-1]|0);var w=p.length-m.length,d;if(c!=="mod"){d=new n(null),d.length=w+1,d.words=new Array(d.length);for(var g=0;g<d.length;g++)d.words[g]=0}var F=p.clone()._ishlnsubmul(m,1,w);F.negative===0&&(p=F,d&&(d.words[w]=1));for(var T=w-1;T>=0;T--){var z=(p.words[m.length+T]|0)*67108864+(p.words[m.length+T-1]|0);for(z=Math.min(z/B|0,67108863),p._ishlnsubmul(m,z,T);p.negative!==0;)z--,p.negative=0,p._ishlnsubmul(m,1,T),p.isZero()||(p.negative^=1);d&&(d.words[T]=z)}return d&&d.strip(),p.strip(),c!=="div"&&b!==0&&p.iushrn(b),{div:d||null,mod:p}},n.prototype.divmod=function(s,c,b){if(t(!s.isZero()),this.isZero())return{div:new n(0),mod:new n(0)};var p,m,B;return this.negative!==0&&s.negative===0?(B=this.neg().divmod(s,c),c!=="mod"&&(p=B.div.neg()),c!=="div"&&(m=B.mod.neg(),b&&m.negative!==0&&m.iadd(s)),{div:p,mod:m}):this.negative===0&&s.negative!==0?(B=this.divmod(s.neg(),c),c!=="mod"&&(p=B.div.neg()),{div:p,mod:B.mod}):(this.negative&s.negative)!=0?(B=this.neg().divmod(s.neg(),c),c!=="div"&&(m=B.mod.neg(),b&&m.negative!==0&&m.isub(s)),{div:B.div,mod:m}):s.length>this.length||this.cmp(s)<0?{div:new n(0),mod:this}:s.length===1?c==="div"?{div:this.divn(s.words[0]),mod:null}:c==="mod"?{div:null,mod:new n(this.modn(s.words[0]))}:{div:this.divn(s.words[0]),mod:new n(this.modn(s.words[0]))}:this._wordDiv(s,c)},n.prototype.div=function(s){return this.divmod(s,"div",!1).div},n.prototype.mod=function(s){return this.divmod(s,"mod",!1).mod},n.prototype.umod=function(s){return this.divmod(s,"mod",!0).mod},n.prototype.divRound=function(s){var c=this.divmod(s);if(c.mod.isZero())return c.div;var b=c.div.negative!==0?c.mod.isub(s):c.mod,p=s.ushrn(1),m=s.andln(1),B=b.cmp(p);return B<0||m===1&&B===0?c.div:c.div.negative!==0?c.div.isubn(1):c.div.iaddn(1)},n.prototype.modn=function(s){t(s<=67108863);for(var c=(1<<26)%s,b=0,p=this.length-1;p>=0;p--)b=(c*b+(this.words[p]|0))%s;return b},n.prototype.idivn=function(s){t(s<=67108863);for(var c=0,b=this.length-1;b>=0;b--){var p=(this.words[b]|0)+c*67108864;this.words[b]=p/s|0,c=p%s}return this.strip()},n.prototype.divn=function(s){return this.clone().idivn(s)},n.prototype.egcd=function(s){t(s.negative===0),t(!s.isZero());var c=this,b=s.clone();c.negative!==0?c=c.umod(s):c=c.clone();for(var p=new n(1),m=new n(0),B=new n(0),q=new n(1),w=0;c.isEven()&&b.isEven();)c.iushrn(1),b.iushrn(1),++w;for(var d=b.clone(),g=c.clone();!c.isZero();){for(var F=0,T=1;(c.words[0]&T)==0&&F<26;++F,T<<=1);if(F>0)for(c.iushrn(F);F-- >0;)(p.isOdd()||m.isOdd())&&(p.iadd(d),m.isub(g)),p.iushrn(1),m.iushrn(1);for(var z=0,W=1;(b.words[0]&W)==0&&z<26;++z,W<<=1);if(z>0)for(b.iushrn(z);z-- >0;)(B.isOdd()||q.isOdd())&&(B.iadd(d),q.isub(g)),B.iushrn(1),q.iushrn(1);c.cmp(b)>=0?(c.isub(b),p.isub(B),m.isub(q)):(b.isub(c),B.isub(p),q.isub(m))}return{a:B,b:q,gcd:b.iushln(w)}},n.prototype._invmp=function(s){t(s.negative===0),t(!s.isZero());var c=this,b=s.clone();c.negative!==0?c=c.umod(s):c=c.clone();for(var p=new n(1),m=new n(0),B=b.clone();c.cmpn(1)>0&&b.cmpn(1)>0;){for(var q=0,w=1;(c.words[0]&w)==0&&q<26;++q,w<<=1);if(q>0)for(c.iushrn(q);q-- >0;)p.isOdd()&&p.iadd(B),p.iushrn(1);for(var d=0,g=1;(b.words[0]&g)==0&&d<26;++d,g<<=1);if(d>0)for(b.iushrn(d);d-- >0;)m.isOdd()&&m.iadd(B),m.iushrn(1);c.cmp(b)>=0?(c.isub(b),p.isub(m)):(b.isub(c),m.isub(p))}var F;return c.cmpn(1)===0?F=p:F=m,F.cmpn(0)<0&&F.iadd(s),F},n.prototype.gcd=function(s){if(this.isZero())return s.abs();if(s.isZero())return this.abs();var c=this.clone(),b=s.clone();c.negative=0,b.negative=0;for(var p=0;c.isEven()&&b.isEven();p++)c.iushrn(1),b.iushrn(1);do{for(;c.isEven();)c.iushrn(1);for(;b.isEven();)b.iushrn(1);var m=c.cmp(b);if(m<0){var B=c;c=b,b=B}else if(m===0||b.cmpn(1)===0)break;c.isub(b)}while(!0);return b.iushln(p)},n.prototype.invm=function(s){return this.egcd(s).a.umod(s)},n.prototype.isEven=function(){return(this.words[0]&1)==0},n.prototype.isOdd=function(){return(this.words[0]&1)==1},n.prototype.andln=function(s){return this.words[0]&s},n.prototype.bincn=function(s){t(typeof s=="number");var c=s%26,b=(s-c)/26,p=1<<c;if(this.length<=b)return this._expand(b+1),this.words[b]|=p,this;for(var m=p,B=b;m!==0&&B<this.length;B++){var q=this.words[B]|0;q+=m,m=q>>>26,q&=67108863,this.words[B]=q}return m!==0&&(this.words[B]=m,this.length++),this},n.prototype.isZero=function(){return this.length===1&&this.words[0]===0},n.prototype.cmpn=function(s){var c=s<0;if(this.negative!==0&&!c)return-1;if(this.negative===0&&c)return 1;this.strip();var b;if(this.length>1)b=1;else{c&&(s=-s),t(s<=67108863,"Number is too big");var p=this.words[0]|0;b=p===s?0:p<s?-1:1}return this.negative!==0?-b|0:b},n.prototype.cmp=function(s){if(this.negative!==0&&s.negative===0)return-1;if(this.negative===0&&s.negative!==0)return 1;var c=this.ucmp(s);return this.negative!==0?-c|0:c},n.prototype.ucmp=function(s){if(this.length>s.length)return 1;if(this.length<s.length)return-1;for(var c=0,b=this.length-1;b>=0;b--){var p=this.words[b]|0,m=s.words[b]|0;if(p!==m){p<m?c=-1:p>m&&(c=1);break}}return c},n.prototype.gtn=function(s){return this.cmpn(s)===1},n.prototype.gt=function(s){return this.cmp(s)===1},n.prototype.gten=function(s){return this.cmpn(s)>=0},n.prototype.gte=function(s){return this.cmp(s)>=0},n.prototype.ltn=function(s){return this.cmpn(s)===-1},n.prototype.lt=function(s){return this.cmp(s)===-1},n.prototype.lten=function(s){return this.cmpn(s)<=0},n.prototype.lte=function(s){return this.cmp(s)<=0},n.prototype.eqn=function(s){return this.cmpn(s)===0},n.prototype.eq=function(s){return this.cmp(s)===0},n.red=function(s){return new N(s)},n.prototype.toRed=function(s){return t(!this.red,"Already a number in reduction context"),t(this.negative===0,"red works only with positives"),s.convertTo(this)._forceRed(s)},n.prototype.fromRed=function(){return t(this.red,"fromRed works only with numbers in reduction context"),this.red.convertFrom(this)},n.prototype._forceRed=function(s){return this.red=s,this},n.prototype.forceRed=function(s){return t(!this.red,"Already a number in reduction context"),this._forceRed(s)},n.prototype.redAdd=function(s){return t(this.red,"redAdd works only with red numbers"),this.red.add(this,s)},n.prototype.redIAdd=function(s){return t(this.red,"redIAdd works only with red numbers"),this.red.iadd(this,s)},n.prototype.redSub=function(s){return t(this.red,"redSub works only with red numbers"),this.red.sub(this,s)},n.prototype.redISub=function(s){return t(this.red,"redISub works only with red numbers"),this.red.isub(this,s)},n.prototype.redShl=function(s){return t(this.red,"redShl works only with red numbers"),this.red.shl(this,s)},n.prototype.redMul=function(s){return t(this.red,"redMul works only with red numbers"),this.red._verify2(this,s),this.red.mul(this,s)},n.prototype.redIMul=function(s){return t(this.red,"redMul works only with red numbers"),this.red._verify2(this,s),this.red.imul(this,s)},n.prototype.redSqr=function(){return t(this.red,"redSqr works only with red numbers"),this.red._verify1(this),this.red.sqr(this)},n.prototype.redISqr=function(){return t(this.red,"redISqr works only with red numbers"),this.red._verify1(this),this.red.isqr(this)},n.prototype.redSqrt=function(){return t(this.red,"redSqrt works only with red numbers"),this.red._verify1(this),this.red.sqrt(this)},n.prototype.redInvm=function(){return t(this.red,"redInvm works only with red numbers"),this.red._verify1(this),this.red.invm(this)},n.prototype.redNeg=function(){return t(this.red,"redNeg works only with red numbers"),this.red._verify1(this),this.red.neg(this)},n.prototype.redPow=function(s){return t(this.red&&!s.red,"redPow(normalNum)"),this.red._verify1(this),this.red.pow(this,s)};var S={k256:null,p224:null,p192:null,p25519:null};function C(M,s){this.name=M,this.p=new n(s,16),this.n=this.p.bitLength(),this.k=new n(1).iushln(this.n).isub(this.p),this.tmp=this._tmp()}C.prototype._tmp=function(){var s=new n(null);return s.words=new Array(Math.ceil(this.n/13)),s},C.prototype.ireduce=function(s){var c=s,b;do this.split(c,this.tmp),c=this.imulK(c),c=c.iadd(this.tmp),b=c.bitLength();while(b>this.n);var p=b<this.n?-1:c.ucmp(this.p);return p===0?(c.words[0]=0,c.length=1):p>0?c.isub(this.p):c.strip!==void 0?c.strip():c._strip(),c},C.prototype.split=function(s,c){s.iushrn(this.n,0,c)},C.prototype.imulK=function(s){return s.imul(this.k)};function I(){C.call(this,"k256","ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe fffffc2f")}i(I,C),I.prototype.split=function(s,c){for(var b=4194303,p=Math.min(s.length,9),m=0;m<p;m++)c.words[m]=s.words[m];if(c.length=p,s.length<=9){s.words[0]=0,s.length=1;return}var B=s.words[9];for(c.words[c.length++]=B&b,m=10;m<s.length;m++){var q=s.words[m]|0;s.words[m-10]=(q&b)<<4|B>>>22,B=q}B>>>=22,s.words[m-10]=B,B===0&&s.length>10?s.length-=10:s.length-=9},I.prototype.imulK=function(s){s.words[s.length]=0,s.words[s.length+1]=0,s.length+=2;for(var c=0,b=0;b<s.length;b++){var p=s.words[b]|0;c+=p*977,s.words[b]=c&67108863,c=p*64+(c/67108864|0)}return s.words[s.length-1]===0&&(s.length--,s.words[s.length-1]===0&&s.length--),s};function P(){C.call(this,"p224","ffffffff ffffffff ffffffff ffffffff 00000000 00000000 00000001")}i(P,C);function k(){C.call(this,"p192","ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff")}i(k,C);function D(){C.call(this,"25519","7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed")}i(D,C),D.prototype.imulK=function(s){for(var c=0,b=0;b<s.length;b++){var p=(s.words[b]|0)*19+c,m=p&67108863;p>>>=26,s.words[b]=m,c=p}return c!==0&&(s.words[s.length++]=c),s},n._prime=function(s){if(S[s])return S[s];var c;if(s==="k256")c=new I;else if(s==="p224")c=new P;else if(s==="p192")c=new k;else if(s==="p25519")c=new D;else throw new Error("Unknown prime "+s);return S[s]=c,c};function N(M){if(typeof M=="string"){var s=n._prime(M);this.m=s.p,this.prime=s}else t(M.gtn(1),"modulus must be greater than 1"),this.m=M,this.prime=null}N.prototype._verify1=function(s){t(s.negative===0,"red works only with positives"),t(s.red,"red works only with red numbers")},N.prototype._verify2=function(s,c){t((s.negative|c.negative)==0,"red works only with positives"),t(s.red&&s.red===c.red,"red works only with red numbers")},N.prototype.imod=function(s){return this.prime?this.prime.ireduce(s)._forceRed(this):s.umod(this.m)._forceRed(this)},N.prototype.neg=function(s){return s.isZero()?s.clone():this.m.sub(s)._forceRed(this)},N.prototype.add=function(s,c){this._verify2(s,c);var b=s.add(c);return b.cmp(this.m)>=0&&b.isub(this.m),b._forceRed(this)},N.prototype.iadd=function(s,c){this._verify2(s,c);var b=s.iadd(c);return b.cmp(this.m)>=0&&b.isub(this.m),b},N.prototype.sub=function(s,c){this._verify2(s,c);var b=s.sub(c);return b.cmpn(0)<0&&b.iadd(this.m),b._forceRed(this)},N.prototype.isub=function(s,c){this._verify2(s,c);var b=s.isub(c);return b.cmpn(0)<0&&b.iadd(this.m),b},N.prototype.shl=function(s,c){return this._verify1(s),this.imod(s.ushln(c))},N.prototype.imul=function(s,c){return this._verify2(s,c),this.imod(s.imul(c))},N.prototype.mul=function(s,c){return this._verify2(s,c),this.imod(s.mul(c))},N.prototype.isqr=function(s){return this.imul(s,s.clone())},N.prototype.sqr=function(s){return this.mul(s,s)},N.prototype.sqrt=function(s){if(s.isZero())return s.clone();var c=this.m.andln(3);if(t(c%2==1),c===3){var b=this.m.add(new n(1)).iushrn(2);return this.pow(s,b)}for(var p=this.m.subn(1),m=0;!p.isZero()&&p.andln(1)===0;)m++,p.iushrn(1);t(!p.isZero());var B=new n(1).toRed(this),q=B.redNeg(),w=this.m.subn(1).iushrn(1),d=this.m.bitLength();for(d=new n(2*d*d).toRed(this);this.pow(d,w).cmp(q)!==0;)d.redIAdd(q);for(var g=this.pow(d,p),F=this.pow(s,p.addn(1).iushrn(1)),T=this.pow(s,p),z=m;T.cmp(B)!==0;){for(var W=T,j=0;W.cmp(B)!==0;j++)W=W.redSqr();t(j<z);var U=this.pow(g,new n(1).iushln(z-j-1));F=F.redMul(U),g=U.redSqr(),T=T.redMul(g),z=j}return F},N.prototype.invm=function(s){var c=s._invmp(this.m);return c.negative!==0?(c.negative=0,this.imod(c).redNeg()):this.imod(c)},N.prototype.pow=function(s,c){if(c.isZero())return new n(1).toRed(this);if(c.cmpn(1)===0)return s.clone();var b=4,p=new Array(1<<b);p[0]=new n(1).toRed(this),p[1]=s;for(var m=2;m<p.length;m++)p[m]=this.mul(p[m-1],s);var B=p[0],q=0,w=0,d=c.bitLength()%26;for(d===0&&(d=26),m=c.length-1;m>=0;m--){for(var g=c.words[m],F=d-1;F>=0;F--){var T=g>>F&1;if(B!==p[0]&&(B=this.sqr(B)),T===0&&q===0){w=0;continue}q<<=1,q|=T,w++,!(w!==b&&(m!==0||F!==0))&&(B=this.mul(B,p[q]),w=0,q=0)}d=26}return B},N.prototype.convertTo=function(s){var c=s.umod(this.m);return c===s?c.clone():c},N.prototype.convertFrom=function(s){var c=s.clone();return c.red=null,c},n.mont=function(s){return new H(s)};function H(M){N.call(this,M),this.shift=this.m.bitLength(),this.shift%26!=0&&(this.shift+=26-this.shift%26),this.r=new n(1).iushln(this.shift),this.r2=this.imod(this.r.sqr()),this.rinv=this.r._invmp(this.m),this.minv=this.rinv.mul(this.r).isubn(1).div(this.m),this.minv=this.minv.umod(this.r),this.minv=this.r.sub(this.minv)}i(H,N),H.prototype.convertTo=function(s){return this.imod(s.ushln(this.shift))},H.prototype.convertFrom=function(s){var c=this.imod(s.mul(this.rinv));return c.red=null,c},H.prototype.imul=function(s,c){if(s.isZero()||c.isZero())return s.words[0]=0,s.length=1,s;var b=s.imul(c),p=b.maskn(this.shift).mul(this.minv).imaskn(this.shift).mul(this.m),m=b.isub(p).iushrn(this.shift),B=m;return m.cmp(this.m)>=0?B=m.isub(this.m):m.cmpn(0)<0&&(B=m.iadd(this.m)),B._forceRed(this)},H.prototype.mul=function(s,c){if(s.isZero()||c.isZero())return new n(0)._forceRed(this);var b=s.mul(c),p=b.maskn(this.shift).mul(this.minv).imaskn(this.shift).mul(this.m),m=b.isub(p).iushrn(this.shift),B=m;return m.cmp(this.m)>=0?B=m.isub(this.m):m.cmpn(0)<0&&(B=m.iadd(this.m)),B._forceRed(this)},H.prototype.invm=function(s){var c=this.imod(s._invmp(this.m).mul(this.r2));return c._forceRed(this)}})(typeof Nf=="undefined"||Nf,Xs)});var Qr=L((dx,Vs)=>{Vs.exports=Gs;function Gs(r,e){if(!r)throw new Error(e||"Assertion failed")}Gs.equal=function(e,t,i){if(e!=t)throw new Error(i||"Assertion failed: "+e+" != "+t)}});var Df=L($s=>{"use strict";var bi=$s;function W1(r,e){if(Array.isArray(r))return r.slice();if(!r)return[];var t=[];if(typeof r!="string"){for(var i=0;i<r.length;i++)t[i]=r[i]|0;return t}if(e==="hex"){r=r.replace(/[^a-z0-9]+/ig,""),r.length%2!=0&&(r="0"+r);for(var i=0;i<r.length;i+=2)t.push(parseInt(r[i]+r[i+1],16))}else for(var i=0;i<r.length;i++){var n=r.charCodeAt(i),f=n>>8,a=n&255;f?t.push(f,a):t.push(a)}return t}bi.toArray=W1;function Zs(r){return r.length===1?"0"+r:r}bi.zero2=Zs;function Ys(r){for(var e="",t=0;t<r.length;t++)e+=Zs(r[t].toString(16));return e}bi.toHex=Ys;bi.encode=function(e,t){return t==="hex"?Ys(e):e}});var cr=L(Qs=>{"use strict";var yr=Qs,j1=gr(),K1=Qr(),vi=Df();yr.assert=K1;yr.toArray=vi.toArray;yr.zero2=vi.zero2;yr.toHex=vi.toHex;yr.encode=vi.encode;function J1(r,e,t){var i=new Array(Math.max(r.bitLength(),t)+1);i.fill(0);for(var n=1<<e+1,f=r.clone(),a=0;a<i.length;a++){var o,u=f.andln(n-1);f.isOdd()?(u>(n>>1)-1?o=(n>>1)-u:o=u,f.isubn(o)):o=0,i[a]=o,f.iushrn(1)}return i}yr.getNAF=J1;function X1(r,e){var t=[[],[]];r=r.clone(),e=e.clone();for(var i=0,n=0,f;r.cmpn(-i)>0||e.cmpn(-n)>0;){var a=r.andln(3)+i&3,o=e.andln(3)+n&3;a===3&&(a=-1),o===3&&(o=-1);var u;(a&1)==0?u=0:(f=r.andln(7)+i&7,(f===3||f===5)&&o===2?u=-a:u=a),t[0].push(u);var v;(o&1)==0?v=0:(f=e.andln(7)+n&7,(f===3||f===5)&&a===2?v=-o:v=o),t[1].push(v),2*i===u+1&&(i=1-i),2*n===v+1&&(n=1-n),r.iushrn(1),e.iushrn(1)}return t}yr.getJSF=X1;function G1(r,e,t){var i="_"+e;r.prototype[e]=function(){return this[i]!==void 0?this[i]:this[i]=t.call(this)}}yr.cachedProperty=G1;function V1(r){return typeof r=="string"?yr.toArray(r,"hex"):r}yr.parseBytes=V1;function Z1(r){return new j1(r,"hex","le")}yr.intFromLE=Z1});var Of=L(()=>{});var Wf=L((bx,Uf)=>{var Hf;Uf.exports=function(e){return Hf||(Hf=new et(null)),Hf.generate(e)};function et(r){this.rand=r}Uf.exports.Rand=et;et.prototype.generate=function(e){return this._rand(e)};et.prototype._rand=function(e){if(this.rand.getBytes)return this.rand.getBytes(e);for(var t=new Uint8Array(e),i=0;i<t.length;i++)t[i]=this.rand.getByte();return t};if(typeof self=="object")self.crypto&&self.crypto.getRandomValues?et.prototype._rand=function(e){var t=new Uint8Array(e);return self.crypto.getRandomValues(t),t}:self.msCrypto&&self.msCrypto.getRandomValues?et.prototype._rand=function(e){var t=new Uint8Array(e);return self.msCrypto.getRandomValues(t),t}:typeof window=="object"&&(et.prototype._rand=function(){throw new Error("Not implemented yet")});else try{if(zf=Of(),typeof zf.randomBytes!="function")throw new Error("Not supported");et.prototype._rand=function(e){return zf.randomBytes(e)}}catch(r){}var zf});var S0=L((vx,eo)=>{"use strict";var _t=gr(),w0=cr(),pi=w0.getNAF,Y1=w0.getJSF,xi=w0.assert;function rt(r,e){this.type=r,this.p=new _t(e.p,16),this.red=e.prime?_t.red(e.prime):_t.mont(this.p),this.zero=new _t(0).toRed(this.red),this.one=new _t(1).toRed(this.red),this.two=new _t(2).toRed(this.red),this.n=e.n&&new _t(e.n,16),this.g=e.g&&this.pointFromJSON(e.g,e.gRed),this._wnafT1=new Array(4),this._wnafT2=new Array(4),this._wnafT3=new Array(4),this._wnafT4=new Array(4),this._bitLength=this.n?this.n.bitLength():0;var t=this.n&&this.p.div(this.n);!t||t.cmpn(100)>0?this.redN=null:(this._maxwellTrick=!0,this.redN=this.n.toRed(this.red))}eo.exports=rt;rt.prototype.point=function(){throw new Error("Not implemented")};rt.prototype.validate=function(){throw new Error("Not implemented")};rt.prototype._fixedNafMul=function(e,t){xi(e.precomputed);var i=e._getDoubles(),n=pi(t,1,this._bitLength),f=(1<<i.step+1)-(i.step%2==0?2:1);f/=3;var a=[],o,u;for(o=0;o<n.length;o+=i.step){u=0;for(var v=o+i.step-1;v>=o;v--)u=(u<<1)+n[v];a.push(u)}for(var h=this.jpoint(null,null,null),l=this.jpoint(null,null,null),x=f;x>0;x--){for(o=0;o<a.length;o++)u=a[o],u===x?l=l.mixedAdd(i.points[o]):u===-x&&(l=l.mixedAdd(i.points[o].neg()));h=h.add(l)}return h.toP()};rt.prototype._wnafMul=function(e,t){var i=4,n=e._getNAFPoints(i);i=n.wnd;for(var f=n.points,a=pi(t,i,this._bitLength),o=this.jpoint(null,null,null),u=a.length-1;u>=0;u--){for(var v=0;u>=0&&a[u]===0;u--)v++;if(u>=0&&v++,o=o.dblp(v),u<0)break;var h=a[u];xi(h!==0),e.type==="affine"?h>0?o=o.mixedAdd(f[h-1>>1]):o=o.mixedAdd(f[-h-1>>1].neg()):h>0?o=o.add(f[h-1>>1]):o=o.add(f[-h-1>>1].neg())}return e.type==="affine"?o.toP():o};rt.prototype._wnafMulAdd=function(e,t,i,n,f){var a=this._wnafT1,o=this._wnafT2,u=this._wnafT3,v=0,h,l,x;for(h=0;h<n;h++){x=t[h];var y=x._getNAFPoints(e);a[h]=y.wnd,o[h]=y.points}for(h=n-1;h>=1;h-=2){var E=h-1,R=h;if(a[E]!==1||a[R]!==1){u[E]=pi(i[E],a[E],this._bitLength),u[R]=pi(i[R],a[R],this._bitLength),v=Math.max(u[E].length,v),v=Math.max(u[R].length,v);continue}var A=[t[E],null,null,t[R]];t[E].y.cmp(t[R].y)===0?(A[1]=t[E].add(t[R]),A[2]=t[E].toJ().mixedAdd(t[R].neg())):t[E].y.cmp(t[R].y.redNeg())===0?(A[1]=t[E].toJ().mixedAdd(t[R]),A[2]=t[E].add(t[R].neg())):(A[1]=t[E].toJ().mixedAdd(t[R]),A[2]=t[E].toJ().mixedAdd(t[R].neg()));var _=[-3,-1,-5,-7,0,7,5,1,3],S=Y1(i[E],i[R]);for(v=Math.max(S[0].length,v),u[E]=new Array(v),u[R]=new Array(v),l=0;l<v;l++){var C=S[0][l]|0,I=S[1][l]|0;u[E][l]=_[(C+1)*3+(I+1)],u[R][l]=0,o[E]=A}}var P=this.jpoint(null,null,null),k=this._wnafT4;for(h=v;h>=0;h--){for(var D=0;h>=0;){var N=!0;for(l=0;l<n;l++)k[l]=u[l][h]|0,k[l]!==0&&(N=!1);if(!N)break;D++,h--}if(h>=0&&D++,P=P.dblp(D),h<0)break;for(l=0;l<n;l++){var H=k[l];H!==0&&(H>0?x=o[l][H-1>>1]:H<0&&(x=o[l][-H-1>>1].neg()),x.type==="affine"?P=P.mixedAdd(x):P=P.add(x))}}for(h=0;h<n;h++)o[h]=null;return f?P:P.toP()};function hr(r,e){this.curve=r,this.type=e,this.precomputed=null}rt.BasePoint=hr;hr.prototype.eq=function(){throw new Error("Not implemented")};hr.prototype.validate=function(){return this.curve.validate(this)};rt.prototype.decodePoint=function(e,t){e=w0.toArray(e,t);var i=this.p.byteLength();if((e[0]===4||e[0]===6||e[0]===7)&&e.length-1==2*i){e[0]===6?xi(e[e.length-1]%2==0):e[0]===7&&xi(e[e.length-1]%2==1);var n=this.point(e.slice(1,1+i),e.slice(1+i,1+2*i));return n}else if((e[0]===2||e[0]===3)&&e.length-1===i)return this.pointFromX(e.slice(1,1+i),e[0]===3);throw new Error("Unknown point format")};hr.prototype.encodeCompressed=function(e){return this.encode(e,!0)};hr.prototype._encode=function(e){var t=this.curve.p.byteLength(),i=this.getX().toArray("be",t);return e?[this.getY().isEven()?2:3].concat(i):[4].concat(i,this.getY().toArray("be",t))};hr.prototype.encode=function(e,t){return w0.encode(this._encode(t),e)};hr.prototype.precompute=function(e){if(this.precomputed)return this;var t={doubles:null,naf:null,beta:null};return t.naf=this._getNAFPoints(8),t.doubles=this._getDoubles(4,e),t.beta=this._getBeta(),this.precomputed=t,this};hr.prototype._hasDoubles=function(e){if(!this.precomputed)return!1;var t=this.precomputed.doubles;return t?t.points.length>=Math.ceil((e.bitLength()+1)/t.step):!1};hr.prototype._getDoubles=function(e,t){if(this.precomputed&&this.precomputed.doubles)return this.precomputed.doubles;for(var i=[this],n=this,f=0;f<t;f+=e){for(var a=0;a<e;a++)n=n.dbl();i.push(n)}return{step:e,points:i}};hr.prototype._getNAFPoints=function(e){if(this.precomputed&&this.precomputed.naf)return this.precomputed.naf;for(var t=[this],i=(1<<e)-1,n=i===1?null:this.dbl(),f=1;f<i;f++)t[f]=t[f-1].add(n);return{wnd:e,points:t}};hr.prototype._getBeta=function(){return null};hr.prototype.dblp=function(e){for(var t=this,i=0;i<e;i++)t=t.dbl();return t}});var ie=L((px,jf)=>{typeof Object.create=="function"?jf.exports=function(e,t){t&&(e.super_=t,e.prototype=Object.create(t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}))}:jf.exports=function(e,t){if(t){e.super_=t;var i=function(){};i.prototype=t.prototype,e.prototype=new i,e.prototype.constructor=e}}});var to=L((xx,ro)=>{"use strict";var $1=cr(),Te=gr(),Kf=ie(),jt=S0(),Q1=$1.assert;function lr(r){jt.call(this,"short",r),this.a=new Te(r.a,16).toRed(this.red),this.b=new Te(r.b,16).toRed(this.red),this.tinv=this.two.redInvm(),this.zeroA=this.a.fromRed().cmpn(0)===0,this.threeA=this.a.fromRed().sub(this.p).cmpn(-3)===0,this.endo=this._getEndomorphism(r),this._endoWnafT1=new Array(4),this._endoWnafT2=new Array(4)}Kf(lr,jt);ro.exports=lr;lr.prototype._getEndomorphism=function(e){if(!(!this.zeroA||!this.g||!this.n||this.p.modn(3)!==1)){var t,i;if(e.beta)t=new Te(e.beta,16).toRed(this.red);else{var n=this._getEndoRoots(this.p);t=n[0].cmp(n[1])<0?n[0]:n[1],t=t.toRed(this.red)}if(e.lambda)i=new Te(e.lambda,16);else{var f=this._getEndoRoots(this.n);this.g.mul(f[0]).x.cmp(this.g.x.redMul(t))===0?i=f[0]:(i=f[1],Q1(this.g.mul(i).x.cmp(this.g.x.redMul(t))===0))}var a;return e.basis?a=e.basis.map(function(o){return{a:new Te(o.a,16),b:new Te(o.b,16)}}):a=this._getEndoBasis(i),{beta:t,lambda:i,basis:a}}};lr.prototype._getEndoRoots=function(e){var t=e===this.p?this.red:Te.mont(e),i=new Te(2).toRed(t).redInvm(),n=i.redNeg(),f=new Te(3).toRed(t).redNeg().redSqrt().redMul(i),a=n.redAdd(f).fromRed(),o=n.redSub(f).fromRed();return[a,o]};lr.prototype._getEndoBasis=function(e){for(var t=this.n.ushrn(Math.floor(this.n.bitLength()/2)),i=e,n=this.n.clone(),f=new Te(1),a=new Te(0),o=new Te(0),u=new Te(1),v,h,l,x,y,E,R,A=0,_,S;i.cmpn(0)!==0;){var C=n.div(i);_=n.sub(C.mul(i)),S=o.sub(C.mul(f));var I=u.sub(C.mul(a));if(!l&&_.cmp(t)<0)v=R.neg(),h=f,l=_.neg(),x=S;else if(l&&++A==2)break;R=_,n=i,i=_,o=f,f=S,u=a,a=I}y=_.neg(),E=S;var P=l.sqr().add(x.sqr()),k=y.sqr().add(E.sqr());return k.cmp(P)>=0&&(y=v,E=h),l.negative&&(l=l.neg(),x=x.neg()),y.negative&&(y=y.neg(),E=E.neg()),[{a:l,b:x},{a:y,b:E}]};lr.prototype._endoSplit=function(e){var t=this.endo.basis,i=t[0],n=t[1],f=n.b.mul(e).divRound(this.n),a=i.b.neg().mul(e).divRound(this.n),o=f.mul(i.a),u=a.mul(n.a),v=f.mul(i.b),h=a.mul(n.b),l=e.sub(o).sub(u),x=v.add(h).neg();return{k1:l,k2:x}};lr.prototype.pointFromX=function(e,t){e=new Te(e,16),e.red||(e=e.toRed(this.red));var i=e.redSqr().redMul(e).redIAdd(e.redMul(this.a)).redIAdd(this.b),n=i.redSqrt();if(n.redSqr().redSub(i).cmp(this.zero)!==0)throw new Error("invalid point");var f=n.fromRed().isOdd();return(t&&!f||!t&&f)&&(n=n.redNeg()),this.point(e,n)};lr.prototype.validate=function(e){if(e.inf)return!0;var t=e.x,i=e.y,n=this.a.redMul(t),f=t.redSqr().redMul(t).redIAdd(n).redIAdd(this.b);return i.redSqr().redISub(f).cmpn(0)===0};lr.prototype._endoWnafMulAdd=function(e,t,i){for(var n=this._endoWnafT1,f=this._endoWnafT2,a=0;a<e.length;a++){var o=this._endoSplit(t[a]),u=e[a],v=u._getBeta();o.k1.negative&&(o.k1.ineg(),u=u.neg(!0)),o.k2.negative&&(o.k2.ineg(),v=v.neg(!0)),n[a*2]=u,n[a*2+1]=v,f[a*2]=o.k1,f[a*2+1]=o.k2}for(var h=this._wnafMulAdd(1,n,f,a*2,i),l=0;l<a*2;l++)n[l]=null,f[l]=null;return h};function ze(r,e,t,i){jt.BasePoint.call(this,r,"affine"),e===null&&t===null?(this.x=null,this.y=null,this.inf=!0):(this.x=new Te(e,16),this.y=new Te(t,16),i&&(this.x.forceRed(this.curve.red),this.y.forceRed(this.curve.red)),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.inf=!1)}Kf(ze,jt.BasePoint);lr.prototype.point=function(e,t,i){return new ze(this,e,t,i)};lr.prototype.pointFromJSON=function(e,t){return ze.fromJSON(this,e,t)};ze.prototype._getBeta=function(){if(!!this.curve.endo){var e=this.precomputed;if(e&&e.beta)return e.beta;var t=this.curve.point(this.x.redMul(this.curve.endo.beta),this.y);if(e){var i=this.curve,n=function(f){return i.point(f.x.redMul(i.endo.beta),f.y)};e.beta=t,t.precomputed={beta:null,naf:e.naf&&{wnd:e.naf.wnd,points:e.naf.points.map(n)},doubles:e.doubles&&{step:e.doubles.step,points:e.doubles.points.map(n)}}}return t}};ze.prototype.toJSON=function(){return this.precomputed?[this.x,this.y,this.precomputed&&{doubles:this.precomputed.doubles&&{step:this.precomputed.doubles.step,points:this.precomputed.doubles.points.slice(1)},naf:this.precomputed.naf&&{wnd:this.precomputed.naf.wnd,points:this.precomputed.naf.points.slice(1)}}]:[this.x,this.y]};ze.fromJSON=function(e,t,i){typeof t=="string"&&(t=JSON.parse(t));var n=e.point(t[0],t[1],i);if(!t[2])return n;function f(o){return e.point(o[0],o[1],i)}var a=t[2];return n.precomputed={beta:null,doubles:a.doubles&&{step:a.doubles.step,points:[n].concat(a.doubles.points.map(f))},naf:a.naf&&{wnd:a.naf.wnd,points:[n].concat(a.naf.points.map(f))}},n};ze.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" y: "+this.y.fromRed().toString(16,2)+">"};ze.prototype.isInfinity=function(){return this.inf};ze.prototype.add=function(e){if(this.inf)return e;if(e.inf)return this;if(this.eq(e))return this.dbl();if(this.neg().eq(e))return this.curve.point(null,null);if(this.x.cmp(e.x)===0)return this.curve.point(null,null);var t=this.y.redSub(e.y);t.cmpn(0)!==0&&(t=t.redMul(this.x.redSub(e.x).redInvm()));var i=t.redSqr().redISub(this.x).redISub(e.x),n=t.redMul(this.x.redSub(i)).redISub(this.y);return this.curve.point(i,n)};ze.prototype.dbl=function(){if(this.inf)return this;var e=this.y.redAdd(this.y);if(e.cmpn(0)===0)return this.curve.point(null,null);var t=this.curve.a,i=this.x.redSqr(),n=e.redInvm(),f=i.redAdd(i).redIAdd(i).redIAdd(t).redMul(n),a=f.redSqr().redISub(this.x.redAdd(this.x)),o=f.redMul(this.x.redSub(a)).redISub(this.y);return this.curve.point(a,o)};ze.prototype.getX=function(){return this.x.fromRed()};ze.prototype.getY=function(){return this.y.fromRed()};ze.prototype.mul=function(e){return e=new Te(e,16),this.isInfinity()?this:this._hasDoubles(e)?this.curve._fixedNafMul(this,e):this.curve.endo?this.curve._endoWnafMulAdd([this],[e]):this.curve._wnafMul(this,e)};ze.prototype.mulAdd=function(e,t,i){var n=[this,t],f=[e,i];return this.curve.endo?this.curve._endoWnafMulAdd(n,f):this.curve._wnafMulAdd(1,n,f,2)};ze.prototype.jmulAdd=function(e,t,i){var n=[this,t],f=[e,i];return this.curve.endo?this.curve._endoWnafMulAdd(n,f,!0):this.curve._wnafMulAdd(1,n,f,2,!0)};ze.prototype.eq=function(e){return this===e||this.inf===e.inf&&(this.inf||this.x.cmp(e.x)===0&&this.y.cmp(e.y)===0)};ze.prototype.neg=function(e){if(this.inf)return this;var t=this.curve.point(this.x,this.y.redNeg());if(e&&this.precomputed){var i=this.precomputed,n=function(f){return f.neg()};t.precomputed={naf:i.naf&&{wnd:i.naf.wnd,points:i.naf.points.map(n)},doubles:i.doubles&&{step:i.doubles.step,points:i.doubles.points.map(n)}}}return t};ze.prototype.toJ=function(){if(this.inf)return this.curve.jpoint(null,null,null);var e=this.curve.jpoint(this.x,this.y,this.curve.one);return e};function Xe(r,e,t,i){jt.BasePoint.call(this,r,"jacobian"),e===null&&t===null&&i===null?(this.x=this.curve.one,this.y=this.curve.one,this.z=new Te(0)):(this.x=new Te(e,16),this.y=new Te(t,16),this.z=new Te(i,16)),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)),this.zOne=this.z===this.curve.one}Kf(Xe,jt.BasePoint);lr.prototype.jpoint=function(e,t,i){return new Xe(this,e,t,i)};Xe.prototype.toP=function(){if(this.isInfinity())return this.curve.point(null,null);var e=this.z.redInvm(),t=e.redSqr(),i=this.x.redMul(t),n=this.y.redMul(t).redMul(e);return this.curve.point(i,n)};Xe.prototype.neg=function(){return this.curve.jpoint(this.x,this.y.redNeg(),this.z)};Xe.prototype.add=function(e){if(this.isInfinity())return e;if(e.isInfinity())return this;var t=e.z.redSqr(),i=this.z.redSqr(),n=this.x.redMul(t),f=e.x.redMul(i),a=this.y.redMul(t.redMul(e.z)),o=e.y.redMul(i.redMul(this.z)),u=n.redSub(f),v=a.redSub(o);if(u.cmpn(0)===0)return v.cmpn(0)!==0?this.curve.jpoint(null,null,null):this.dbl();var h=u.redSqr(),l=h.redMul(u),x=n.redMul(h),y=v.redSqr().redIAdd(l).redISub(x).redISub(x),E=v.redMul(x.redISub(y)).redISub(a.redMul(l)),R=this.z.redMul(e.z).redMul(u);return this.curve.jpoint(y,E,R)};Xe.prototype.mixedAdd=function(e){if(this.isInfinity())return e.toJ();if(e.isInfinity())return this;var t=this.z.redSqr(),i=this.x,n=e.x.redMul(t),f=this.y,a=e.y.redMul(t).redMul(this.z),o=i.redSub(n),u=f.redSub(a);if(o.cmpn(0)===0)return u.cmpn(0)!==0?this.curve.jpoint(null,null,null):this.dbl();var v=o.redSqr(),h=v.redMul(o),l=i.redMul(v),x=u.redSqr().redIAdd(h).redISub(l).redISub(l),y=u.redMul(l.redISub(x)).redISub(f.redMul(h)),E=this.z.redMul(o);return this.curve.jpoint(x,y,E)};Xe.prototype.dblp=function(e){if(e===0)return this;if(this.isInfinity())return this;if(!e)return this.dbl();var t;if(this.curve.zeroA||this.curve.threeA){var i=this;for(t=0;t<e;t++)i=i.dbl();return i}var n=this.curve.a,f=this.curve.tinv,a=this.x,o=this.y,u=this.z,v=u.redSqr().redSqr(),h=o.redAdd(o);for(t=0;t<e;t++){var l=a.redSqr(),x=h.redSqr(),y=x.redSqr(),E=l.redAdd(l).redIAdd(l).redIAdd(n.redMul(v)),R=a.redMul(x),A=E.redSqr().redISub(R.redAdd(R)),_=R.redISub(A),S=E.redMul(_);S=S.redIAdd(S).redISub(y);var C=h.redMul(u);t+1<e&&(v=v.redMul(y)),a=A,u=C,h=S}return this.curve.jpoint(a,h.redMul(f),u)};Xe.prototype.dbl=function(){return this.isInfinity()?this:this.curve.zeroA?this._zeroDbl():this.curve.threeA?this._threeDbl():this._dbl()};Xe.prototype._zeroDbl=function(){var e,t,i;if(this.zOne){var n=this.x.redSqr(),f=this.y.redSqr(),a=f.redSqr(),o=this.x.redAdd(f).redSqr().redISub(n).redISub(a);o=o.redIAdd(o);var u=n.redAdd(n).redIAdd(n),v=u.redSqr().redISub(o).redISub(o),h=a.redIAdd(a);h=h.redIAdd(h),h=h.redIAdd(h),e=v,t=u.redMul(o.redISub(v)).redISub(h),i=this.y.redAdd(this.y)}else{var l=this.x.redSqr(),x=this.y.redSqr(),y=x.redSqr(),E=this.x.redAdd(x).redSqr().redISub(l).redISub(y);E=E.redIAdd(E);var R=l.redAdd(l).redIAdd(l),A=R.redSqr(),_=y.redIAdd(y);_=_.redIAdd(_),_=_.redIAdd(_),e=A.redISub(E).redISub(E),t=R.redMul(E.redISub(e)).redISub(_),i=this.y.redMul(this.z),i=i.redIAdd(i)}return this.curve.jpoint(e,t,i)};Xe.prototype._threeDbl=function(){var e,t,i;if(this.zOne){var n=this.x.redSqr(),f=this.y.redSqr(),a=f.redSqr(),o=this.x.redAdd(f).redSqr().redISub(n).redISub(a);o=o.redIAdd(o);var u=n.redAdd(n).redIAdd(n).redIAdd(this.curve.a),v=u.redSqr().redISub(o).redISub(o);e=v;var h=a.redIAdd(a);h=h.redIAdd(h),h=h.redIAdd(h),t=u.redMul(o.redISub(v)).redISub(h),i=this.y.redAdd(this.y)}else{var l=this.z.redSqr(),x=this.y.redSqr(),y=this.x.redMul(x),E=this.x.redSub(l).redMul(this.x.redAdd(l));E=E.redAdd(E).redIAdd(E);var R=y.redIAdd(y);R=R.redIAdd(R);var A=R.redAdd(R);e=E.redSqr().redISub(A),i=this.y.redAdd(this.z).redSqr().redISub(x).redISub(l);var _=x.redSqr();_=_.redIAdd(_),_=_.redIAdd(_),_=_.redIAdd(_),t=E.redMul(R.redISub(e)).redISub(_)}return this.curve.jpoint(e,t,i)};Xe.prototype._dbl=function(){var e=this.curve.a,t=this.x,i=this.y,n=this.z,f=n.redSqr().redSqr(),a=t.redSqr(),o=i.redSqr(),u=a.redAdd(a).redIAdd(a).redIAdd(e.redMul(f)),v=t.redAdd(t);v=v.redIAdd(v);var h=v.redMul(o),l=u.redSqr().redISub(h.redAdd(h)),x=h.redISub(l),y=o.redSqr();y=y.redIAdd(y),y=y.redIAdd(y),y=y.redIAdd(y);var E=u.redMul(x).redISub(y),R=i.redAdd(i).redMul(n);return this.curve.jpoint(l,E,R)};Xe.prototype.trpl=function(){if(!this.curve.zeroA)return this.dbl().add(this);var e=this.x.redSqr(),t=this.y.redSqr(),i=this.z.redSqr(),n=t.redSqr(),f=e.redAdd(e).redIAdd(e),a=f.redSqr(),o=this.x.redAdd(t).redSqr().redISub(e).redISub(n);o=o.redIAdd(o),o=o.redAdd(o).redIAdd(o),o=o.redISub(a);var u=o.redSqr(),v=n.redIAdd(n);v=v.redIAdd(v),v=v.redIAdd(v),v=v.redIAdd(v);var h=f.redIAdd(o).redSqr().redISub(a).redISub(u).redISub(v),l=t.redMul(h);l=l.redIAdd(l),l=l.redIAdd(l);var x=this.x.redMul(u).redISub(l);x=x.redIAdd(x),x=x.redIAdd(x);var y=this.y.redMul(h.redMul(v.redISub(h)).redISub(o.redMul(u)));y=y.redIAdd(y),y=y.redIAdd(y),y=y.redIAdd(y);var E=this.z.redAdd(o).redSqr().redISub(i).redISub(u);return this.curve.jpoint(x,y,E)};Xe.prototype.mul=function(e,t){return e=new Te(e,t),this.curve._wnafMul(this,e)};Xe.prototype.eq=function(e){if(e.type==="affine")return this.eq(e.toJ());if(this===e)return!0;var t=this.z.redSqr(),i=e.z.redSqr();if(this.x.redMul(i).redISub(e.x.redMul(t)).cmpn(0)!==0)return!1;var n=t.redMul(this.z),f=i.redMul(e.z);return this.y.redMul(f).redISub(e.y.redMul(n)).cmpn(0)===0};Xe.prototype.eqXToP=function(e){var t=this.z.redSqr(),i=e.toRed(this.curve.red).redMul(t);if(this.x.cmp(i)===0)return!0;for(var n=e.clone(),f=this.curve.redN.redMul(t);;){if(n.iadd(this.curve.n),n.cmp(this.curve.p)>=0)return!1;if(i.redIAdd(f),this.x.cmp(i)===0)return!0}};Xe.prototype.inspect=function(){return this.isInfinity()?"<EC JPoint Infinity>":"<EC JPoint x: "+this.x.toString(16,2)+" y: "+this.y.toString(16,2)+" z: "+this.z.toString(16,2)+">"};Xe.prototype.isInfinity=function(){return this.z.cmpn(0)===0}});var fo=L((gx,no)=>{"use strict";var Kt=gr(),io=ie(),gi=S0(),e2=cr();function Jt(r){gi.call(this,"mont",r),this.a=new Kt(r.a,16).toRed(this.red),this.b=new Kt(r.b,16).toRed(this.red),this.i4=new Kt(4).toRed(this.red).redInvm(),this.two=new Kt(2).toRed(this.red),this.a24=this.i4.redMul(this.a.redAdd(this.two))}io(Jt,gi);no.exports=Jt;Jt.prototype.validate=function(e){var t=e.normalize().x,i=t.redSqr(),n=i.redMul(t).redAdd(i.redMul(this.a)).redAdd(t),f=n.redSqrt();return f.redSqr().cmp(n)===0};function Ue(r,e,t){gi.BasePoint.call(this,r,"projective"),e===null&&t===null?(this.x=this.curve.one,this.z=this.curve.zero):(this.x=new Kt(e,16),this.z=new Kt(t,16),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)))}io(Ue,gi.BasePoint);Jt.prototype.decodePoint=function(e,t){return this.point(e2.toArray(e,t),1)};Jt.prototype.point=function(e,t){return new Ue(this,e,t)};Jt.prototype.pointFromJSON=function(e){return Ue.fromJSON(this,e)};Ue.prototype.precompute=function(){};Ue.prototype._encode=function(){return this.getX().toArray("be",this.curve.p.byteLength())};Ue.fromJSON=function(e,t){return new Ue(e,t[0],t[1]||e.one)};Ue.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" z: "+this.z.fromRed().toString(16,2)+">"};Ue.prototype.isInfinity=function(){return this.z.cmpn(0)===0};Ue.prototype.dbl=function(){var e=this.x.redAdd(this.z),t=e.redSqr(),i=this.x.redSub(this.z),n=i.redSqr(),f=t.redSub(n),a=t.redMul(n),o=f.redMul(n.redAdd(this.curve.a24.redMul(f)));return this.curve.point(a,o)};Ue.prototype.add=function(){throw new Error("Not supported on Montgomery curve")};Ue.prototype.diffAdd=function(e,t){var i=this.x.redAdd(this.z),n=this.x.redSub(this.z),f=e.x.redAdd(e.z),a=e.x.redSub(e.z),o=a.redMul(i),u=f.redMul(n),v=t.z.redMul(o.redAdd(u).redSqr()),h=t.x.redMul(o.redISub(u).redSqr());return this.curve.point(v,h)};Ue.prototype.mul=function(e){for(var t=e.clone(),i=this,n=this.curve.point(null,null),f=this,a=[];t.cmpn(0)!==0;t.iushrn(1))a.push(t.andln(1));for(var o=a.length-1;o>=0;o--)a[o]===0?(i=i.diffAdd(n,f),n=n.dbl()):(n=i.diffAdd(n,f),i=i.dbl());return n};Ue.prototype.mulAdd=function(){throw new Error("Not supported on Montgomery curve")};Ue.prototype.jumlAdd=function(){throw new Error("Not supported on Montgomery curve")};Ue.prototype.eq=function(e){return this.getX().cmp(e.getX())===0};Ue.prototype.normalize=function(){return this.x=this.x.redMul(this.z.redInvm()),this.z=this.curve.one,this};Ue.prototype.getX=function(){return this.normalize(),this.x.fromRed()}});var oo=L((yx,so)=>{"use strict";var r2=cr(),Nr=gr(),ao=ie(),yi=S0(),t2=r2.assert;function Mr(r){this.twisted=(r.a|0)!=1,this.mOneA=this.twisted&&(r.a|0)==-1,this.extended=this.mOneA,yi.call(this,"edwards",r),this.a=new Nr(r.a,16).umod(this.red.m),this.a=this.a.toRed(this.red),this.c=new Nr(r.c,16).toRed(this.red),this.c2=this.c.redSqr(),this.d=new Nr(r.d,16).toRed(this.red),this.dd=this.d.redAdd(this.d),t2(!this.twisted||this.c.fromRed().cmpn(1)===0),this.oneC=(r.c|0)==1}ao(Mr,yi);so.exports=Mr;Mr.prototype._mulA=function(e){return this.mOneA?e.redNeg():this.a.redMul(e)};Mr.prototype._mulC=function(e){return this.oneC?e:this.c.redMul(e)};Mr.prototype.jpoint=function(e,t,i,n){return this.point(e,t,i,n)};Mr.prototype.pointFromX=function(e,t){e=new Nr(e,16),e.red||(e=e.toRed(this.red));var i=e.redSqr(),n=this.c2.redSub(this.a.redMul(i)),f=this.one.redSub(this.c2.redMul(this.d).redMul(i)),a=n.redMul(f.redInvm()),o=a.redSqrt();if(o.redSqr().redSub(a).cmp(this.zero)!==0)throw new Error("invalid point");var u=o.fromRed().isOdd();return(t&&!u||!t&&u)&&(o=o.redNeg()),this.point(e,o)};Mr.prototype.pointFromY=function(e,t){e=new Nr(e,16),e.red||(e=e.toRed(this.red));var i=e.redSqr(),n=i.redSub(this.c2),f=i.redMul(this.d).redMul(this.c2).redSub(this.a),a=n.redMul(f.redInvm());if(a.cmp(this.zero)===0){if(t)throw new Error("invalid point");return this.point(this.zero,e)}var o=a.redSqrt();if(o.redSqr().redSub(a).cmp(this.zero)!==0)throw new Error("invalid point");return o.fromRed().isOdd()!==t&&(o=o.redNeg()),this.point(o,e)};Mr.prototype.validate=function(e){if(e.isInfinity())return!0;e.normalize();var t=e.x.redSqr(),i=e.y.redSqr(),n=t.redMul(this.a).redAdd(i),f=this.c2.redMul(this.one.redAdd(this.d.redMul(t).redMul(i)));return n.cmp(f)===0};function he(r,e,t,i,n){yi.BasePoint.call(this,r,"projective"),e===null&&t===null&&i===null?(this.x=this.curve.zero,this.y=this.curve.one,this.z=this.curve.one,this.t=this.curve.zero,this.zOne=!0):(this.x=new Nr(e,16),this.y=new Nr(t,16),this.z=i?new Nr(i,16):this.curve.one,this.t=n&&new Nr(n,16),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)),this.t&&!this.t.red&&(this.t=this.t.toRed(this.curve.red)),this.zOne=this.z===this.curve.one,this.curve.extended&&!this.t&&(this.t=this.x.redMul(this.y),this.zOne||(this.t=this.t.redMul(this.z.redInvm()))))}ao(he,yi.BasePoint);Mr.prototype.pointFromJSON=function(e){return he.fromJSON(this,e)};Mr.prototype.point=function(e,t,i,n){return new he(this,e,t,i,n)};he.fromJSON=function(e,t){return new he(e,t[0],t[1],t[2])};he.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" y: "+this.y.fromRed().toString(16,2)+" z: "+this.z.fromRed().toString(16,2)+">"};he.prototype.isInfinity=function(){return this.x.cmpn(0)===0&&(this.y.cmp(this.z)===0||this.zOne&&this.y.cmp(this.curve.c)===0)};he.prototype._extDbl=function(){var e=this.x.redSqr(),t=this.y.redSqr(),i=this.z.redSqr();i=i.redIAdd(i);var n=this.curve._mulA(e),f=this.x.redAdd(this.y).redSqr().redISub(e).redISub(t),a=n.redAdd(t),o=a.redSub(i),u=n.redSub(t),v=f.redMul(o),h=a.redMul(u),l=f.redMul(u),x=o.redMul(a);return this.curve.point(v,h,x,l)};he.prototype._projDbl=function(){var e=this.x.redAdd(this.y).redSqr(),t=this.x.redSqr(),i=this.y.redSqr(),n,f,a,o,u,v;if(this.curve.twisted){o=this.curve._mulA(t);var h=o.redAdd(i);this.zOne?(n=e.redSub(t).redSub(i).redMul(h.redSub(this.curve.two)),f=h.redMul(o.redSub(i)),a=h.redSqr().redSub(h).redSub(h)):(u=this.z.redSqr(),v=h.redSub(u).redISub(u),n=e.redSub(t).redISub(i).redMul(v),f=h.redMul(o.redSub(i)),a=h.redMul(v))}else o=t.redAdd(i),u=this.curve._mulC(this.z).redSqr(),v=o.redSub(u).redSub(u),n=this.curve._mulC(e.redISub(o)).redMul(v),f=this.curve._mulC(o).redMul(t.redISub(i)),a=o.redMul(v);return this.curve.point(n,f,a)};he.prototype.dbl=function(){return this.isInfinity()?this:this.curve.extended?this._extDbl():this._projDbl()};he.prototype._extAdd=function(e){var t=this.y.redSub(this.x).redMul(e.y.redSub(e.x)),i=this.y.redAdd(this.x).redMul(e.y.redAdd(e.x)),n=this.t.redMul(this.curve.dd).redMul(e.t),f=this.z.redMul(e.z.redAdd(e.z)),a=i.redSub(t),o=f.redSub(n),u=f.redAdd(n),v=i.redAdd(t),h=a.redMul(o),l=u.redMul(v),x=a.redMul(v),y=o.redMul(u);return this.curve.point(h,l,y,x)};he.prototype._projAdd=function(e){var t=this.z.redMul(e.z),i=t.redSqr(),n=this.x.redMul(e.x),f=this.y.redMul(e.y),a=this.curve.d.redMul(n).redMul(f),o=i.redSub(a),u=i.redAdd(a),v=this.x.redAdd(this.y).redMul(e.x.redAdd(e.y)).redISub(n).redISub(f),h=t.redMul(o).redMul(v),l,x;return this.curve.twisted?(l=t.redMul(u).redMul(f.redSub(this.curve._mulA(n))),x=o.redMul(u)):(l=t.redMul(u).redMul(f.redSub(n)),x=this.curve._mulC(o).redMul(u)),this.curve.point(h,l,x)};he.prototype.add=function(e){return this.isInfinity()?e:e.isInfinity()?this:this.curve.extended?this._extAdd(e):this._projAdd(e)};he.prototype.mul=function(e){return this._hasDoubles(e)?this.curve._fixedNafMul(this,e):this.curve._wnafMul(this,e)};he.prototype.mulAdd=function(e,t,i){return this.curve._wnafMulAdd(1,[this,t],[e,i],2,!1)};he.prototype.jmulAdd=function(e,t,i){return this.curve._wnafMulAdd(1,[this,t],[e,i],2,!0)};he.prototype.normalize=function(){if(this.zOne)return this;var e=this.z.redInvm();return this.x=this.x.redMul(e),this.y=this.y.redMul(e),this.t&&(this.t=this.t.redMul(e)),this.z=this.curve.one,this.zOne=!0,this};he.prototype.neg=function(){return this.curve.point(this.x.redNeg(),this.y,this.z,this.t&&this.t.redNeg())};he.prototype.getX=function(){return this.normalize(),this.x.fromRed()};he.prototype.getY=function(){return this.normalize(),this.y.fromRed()};he.prototype.eq=function(e){return this===e||this.getX().cmp(e.getX())===0&&this.getY().cmp(e.getY())===0};he.prototype.eqXToP=function(e){var t=e.toRed(this.curve.red).redMul(this.z);if(this.x.cmp(t)===0)return!0;for(var i=e.clone(),n=this.curve.redN.redMul(this.z);;){if(i.iadd(this.curve.n),i.cmp(this.curve.p)>=0)return!1;if(t.redIAdd(n),this.x.cmp(t)===0)return!0}};he.prototype.toP=he.prototype.normalize;he.prototype.mixedAdd=he.prototype.add});var Jf=L(co=>{"use strict";var _i=co;_i.base=S0();_i.short=to();_i.mont=fo();_i.edwards=oo()});var _r=L(oe=>{"use strict";var i2=Qr(),n2=ie();oe.inherits=n2;function f2(r,e){return(r.charCodeAt(e)&64512)!=55296||e<0||e+1>=r.length?!1:(r.charCodeAt(e+1)&64512)==56320}function a2(r,e){if(Array.isArray(r))return r.slice();if(!r)return[];var t=[];if(typeof r=="string")if(e){if(e==="hex")for(r=r.replace(/[^a-z0-9]+/ig,""),r.length%2!=0&&(r="0"+r),n=0;n<r.length;n+=2)t.push(parseInt(r[n]+r[n+1],16))}else for(var i=0,n=0;n<r.length;n++){var f=r.charCodeAt(n);f<128?t[i++]=f:f<2048?(t[i++]=f>>6|192,t[i++]=f&63|128):f2(r,n)?(f=65536+((f&1023)<<10)+(r.charCodeAt(++n)&1023),t[i++]=f>>18|240,t[i++]=f>>12&63|128,t[i++]=f>>6&63|128,t[i++]=f&63|128):(t[i++]=f>>12|224,t[i++]=f>>6&63|128,t[i++]=f&63|128)}else for(n=0;n<r.length;n++)t[n]=r[n]|0;return t}oe.toArray=a2;function s2(r){for(var e="",t=0;t<r.length;t++)e+=ho(r[t].toString(16));return e}oe.toHex=s2;function uo(r){var e=r>>>24|r>>>8&65280|r<<8&16711680|(r&255)<<24;return e>>>0}oe.htonl=uo;function o2(r,e){for(var t="",i=0;i<r.length;i++){var n=r[i];e==="little"&&(n=uo(n)),t+=lo(n.toString(16))}return t}oe.toHex32=o2;function ho(r){return r.length===1?"0"+r:r}oe.zero2=ho;function lo(r){return r.length===7?"0"+r:r.length===6?"00"+r:r.length===5?"000"+r:r.length===4?"0000"+r:r.length===3?"00000"+r:r.length===2?"000000"+r:r.length===1?"0000000"+r:r}oe.zero8=lo;function d2(r,e,t,i){var n=t-e;i2(n%4==0);for(var f=new Array(n/4),a=0,o=e;a<f.length;a++,o+=4){var u;i==="big"?u=r[o]<<24|r[o+1]<<16|r[o+2]<<8|r[o+3]:u=r[o+3]<<24|r[o+2]<<16|r[o+1]<<8|r[o],f[a]=u>>>0}return f}oe.join32=d2;function c2(r,e){for(var t=new Array(r.length*4),i=0,n=0;i<r.length;i++,n+=4){var f=r[i];e==="big"?(t[n]=f>>>24,t[n+1]=f>>>16&255,t[n+2]=f>>>8&255,t[n+3]=f&255):(t[n+3]=f>>>24,t[n+2]=f>>>16&255,t[n+1]=f>>>8&255,t[n]=f&255)}return t}oe.split32=c2;function u2(r,e){return r>>>e|r<<32-e}oe.rotr32=u2;function h2(r,e){return r<<e|r>>>32-e}oe.rotl32=h2;function l2(r,e){return r+e>>>0}oe.sum32=l2;function b2(r,e,t){return r+e+t>>>0}oe.sum32_3=b2;function v2(r,e,t,i){return r+e+t+i>>>0}oe.sum32_4=v2;function p2(r,e,t,i,n){return r+e+t+i+n>>>0}oe.sum32_5=p2;function x2(r,e,t,i){var n=r[e],f=r[e+1],a=i+f>>>0,o=(a<i?1:0)+t+n;r[e]=o>>>0,r[e+1]=a}oe.sum64=x2;function g2(r,e,t,i){var n=e+i>>>0,f=(n<e?1:0)+r+t;return f>>>0}oe.sum64_hi=g2;function y2(r,e,t,i){var n=e+i;return n>>>0}oe.sum64_lo=y2;function _2(r,e,t,i,n,f,a,o){var u=0,v=e;v=v+i>>>0,u+=v<e?1:0,v=v+f>>>0,u+=v<f?1:0,v=v+o>>>0,u+=v<o?1:0;var h=r+t+n+a+u;return h>>>0}oe.sum64_4_hi=_2;function m2(r,e,t,i,n,f,a,o){var u=e+i+f+o;return u>>>0}oe.sum64_4_lo=m2;function w2(r,e,t,i,n,f,a,o,u,v){var h=0,l=e;l=l+i>>>0,h+=l<e?1:0,l=l+f>>>0,h+=l<f?1:0,l=l+o>>>0,h+=l<o?1:0,l=l+v>>>0,h+=l<v?1:0;var x=r+t+n+a+u+h;return x>>>0}oe.sum64_5_hi=w2;function S2(r,e,t,i,n,f,a,o,u,v){var h=e+i+f+o+v;return h>>>0}oe.sum64_5_lo=S2;function E2(r,e,t){var i=e<<32-t|r>>>t;return i>>>0}oe.rotr64_hi=E2;function M2(r,e,t){var i=r<<32-t|e>>>t;return i>>>0}oe.rotr64_lo=M2;function A2(r,e,t){return r>>>t}oe.shr64_hi=A2;function B2(r,e,t){var i=r<<32-t|e>>>t;return i>>>0}oe.shr64_lo=B2});var Xt=L(vo=>{"use strict";var bo=_r(),R2=Qr();function mi(){this.pending=null,this.pendingTotal=0,this.blockSize=this.constructor.blockSize,this.outSize=this.constructor.outSize,this.hmacStrength=this.constructor.hmacStrength,this.padLength=this.constructor.padLength/8,this.endian="big",this._delta8=this.blockSize/8,this._delta32=this.blockSize/32}vo.BlockHash=mi;mi.prototype.update=function(e,t){if(e=bo.toArray(e,t),this.pending?this.pending=this.pending.concat(e):this.pending=e,this.pendingTotal+=e.length,this.pending.length>=this._delta8){e=this.pending;var i=e.length%this._delta8;this.pending=e.slice(e.length-i,e.length),this.pending.length===0&&(this.pending=null),e=bo.join32(e,0,e.length-i,this.endian);for(var n=0;n<e.length;n+=this._delta32)this._update(e,n,n+this._delta32)}return this};mi.prototype.digest=function(e){return this.update(this._pad()),R2(this.pending===null),this._digest(e)};mi.prototype._pad=function(){var e=this.pendingTotal,t=this._delta8,i=t-(e+this.padLength)%t,n=new Array(i+this.padLength);n[0]=128;for(var f=1;f<i;f++)n[f]=0;if(e<<=3,this.endian==="big"){for(var a=8;a<this.padLength;a++)n[f++]=0;n[f++]=0,n[f++]=0,n[f++]=0,n[f++]=0,n[f++]=e>>>24&255,n[f++]=e>>>16&255,n[f++]=e>>>8&255,n[f++]=e&255}else for(n[f++]=e&255,n[f++]=e>>>8&255,n[f++]=e>>>16&255,n[f++]=e>>>24&255,n[f++]=0,n[f++]=0,n[f++]=0,n[f++]=0,a=8;a<this.padLength;a++)n[f++]=0;return n}});var Xf=L(Dr=>{"use strict";var q2=_r(),Ar=q2.rotr32;function C2(r,e,t,i){if(r===0)return po(e,t,i);if(r===1||r===3)return go(e,t,i);if(r===2)return xo(e,t,i)}Dr.ft_1=C2;function po(r,e,t){return r&e^~r&t}Dr.ch32=po;function xo(r,e,t){return r&e^r&t^e&t}Dr.maj32=xo;function go(r,e,t){return r^e^t}Dr.p32=go;function I2(r){return Ar(r,2)^Ar(r,13)^Ar(r,22)}Dr.s0_256=I2;function k2(r){return Ar(r,6)^Ar(r,11)^Ar(r,25)}Dr.s1_256=k2;function T2(r){return Ar(r,7)^Ar(r,18)^r>>>3}Dr.g0_256=T2;function P2(r){return Ar(r,17)^Ar(r,19)^r>>>10}Dr.g1_256=P2});var mo=L((Ex,_o)=>{"use strict";var Gt=_r(),F2=Xt(),L2=Xf(),Gf=Gt.rotl32,E0=Gt.sum32,N2=Gt.sum32_5,D2=L2.ft_1,yo=F2.BlockHash,O2=[1518500249,1859775393,2400959708,3395469782];function Br(){if(!(this instanceof Br))return new Br;yo.call(this),this.h=[1732584193,4023233417,2562383102,271733878,3285377520],this.W=new Array(80)}Gt.inherits(Br,yo);_o.exports=Br;Br.blockSize=512;Br.outSize=160;Br.hmacStrength=80;Br.padLength=64;Br.prototype._update=function(e,t){for(var i=this.W,n=0;n<16;n++)i[n]=e[t+n];for(;n<i.length;n++)i[n]=Gf(i[n-3]^i[n-8]^i[n-14]^i[n-16],1);var f=this.h[0],a=this.h[1],o=this.h[2],u=this.h[3],v=this.h[4];for(n=0;n<i.length;n++){var h=~~(n/20),l=N2(Gf(f,5),D2(h,a,o,u),v,i[n],O2[h]);v=u,u=o,o=Gf(a,30),a=f,f=l}this.h[0]=E0(this.h[0],f),this.h[1]=E0(this.h[1],a),this.h[2]=E0(this.h[2],o),this.h[3]=E0(this.h[3],u),this.h[4]=E0(this.h[4],v)};Br.prototype._digest=function(e){return e==="hex"?Gt.toHex32(this.h,"big"):Gt.split32(this.h,"big")}});var Vf=L((Mx,So)=>{"use strict";var Vt=_r(),H2=Xt(),Zt=Xf(),z2=Qr(),mr=Vt.sum32,U2=Vt.sum32_4,W2=Vt.sum32_5,j2=Zt.ch32,K2=Zt.maj32,J2=Zt.s0_256,X2=Zt.s1_256,G2=Zt.g0_256,V2=Zt.g1_256,wo=H2.BlockHash,Z2=[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298];function Rr(){if(!(this instanceof Rr))return new Rr;wo.call(this),this.h=[1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225],this.k=Z2,this.W=new Array(64)}Vt.inherits(Rr,wo);So.exports=Rr;Rr.blockSize=512;Rr.outSize=256;Rr.hmacStrength=192;Rr.padLength=64;Rr.prototype._update=function(e,t){for(var i=this.W,n=0;n<16;n++)i[n]=e[t+n];for(;n<i.length;n++)i[n]=U2(V2(i[n-2]),i[n-7],G2(i[n-15]),i[n-16]);var f=this.h[0],a=this.h[1],o=this.h[2],u=this.h[3],v=this.h[4],h=this.h[5],l=this.h[6],x=this.h[7];for(z2(this.k.length===i.length),n=0;n<i.length;n++){var y=W2(x,X2(v),j2(v,h,l),this.k[n],i[n]),E=mr(J2(f),K2(f,a,o));x=l,l=h,h=v,v=mr(u,y),u=o,o=a,a=f,f=mr(y,E)}this.h[0]=mr(this.h[0],f),this.h[1]=mr(this.h[1],a),this.h[2]=mr(this.h[2],o),this.h[3]=mr(this.h[3],u),this.h[4]=mr(this.h[4],v),this.h[5]=mr(this.h[5],h),this.h[6]=mr(this.h[6],l),this.h[7]=mr(this.h[7],x)};Rr.prototype._digest=function(e){return e==="hex"?Vt.toHex32(this.h,"big"):Vt.split32(this.h,"big")}});var Ao=L((Ax,Mo)=>{"use strict";var Zf=_r(),Eo=Vf();function Or(){if(!(this instanceof Or))return new Or;Eo.call(this),this.h=[3238371032,914150663,812702999,4144912697,4290775857,1750603025,1694076839,3204075428]}Zf.inherits(Or,Eo);Mo.exports=Or;Or.blockSize=512;Or.outSize=224;Or.hmacStrength=192;Or.padLength=64;Or.prototype._digest=function(e){return e==="hex"?Zf.toHex32(this.h.slice(0,7),"big"):Zf.split32(this.h.slice(0,7),"big")}});var Qf=L((Bx,Co)=>{"use strict";var ar=_r(),Y2=Xt(),$2=Qr(),qr=ar.rotr64_hi,Cr=ar.rotr64_lo,Bo=ar.shr64_hi,Ro=ar.shr64_lo,tt=ar.sum64,Yf=ar.sum64_hi,$f=ar.sum64_lo,Q2=ar.sum64_4_hi,eb=ar.sum64_4_lo,rb=ar.sum64_5_hi,tb=ar.sum64_5_lo,qo=Y2.BlockHash,ib=[1116352408,3609767458,1899447441,602891725,3049323471,3964484399,3921009573,2173295548,961987163,4081628472,1508970993,3053834265,2453635748,2937671579,2870763221,3664609560,3624381080,2734883394,310598401,1164996542,607225278,1323610764,1426881987,3590304994,1925078388,4068182383,2162078206,991336113,2614888103,633803317,3248222580,3479774868,3835390401,2666613458,4022224774,944711139,264347078,2341262773,604807628,2007800933,770255983,1495990901,1249150122,1856431235,1555081692,3175218132,1996064986,2198950837,2554220882,3999719339,2821834349,766784016,2952996808,2566594879,3210313671,3203337956,3336571891,1034457026,3584528711,2466948901,113926993,3758326383,338241895,168717936,666307205,1188179964,773529912,1546045734,1294757372,1522805485,1396182291,2643833823,1695183700,2343527390,1986661051,1014477480,2177026350,1206759142,2456956037,344077627,2730485921,1290863460,2820302411,3158454273,3259730800,3505952657,3345764771,106217008,3516065817,3606008344,3600352804,1432725776,4094571909,1467031594,275423344,851169720,430227734,3100823752,506948616,1363258195,659060556,3750685593,883997877,3785050280,958139571,3318307427,1322822218,3812723403,1537002063,2003034995,1747873779,3602036899,1955562222,1575990012,2024104815,1125592928,2227730452,2716904306,2361852424,442776044,2428436474,593698344,2756734187,3733110249,3204031479,2999351573,3329325298,3815920427,3391569614,3928383900,3515267271,566280711,3940187606,3454069534,4118630271,4000239992,116418474,1914138554,174292421,2731055270,289380356,3203993006,460393269,320620315,685471733,587496836,852142971,1086792851,1017036298,365543100,1126000580,2618297676,1288033470,3409855158,1501505948,4234509866,1607167915,987167468,1816402316,1246189591];function wr(){if(!(this instanceof wr))return new wr;qo.call(this),this.h=[1779033703,4089235720,3144134277,2227873595,1013904242,4271175723,2773480762,1595750129,1359893119,2917565137,2600822924,725511199,528734635,4215389547,1541459225,327033209],this.k=ib,this.W=new Array(160)}ar.inherits(wr,qo);Co.exports=wr;wr.blockSize=1024;wr.outSize=512;wr.hmacStrength=192;wr.padLength=128;wr.prototype._prepareBlock=function(e,t){for(var i=this.W,n=0;n<32;n++)i[n]=e[t+n];for(;n<i.length;n+=2){var f=bb(i[n-4],i[n-3]),a=vb(i[n-4],i[n-3]),o=i[n-14],u=i[n-13],v=hb(i[n-30],i[n-29]),h=lb(i[n-30],i[n-29]),l=i[n-32],x=i[n-31];i[n]=Q2(f,a,o,u,v,h,l,x),i[n+1]=eb(f,a,o,u,v,h,l,x)}};wr.prototype._update=function(e,t){this._prepareBlock(e,t);var i=this.W,n=this.h[0],f=this.h[1],a=this.h[2],o=this.h[3],u=this.h[4],v=this.h[5],h=this.h[6],l=this.h[7],x=this.h[8],y=this.h[9],E=this.h[10],R=this.h[11],A=this.h[12],_=this.h[13],S=this.h[14],C=this.h[15];$2(this.k.length===i.length);for(var I=0;I<i.length;I+=2){var P=S,k=C,D=cb(x,y),N=ub(x,y),H=nb(x,y,E,R,A,_),M=fb(x,y,E,R,A,_),s=this.k[I],c=this.k[I+1],b=i[I],p=i[I+1],m=rb(P,k,D,N,H,M,s,c,b,p),B=tb(P,k,D,N,H,M,s,c,b,p);P=ob(n,f),k=db(n,f),D=ab(n,f,a,o,u,v),N=sb(n,f,a,o,u,v);var q=Yf(P,k,D,N),w=$f(P,k,D,N);S=A,C=_,A=E,_=R,E=x,R=y,x=Yf(h,l,m,B),y=$f(l,l,m,B),h=u,l=v,u=a,v=o,a=n,o=f,n=Yf(m,B,q,w),f=$f(m,B,q,w)}tt(this.h,0,n,f),tt(this.h,2,a,o),tt(this.h,4,u,v),tt(this.h,6,h,l),tt(this.h,8,x,y),tt(this.h,10,E,R),tt(this.h,12,A,_),tt(this.h,14,S,C)};wr.prototype._digest=function(e){return e==="hex"?ar.toHex32(this.h,"big"):ar.split32(this.h,"big")};function nb(r,e,t,i,n){var f=r&t^~r&n;return f<0&&(f+=4294967296),f}function fb(r,e,t,i,n,f){var a=e&i^~e&f;return a<0&&(a+=4294967296),a}function ab(r,e,t,i,n){var f=r&t^r&n^t&n;return f<0&&(f+=4294967296),f}function sb(r,e,t,i,n,f){var a=e&i^e&f^i&f;return a<0&&(a+=4294967296),a}function ob(r,e){var t=qr(r,e,28),i=qr(e,r,2),n=qr(e,r,7),f=t^i^n;return f<0&&(f+=4294967296),f}function db(r,e){var t=Cr(r,e,28),i=Cr(e,r,2),n=Cr(e,r,7),f=t^i^n;return f<0&&(f+=4294967296),f}function cb(r,e){var t=qr(r,e,14),i=qr(r,e,18),n=qr(e,r,9),f=t^i^n;return f<0&&(f+=4294967296),f}function ub(r,e){var t=Cr(r,e,14),i=Cr(r,e,18),n=Cr(e,r,9),f=t^i^n;return f<0&&(f+=4294967296),f}function hb(r,e){var t=qr(r,e,1),i=qr(r,e,8),n=Bo(r,e,7),f=t^i^n;return f<0&&(f+=4294967296),f}function lb(r,e){var t=Cr(r,e,1),i=Cr(r,e,8),n=Ro(r,e,7),f=t^i^n;return f<0&&(f+=4294967296),f}function bb(r,e){var t=qr(r,e,19),i=qr(e,r,29),n=Bo(r,e,6),f=t^i^n;return f<0&&(f+=4294967296),f}function vb(r,e){var t=Cr(r,e,19),i=Cr(e,r,29),n=Ro(r,e,6),f=t^i^n;return f<0&&(f+=4294967296),f}});var To=L((Rx,ko)=>{"use strict";var ea=_r(),Io=Qf();function Hr(){if(!(this instanceof Hr))return new Hr;Io.call(this),this.h=[3418070365,3238371032,1654270250,914150663,2438529370,812702999,355462360,4144912697,1731405415,4290775857,2394180231,1750603025,3675008525,1694076839,1203062813,3204075428]}ea.inherits(Hr,Io);ko.exports=Hr;Hr.blockSize=1024;Hr.outSize=384;Hr.hmacStrength=192;Hr.padLength=128;Hr.prototype._digest=function(e){return e==="hex"?ea.toHex32(this.h.slice(0,12),"big"):ea.split32(this.h.slice(0,12),"big")}});var Po=L(Yt=>{"use strict";Yt.sha1=mo();Yt.sha224=Ao();Yt.sha256=Vf();Yt.sha384=To();Yt.sha512=Qf()});var Ho=L(Oo=>{"use strict";var mt=_r(),pb=Xt(),wi=mt.rotl32,Fo=mt.sum32,M0=mt.sum32_3,Lo=mt.sum32_4,No=pb.BlockHash;function Ir(){if(!(this instanceof Ir))return new Ir;No.call(this),this.h=[1732584193,4023233417,2562383102,271733878,3285377520],this.endian="little"}mt.inherits(Ir,No);Oo.ripemd160=Ir;Ir.blockSize=512;Ir.outSize=160;Ir.hmacStrength=192;Ir.padLength=64;Ir.prototype._update=function(e,t){for(var i=this.h[0],n=this.h[1],f=this.h[2],a=this.h[3],o=this.h[4],u=i,v=n,h=f,l=a,x=o,y=0;y<80;y++){var E=Fo(wi(Lo(i,Do(y,n,f,a),e[yb[y]+t],xb(y)),mb[y]),o);i=o,o=a,a=wi(f,10),f=n,n=E,E=Fo(wi(Lo(u,Do(79-y,v,h,l),e[_b[y]+t],gb(y)),wb[y]),x),u=x,x=l,l=wi(h,10),h=v,v=E}E=M0(this.h[1],f,l),this.h[1]=M0(this.h[2],a,x),this.h[2]=M0(this.h[3],o,u),this.h[3]=M0(this.h[4],i,v),this.h[4]=M0(this.h[0],n,h),this.h[0]=E};Ir.prototype._digest=function(e){return e==="hex"?mt.toHex32(this.h,"little"):mt.split32(this.h,"little")};function Do(r,e,t,i){return r<=15?e^t^i:r<=31?e&t|~e&i:r<=47?(e|~t)^i:r<=63?e&i|t&~i:e^(t|~i)}function xb(r){return r<=15?0:r<=31?1518500249:r<=47?1859775393:r<=63?2400959708:2840853838}function gb(r){return r<=15?1352829926:r<=31?1548603684:r<=47?1836072691:r<=63?2053994217:0}var yb=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13],_b=[5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11],mb=[11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6],wb=[8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11]});var Uo=L((Ix,zo)=>{"use strict";var Sb=_r(),Eb=Qr();function $t(r,e,t){if(!(this instanceof $t))return new $t(r,e,t);this.Hash=r,this.blockSize=r.blockSize/8,this.outSize=r.outSize/8,this.inner=null,this.outer=null,this._init(Sb.toArray(e,t))}zo.exports=$t;$t.prototype._init=function(e){e.length>this.blockSize&&(e=new this.Hash().update(e).digest()),Eb(e.length<=this.blockSize);for(var t=e.length;t<this.blockSize;t++)e.push(0);for(t=0;t<e.length;t++)e[t]^=54;for(this.inner=new this.Hash().update(e),t=0;t<e.length;t++)e[t]^=106;this.outer=new this.Hash().update(e)};$t.prototype.update=function(e,t){return this.inner.update(e,t),this};$t.prototype.digest=function(e){return this.outer.update(this.inner.digest()),this.outer.digest(e)}});var Si=L(Wo=>{var Ge=Wo;Ge.utils=_r();Ge.common=Xt();Ge.sha=Po();Ge.ripemd=Ho();Ge.hmac=Uo();Ge.sha1=Ge.sha.sha1;Ge.sha256=Ge.sha.sha256;Ge.sha224=Ge.sha.sha224;Ge.sha384=Ge.sha.sha384;Ge.sha512=Ge.sha.sha512;Ge.ripemd160=Ge.ripemd.ripemd160});var Ko=L((Tx,jo)=>{jo.exports={doubles:{step:4,points:[["e60fce93b59e9ec53011aabc21c23e97b2a31369b87a5ae9c44ee89e2a6dec0a","f7e3507399e595929db99f34f57937101296891e44d23f0be1f32cce69616821"],["8282263212c609d9ea2a6e3e172de238d8c39cabd5ac1ca10646e23fd5f51508","11f8a8098557dfe45e8256e830b60ace62d613ac2f7b17bed31b6eaff6e26caf"],["175e159f728b865a72f99cc6c6fc846de0b93833fd2222ed73fce5b551e5b739","d3506e0d9e3c79eba4ef97a51ff71f5eacb5955add24345c6efa6ffee9fed695"],["363d90d447b00c9c99ceac05b6262ee053441c7e55552ffe526bad8f83ff4640","4e273adfc732221953b445397f3363145b9a89008199ecb62003c7f3bee9de9"],["8b4b5f165df3c2be8c6244b5b745638843e4a781a15bcd1b69f79a55dffdf80c","4aad0a6f68d308b4b3fbd7813ab0da04f9e336546162ee56b3eff0c65fd4fd36"],["723cbaa6e5db996d6bf771c00bd548c7b700dbffa6c0e77bcb6115925232fcda","96e867b5595cc498a921137488824d6e2660a0653779494801dc069d9eb39f5f"],["eebfa4d493bebf98ba5feec812c2d3b50947961237a919839a533eca0e7dd7fa","5d9a8ca3970ef0f269ee7edaf178089d9ae4cdc3a711f712ddfd4fdae1de8999"],["100f44da696e71672791d0a09b7bde459f1215a29b3c03bfefd7835b39a48db0","cdd9e13192a00b772ec8f3300c090666b7ff4a18ff5195ac0fbd5cd62bc65a09"],["e1031be262c7ed1b1dc9227a4a04c017a77f8d4464f3b3852c8acde6e534fd2d","9d7061928940405e6bb6a4176597535af292dd419e1ced79a44f18f29456a00d"],["feea6cae46d55b530ac2839f143bd7ec5cf8b266a41d6af52d5e688d9094696d","e57c6b6c97dce1bab06e4e12bf3ecd5c981c8957cc41442d3155debf18090088"],["da67a91d91049cdcb367be4be6ffca3cfeed657d808583de33fa978bc1ec6cb1","9bacaa35481642bc41f463f7ec9780e5dec7adc508f740a17e9ea8e27a68be1d"],["53904faa0b334cdda6e000935ef22151ec08d0f7bb11069f57545ccc1a37b7c0","5bc087d0bc80106d88c9eccac20d3c1c13999981e14434699dcb096b022771c8"],["8e7bcd0bd35983a7719cca7764ca906779b53a043a9b8bcaeff959f43ad86047","10b7770b2a3da4b3940310420ca9514579e88e2e47fd68b3ea10047e8460372a"],["385eed34c1cdff21e6d0818689b81bde71a7f4f18397e6690a841e1599c43862","283bebc3e8ea23f56701de19e9ebf4576b304eec2086dc8cc0458fe5542e5453"],["6f9d9b803ecf191637c73a4413dfa180fddf84a5947fbc9c606ed86c3fac3a7","7c80c68e603059ba69b8e2a30e45c4d47ea4dd2f5c281002d86890603a842160"],["3322d401243c4e2582a2147c104d6ecbf774d163db0f5e5313b7e0e742d0e6bd","56e70797e9664ef5bfb019bc4ddaf9b72805f63ea2873af624f3a2e96c28b2a0"],["85672c7d2de0b7da2bd1770d89665868741b3f9af7643397721d74d28134ab83","7c481b9b5b43b2eb6374049bfa62c2e5e77f17fcc5298f44c8e3094f790313a6"],["948bf809b1988a46b06c9f1919413b10f9226c60f668832ffd959af60c82a0a","53a562856dcb6646dc6b74c5d1c3418c6d4dff08c97cd2bed4cb7f88d8c8e589"],["6260ce7f461801c34f067ce0f02873a8f1b0e44dfc69752accecd819f38fd8e8","bc2da82b6fa5b571a7f09049776a1ef7ecd292238051c198c1a84e95b2b4ae17"],["e5037de0afc1d8d43d8348414bbf4103043ec8f575bfdc432953cc8d2037fa2d","4571534baa94d3b5f9f98d09fb990bddbd5f5b03ec481f10e0e5dc841d755bda"],["e06372b0f4a207adf5ea905e8f1771b4e7e8dbd1c6a6c5b725866a0ae4fce725","7a908974bce18cfe12a27bb2ad5a488cd7484a7787104870b27034f94eee31dd"],["213c7a715cd5d45358d0bbf9dc0ce02204b10bdde2a3f58540ad6908d0559754","4b6dad0b5ae462507013ad06245ba190bb4850f5f36a7eeddff2c27534b458f2"],["4e7c272a7af4b34e8dbb9352a5419a87e2838c70adc62cddf0cc3a3b08fbd53c","17749c766c9d0b18e16fd09f6def681b530b9614bff7dd33e0b3941817dcaae6"],["fea74e3dbe778b1b10f238ad61686aa5c76e3db2be43057632427e2840fb27b6","6e0568db9b0b13297cf674deccb6af93126b596b973f7b77701d3db7f23cb96f"],["76e64113f677cf0e10a2570d599968d31544e179b760432952c02a4417bdde39","c90ddf8dee4e95cf577066d70681f0d35e2a33d2b56d2032b4b1752d1901ac01"],["c738c56b03b2abe1e8281baa743f8f9a8f7cc643df26cbee3ab150242bcbb891","893fb578951ad2537f718f2eacbfbbbb82314eef7880cfe917e735d9699a84c3"],["d895626548b65b81e264c7637c972877d1d72e5f3a925014372e9f6588f6c14b","febfaa38f2bc7eae728ec60818c340eb03428d632bb067e179363ed75d7d991f"],["b8da94032a957518eb0f6433571e8761ceffc73693e84edd49150a564f676e03","2804dfa44805a1e4d7c99cc9762808b092cc584d95ff3b511488e4e74efdf6e7"],["e80fea14441fb33a7d8adab9475d7fab2019effb5156a792f1a11778e3c0df5d","eed1de7f638e00771e89768ca3ca94472d155e80af322ea9fcb4291b6ac9ec78"],["a301697bdfcd704313ba48e51d567543f2a182031efd6915ddc07bbcc4e16070","7370f91cfb67e4f5081809fa25d40f9b1735dbf7c0a11a130c0d1a041e177ea1"],["90ad85b389d6b936463f9d0512678de208cc330b11307fffab7ac63e3fb04ed4","e507a3620a38261affdcbd9427222b839aefabe1582894d991d4d48cb6ef150"],["8f68b9d2f63b5f339239c1ad981f162ee88c5678723ea3351b7b444c9ec4c0da","662a9f2dba063986de1d90c2b6be215dbbea2cfe95510bfdf23cbf79501fff82"],["e4f3fb0176af85d65ff99ff9198c36091f48e86503681e3e6686fd5053231e11","1e63633ad0ef4f1c1661a6d0ea02b7286cc7e74ec951d1c9822c38576feb73bc"],["8c00fa9b18ebf331eb961537a45a4266c7034f2f0d4e1d0716fb6eae20eae29e","efa47267fea521a1a9dc343a3736c974c2fadafa81e36c54e7d2a4c66702414b"],["e7a26ce69dd4829f3e10cec0a9e98ed3143d084f308b92c0997fddfc60cb3e41","2a758e300fa7984b471b006a1aafbb18d0a6b2c0420e83e20e8a9421cf2cfd51"],["b6459e0ee3662ec8d23540c223bcbdc571cbcb967d79424f3cf29eb3de6b80ef","67c876d06f3e06de1dadf16e5661db3c4b3ae6d48e35b2ff30bf0b61a71ba45"],["d68a80c8280bb840793234aa118f06231d6f1fc67e73c5a5deda0f5b496943e8","db8ba9fff4b586d00c4b1f9177b0e28b5b0e7b8f7845295a294c84266b133120"],["324aed7df65c804252dc0270907a30b09612aeb973449cea4095980fc28d3d5d","648a365774b61f2ff130c0c35aec1f4f19213b0c7e332843967224af96ab7c84"],["4df9c14919cde61f6d51dfdbe5fee5dceec4143ba8d1ca888e8bd373fd054c96","35ec51092d8728050974c23a1d85d4b5d506cdc288490192ebac06cad10d5d"],["9c3919a84a474870faed8a9c1cc66021523489054d7f0308cbfc99c8ac1f98cd","ddb84f0f4a4ddd57584f044bf260e641905326f76c64c8e6be7e5e03d4fc599d"],["6057170b1dd12fdf8de05f281d8e06bb91e1493a8b91d4cc5a21382120a959e5","9a1af0b26a6a4807add9a2daf71df262465152bc3ee24c65e899be932385a2a8"],["a576df8e23a08411421439a4518da31880cef0fba7d4df12b1a6973eecb94266","40a6bf20e76640b2c92b97afe58cd82c432e10a7f514d9f3ee8be11ae1b28ec8"],["7778a78c28dec3e30a05fe9629de8c38bb30d1f5cf9a3a208f763889be58ad71","34626d9ab5a5b22ff7098e12f2ff580087b38411ff24ac563b513fc1fd9f43ac"],["928955ee637a84463729fd30e7afd2ed5f96274e5ad7e5cb09eda9c06d903ac","c25621003d3f42a827b78a13093a95eeac3d26efa8a8d83fc5180e935bcd091f"],["85d0fef3ec6db109399064f3a0e3b2855645b4a907ad354527aae75163d82751","1f03648413a38c0be29d496e582cf5663e8751e96877331582c237a24eb1f962"],["ff2b0dce97eece97c1c9b6041798b85dfdfb6d8882da20308f5404824526087e","493d13fef524ba188af4c4dc54d07936c7b7ed6fb90e2ceb2c951e01f0c29907"],["827fbbe4b1e880ea9ed2b2e6301b212b57f1ee148cd6dd28780e5e2cf856e241","c60f9c923c727b0b71bef2c67d1d12687ff7a63186903166d605b68baec293ec"],["eaa649f21f51bdbae7be4ae34ce6e5217a58fdce7f47f9aa7f3b58fa2120e2b3","be3279ed5bbbb03ac69a80f89879aa5a01a6b965f13f7e59d47a5305ba5ad93d"],["e4a42d43c5cf169d9391df6decf42ee541b6d8f0c9a137401e23632dda34d24f","4d9f92e716d1c73526fc99ccfb8ad34ce886eedfa8d8e4f13a7f7131deba9414"],["1ec80fef360cbdd954160fadab352b6b92b53576a88fea4947173b9d4300bf19","aeefe93756b5340d2f3a4958a7abbf5e0146e77f6295a07b671cdc1cc107cefd"],["146a778c04670c2f91b00af4680dfa8bce3490717d58ba889ddb5928366642be","b318e0ec3354028add669827f9d4b2870aaa971d2f7e5ed1d0b297483d83efd0"],["fa50c0f61d22e5f07e3acebb1aa07b128d0012209a28b9776d76a8793180eef9","6b84c6922397eba9b72cd2872281a68a5e683293a57a213b38cd8d7d3f4f2811"],["da1d61d0ca721a11b1a5bf6b7d88e8421a288ab5d5bba5220e53d32b5f067ec2","8157f55a7c99306c79c0766161c91e2966a73899d279b48a655fba0f1ad836f1"],["a8e282ff0c9706907215ff98e8fd416615311de0446f1e062a73b0610d064e13","7f97355b8db81c09abfb7f3c5b2515888b679a3e50dd6bd6cef7c73111f4cc0c"],["174a53b9c9a285872d39e56e6913cab15d59b1fa512508c022f382de8319497c","ccc9dc37abfc9c1657b4155f2c47f9e6646b3a1d8cb9854383da13ac079afa73"],["959396981943785c3d3e57edf5018cdbe039e730e4918b3d884fdff09475b7ba","2e7e552888c331dd8ba0386a4b9cd6849c653f64c8709385e9b8abf87524f2fd"],["d2a63a50ae401e56d645a1153b109a8fcca0a43d561fba2dbb51340c9d82b151","e82d86fb6443fcb7565aee58b2948220a70f750af484ca52d4142174dcf89405"],["64587e2335471eb890ee7896d7cfdc866bacbdbd3839317b3436f9b45617e073","d99fcdd5bf6902e2ae96dd6447c299a185b90a39133aeab358299e5e9faf6589"],["8481bde0e4e4d885b3a546d3e549de042f0aa6cea250e7fd358d6c86dd45e458","38ee7b8cba5404dd84a25bf39cecb2ca900a79c42b262e556d64b1b59779057e"],["13464a57a78102aa62b6979ae817f4637ffcfed3c4b1ce30bcd6303f6caf666b","69be159004614580ef7e433453ccb0ca48f300a81d0942e13f495a907f6ecc27"],["bc4a9df5b713fe2e9aef430bcc1dc97a0cd9ccede2f28588cada3a0d2d83f366","d3a81ca6e785c06383937adf4b798caa6e8a9fbfa547b16d758d666581f33c1"],["8c28a97bf8298bc0d23d8c749452a32e694b65e30a9472a3954ab30fe5324caa","40a30463a3305193378fedf31f7cc0eb7ae784f0451cb9459e71dc73cbef9482"],["8ea9666139527a8c1dd94ce4f071fd23c8b350c5a4bb33748c4ba111faccae0","620efabbc8ee2782e24e7c0cfb95c5d735b783be9cf0f8e955af34a30e62b945"],["dd3625faef5ba06074669716bbd3788d89bdde815959968092f76cc4eb9a9787","7a188fa3520e30d461da2501045731ca941461982883395937f68d00c644a573"],["f710d79d9eb962297e4f6232b40e8f7feb2bc63814614d692c12de752408221e","ea98e67232d3b3295d3b535532115ccac8612c721851617526ae47a9c77bfc82"]]},naf:{wnd:7,points:[["f9308a019258c31049344f85f89d5229b531c845836f99b08601f113bce036f9","388f7b0f632de8140fe337e62a37f3566500a99934c2231b6cb9fd7584b8e672"],["2f8bde4d1a07209355b4a7250a5c5128e88b84bddc619ab7cba8d569b240efe4","d8ac222636e5e3d6d4dba9dda6c9c426f788271bab0d6840dca87d3aa6ac62d6"],["5cbdf0646e5db4eaa398f365f2ea7a0e3d419b7e0330e39ce92bddedcac4f9bc","6aebca40ba255960a3178d6d861a54dba813d0b813fde7b5a5082628087264da"],["acd484e2f0c7f65309ad178a9f559abde09796974c57e714c35f110dfc27ccbe","cc338921b0a7d9fd64380971763b61e9add888a4375f8e0f05cc262ac64f9c37"],["774ae7f858a9411e5ef4246b70c65aac5649980be5c17891bbec17895da008cb","d984a032eb6b5e190243dd56d7b7b365372db1e2dff9d6a8301d74c9c953c61b"],["f28773c2d975288bc7d1d205c3748651b075fbc6610e58cddeeddf8f19405aa8","ab0902e8d880a89758212eb65cdaf473a1a06da521fa91f29b5cb52db03ed81"],["d7924d4f7d43ea965a465ae3095ff41131e5946f3c85f79e44adbcf8e27e080e","581e2872a86c72a683842ec228cc6defea40af2bd896d3a5c504dc9ff6a26b58"],["defdea4cdb677750a420fee807eacf21eb9898ae79b9768766e4faa04a2d4a34","4211ab0694635168e997b0ead2a93daeced1f4a04a95c0f6cfb199f69e56eb77"],["2b4ea0a797a443d293ef5cff444f4979f06acfebd7e86d277475656138385b6c","85e89bc037945d93b343083b5a1c86131a01f60c50269763b570c854e5c09b7a"],["352bbf4a4cdd12564f93fa332ce333301d9ad40271f8107181340aef25be59d5","321eb4075348f534d59c18259dda3e1f4a1b3b2e71b1039c67bd3d8bcf81998c"],["2fa2104d6b38d11b0230010559879124e42ab8dfeff5ff29dc9cdadd4ecacc3f","2de1068295dd865b64569335bd5dd80181d70ecfc882648423ba76b532b7d67"],["9248279b09b4d68dab21a9b066edda83263c3d84e09572e269ca0cd7f5453714","73016f7bf234aade5d1aa71bdea2b1ff3fc0de2a887912ffe54a32ce97cb3402"],["daed4f2be3a8bf278e70132fb0beb7522f570e144bf615c07e996d443dee8729","a69dce4a7d6c98e8d4a1aca87ef8d7003f83c230f3afa726ab40e52290be1c55"],["c44d12c7065d812e8acf28d7cbb19f9011ecd9e9fdf281b0e6a3b5e87d22e7db","2119a460ce326cdc76c45926c982fdac0e106e861edf61c5a039063f0e0e6482"],["6a245bf6dc698504c89a20cfded60853152b695336c28063b61c65cbd269e6b4","e022cf42c2bd4a708b3f5126f16a24ad8b33ba48d0423b6efd5e6348100d8a82"],["1697ffa6fd9de627c077e3d2fe541084ce13300b0bec1146f95ae57f0d0bd6a5","b9c398f186806f5d27561506e4557433a2cf15009e498ae7adee9d63d01b2396"],["605bdb019981718b986d0f07e834cb0d9deb8360ffb7f61df982345ef27a7479","2972d2de4f8d20681a78d93ec96fe23c26bfae84fb14db43b01e1e9056b8c49"],["62d14dab4150bf497402fdc45a215e10dcb01c354959b10cfe31c7e9d87ff33d","80fc06bd8cc5b01098088a1950eed0db01aa132967ab472235f5642483b25eaf"],["80c60ad0040f27dade5b4b06c408e56b2c50e9f56b9b8b425e555c2f86308b6f","1c38303f1cc5c30f26e66bad7fe72f70a65eed4cbe7024eb1aa01f56430bd57a"],["7a9375ad6167ad54aa74c6348cc54d344cc5dc9487d847049d5eabb0fa03c8fb","d0e3fa9eca8726909559e0d79269046bdc59ea10c70ce2b02d499ec224dc7f7"],["d528ecd9b696b54c907a9ed045447a79bb408ec39b68df504bb51f459bc3ffc9","eecf41253136e5f99966f21881fd656ebc4345405c520dbc063465b521409933"],["49370a4b5f43412ea25f514e8ecdad05266115e4a7ecb1387231808f8b45963","758f3f41afd6ed428b3081b0512fd62a54c3f3afbb5b6764b653052a12949c9a"],["77f230936ee88cbbd73df930d64702ef881d811e0e1498e2f1c13eb1fc345d74","958ef42a7886b6400a08266e9ba1b37896c95330d97077cbbe8eb3c7671c60d6"],["f2dac991cc4ce4b9ea44887e5c7c0bce58c80074ab9d4dbaeb28531b7739f530","e0dedc9b3b2f8dad4da1f32dec2531df9eb5fbeb0598e4fd1a117dba703a3c37"],["463b3d9f662621fb1b4be8fbbe2520125a216cdfc9dae3debcba4850c690d45b","5ed430d78c296c3543114306dd8622d7c622e27c970a1de31cb377b01af7307e"],["f16f804244e46e2a09232d4aff3b59976b98fac14328a2d1a32496b49998f247","cedabd9b82203f7e13d206fcdf4e33d92a6c53c26e5cce26d6579962c4e31df6"],["caf754272dc84563b0352b7a14311af55d245315ace27c65369e15f7151d41d1","cb474660ef35f5f2a41b643fa5e460575f4fa9b7962232a5c32f908318a04476"],["2600ca4b282cb986f85d0f1709979d8b44a09c07cb86d7c124497bc86f082120","4119b88753c15bd6a693b03fcddbb45d5ac6be74ab5f0ef44b0be9475a7e4b40"],["7635ca72d7e8432c338ec53cd12220bc01c48685e24f7dc8c602a7746998e435","91b649609489d613d1d5e590f78e6d74ecfc061d57048bad9e76f302c5b9c61"],["754e3239f325570cdbbf4a87deee8a66b7f2b33479d468fbc1a50743bf56cc18","673fb86e5bda30fb3cd0ed304ea49a023ee33d0197a695d0c5d98093c536683"],["e3e6bd1071a1e96aff57859c82d570f0330800661d1c952f9fe2694691d9b9e8","59c9e0bba394e76f40c0aa58379a3cb6a5a2283993e90c4167002af4920e37f5"],["186b483d056a033826ae73d88f732985c4ccb1f32ba35f4b4cc47fdcf04aa6eb","3b952d32c67cf77e2e17446e204180ab21fb8090895138b4a4a797f86e80888b"],["df9d70a6b9876ce544c98561f4be4f725442e6d2b737d9c91a8321724ce0963f","55eb2dafd84d6ccd5f862b785dc39d4ab157222720ef9da217b8c45cf2ba2417"],["5edd5cc23c51e87a497ca815d5dce0f8ab52554f849ed8995de64c5f34ce7143","efae9c8dbc14130661e8cec030c89ad0c13c66c0d17a2905cdc706ab7399a868"],["290798c2b6476830da12fe02287e9e777aa3fba1c355b17a722d362f84614fba","e38da76dcd440621988d00bcf79af25d5b29c094db2a23146d003afd41943e7a"],["af3c423a95d9f5b3054754efa150ac39cd29552fe360257362dfdecef4053b45","f98a3fd831eb2b749a93b0e6f35cfb40c8cd5aa667a15581bc2feded498fd9c6"],["766dbb24d134e745cccaa28c99bf274906bb66b26dcf98df8d2fed50d884249a","744b1152eacbe5e38dcc887980da38b897584a65fa06cedd2c924f97cbac5996"],["59dbf46f8c94759ba21277c33784f41645f7b44f6c596a58ce92e666191abe3e","c534ad44175fbc300f4ea6ce648309a042ce739a7919798cd85e216c4a307f6e"],["f13ada95103c4537305e691e74e9a4a8dd647e711a95e73cb62dc6018cfd87b8","e13817b44ee14de663bf4bc808341f326949e21a6a75c2570778419bdaf5733d"],["7754b4fa0e8aced06d4167a2c59cca4cda1869c06ebadfb6488550015a88522c","30e93e864e669d82224b967c3020b8fa8d1e4e350b6cbcc537a48b57841163a2"],["948dcadf5990e048aa3874d46abef9d701858f95de8041d2a6828c99e2262519","e491a42537f6e597d5d28a3224b1bc25df9154efbd2ef1d2cbba2cae5347d57e"],["7962414450c76c1689c7b48f8202ec37fb224cf5ac0bfa1570328a8a3d7c77ab","100b610ec4ffb4760d5c1fc133ef6f6b12507a051f04ac5760afa5b29db83437"],["3514087834964b54b15b160644d915485a16977225b8847bb0dd085137ec47ca","ef0afbb2056205448e1652c48e8127fc6039e77c15c2378b7e7d15a0de293311"],["d3cc30ad6b483e4bc79ce2c9dd8bc54993e947eb8df787b442943d3f7b527eaf","8b378a22d827278d89c5e9be8f9508ae3c2ad46290358630afb34db04eede0a4"],["1624d84780732860ce1c78fcbfefe08b2b29823db913f6493975ba0ff4847610","68651cf9b6da903e0914448c6cd9d4ca896878f5282be4c8cc06e2a404078575"],["733ce80da955a8a26902c95633e62a985192474b5af207da6df7b4fd5fc61cd4","f5435a2bd2badf7d485a4d8b8db9fcce3e1ef8e0201e4578c54673bc1dc5ea1d"],["15d9441254945064cf1a1c33bbd3b49f8966c5092171e699ef258dfab81c045c","d56eb30b69463e7234f5137b73b84177434800bacebfc685fc37bbe9efe4070d"],["a1d0fcf2ec9de675b612136e5ce70d271c21417c9d2b8aaaac138599d0717940","edd77f50bcb5a3cab2e90737309667f2641462a54070f3d519212d39c197a629"],["e22fbe15c0af8ccc5780c0735f84dbe9a790badee8245c06c7ca37331cb36980","a855babad5cd60c88b430a69f53a1a7a38289154964799be43d06d77d31da06"],["311091dd9860e8e20ee13473c1155f5f69635e394704eaa74009452246cfa9b3","66db656f87d1f04fffd1f04788c06830871ec5a64feee685bd80f0b1286d8374"],["34c1fd04d301be89b31c0442d3e6ac24883928b45a9340781867d4232ec2dbdf","9414685e97b1b5954bd46f730174136d57f1ceeb487443dc5321857ba73abee"],["f219ea5d6b54701c1c14de5b557eb42a8d13f3abbcd08affcc2a5e6b049b8d63","4cb95957e83d40b0f73af4544cccf6b1f4b08d3c07b27fb8d8c2962a400766d1"],["d7b8740f74a8fbaab1f683db8f45de26543a5490bca627087236912469a0b448","fa77968128d9c92ee1010f337ad4717eff15db5ed3c049b3411e0315eaa4593b"],["32d31c222f8f6f0ef86f7c98d3a3335ead5bcd32abdd94289fe4d3091aa824bf","5f3032f5892156e39ccd3d7915b9e1da2e6dac9e6f26e961118d14b8462e1661"],["7461f371914ab32671045a155d9831ea8793d77cd59592c4340f86cbc18347b5","8ec0ba238b96bec0cbdddcae0aa442542eee1ff50c986ea6b39847b3cc092ff6"],["ee079adb1df1860074356a25aa38206a6d716b2c3e67453d287698bad7b2b2d6","8dc2412aafe3be5c4c5f37e0ecc5f9f6a446989af04c4e25ebaac479ec1c8c1e"],["16ec93e447ec83f0467b18302ee620f7e65de331874c9dc72bfd8616ba9da6b5","5e4631150e62fb40d0e8c2a7ca5804a39d58186a50e497139626778e25b0674d"],["eaa5f980c245f6f038978290afa70b6bd8855897f98b6aa485b96065d537bd99","f65f5d3e292c2e0819a528391c994624d784869d7e6ea67fb18041024edc07dc"],["78c9407544ac132692ee1910a02439958ae04877151342ea96c4b6b35a49f51","f3e0319169eb9b85d5404795539a5e68fa1fbd583c064d2462b675f194a3ddb4"],["494f4be219a1a77016dcd838431aea0001cdc8ae7a6fc688726578d9702857a5","42242a969283a5f339ba7f075e36ba2af925ce30d767ed6e55f4b031880d562c"],["a598a8030da6d86c6bc7f2f5144ea549d28211ea58faa70ebf4c1e665c1fe9b5","204b5d6f84822c307e4b4a7140737aec23fc63b65b35f86a10026dbd2d864e6b"],["c41916365abb2b5d09192f5f2dbeafec208f020f12570a184dbadc3e58595997","4f14351d0087efa49d245b328984989d5caf9450f34bfc0ed16e96b58fa9913"],["841d6063a586fa475a724604da03bc5b92a2e0d2e0a36acfe4c73a5514742881","73867f59c0659e81904f9a1c7543698e62562d6744c169ce7a36de01a8d6154"],["5e95bb399a6971d376026947f89bde2f282b33810928be4ded112ac4d70e20d5","39f23f366809085beebfc71181313775a99c9aed7d8ba38b161384c746012865"],["36e4641a53948fd476c39f8a99fd974e5ec07564b5315d8bf99471bca0ef2f66","d2424b1b1abe4eb8164227b085c9aa9456ea13493fd563e06fd51cf5694c78fc"],["336581ea7bfbbb290c191a2f507a41cf5643842170e914faeab27c2c579f726","ead12168595fe1be99252129b6e56b3391f7ab1410cd1e0ef3dcdcabd2fda224"],["8ab89816dadfd6b6a1f2634fcf00ec8403781025ed6890c4849742706bd43ede","6fdcef09f2f6d0a044e654aef624136f503d459c3e89845858a47a9129cdd24e"],["1e33f1a746c9c5778133344d9299fcaa20b0938e8acff2544bb40284b8c5fb94","60660257dd11b3aa9c8ed618d24edff2306d320f1d03010e33a7d2057f3b3b6"],["85b7c1dcb3cec1b7ee7f30ded79dd20a0ed1f4cc18cbcfcfa410361fd8f08f31","3d98a9cdd026dd43f39048f25a8847f4fcafad1895d7a633c6fed3c35e999511"],["29df9fbd8d9e46509275f4b125d6d45d7fbe9a3b878a7af872a2800661ac5f51","b4c4fe99c775a606e2d8862179139ffda61dc861c019e55cd2876eb2a27d84b"],["a0b1cae06b0a847a3fea6e671aaf8adfdfe58ca2f768105c8082b2e449fce252","ae434102edde0958ec4b19d917a6a28e6b72da1834aff0e650f049503a296cf2"],["4e8ceafb9b3e9a136dc7ff67e840295b499dfb3b2133e4ba113f2e4c0e121e5","cf2174118c8b6d7a4b48f6d534ce5c79422c086a63460502b827ce62a326683c"],["d24a44e047e19b6f5afb81c7ca2f69080a5076689a010919f42725c2b789a33b","6fb8d5591b466f8fc63db50f1c0f1c69013f996887b8244d2cdec417afea8fa3"],["ea01606a7a6c9cdd249fdfcfacb99584001edd28abbab77b5104e98e8e3b35d4","322af4908c7312b0cfbfe369f7a7b3cdb7d4494bc2823700cfd652188a3ea98d"],["af8addbf2b661c8a6c6328655eb96651252007d8c5ea31be4ad196de8ce2131f","6749e67c029b85f52a034eafd096836b2520818680e26ac8f3dfbcdb71749700"],["e3ae1974566ca06cc516d47e0fb165a674a3dabcfca15e722f0e3450f45889","2aeabe7e4531510116217f07bf4d07300de97e4874f81f533420a72eeb0bd6a4"],["591ee355313d99721cf6993ffed1e3e301993ff3ed258802075ea8ced397e246","b0ea558a113c30bea60fc4775460c7901ff0b053d25ca2bdeee98f1a4be5d196"],["11396d55fda54c49f19aa97318d8da61fa8584e47b084945077cf03255b52984","998c74a8cd45ac01289d5833a7beb4744ff536b01b257be4c5767bea93ea57a4"],["3c5d2a1ba39c5a1790000738c9e0c40b8dcdfd5468754b6405540157e017aa7a","b2284279995a34e2f9d4de7396fc18b80f9b8b9fdd270f6661f79ca4c81bd257"],["cc8704b8a60a0defa3a99a7299f2e9c3fbc395afb04ac078425ef8a1793cc030","bdd46039feed17881d1e0862db347f8cf395b74fc4bcdc4e940b74e3ac1f1b13"],["c533e4f7ea8555aacd9777ac5cad29b97dd4defccc53ee7ea204119b2889b197","6f0a256bc5efdf429a2fb6242f1a43a2d9b925bb4a4b3a26bb8e0f45eb596096"],["c14f8f2ccb27d6f109f6d08d03cc96a69ba8c34eec07bbcf566d48e33da6593","c359d6923bb398f7fd4473e16fe1c28475b740dd098075e6c0e8649113dc3a38"],["a6cbc3046bc6a450bac24789fa17115a4c9739ed75f8f21ce441f72e0b90e6ef","21ae7f4680e889bb130619e2c0f95a360ceb573c70603139862afd617fa9b9f"],["347d6d9a02c48927ebfb86c1359b1caf130a3c0267d11ce6344b39f99d43cc38","60ea7f61a353524d1c987f6ecec92f086d565ab687870cb12689ff1e31c74448"],["da6545d2181db8d983f7dcb375ef5866d47c67b1bf31c8cf855ef7437b72656a","49b96715ab6878a79e78f07ce5680c5d6673051b4935bd897fea824b77dc208a"],["c40747cc9d012cb1a13b8148309c6de7ec25d6945d657146b9d5994b8feb1111","5ca560753be2a12fc6de6caf2cb489565db936156b9514e1bb5e83037e0fa2d4"],["4e42c8ec82c99798ccf3a610be870e78338c7f713348bd34c8203ef4037f3502","7571d74ee5e0fb92a7a8b33a07783341a5492144cc54bcc40a94473693606437"],["3775ab7089bc6af823aba2e1af70b236d251cadb0c86743287522a1b3b0dedea","be52d107bcfa09d8bcb9736a828cfa7fac8db17bf7a76a2c42ad961409018cf7"],["cee31cbf7e34ec379d94fb814d3d775ad954595d1314ba8846959e3e82f74e26","8fd64a14c06b589c26b947ae2bcf6bfa0149ef0be14ed4d80f448a01c43b1c6d"],["b4f9eaea09b6917619f6ea6a4eb5464efddb58fd45b1ebefcdc1a01d08b47986","39e5c9925b5a54b07433a4f18c61726f8bb131c012ca542eb24a8ac07200682a"],["d4263dfc3d2df923a0179a48966d30ce84e2515afc3dccc1b77907792ebcc60e","62dfaf07a0f78feb30e30d6295853ce189e127760ad6cf7fae164e122a208d54"],["48457524820fa65a4f8d35eb6930857c0032acc0a4a2de422233eeda897612c4","25a748ab367979d98733c38a1fa1c2e7dc6cc07db2d60a9ae7a76aaa49bd0f77"],["dfeeef1881101f2cb11644f3a2afdfc2045e19919152923f367a1767c11cceda","ecfb7056cf1de042f9420bab396793c0c390bde74b4bbdff16a83ae09a9a7517"],["6d7ef6b17543f8373c573f44e1f389835d89bcbc6062ced36c82df83b8fae859","cd450ec335438986dfefa10c57fea9bcc521a0959b2d80bbf74b190dca712d10"],["e75605d59102a5a2684500d3b991f2e3f3c88b93225547035af25af66e04541f","f5c54754a8f71ee540b9b48728473e314f729ac5308b06938360990e2bfad125"],["eb98660f4c4dfaa06a2be453d5020bc99a0c2e60abe388457dd43fefb1ed620c","6cb9a8876d9cb8520609af3add26cd20a0a7cd8a9411131ce85f44100099223e"],["13e87b027d8514d35939f2e6892b19922154596941888336dc3563e3b8dba942","fef5a3c68059a6dec5d624114bf1e91aac2b9da568d6abeb2570d55646b8adf1"],["ee163026e9fd6fe017c38f06a5be6fc125424b371ce2708e7bf4491691e5764a","1acb250f255dd61c43d94ccc670d0f58f49ae3fa15b96623e5430da0ad6c62b2"],["b268f5ef9ad51e4d78de3a750c2dc89b1e626d43505867999932e5db33af3d80","5f310d4b3c99b9ebb19f77d41c1dee018cf0d34fd4191614003e945a1216e423"],["ff07f3118a9df035e9fad85eb6c7bfe42b02f01ca99ceea3bf7ffdba93c4750d","438136d603e858a3a5c440c38eccbaddc1d2942114e2eddd4740d098ced1f0d8"],["8d8b9855c7c052a34146fd20ffb658bea4b9f69e0d825ebec16e8c3ce2b526a1","cdb559eedc2d79f926baf44fb84ea4d44bcf50fee51d7ceb30e2e7f463036758"],["52db0b5384dfbf05bfa9d472d7ae26dfe4b851ceca91b1eba54263180da32b63","c3b997d050ee5d423ebaf66a6db9f57b3180c902875679de924b69d84a7b375"],["e62f9490d3d51da6395efd24e80919cc7d0f29c3f3fa48c6fff543becbd43352","6d89ad7ba4876b0b22c2ca280c682862f342c8591f1daf5170e07bfd9ccafa7d"],["7f30ea2476b399b4957509c88f77d0191afa2ff5cb7b14fd6d8e7d65aaab1193","ca5ef7d4b231c94c3b15389a5f6311e9daff7bb67b103e9880ef4bff637acaec"],["5098ff1e1d9f14fb46a210fada6c903fef0fb7b4a1dd1d9ac60a0361800b7a00","9731141d81fc8f8084d37c6e7542006b3ee1b40d60dfe5362a5b132fd17ddc0"],["32b78c7de9ee512a72895be6b9cbefa6e2f3c4ccce445c96b9f2c81e2778ad58","ee1849f513df71e32efc3896ee28260c73bb80547ae2275ba497237794c8753c"],["e2cb74fddc8e9fbcd076eef2a7c72b0ce37d50f08269dfc074b581550547a4f7","d3aa2ed71c9dd2247a62df062736eb0baddea9e36122d2be8641abcb005cc4a4"],["8438447566d4d7bedadc299496ab357426009a35f235cb141be0d99cd10ae3a8","c4e1020916980a4da5d01ac5e6ad330734ef0d7906631c4f2390426b2edd791f"],["4162d488b89402039b584c6fc6c308870587d9c46f660b878ab65c82c711d67e","67163e903236289f776f22c25fb8a3afc1732f2b84b4e95dbda47ae5a0852649"],["3fad3fa84caf0f34f0f89bfd2dcf54fc175d767aec3e50684f3ba4a4bf5f683d","cd1bc7cb6cc407bb2f0ca647c718a730cf71872e7d0d2a53fa20efcdfe61826"],["674f2600a3007a00568c1a7ce05d0816c1fb84bf1370798f1c69532faeb1a86b","299d21f9413f33b3edf43b257004580b70db57da0b182259e09eecc69e0d38a5"],["d32f4da54ade74abb81b815ad1fb3b263d82d6c692714bcff87d29bd5ee9f08f","f9429e738b8e53b968e99016c059707782e14f4535359d582fc416910b3eea87"],["30e4e670435385556e593657135845d36fbb6931f72b08cb1ed954f1e3ce3ff6","462f9bce619898638499350113bbc9b10a878d35da70740dc695a559eb88db7b"],["be2062003c51cc3004682904330e4dee7f3dcd10b01e580bf1971b04d4cad297","62188bc49d61e5428573d48a74e1c655b1c61090905682a0d5558ed72dccb9bc"],["93144423ace3451ed29e0fb9ac2af211cb6e84a601df5993c419859fff5df04a","7c10dfb164c3425f5c71a3f9d7992038f1065224f72bb9d1d902a6d13037b47c"],["b015f8044f5fcbdcf21ca26d6c34fb8197829205c7b7d2a7cb66418c157b112c","ab8c1e086d04e813744a655b2df8d5f83b3cdc6faa3088c1d3aea1454e3a1d5f"],["d5e9e1da649d97d89e4868117a465a3a4f8a18de57a140d36b3f2af341a21b52","4cb04437f391ed73111a13cc1d4dd0db1693465c2240480d8955e8592f27447a"],["d3ae41047dd7ca065dbf8ed77b992439983005cd72e16d6f996a5316d36966bb","bd1aeb21ad22ebb22a10f0303417c6d964f8cdd7df0aca614b10dc14d125ac46"],["463e2763d885f958fc66cdd22800f0a487197d0a82e377b49f80af87c897b065","bfefacdb0e5d0fd7df3a311a94de062b26b80c61fbc97508b79992671ef7ca7f"],["7985fdfd127c0567c6f53ec1bb63ec3158e597c40bfe747c83cddfc910641917","603c12daf3d9862ef2b25fe1de289aed24ed291e0ec6708703a5bd567f32ed03"],["74a1ad6b5f76e39db2dd249410eac7f99e74c59cb83d2d0ed5ff1543da7703e9","cc6157ef18c9c63cd6193d83631bbea0093e0968942e8c33d5737fd790e0db08"],["30682a50703375f602d416664ba19b7fc9bab42c72747463a71d0896b22f6da3","553e04f6b018b4fa6c8f39e7f311d3176290d0e0f19ca73f17714d9977a22ff8"],["9e2158f0d7c0d5f26c3791efefa79597654e7a2b2464f52b1ee6c1347769ef57","712fcdd1b9053f09003a3481fa7762e9ffd7c8ef35a38509e2fbf2629008373"],["176e26989a43c9cfeba4029c202538c28172e566e3c4fce7322857f3be327d66","ed8cc9d04b29eb877d270b4878dc43c19aefd31f4eee09ee7b47834c1fa4b1c3"],["75d46efea3771e6e68abb89a13ad747ecf1892393dfc4f1b7004788c50374da8","9852390a99507679fd0b86fd2b39a868d7efc22151346e1a3ca4726586a6bed8"],["809a20c67d64900ffb698c4c825f6d5f2310fb0451c869345b7319f645605721","9e994980d9917e22b76b061927fa04143d096ccc54963e6a5ebfa5f3f8e286c1"],["1b38903a43f7f114ed4500b4eac7083fdefece1cf29c63528d563446f972c180","4036edc931a60ae889353f77fd53de4a2708b26b6f5da72ad3394119daf408f9"]]}}});var Ei=L(Go=>{"use strict";var ra=Go,it=Si(),ta=Jf(),Mb=cr(),Jo=Mb.assert;function Xo(r){r.type==="short"?this.curve=new ta.short(r):r.type==="edwards"?this.curve=new ta.edwards(r):this.curve=new ta.mont(r),this.g=this.curve.g,this.n=this.curve.n,this.hash=r.hash,Jo(this.g.validate(),"Invalid curve"),Jo(this.g.mul(this.n).isInfinity(),"Invalid curve, G*N != O")}ra.PresetCurve=Xo;function nt(r,e){Object.defineProperty(ra,r,{configurable:!0,enumerable:!0,get:function(){var t=new Xo(e);return Object.defineProperty(ra,r,{configurable:!0,enumerable:!0,value:t}),t}})}nt("p192",{type:"short",prime:"p192",p:"ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff",a:"ffffffff ffffffff ffffffff fffffffe ffffffff fffffffc",b:"64210519 e59c80e7 0fa7e9ab 72243049 feb8deec c146b9b1",n:"ffffffff ffffffff ffffffff 99def836 146bc9b1 b4d22831",hash:it.sha256,gRed:!1,g:["188da80e b03090f6 7cbf20eb 43a18800 f4ff0afd 82ff1012","07192b95 ffc8da78 631011ed 6b24cdd5 73f977a1 1e794811"]});nt("p224",{type:"short",prime:"p224",p:"ffffffff ffffffff ffffffff ffffffff 00000000 00000000 00000001",a:"ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff fffffffe",b:"b4050a85 0c04b3ab f5413256 5044b0b7 d7bfd8ba 270b3943 2355ffb4",n:"ffffffff ffffffff ffffffff ffff16a2 e0b8f03e 13dd2945 5c5c2a3d",hash:it.sha256,gRed:!1,g:["b70e0cbd 6bb4bf7f 321390b9 4a03c1d3 56c21122 343280d6 115c1d21","bd376388 b5f723fb 4c22dfe6 cd4375a0 5a074764 44d58199 85007e34"]});nt("p256",{type:"short",prime:null,p:"ffffffff 00000001 00000000 00000000 00000000 ffffffff ffffffff ffffffff",a:"ffffffff 00000001 00000000 00000000 00000000 ffffffff ffffffff fffffffc",b:"5ac635d8 aa3a93e7 b3ebbd55 769886bc 651d06b0 cc53b0f6 3bce3c3e 27d2604b",n:"ffffffff 00000000 ffffffff ffffffff bce6faad a7179e84 f3b9cac2 fc632551",hash:it.sha256,gRed:!1,g:["6b17d1f2 e12c4247 f8bce6e5 63a440f2 77037d81 2deb33a0 f4a13945 d898c296","4fe342e2 fe1a7f9b 8ee7eb4a 7c0f9e16 2bce3357 6b315ece cbb64068 37bf51f5"]});nt("p384",{type:"short",prime:null,p:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe ffffffff 00000000 00000000 ffffffff",a:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe ffffffff 00000000 00000000 fffffffc",b:"b3312fa7 e23ee7e4 988e056b e3f82d19 181d9c6e fe814112 0314088f 5013875a c656398d 8a2ed19d 2a85c8ed d3ec2aef",n:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff c7634d81 f4372ddf 581a0db2 48b0a77a ecec196a ccc52973",hash:it.sha384,gRed:!1,g:["aa87ca22 be8b0537 8eb1c71e f320ad74 6e1d3b62 8ba79b98 59f741e0 82542a38 5502f25d bf55296c 3a545e38 72760ab7","3617de4a 96262c6f 5d9e98bf 9292dc29 f8f41dbd 289a147c e9da3113 b5f0b8c0 0a60b1ce 1d7e819d 7a431d7c 90ea0e5f"]});nt("p521",{type:"short",prime:null,p:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff",a:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffc",b:"00000051 953eb961 8e1c9a1f 929a21a0 b68540ee a2da725b 99b315f3 b8b48991 8ef109e1 56193951 ec7e937b 1652c0bd 3bb1bf07 3573df88 3d2c34f1 ef451fd4 6b503f00",n:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffa 51868783 bf2f966b 7fcc0148 f709a5d0 3bb5c9b8 899c47ae bb6fb71e 91386409",hash:it.sha512,gRed:!1,g:["000000c6 858e06b7 0404e9cd 9e3ecb66 2395b442 9c648139 053fb521 f828af60 6b4d3dba a14b5e77 efe75928 fe1dc127 a2ffa8de 3348b3c1 856a429b f97e7e31 c2e5bd66","00000118 39296a78 9a3bc004 5c8a5fb4 2c7d1bd9 98f54449 579b4468 17afbd17 273e662c 97ee7299 5ef42640 c550b901 3fad0761 353c7086 a272c240 88be9476 9fd16650"]});nt("curve25519",{type:"mont",prime:"p25519",p:"7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed",a:"76d06",b:"1",n:"1000000000000000 0000000000000000 14def9dea2f79cd6 5812631a5cf5d3ed",hash:it.sha256,gRed:!1,g:["9"]});nt("ed25519",{type:"edwards",prime:"p25519",p:"7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed",a:"-1",c:"1",d:"52036cee2b6ffe73 8cc740797779e898 00700a4d4141d8ab 75eb4dca135978a3",n:"1000000000000000 0000000000000000 14def9dea2f79cd6 5812631a5cf5d3ed",hash:it.sha256,gRed:!1,g:["216936d3cd6e53fec0a4e231fdd6dc5c692cc7609525a7b2c9562d608f25d51a","6666666666666666666666666666666666666666666666666666666666666658"]});var ia;try{ia=Ko()}catch(r){ia=void 0}nt("secp256k1",{type:"short",prime:"k256",p:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe fffffc2f",a:"0",b:"7",n:"ffffffff ffffffff ffffffff fffffffe baaedce6 af48a03b bfd25e8c d0364141",h:"1",hash:it.sha256,beta:"7ae96a2b657c07106e64479eac3434e99cf0497512f58995c1396c28719501ee",lambda:"5363ad4cc05c30e0a5261c028812645a122e22ea20816678df02967c1b23bd72",basis:[{a:"3086d221a7d46bcde86c90e49284eb15",b:"-e4437ed6010e88286f547fa90abfe4c3"},{a:"114ca50f7a8e2f3f657c1108d9d44cfd8",b:"3086d221a7d46bcde86c90e49284eb15"}],gRed:!1,g:["79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798","483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8",ia]})});var Yo=L((Fx,Zo)=>{"use strict";var Ab=Si(),wt=Df(),Vo=Qr();function ft(r){if(!(this instanceof ft))return new ft(r);this.hash=r.hash,this.predResist=!!r.predResist,this.outLen=this.hash.outSize,this.minEntropy=r.minEntropy||this.hash.hmacStrength,this._reseed=null,this.reseedInterval=null,this.K=null,this.V=null;var e=wt.toArray(r.entropy,r.entropyEnc||"hex"),t=wt.toArray(r.nonce,r.nonceEnc||"hex"),i=wt.toArray(r.pers,r.persEnc||"hex");Vo(e.length>=this.minEntropy/8,"Not enough entropy. Minimum is: "+this.minEntropy+" bits"),this._init(e,t,i)}Zo.exports=ft;ft.prototype._init=function(e,t,i){var n=e.concat(t).concat(i);this.K=new Array(this.outLen/8),this.V=new Array(this.outLen/8);for(var f=0;f<this.V.length;f++)this.K[f]=0,this.V[f]=1;this._update(n),this._reseed=1,this.reseedInterval=281474976710656};ft.prototype._hmac=function(){return new Ab.hmac(this.hash,this.K)};ft.prototype._update=function(e){var t=this._hmac().update(this.V).update([0]);e&&(t=t.update(e)),this.K=t.digest(),this.V=this._hmac().update(this.V).digest(),!!e&&(this.K=this._hmac().update(this.V).update([1]).update(e).digest(),this.V=this._hmac().update(this.V).digest())};ft.prototype.reseed=function(e,t,i,n){typeof t!="string"&&(n=i,i=t,t=null),e=wt.toArray(e,t),i=wt.toArray(i,n),Vo(e.length>=this.minEntropy/8,"Not enough entropy. Minimum is: "+this.minEntropy+" bits"),this._update(e.concat(i||[])),this._reseed=1};ft.prototype.generate=function(e,t,i,n){if(this._reseed>this.reseedInterval)throw new Error("Reseed is required");typeof t!="string"&&(n=i,i=t,t=null),i&&(i=wt.toArray(i,n||"hex"),this._update(i));for(var f=[];f.length<e;)this.V=this._hmac().update(this.V).digest(),f=f.concat(this.V);var a=f.slice(0,e);return this._update(i),this._reseed++,wt.encode(a,t)}});var Qo=L((Lx,$o)=>{"use strict";var Bb=gr(),Rb=cr(),na=Rb.assert;function $e(r,e){this.ec=r,this.priv=null,this.pub=null,e.priv&&this._importPrivate(e.priv,e.privEnc),e.pub&&this._importPublic(e.pub,e.pubEnc)}$o.exports=$e;$e.fromPublic=function(e,t,i){return t instanceof $e?t:new $e(e,{pub:t,pubEnc:i})};$e.fromPrivate=function(e,t,i){return t instanceof $e?t:new $e(e,{priv:t,privEnc:i})};$e.prototype.validate=function(){var e=this.getPublic();return e.isInfinity()?{result:!1,reason:"Invalid public key"}:e.validate()?e.mul(this.ec.curve.n).isInfinity()?{result:!0,reason:null}:{result:!1,reason:"Public key * N != O"}:{result:!1,reason:"Public key is not a point"}};$e.prototype.getPublic=function(e,t){return typeof e=="string"&&(t=e,e=null),this.pub||(this.pub=this.ec.g.mul(this.priv)),t?this.pub.encode(t,e):this.pub};$e.prototype.getPrivate=function(e){return e==="hex"?this.priv.toString(16,2):this.priv};$e.prototype._importPrivate=function(e,t){this.priv=new Bb(e,t||16),this.priv=this.priv.umod(this.ec.curve.n)};$e.prototype._importPublic=function(e,t){if(e.x||e.y){this.ec.curve.type==="mont"?na(e.x,"Need x coordinate"):(this.ec.curve.type==="short"||this.ec.curve.type==="edwards")&&na(e.x&&e.y,"Need both x and y coordinate"),this.pub=this.ec.curve.point(e.x,e.y);return}this.pub=this.ec.curve.decodePoint(e,t)};$e.prototype.derive=function(e){return e.validate()||na(e.validate(),"public point not validated"),e.mul(this.priv).getX()};$e.prototype.sign=function(e,t,i){return this.ec.sign(e,this,t,i)};$e.prototype.verify=function(e,t){return this.ec.verify(e,t,this)};$e.prototype.inspect=function(){return"<Key priv: "+(this.priv&&this.priv.toString(16,2))+" pub: "+(this.pub&&this.pub.inspect())+" >"}});var td=L((Nx,rd)=>{"use strict";var Mi=gr(),fa=cr(),qb=fa.assert;function Ai(r,e){if(r instanceof Ai)return r;this._importDER(r,e)||(qb(r.r&&r.s,"Signature without r or s"),this.r=new Mi(r.r,16),this.s=new Mi(r.s,16),r.recoveryParam===void 0?this.recoveryParam=null:this.recoveryParam=r.recoveryParam)}rd.exports=Ai;function Cb(){this.place=0}function aa(r,e){var t=r[e.place++];if(!(t&128))return t;var i=t&15;if(i===0||i>4)return!1;for(var n=0,f=0,a=e.place;f<i;f++,a++)n<<=8,n|=r[a],n>>>=0;return n<=127?!1:(e.place=a,n)}function ed(r){for(var e=0,t=r.length-1;!r[e]&&!(r[e+1]&128)&&e<t;)e++;return e===0?r:r.slice(e)}Ai.prototype._importDER=function(e,t){e=fa.toArray(e,t);var i=new Cb;if(e[i.place++]!==48)return!1;var n=aa(e,i);if(n===!1||n+i.place!==e.length||e[i.place++]!==2)return!1;var f=aa(e,i);if(f===!1)return!1;var a=e.slice(i.place,f+i.place);if(i.place+=f,e[i.place++]!==2)return!1;var o=aa(e,i);if(o===!1||e.length!==o+i.place)return!1;var u=e.slice(i.place,o+i.place);if(a[0]===0)if(a[1]&128)a=a.slice(1);else return!1;if(u[0]===0)if(u[1]&128)u=u.slice(1);else return!1;return this.r=new Mi(a),this.s=new Mi(u),this.recoveryParam=null,!0};function sa(r,e){if(e<128){r.push(e);return}var t=1+(Math.log(e)/Math.LN2>>>3);for(r.push(t|128);--t;)r.push(e>>>(t<<3)&255);r.push(e)}Ai.prototype.toDER=function(e){var t=this.r.toArray(),i=this.s.toArray();for(t[0]&128&&(t=[0].concat(t)),i[0]&128&&(i=[0].concat(i)),t=ed(t),i=ed(i);!i[0]&&!(i[1]&128);)i=i.slice(1);var n=[2];sa(n,t.length),n=n.concat(t),n.push(2),sa(n,i.length);var f=n.concat(i),a=[48];return sa(a,f.length),a=a.concat(f),fa.encode(a,e)}});var ad=L((Dx,fd)=>{"use strict";var St=gr(),id=Yo(),Ib=cr(),oa=Ei(),kb=Wf(),nd=Ib.assert,da=Qo(),Bi=td();function br(r){if(!(this instanceof br))return new br(r);typeof r=="string"&&(nd(Object.prototype.hasOwnProperty.call(oa,r),"Unknown curve "+r),r=oa[r]),r instanceof oa.PresetCurve&&(r={curve:r}),this.curve=r.curve.curve,this.n=this.curve.n,this.nh=this.n.ushrn(1),this.g=this.curve.g,this.g=r.curve.g,this.g.precompute(r.curve.n.bitLength()+1),this.hash=r.hash||r.curve.hash}fd.exports=br;br.prototype.keyPair=function(e){return new da(this,e)};br.prototype.keyFromPrivate=function(e,t){return da.fromPrivate(this,e,t)};br.prototype.keyFromPublic=function(e,t){return da.fromPublic(this,e,t)};br.prototype.genKeyPair=function(e){e||(e={});for(var t=new id({hash:this.hash,pers:e.pers,persEnc:e.persEnc||"utf8",entropy:e.entropy||kb(this.hash.hmacStrength),entropyEnc:e.entropy&&e.entropyEnc||"utf8",nonce:this.n.toArray()}),i=this.n.byteLength(),n=this.n.sub(new St(2));;){var f=new St(t.generate(i));if(!(f.cmp(n)>0))return f.iaddn(1),this.keyFromPrivate(f)}};br.prototype._truncateToN=function(e,t){var i=e.byteLength()*8-this.n.bitLength();return i>0&&(e=e.ushrn(i)),!t&&e.cmp(this.n)>=0?e.sub(this.n):e};br.prototype.sign=function(e,t,i,n){typeof i=="object"&&(n=i,i=null),n||(n={}),t=this.keyFromPrivate(t,i),e=this._truncateToN(new St(e,16));for(var f=this.n.byteLength(),a=t.getPrivate().toArray("be",f),o=e.toArray("be",f),u=new id({hash:this.hash,entropy:a,nonce:o,pers:n.pers,persEnc:n.persEnc||"utf8"}),v=this.n.sub(new St(1)),h=0;;h++){var l=n.k?n.k(h):new St(u.generate(this.n.byteLength()));if(l=this._truncateToN(l,!0),!(l.cmpn(1)<=0||l.cmp(v)>=0)){var x=this.g.mul(l);if(!x.isInfinity()){var y=x.getX(),E=y.umod(this.n);if(E.cmpn(0)!==0){var R=l.invm(this.n).mul(E.mul(t.getPrivate()).iadd(e));if(R=R.umod(this.n),R.cmpn(0)!==0){var A=(x.getY().isOdd()?1:0)|(y.cmp(E)!==0?2:0);return n.canonical&&R.cmp(this.nh)>0&&(R=this.n.sub(R),A^=1),new Bi({r:E,s:R,recoveryParam:A})}}}}}};br.prototype.verify=function(e,t,i,n){e=this._truncateToN(new St(e,16)),i=this.keyFromPublic(i,n),t=new Bi(t,"hex");var f=t.r,a=t.s;if(f.cmpn(1)<0||f.cmp(this.n)>=0||a.cmpn(1)<0||a.cmp(this.n)>=0)return!1;var o=a.invm(this.n),u=o.mul(e).umod(this.n),v=o.mul(f).umod(this.n),h;return this.curve._maxwellTrick?(h=this.g.jmulAdd(u,i.getPublic(),v),h.isInfinity()?!1:h.eqXToP(f)):(h=this.g.mulAdd(u,i.getPublic(),v),h.isInfinity()?!1:h.getX().umod(this.n).cmp(f)===0)};br.prototype.recoverPubKey=function(r,e,t,i){nd((3&t)===t,"The recovery param is more than two bits"),e=new Bi(e,i);var n=this.n,f=new St(r),a=e.r,o=e.s,u=t&1,v=t>>1;if(a.cmp(this.curve.p.umod(this.curve.n))>=0&&v)throw new Error("Unable to find sencond key candinate");v?a=this.curve.pointFromX(a.add(this.curve.n),u):a=this.curve.pointFromX(a,u);var h=e.r.invm(n),l=n.sub(f).mul(h).umod(n),x=o.mul(h).umod(n);return this.g.mulAdd(l,a,x)};br.prototype.getKeyRecoveryParam=function(r,e,t,i){if(e=new Bi(e,i),e.recoveryParam!==null)return e.recoveryParam;for(var n=0;n<4;n++){var f;try{f=this.recoverPubKey(r,e,n)}catch(a){continue}if(f.eq(t))return n}throw new Error("Unable to find valid recovery factor")}});var cd=L((Ox,dd)=>{"use strict";var A0=cr(),sd=A0.assert,od=A0.parseBytes,Qt=A0.cachedProperty;function We(r,e){this.eddsa=r,this._secret=od(e.secret),r.isPoint(e.pub)?this._pub=e.pub:this._pubBytes=od(e.pub)}We.fromPublic=function(e,t){return t instanceof We?t:new We(e,{pub:t})};We.fromSecret=function(e,t){return t instanceof We?t:new We(e,{secret:t})};We.prototype.secret=function(){return this._secret};Qt(We,"pubBytes",function(){return this.eddsa.encodePoint(this.pub())});Qt(We,"pub",function(){return this._pubBytes?this.eddsa.decodePoint(this._pubBytes):this.eddsa.g.mul(this.priv())});Qt(We,"privBytes",function(){var e=this.eddsa,t=this.hash(),i=e.encodingLength-1,n=t.slice(0,e.encodingLength);return n[0]&=248,n[i]&=127,n[i]|=64,n});Qt(We,"priv",function(){return this.eddsa.decodeInt(this.privBytes())});Qt(We,"hash",function(){return this.eddsa.hash().update(this.secret()).digest()});Qt(We,"messagePrefix",function(){return this.hash().slice(this.eddsa.encodingLength)});We.prototype.sign=function(e){return sd(this._secret,"KeyPair can only verify"),this.eddsa.sign(e,this)};We.prototype.verify=function(e,t){return this.eddsa.verify(e,t,this)};We.prototype.getSecret=function(e){return sd(this._secret,"KeyPair is public only"),A0.encode(this.secret(),e)};We.prototype.getPublic=function(e){return A0.encode(this.pubBytes(),e)};dd.exports=We});var hd=L((Hx,ud)=>{"use strict";var Tb=gr(),Ri=cr(),Pb=Ri.assert,qi=Ri.cachedProperty,Fb=Ri.parseBytes;function Et(r,e){this.eddsa=r,typeof e!="object"&&(e=Fb(e)),Array.isArray(e)&&(e={R:e.slice(0,r.encodingLength),S:e.slice(r.encodingLength)}),Pb(e.R&&e.S,"Signature without R or S"),r.isPoint(e.R)&&(this._R=e.R),e.S instanceof Tb&&(this._S=e.S),this._Rencoded=Array.isArray(e.R)?e.R:e.Rencoded,this._Sencoded=Array.isArray(e.S)?e.S:e.Sencoded}qi(Et,"S",function(){return this.eddsa.decodeInt(this.Sencoded())});qi(Et,"R",function(){return this.eddsa.decodePoint(this.Rencoded())});qi(Et,"Rencoded",function(){return this.eddsa.encodePoint(this.R())});qi(Et,"Sencoded",function(){return this.eddsa.encodeInt(this.S())});Et.prototype.toBytes=function(){return this.Rencoded().concat(this.Sencoded())};Et.prototype.toHex=function(){return Ri.encode(this.toBytes(),"hex").toUpperCase()};ud.exports=Et});var xd=L((zx,pd)=>{"use strict";var Lb=Si(),Nb=Ei(),e0=cr(),Db=e0.assert,ld=e0.parseBytes,bd=cd(),vd=hd();function sr(r){if(Db(r==="ed25519","only tested with ed25519 so far"),!(this instanceof sr))return new sr(r);r=Nb[r].curve,this.curve=r,this.g=r.g,this.g.precompute(r.n.bitLength()+1),this.pointClass=r.point().constructor,this.encodingLength=Math.ceil(r.n.bitLength()/8),this.hash=Lb.sha512}pd.exports=sr;sr.prototype.sign=function(e,t){e=ld(e);var i=this.keyFromSecret(t),n=this.hashInt(i.messagePrefix(),e),f=this.g.mul(n),a=this.encodePoint(f),o=this.hashInt(a,i.pubBytes(),e).mul(i.priv()),u=n.add(o).umod(this.curve.n);return this.makeSignature({R:f,S:u,Rencoded:a})};sr.prototype.verify=function(e,t,i){e=ld(e),t=this.makeSignature(t);var n=this.keyFromPublic(i),f=this.hashInt(t.Rencoded(),n.pubBytes(),e),a=this.g.mul(t.S()),o=t.R().add(n.pub().mul(f));return o.eq(a)};sr.prototype.hashInt=function(){for(var e=this.hash(),t=0;t<arguments.length;t++)e.update(arguments[t]);return e0.intFromLE(e.digest()).umod(this.curve.n)};sr.prototype.keyFromPublic=function(e){return bd.fromPublic(this,e)};sr.prototype.keyFromSecret=function(e){return bd.fromSecret(this,e)};sr.prototype.makeSignature=function(e){return e instanceof vd?e:new vd(this,e)};sr.prototype.encodePoint=function(e){var t=e.getY().toArray("le",this.encodingLength);return t[this.encodingLength-1]|=e.getX().isOdd()?128:0,t};sr.prototype.decodePoint=function(e){e=e0.parseBytes(e);var t=e.length-1,i=e.slice(0,t).concat(e[t]&~128),n=(e[t]&128)!=0,f=e0.intFromLE(i);return this.curve.pointFromY(f,n)};sr.prototype.encodeInt=function(e){return e.toArray("le",this.encodingLength)};sr.prototype.decodeInt=function(e){return e0.intFromLE(e)};sr.prototype.isPoint=function(e){return e instanceof this.pointClass}});var Ci=L(gd=>{"use strict";var Mt=gd;Mt.version=Ks().version;Mt.utils=cr();Mt.rand=Wf();Mt.curve=Jf();Mt.curves=Ei();Mt.ec=ad();Mt.eddsa=xd()});var X=L((Ii,yd)=>{(function(r,e){typeof Ii=="object"?yd.exports=Ii=e():typeof define=="function"&&define.amd?define([],e):r.CryptoJS=e()})(Ii,function(){var r=r||function(e,t){var i;if(typeof window!="undefined"&&window.crypto&&(i=window.crypto),typeof self!="undefined"&&self.crypto&&(i=self.crypto),typeof globalThis!="undefined"&&globalThis.crypto&&(i=globalThis.crypto),!i&&typeof window!="undefined"&&window.msCrypto&&(i=window.msCrypto),!i&&typeof global!="undefined"&&global.crypto&&(i=global.crypto),!i&&typeof js=="function")try{i=Of()}catch(_){}var n=function(){if(i){if(typeof i.getRandomValues=="function")try{return i.getRandomValues(new Uint32Array(1))[0]}catch(_){}if(typeof i.randomBytes=="function")try{return i.randomBytes(4).readInt32LE()}catch(_){}}throw new Error("Native crypto module could not be used to get secure random number.")},f=Object.create||function(){function _(){}return function(S){var C;return _.prototype=S,C=new _,_.prototype=null,C}}(),a={},o=a.lib={},u=o.Base=function(){return{extend:function(_){var S=f(this);return _&&S.mixIn(_),(!S.hasOwnProperty("init")||this.init===S.init)&&(S.init=function(){S.$super.init.apply(this,arguments)}),S.init.prototype=S,S.$super=this,S},create:function(){var _=this.extend();return _.init.apply(_,arguments),_},init:function(){},mixIn:function(_){for(var S in _)_.hasOwnProperty(S)&&(this[S]=_[S]);_.hasOwnProperty("toString")&&(this.toString=_.toString)},clone:function(){return this.init.prototype.extend(this)}}}(),v=o.WordArray=u.extend({init:function(_,S){_=this.words=_||[],S!=t?this.sigBytes=S:this.sigBytes=_.length*4},toString:function(_){return(_||l).stringify(this)},concat:function(_){var S=this.words,C=_.words,I=this.sigBytes,P=_.sigBytes;if(this.clamp(),I%4)for(var k=0;k<P;k++){var D=C[k>>>2]>>>24-k%4*8&255;S[I+k>>>2]|=D<<24-(I+k)%4*8}else for(var N=0;N<P;N+=4)S[I+N>>>2]=C[N>>>2];return this.sigBytes+=P,this},clamp:function(){var _=this.words,S=this.sigBytes;_[S>>>2]&=4294967295<<32-S%4*8,_.length=e.ceil(S/4)},clone:function(){var _=u.clone.call(this);return _.words=this.words.slice(0),_},random:function(_){for(var S=[],C=0;C<_;C+=4)S.push(n());return new v.init(S,_)}}),h=a.enc={},l=h.Hex={stringify:function(_){for(var S=_.words,C=_.sigBytes,I=[],P=0;P<C;P++){var k=S[P>>>2]>>>24-P%4*8&255;I.push((k>>>4).toString(16)),I.push((k&15).toString(16))}return I.join("")},parse:function(_){for(var S=_.length,C=[],I=0;I<S;I+=2)C[I>>>3]|=parseInt(_.substr(I,2),16)<<24-I%8*4;return new v.init(C,S/2)}},x=h.Latin1={stringify:function(_){for(var S=_.words,C=_.sigBytes,I=[],P=0;P<C;P++){var k=S[P>>>2]>>>24-P%4*8&255;I.push(String.fromCharCode(k))}return I.join("")},parse:function(_){for(var S=_.length,C=[],I=0;I<S;I++)C[I>>>2]|=(_.charCodeAt(I)&255)<<24-I%4*8;return new v.init(C,S)}},y=h.Utf8={stringify:function(_){try{return decodeURIComponent(escape(x.stringify(_)))}catch(S){throw new Error("Malformed UTF-8 data")}},parse:function(_){return x.parse(unescape(encodeURIComponent(_)))}},E=o.BufferedBlockAlgorithm=u.extend({reset:function(){this._data=new v.init,this._nDataBytes=0},_append:function(_){typeof _=="string"&&(_=y.parse(_)),this._data.concat(_),this._nDataBytes+=_.sigBytes},_process:function(_){var S,C=this._data,I=C.words,P=C.sigBytes,k=this.blockSize,D=k*4,N=P/D;_?N=e.ceil(N):N=e.max((N|0)-this._minBufferSize,0);var H=N*k,M=e.min(H*4,P);if(H){for(var s=0;s<H;s+=k)this._doProcessBlock(I,s);S=I.splice(0,H),C.sigBytes-=M}return new v.init(S,M)},clone:function(){var _=u.clone.call(this);return _._data=this._data.clone(),_},_minBufferSize:0}),R=o.Hasher=E.extend({cfg:u.extend(),init:function(_){this.cfg=this.cfg.extend(_),this.reset()},reset:function(){E.reset.call(this),this._doReset()},update:function(_){return this._append(_),this._process(),this},finalize:function(_){_&&this._append(_);var S=this._doFinalize();return S},blockSize:512/32,_createHelper:function(_){return function(S,C){return new _.init(C).finalize(S)}},_createHmacHelper:function(_){return function(S,C){return new A.HMAC.init(_,C).finalize(S)}}}),A=a.algo={};return a}(Math);return r})});var B0=L((ki,_d)=>{(function(r,e){typeof ki=="object"?_d.exports=ki=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(ki,function(r){return function(e){var t=r,i=t.lib,n=i.Base,f=i.WordArray,a=t.x64={},o=a.Word=n.extend({init:function(v,h){this.high=v,this.low=h}}),u=a.WordArray=n.extend({init:function(v,h){v=this.words=v||[],h!=e?this.sigBytes=h:this.sigBytes=v.length*8},toX32:function(){for(var v=this.words,h=v.length,l=[],x=0;x<h;x++){var y=v[x];l.push(y.high),l.push(y.low)}return f.create(l,this.sigBytes)},clone:function(){for(var v=n.clone.call(this),h=v.words=this.words.slice(0),l=h.length,x=0;x<l;x++)h[x]=h[x].clone();return v}})}(),r})});var wd=L((Ti,md)=>{(function(r,e){typeof Ti=="object"?md.exports=Ti=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Ti,function(r){return function(){if(typeof ArrayBuffer=="function"){var e=r,t=e.lib,i=t.WordArray,n=i.init,f=i.init=function(a){if(a instanceof ArrayBuffer&&(a=new Uint8Array(a)),(a instanceof Int8Array||typeof Uint8ClampedArray!="undefined"&&a instanceof Uint8ClampedArray||a instanceof Int16Array||a instanceof Uint16Array||a instanceof Int32Array||a instanceof Uint32Array||a instanceof Float32Array||a instanceof Float64Array)&&(a=new Uint8Array(a.buffer,a.byteOffset,a.byteLength)),a instanceof Uint8Array){for(var o=a.byteLength,u=[],v=0;v<o;v++)u[v>>>2]|=a[v]<<24-v%4*8;n.call(this,u,o)}else n.apply(this,arguments)};f.prototype=i}}(),r.lib.WordArray})});var Ed=L((Pi,Sd)=>{(function(r,e){typeof Pi=="object"?Sd.exports=Pi=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Pi,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=e.enc,f=n.Utf16=n.Utf16BE={stringify:function(o){for(var u=o.words,v=o.sigBytes,h=[],l=0;l<v;l+=2){var x=u[l>>>2]>>>16-l%4*8&65535;h.push(String.fromCharCode(x))}return h.join("")},parse:function(o){for(var u=o.length,v=[],h=0;h<u;h++)v[h>>>1]|=o.charCodeAt(h)<<16-h%2*16;return i.create(v,u*2)}};n.Utf16LE={stringify:function(o){for(var u=o.words,v=o.sigBytes,h=[],l=0;l<v;l+=2){var x=a(u[l>>>2]>>>16-l%4*8&65535);h.push(String.fromCharCode(x))}return h.join("")},parse:function(o){for(var u=o.length,v=[],h=0;h<u;h++)v[h>>>1]|=a(o.charCodeAt(h)<<16-h%2*16);return i.create(v,u*2)}};function a(o){return o<<8&4278255360|o>>>8&16711935}}(),r.enc.Utf16})});var At=L((Fi,Md)=>{(function(r,e){typeof Fi=="object"?Md.exports=Fi=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Fi,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=e.enc,f=n.Base64={stringify:function(o){var u=o.words,v=o.sigBytes,h=this._map;o.clamp();for(var l=[],x=0;x<v;x+=3)for(var y=u[x>>>2]>>>24-x%4*8&255,E=u[x+1>>>2]>>>24-(x+1)%4*8&255,R=u[x+2>>>2]>>>24-(x+2)%4*8&255,A=y<<16|E<<8|R,_=0;_<4&&x+_*.75<v;_++)l.push(h.charAt(A>>>6*(3-_)&63));var S=h.charAt(64);if(S)for(;l.length%4;)l.push(S);return l.join("")},parse:function(o){var u=o.length,v=this._map,h=this._reverseMap;if(!h){h=this._reverseMap=[];for(var l=0;l<v.length;l++)h[v.charCodeAt(l)]=l}var x=v.charAt(64);if(x){var y=o.indexOf(x);y!==-1&&(u=y)}return a(o,u,h)},_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="};function a(o,u,v){for(var h=[],l=0,x=0;x<u;x++)if(x%4){var y=v[o.charCodeAt(x-1)]<<x%4*2,E=v[o.charCodeAt(x)]>>>6-x%4*2,R=y|E;h[l>>>2]|=R<<24-l%4*8,l++}return i.create(h,l)}}(),r.enc.Base64})});var Bd=L((Li,Ad)=>{(function(r,e){typeof Li=="object"?Ad.exports=Li=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Li,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=e.enc,f=n.Base64url={stringify:function(o,u=!0){var v=o.words,h=o.sigBytes,l=u?this._safe_map:this._map;o.clamp();for(var x=[],y=0;y<h;y+=3)for(var E=v[y>>>2]>>>24-y%4*8&255,R=v[y+1>>>2]>>>24-(y+1)%4*8&255,A=v[y+2>>>2]>>>24-(y+2)%4*8&255,_=E<<16|R<<8|A,S=0;S<4&&y+S*.75<h;S++)x.push(l.charAt(_>>>6*(3-S)&63));var C=l.charAt(64);if(C)for(;x.length%4;)x.push(C);return x.join("")},parse:function(o,u=!0){var v=o.length,h=u?this._safe_map:this._map,l=this._reverseMap;if(!l){l=this._reverseMap=[];for(var x=0;x<h.length;x++)l[h.charCodeAt(x)]=x}var y=h.charAt(64);if(y){var E=o.indexOf(y);E!==-1&&(v=E)}return a(o,v,l)},_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",_safe_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"};function a(o,u,v){for(var h=[],l=0,x=0;x<u;x++)if(x%4){var y=v[o.charCodeAt(x-1)]<<x%4*2,E=v[o.charCodeAt(x)]>>>6-x%4*2,R=y|E;h[l>>>2]|=R<<24-l%4*8,l++}return i.create(h,l)}}(),r.enc.Base64url})});var Bt=L((Ni,Rd)=>{(function(r,e){typeof Ni=="object"?Rd.exports=Ni=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Ni,function(r){return function(e){var t=r,i=t.lib,n=i.WordArray,f=i.Hasher,a=t.algo,o=[];(function(){for(var y=0;y<64;y++)o[y]=e.abs(e.sin(y+1))*4294967296|0})();var u=a.MD5=f.extend({_doReset:function(){this._hash=new n.init([1732584193,4023233417,2562383102,271733878])},_doProcessBlock:function(y,E){for(var R=0;R<16;R++){var A=E+R,_=y[A];y[A]=(_<<8|_>>>24)&16711935|(_<<24|_>>>8)&4278255360}var S=this._hash.words,C=y[E+0],I=y[E+1],P=y[E+2],k=y[E+3],D=y[E+4],N=y[E+5],H=y[E+6],M=y[E+7],s=y[E+8],c=y[E+9],b=y[E+10],p=y[E+11],m=y[E+12],B=y[E+13],q=y[E+14],w=y[E+15],d=S[0],g=S[1],F=S[2],T=S[3];d=v(d,g,F,T,C,7,o[0]),T=v(T,d,g,F,I,12,o[1]),F=v(F,T,d,g,P,17,o[2]),g=v(g,F,T,d,k,22,o[3]),d=v(d,g,F,T,D,7,o[4]),T=v(T,d,g,F,N,12,o[5]),F=v(F,T,d,g,H,17,o[6]),g=v(g,F,T,d,M,22,o[7]),d=v(d,g,F,T,s,7,o[8]),T=v(T,d,g,F,c,12,o[9]),F=v(F,T,d,g,b,17,o[10]),g=v(g,F,T,d,p,22,o[11]),d=v(d,g,F,T,m,7,o[12]),T=v(T,d,g,F,B,12,o[13]),F=v(F,T,d,g,q,17,o[14]),g=v(g,F,T,d,w,22,o[15]),d=h(d,g,F,T,I,5,o[16]),T=h(T,d,g,F,H,9,o[17]),F=h(F,T,d,g,p,14,o[18]),g=h(g,F,T,d,C,20,o[19]),d=h(d,g,F,T,N,5,o[20]),T=h(T,d,g,F,b,9,o[21]),F=h(F,T,d,g,w,14,o[22]),g=h(g,F,T,d,D,20,o[23]),d=h(d,g,F,T,c,5,o[24]),T=h(T,d,g,F,q,9,o[25]),F=h(F,T,d,g,k,14,o[26]),g=h(g,F,T,d,s,20,o[27]),d=h(d,g,F,T,B,5,o[28]),T=h(T,d,g,F,P,9,o[29]),F=h(F,T,d,g,M,14,o[30]),g=h(g,F,T,d,m,20,o[31]),d=l(d,g,F,T,N,4,o[32]),T=l(T,d,g,F,s,11,o[33]),F=l(F,T,d,g,p,16,o[34]),g=l(g,F,T,d,q,23,o[35]),d=l(d,g,F,T,I,4,o[36]),T=l(T,d,g,F,D,11,o[37]),F=l(F,T,d,g,M,16,o[38]),g=l(g,F,T,d,b,23,o[39]),d=l(d,g,F,T,B,4,o[40]),T=l(T,d,g,F,C,11,o[41]),F=l(F,T,d,g,k,16,o[42]),g=l(g,F,T,d,H,23,o[43]),d=l(d,g,F,T,c,4,o[44]),T=l(T,d,g,F,m,11,o[45]),F=l(F,T,d,g,w,16,o[46]),g=l(g,F,T,d,P,23,o[47]),d=x(d,g,F,T,C,6,o[48]),T=x(T,d,g,F,M,10,o[49]),F=x(F,T,d,g,q,15,o[50]),g=x(g,F,T,d,N,21,o[51]),d=x(d,g,F,T,m,6,o[52]),T=x(T,d,g,F,k,10,o[53]),F=x(F,T,d,g,b,15,o[54]),g=x(g,F,T,d,I,21,o[55]),d=x(d,g,F,T,s,6,o[56]),T=x(T,d,g,F,w,10,o[57]),F=x(F,T,d,g,H,15,o[58]),g=x(g,F,T,d,B,21,o[59]),d=x(d,g,F,T,D,6,o[60]),T=x(T,d,g,F,p,10,o[61]),F=x(F,T,d,g,P,15,o[62]),g=x(g,F,T,d,c,21,o[63]),S[0]=S[0]+d|0,S[1]=S[1]+g|0,S[2]=S[2]+F|0,S[3]=S[3]+T|0},_doFinalize:function(){var y=this._data,E=y.words,R=this._nDataBytes*8,A=y.sigBytes*8;E[A>>>5]|=128<<24-A%32;var _=e.floor(R/4294967296),S=R;E[(A+64>>>9<<4)+15]=(_<<8|_>>>24)&16711935|(_<<24|_>>>8)&4278255360,E[(A+64>>>9<<4)+14]=(S<<8|S>>>24)&16711935|(S<<24|S>>>8)&4278255360,y.sigBytes=(E.length+1)*4,this._process();for(var C=this._hash,I=C.words,P=0;P<4;P++){var k=I[P];I[P]=(k<<8|k>>>24)&16711935|(k<<24|k>>>8)&4278255360}return C},clone:function(){var y=f.clone.call(this);return y._hash=this._hash.clone(),y}});function v(y,E,R,A,_,S,C){var I=y+(E&R|~E&A)+_+C;return(I<<S|I>>>32-S)+E}function h(y,E,R,A,_,S,C){var I=y+(E&A|R&~A)+_+C;return(I<<S|I>>>32-S)+E}function l(y,E,R,A,_,S,C){var I=y+(E^R^A)+_+C;return(I<<S|I>>>32-S)+E}function x(y,E,R,A,_,S,C){var I=y+(R^(E|~A))+_+C;return(I<<S|I>>>32-S)+E}t.MD5=f._createHelper(u),t.HmacMD5=f._createHmacHelper(u)}(Math),r.MD5})});var Oi=L((Di,qd)=>{(function(r,e){typeof Di=="object"?qd.exports=Di=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Di,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=t.Hasher,f=e.algo,a=[],o=f.SHA1=n.extend({_doReset:function(){this._hash=new i.init([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(u,v){for(var h=this._hash.words,l=h[0],x=h[1],y=h[2],E=h[3],R=h[4],A=0;A<80;A++){if(A<16)a[A]=u[v+A]|0;else{var _=a[A-3]^a[A-8]^a[A-14]^a[A-16];a[A]=_<<1|_>>>31}var S=(l<<5|l>>>27)+R+a[A];A<20?S+=(x&y|~x&E)+1518500249:A<40?S+=(x^y^E)+1859775393:A<60?S+=(x&y|x&E|y&E)-1894007588:S+=(x^y^E)-899497514,R=E,E=y,y=x<<30|x>>>2,x=l,l=S}h[0]=h[0]+l|0,h[1]=h[1]+x|0,h[2]=h[2]+y|0,h[3]=h[3]+E|0,h[4]=h[4]+R|0},_doFinalize:function(){var u=this._data,v=u.words,h=this._nDataBytes*8,l=u.sigBytes*8;return v[l>>>5]|=128<<24-l%32,v[(l+64>>>9<<4)+14]=Math.floor(h/4294967296),v[(l+64>>>9<<4)+15]=h,u.sigBytes=v.length*4,this._process(),this._hash},clone:function(){var u=n.clone.call(this);return u._hash=this._hash.clone(),u}});e.SHA1=n._createHelper(o),e.HmacSHA1=n._createHmacHelper(o)}(),r.SHA1})});var ca=L((Hi,Cd)=>{(function(r,e){typeof Hi=="object"?Cd.exports=Hi=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Hi,function(r){return function(e){var t=r,i=t.lib,n=i.WordArray,f=i.Hasher,a=t.algo,o=[],u=[];(function(){function l(R){for(var A=e.sqrt(R),_=2;_<=A;_++)if(!(R%_))return!1;return!0}function x(R){return(R-(R|0))*4294967296|0}for(var y=2,E=0;E<64;)l(y)&&(E<8&&(o[E]=x(e.pow(y,1/2))),u[E]=x(e.pow(y,1/3)),E++),y++})();var v=[],h=a.SHA256=f.extend({_doReset:function(){this._hash=new n.init(o.slice(0))},_doProcessBlock:function(l,x){for(var y=this._hash.words,E=y[0],R=y[1],A=y[2],_=y[3],S=y[4],C=y[5],I=y[6],P=y[7],k=0;k<64;k++){if(k<16)v[k]=l[x+k]|0;else{var D=v[k-15],N=(D<<25|D>>>7)^(D<<14|D>>>18)^D>>>3,H=v[k-2],M=(H<<15|H>>>17)^(H<<13|H>>>19)^H>>>10;v[k]=N+v[k-7]+M+v[k-16]}var s=S&C^~S&I,c=E&R^E&A^R&A,b=(E<<30|E>>>2)^(E<<19|E>>>13)^(E<<10|E>>>22),p=(S<<26|S>>>6)^(S<<21|S>>>11)^(S<<7|S>>>25),m=P+p+s+u[k]+v[k],B=b+c;P=I,I=C,C=S,S=_+m|0,_=A,A=R,R=E,E=m+B|0}y[0]=y[0]+E|0,y[1]=y[1]+R|0,y[2]=y[2]+A|0,y[3]=y[3]+_|0,y[4]=y[4]+S|0,y[5]=y[5]+C|0,y[6]=y[6]+I|0,y[7]=y[7]+P|0},_doFinalize:function(){var l=this._data,x=l.words,y=this._nDataBytes*8,E=l.sigBytes*8;return x[E>>>5]|=128<<24-E%32,x[(E+64>>>9<<4)+14]=e.floor(y/4294967296),x[(E+64>>>9<<4)+15]=y,l.sigBytes=x.length*4,this._process(),this._hash},clone:function(){var l=f.clone.call(this);return l._hash=this._hash.clone(),l}});t.SHA256=f._createHelper(h),t.HmacSHA256=f._createHmacHelper(h)}(Math),r.SHA256})});var kd=L((zi,Id)=>{(function(r,e,t){typeof zi=="object"?Id.exports=zi=e(X(),ca()):typeof define=="function"&&define.amd?define(["./core","./sha256"],e):e(r.CryptoJS)})(zi,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=e.algo,f=n.SHA256,a=n.SHA224=f.extend({_doReset:function(){this._hash=new i.init([3238371032,914150663,812702999,4144912697,4290775857,1750603025,1694076839,3204075428])},_doFinalize:function(){var o=f._doFinalize.call(this);return o.sigBytes-=4,o}});e.SHA224=f._createHelper(a),e.HmacSHA224=f._createHmacHelper(a)}(),r.SHA224})});var ua=L((Ui,Td)=>{(function(r,e,t){typeof Ui=="object"?Td.exports=Ui=e(X(),B0()):typeof define=="function"&&define.amd?define(["./core","./x64-core"],e):e(r.CryptoJS)})(Ui,function(r){return function(){var e=r,t=e.lib,i=t.Hasher,n=e.x64,f=n.Word,a=n.WordArray,o=e.algo;function u(){return f.create.apply(f,arguments)}var v=[u(1116352408,3609767458),u(1899447441,602891725),u(3049323471,3964484399),u(3921009573,2173295548),u(961987163,4081628472),u(1508970993,3053834265),u(2453635748,2937671579),u(2870763221,3664609560),u(3624381080,2734883394),u(310598401,1164996542),u(607225278,1323610764),u(1426881987,3590304994),u(1925078388,4068182383),u(2162078206,991336113),u(2614888103,633803317),u(3248222580,3479774868),u(3835390401,2666613458),u(4022224774,944711139),u(264347078,2341262773),u(604807628,2007800933),u(770255983,1495990901),u(1249150122,1856431235),u(1555081692,3175218132),u(1996064986,2198950837),u(2554220882,3999719339),u(2821834349,766784016),u(2952996808,2566594879),u(3210313671,3203337956),u(3336571891,1034457026),u(3584528711,2466948901),u(113926993,3758326383),u(338241895,168717936),u(666307205,1188179964),u(773529912,1546045734),u(1294757372,1522805485),u(1396182291,2643833823),u(1695183700,2343527390),u(1986661051,1014477480),u(2177026350,1206759142),u(2456956037,344077627),u(2730485921,1290863460),u(2820302411,3158454273),u(3259730800,3505952657),u(3345764771,106217008),u(3516065817,3606008344),u(3600352804,1432725776),u(4094571909,1467031594),u(275423344,851169720),u(430227734,3100823752),u(506948616,1363258195),u(659060556,3750685593),u(883997877,3785050280),u(958139571,3318307427),u(1322822218,3812723403),u(1537002063,2003034995),u(1747873779,3602036899),u(1955562222,1575990012),u(2024104815,1125592928),u(2227730452,2716904306),u(2361852424,442776044),u(2428436474,593698344),u(2756734187,3733110249),u(3204031479,2999351573),u(3329325298,3815920427),u(3391569614,3928383900),u(3515267271,566280711),u(3940187606,3454069534),u(4118630271,4000239992),u(116418474,1914138554),u(174292421,2731055270),u(289380356,3203993006),u(460393269,320620315),u(685471733,587496836),u(852142971,1086792851),u(1017036298,365543100),u(1126000580,2618297676),u(1288033470,3409855158),u(1501505948,4234509866),u(1607167915,987167468),u(1816402316,1246189591)],h=[];(function(){for(var x=0;x<80;x++)h[x]=u()})();var l=o.SHA512=i.extend({_doReset:function(){this._hash=new a.init([new f.init(1779033703,4089235720),new f.init(3144134277,2227873595),new f.init(1013904242,4271175723),new f.init(2773480762,1595750129),new f.init(1359893119,2917565137),new f.init(2600822924,725511199),new f.init(528734635,4215389547),new f.init(1541459225,327033209)])},_doProcessBlock:function(x,y){for(var E=this._hash.words,R=E[0],A=E[1],_=E[2],S=E[3],C=E[4],I=E[5],P=E[6],k=E[7],D=R.high,N=R.low,H=A.high,M=A.low,s=_.high,c=_.low,b=S.high,p=S.low,m=C.high,B=C.low,q=I.high,w=I.low,d=P.high,g=P.low,F=k.high,T=k.low,z=D,W=N,j=H,U=M,pe=s,J=c,ee=b,Zr=p,$=m,G=B,gt=q,de=w,le=d,Yr=g,ve=F,ce=T,fr=0;fr<80;fr++){var Z,re,yt=h[fr];if(fr<16)re=yt.high=x[y+fr*2]|0,Z=yt.low=x[y+fr*2+1]|0;else{var xe=h[fr-15],ae=xe.high,$r=xe.low,Me=(ae>>>1|$r<<31)^(ae>>>8|$r<<24)^ae>>>7,ge=($r>>>1|ae<<31)^($r>>>8|ae<<24)^($r>>>7|ae<<25),x0=h[fr-2],se=x0.high,ue=x0.low,di=(se>>>19|ue<<13)^(se<<3|ue>>>29)^se>>>6,ye=(ue>>>19|se<<13)^(ue<<3|se>>>29)^(ue>>>6|se<<26),_e=h[fr-7],ci=_e.high,Ae=_e.low,me=h[fr-16],ui=me.high,we=me.low;Z=ge+Ae,re=Me+ci+(Z>>>0<ge>>>0?1:0),Z=Z+ye,re=re+di+(Z>>>0<ye>>>0?1:0),Z=Z+we,re=re+ui+(Z>>>0<we>>>0?1:0),yt.high=re,yt.low=Z}var Be=$&gt^~$&le,g0=G&de^~G&Yr,Re=z&j^z&pe^j&pe,qe=W&U^W&J^U&J,hi=(z>>>28|W<<4)^(z<<30|W>>>2)^(z<<25|W>>>7),Se=(W>>>28|z<<4)^(W<<30|z>>>2)^(W<<25|z>>>7),Ce=($>>>14|G<<18)^($>>>18|G<<14)^($<<23|G>>>9),li=(G>>>14|$<<18)^(G>>>18|$<<14)^(G<<23|$>>>9),Ee=v[fr],Ie=Ee.high,y0=Ee.low,V=ce+li,te=ve+Ce+(V>>>0<ce>>>0?1:0),V=V+g0,te=te+Be+(V>>>0<g0>>>0?1:0),V=V+y0,te=te+Ie+(V>>>0<y0>>>0?1:0),V=V+Z,te=te+re+(V>>>0<Z>>>0?1:0),_0=Se+qe,ke=hi+Re+(_0>>>0<Se>>>0?1:0);ve=le,ce=Yr,le=gt,Yr=de,gt=$,de=G,G=Zr+V|0,$=ee+te+(G>>>0<Zr>>>0?1:0)|0,ee=pe,Zr=J,pe=j,J=U,j=z,U=W,W=V+_0|0,z=te+ke+(W>>>0<V>>>0?1:0)|0}N=R.low=N+W,R.high=D+z+(N>>>0<W>>>0?1:0),M=A.low=M+U,A.high=H+j+(M>>>0<U>>>0?1:0),c=_.low=c+J,_.high=s+pe+(c>>>0<J>>>0?1:0),p=S.low=p+Zr,S.high=b+ee+(p>>>0<Zr>>>0?1:0),B=C.low=B+G,C.high=m+$+(B>>>0<G>>>0?1:0),w=I.low=w+de,I.high=q+gt+(w>>>0<de>>>0?1:0),g=P.low=g+Yr,P.high=d+le+(g>>>0<Yr>>>0?1:0),T=k.low=T+ce,k.high=F+ve+(T>>>0<ce>>>0?1:0)},_doFinalize:function(){var x=this._data,y=x.words,E=this._nDataBytes*8,R=x.sigBytes*8;y[R>>>5]|=128<<24-R%32,y[(R+128>>>10<<5)+30]=Math.floor(E/4294967296),y[(R+128>>>10<<5)+31]=E,x.sigBytes=y.length*4,this._process();var A=this._hash.toX32();return A},clone:function(){var x=i.clone.call(this);return x._hash=this._hash.clone(),x},blockSize:1024/32});e.SHA512=i._createHelper(l),e.HmacSHA512=i._createHmacHelper(l)}(),r.SHA512})});var Fd=L((Wi,Pd)=>{(function(r,e,t){typeof Wi=="object"?Pd.exports=Wi=e(X(),B0(),ua()):typeof define=="function"&&define.amd?define(["./core","./x64-core","./sha512"],e):e(r.CryptoJS)})(Wi,function(r){return function(){var e=r,t=e.x64,i=t.Word,n=t.WordArray,f=e.algo,a=f.SHA512,o=f.SHA384=a.extend({_doReset:function(){this._hash=new n.init([new i.init(3418070365,3238371032),new i.init(1654270250,914150663),new i.init(2438529370,812702999),new i.init(355462360,4144912697),new i.init(1731405415,4290775857),new i.init(2394180231,1750603025),new i.init(3675008525,1694076839),new i.init(1203062813,3204075428)])},_doFinalize:function(){var u=a._doFinalize.call(this);return u.sigBytes-=16,u}});e.SHA384=a._createHelper(o),e.HmacSHA384=a._createHmacHelper(o)}(),r.SHA384})});var Nd=L((ji,Ld)=>{(function(r,e,t){typeof ji=="object"?Ld.exports=ji=e(X(),B0()):typeof define=="function"&&define.amd?define(["./core","./x64-core"],e):e(r.CryptoJS)})(ji,function(r){return function(e){var t=r,i=t.lib,n=i.WordArray,f=i.Hasher,a=t.x64,o=a.Word,u=t.algo,v=[],h=[],l=[];(function(){for(var E=1,R=0,A=0;A<24;A++){v[E+5*R]=(A+1)*(A+2)/2%64;var _=R%5,S=(2*E+3*R)%5;E=_,R=S}for(var E=0;E<5;E++)for(var R=0;R<5;R++)h[E+5*R]=R+(2*E+3*R)%5*5;for(var C=1,I=0;I<24;I++){for(var P=0,k=0,D=0;D<7;D++){if(C&1){var N=(1<<D)-1;N<32?k^=1<<N:P^=1<<N-32}C&128?C=C<<1^113:C<<=1}l[I]=o.create(P,k)}})();var x=[];(function(){for(var E=0;E<25;E++)x[E]=o.create()})();var y=u.SHA3=f.extend({cfg:f.cfg.extend({outputLength:512}),_doReset:function(){for(var E=this._state=[],R=0;R<25;R++)E[R]=new o.init;this.blockSize=(1600-2*this.cfg.outputLength)/32},_doProcessBlock:function(E,R){for(var A=this._state,_=this.blockSize/2,S=0;S<_;S++){var C=E[R+2*S],I=E[R+2*S+1];C=(C<<8|C>>>24)&16711935|(C<<24|C>>>8)&4278255360,I=(I<<8|I>>>24)&16711935|(I<<24|I>>>8)&4278255360;var P=A[S];P.high^=I,P.low^=C}for(var k=0;k<24;k++){for(var D=0;D<5;D++){for(var N=0,H=0,M=0;M<5;M++){var P=A[D+5*M];N^=P.high,H^=P.low}var s=x[D];s.high=N,s.low=H}for(var D=0;D<5;D++)for(var c=x[(D+4)%5],b=x[(D+1)%5],p=b.high,m=b.low,N=c.high^(p<<1|m>>>31),H=c.low^(m<<1|p>>>31),M=0;M<5;M++){var P=A[D+5*M];P.high^=N,P.low^=H}for(var B=1;B<25;B++){var N,H,P=A[B],q=P.high,w=P.low,d=v[B];d<32?(N=q<<d|w>>>32-d,H=w<<d|q>>>32-d):(N=w<<d-32|q>>>64-d,H=q<<d-32|w>>>64-d);var g=x[h[B]];g.high=N,g.low=H}var F=x[0],T=A[0];F.high=T.high,F.low=T.low;for(var D=0;D<5;D++)for(var M=0;M<5;M++){var B=D+5*M,P=A[B],z=x[B],W=x[(D+1)%5+5*M],j=x[(D+2)%5+5*M];P.high=z.high^~W.high&j.high,P.low=z.low^~W.low&j.low}var P=A[0],U=l[k];P.high^=U.high,P.low^=U.low}},_doFinalize:function(){var E=this._data,R=E.words,A=this._nDataBytes*8,_=E.sigBytes*8,S=this.blockSize*32;R[_>>>5]|=1<<24-_%32,R[(e.ceil((_+1)/S)*S>>>5)-1]|=128,E.sigBytes=R.length*4,this._process();for(var C=this._state,I=this.cfg.outputLength/8,P=I/8,k=[],D=0;D<P;D++){var N=C[D],H=N.high,M=N.low;H=(H<<8|H>>>24)&16711935|(H<<24|H>>>8)&4278255360,M=(M<<8|M>>>24)&16711935|(M<<24|M>>>8)&4278255360,k.push(M),k.push(H)}return new n.init(k,I)},clone:function(){for(var E=f.clone.call(this),R=E._state=this._state.slice(0),A=0;A<25;A++)R[A]=R[A].clone();return E}});t.SHA3=f._createHelper(y),t.HmacSHA3=f._createHmacHelper(y)}(Math),r.SHA3})});var Od=L((Ki,Dd)=>{(function(r,e){typeof Ki=="object"?Dd.exports=Ki=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Ki,function(r){return function(e){var t=r,i=t.lib,n=i.WordArray,f=i.Hasher,a=t.algo,o=n.create([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13]),u=n.create([5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11]),v=n.create([11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6]),h=n.create([8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11]),l=n.create([0,1518500249,1859775393,2400959708,2840853838]),x=n.create([1352829926,1548603684,1836072691,2053994217,0]),y=a.RIPEMD160=f.extend({_doReset:function(){this._hash=n.create([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(I,P){for(var k=0;k<16;k++){var D=P+k,N=I[D];I[D]=(N<<8|N>>>24)&16711935|(N<<24|N>>>8)&4278255360}var H=this._hash.words,M=l.words,s=x.words,c=o.words,b=u.words,p=v.words,m=h.words,B,q,w,d,g,F,T,z,W,j;F=B=H[0],T=q=H[1],z=w=H[2],W=d=H[3],j=g=H[4];for(var U,k=0;k<80;k+=1)U=B+I[P+c[k]]|0,k<16?U+=E(q,w,d)+M[0]:k<32?U+=R(q,w,d)+M[1]:k<48?U+=A(q,w,d)+M[2]:k<64?U+=_(q,w,d)+M[3]:U+=S(q,w,d)+M[4],U=U|0,U=C(U,p[k]),U=U+g|0,B=g,g=d,d=C(w,10),w=q,q=U,U=F+I[P+b[k]]|0,k<16?U+=S(T,z,W)+s[0]:k<32?U+=_(T,z,W)+s[1]:k<48?U+=A(T,z,W)+s[2]:k<64?U+=R(T,z,W)+s[3]:U+=E(T,z,W)+s[4],U=U|0,U=C(U,m[k]),U=U+j|0,F=j,j=W,W=C(z,10),z=T,T=U;U=H[1]+w+W|0,H[1]=H[2]+d+j|0,H[2]=H[3]+g+F|0,H[3]=H[4]+B+T|0,H[4]=H[0]+q+z|0,H[0]=U},_doFinalize:function(){var I=this._data,P=I.words,k=this._nDataBytes*8,D=I.sigBytes*8;P[D>>>5]|=128<<24-D%32,P[(D+64>>>9<<4)+14]=(k<<8|k>>>24)&16711935|(k<<24|k>>>8)&4278255360,I.sigBytes=(P.length+1)*4,this._process();for(var N=this._hash,H=N.words,M=0;M<5;M++){var s=H[M];H[M]=(s<<8|s>>>24)&16711935|(s<<24|s>>>8)&4278255360}return N},clone:function(){var I=f.clone.call(this);return I._hash=this._hash.clone(),I}});function E(I,P,k){return I^P^k}function R(I,P,k){return I&P|~I&k}function A(I,P,k){return(I|~P)^k}function _(I,P,k){return I&k|P&~k}function S(I,P,k){return I^(P|~k)}function C(I,P){return I<<P|I>>>32-P}t.RIPEMD160=f._createHelper(y),t.HmacRIPEMD160=f._createHmacHelper(y)}(Math),r.RIPEMD160})});var Xi=L((Ji,Hd)=>{(function(r,e){typeof Ji=="object"?Hd.exports=Ji=e(X()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(Ji,function(r){(function(){var e=r,t=e.lib,i=t.Base,n=e.enc,f=n.Utf8,a=e.algo,o=a.HMAC=i.extend({init:function(u,v){u=this._hasher=new u.init,typeof v=="string"&&(v=f.parse(v));var h=u.blockSize,l=h*4;v.sigBytes>l&&(v=u.finalize(v)),v.clamp();for(var x=this._oKey=v.clone(),y=this._iKey=v.clone(),E=x.words,R=y.words,A=0;A<h;A++)E[A]^=1549556828,R[A]^=909522486;x.sigBytes=y.sigBytes=l,this.reset()},reset:function(){var u=this._hasher;u.reset(),u.update(this._iKey)},update:function(u){return this._hasher.update(u),this},finalize:function(u){var v=this._hasher,h=v.finalize(u);v.reset();var l=v.finalize(this._oKey.clone().concat(h));return l}})})()})});var Ud=L((Gi,zd)=>{(function(r,e,t){typeof Gi=="object"?zd.exports=Gi=e(X(),Oi(),Xi()):typeof define=="function"&&define.amd?define(["./core","./sha1","./hmac"],e):e(r.CryptoJS)})(Gi,function(r){return function(){var e=r,t=e.lib,i=t.Base,n=t.WordArray,f=e.algo,a=f.SHA1,o=f.HMAC,u=f.PBKDF2=i.extend({cfg:i.extend({keySize:128/32,hasher:a,iterations:1}),init:function(v){this.cfg=this.cfg.extend(v)},compute:function(v,h){for(var l=this.cfg,x=o.create(l.hasher,v),y=n.create(),E=n.create([1]),R=y.words,A=E.words,_=l.keySize,S=l.iterations;R.length<_;){var C=x.update(h).finalize(E);x.reset();for(var I=C.words,P=I.length,k=C,D=1;D<S;D++){k=x.finalize(k),x.reset();for(var N=k.words,H=0;H<P;H++)I[H]^=N[H]}y.concat(C),A[0]++}return y.sigBytes=_*4,y}});e.PBKDF2=function(v,h,l){return u.create(l).compute(v,h)}}(),r.PBKDF2})});var at=L((Vi,Wd)=>{(function(r,e,t){typeof Vi=="object"?Wd.exports=Vi=e(X(),Oi(),Xi()):typeof define=="function"&&define.amd?define(["./core","./sha1","./hmac"],e):e(r.CryptoJS)})(Vi,function(r){return function(){var e=r,t=e.lib,i=t.Base,n=t.WordArray,f=e.algo,a=f.MD5,o=f.EvpKDF=i.extend({cfg:i.extend({keySize:128/32,hasher:a,iterations:1}),init:function(u){this.cfg=this.cfg.extend(u)},compute:function(u,v){for(var h,l=this.cfg,x=l.hasher.create(),y=n.create(),E=y.words,R=l.keySize,A=l.iterations;E.length<R;){h&&x.update(h),h=x.update(u).finalize(v),x.reset();for(var _=1;_<A;_++)h=x.finalize(h),x.reset();y.concat(h)}return y.sigBytes=R*4,y}});e.EvpKDF=function(u,v,h){return o.create(h).compute(u,v)}}(),r.EvpKDF})});var je=L((Zi,jd)=>{(function(r,e,t){typeof Zi=="object"?jd.exports=Zi=e(X(),at()):typeof define=="function"&&define.amd?define(["./core","./evpkdf"],e):e(r.CryptoJS)})(Zi,function(r){r.lib.Cipher||function(e){var t=r,i=t.lib,n=i.Base,f=i.WordArray,a=i.BufferedBlockAlgorithm,o=t.enc,u=o.Utf8,v=o.Base64,h=t.algo,l=h.EvpKDF,x=i.Cipher=a.extend({cfg:n.extend(),createEncryptor:function(s,c){return this.create(this._ENC_XFORM_MODE,s,c)},createDecryptor:function(s,c){return this.create(this._DEC_XFORM_MODE,s,c)},init:function(s,c,b){this.cfg=this.cfg.extend(b),this._xformMode=s,this._key=c,this.reset()},reset:function(){a.reset.call(this),this._doReset()},process:function(s){return this._append(s),this._process()},finalize:function(s){s&&this._append(s);var c=this._doFinalize();return c},keySize:128/32,ivSize:128/32,_ENC_XFORM_MODE:1,_DEC_XFORM_MODE:2,_createHelper:function(){function s(c){return typeof c=="string"?M:D}return function(c){return{encrypt:function(b,p,m){return s(p).encrypt(c,b,p,m)},decrypt:function(b,p,m){return s(p).decrypt(c,b,p,m)}}}}()}),y=i.StreamCipher=x.extend({_doFinalize:function(){var s=this._process(!0);return s},blockSize:1}),E=t.mode={},R=i.BlockCipherMode=n.extend({createEncryptor:function(s,c){return this.Encryptor.create(s,c)},createDecryptor:function(s,c){return this.Decryptor.create(s,c)},init:function(s,c){this._cipher=s,this._iv=c}}),A=E.CBC=function(){var s=R.extend();s.Encryptor=s.extend({processBlock:function(b,p){var m=this._cipher,B=m.blockSize;c.call(this,b,p,B),m.encryptBlock(b,p),this._prevBlock=b.slice(p,p+B)}}),s.Decryptor=s.extend({processBlock:function(b,p){var m=this._cipher,B=m.blockSize,q=b.slice(p,p+B);m.decryptBlock(b,p),c.call(this,b,p,B),this._prevBlock=q}});function c(b,p,m){var B,q=this._iv;q?(B=q,this._iv=e):B=this._prevBlock;for(var w=0;w<m;w++)b[p+w]^=B[w]}return s}(),_=t.pad={},S=_.Pkcs7={pad:function(s,c){for(var b=c*4,p=b-s.sigBytes%b,m=p<<24|p<<16|p<<8|p,B=[],q=0;q<p;q+=4)B.push(m);var w=f.create(B,p);s.concat(w)},unpad:function(s){var c=s.words[s.sigBytes-1>>>2]&255;s.sigBytes-=c}},C=i.BlockCipher=x.extend({cfg:x.cfg.extend({mode:A,padding:S}),reset:function(){var s;x.reset.call(this);var c=this.cfg,b=c.iv,p=c.mode;this._xformMode==this._ENC_XFORM_MODE?s=p.createEncryptor:(s=p.createDecryptor,this._minBufferSize=1),this._mode&&this._mode.__creator==s?this._mode.init(this,b&&b.words):(this._mode=s.call(p,this,b&&b.words),this._mode.__creator=s)},_doProcessBlock:function(s,c){this._mode.processBlock(s,c)},_doFinalize:function(){var s,c=this.cfg.padding;return this._xformMode==this._ENC_XFORM_MODE?(c.pad(this._data,this.blockSize),s=this._process(!0)):(s=this._process(!0),c.unpad(s)),s},blockSize:128/32}),I=i.CipherParams=n.extend({init:function(s){this.mixIn(s)},toString:function(s){return(s||this.formatter).stringify(this)}}),P=t.format={},k=P.OpenSSL={stringify:function(s){var c,b=s.ciphertext,p=s.salt;return p?c=f.create([1398893684,1701076831]).concat(p).concat(b):c=b,c.toString(v)},parse:function(s){var c,b=v.parse(s),p=b.words;return p[0]==1398893684&&p[1]==1701076831&&(c=f.create(p.slice(2,4)),p.splice(0,4),b.sigBytes-=16),I.create({ciphertext:b,salt:c})}},D=i.SerializableCipher=n.extend({cfg:n.extend({format:k}),encrypt:function(s,c,b,p){p=this.cfg.extend(p);var m=s.createEncryptor(b,p),B=m.finalize(c),q=m.cfg;return I.create({ciphertext:B,key:b,iv:q.iv,algorithm:s,mode:q.mode,padding:q.padding,blockSize:s.blockSize,formatter:p.format})},decrypt:function(s,c,b,p){p=this.cfg.extend(p),c=this._parse(c,p.format);var m=s.createDecryptor(b,p).finalize(c.ciphertext);return m},_parse:function(s,c){return typeof s=="string"?c.parse(s,this):s}}),N=t.kdf={},H=N.OpenSSL={execute:function(s,c,b,p){p||(p=f.random(64/8));var m=l.create({keySize:c+b}).compute(s,p),B=f.create(m.words.slice(c),b*4);return m.sigBytes=c*4,I.create({key:m,iv:B,salt:p})}},M=i.PasswordBasedCipher=D.extend({cfg:D.cfg.extend({kdf:H}),encrypt:function(s,c,b,p){p=this.cfg.extend(p);var m=p.kdf.execute(b,s.keySize,s.ivSize);p.iv=m.iv;var B=D.encrypt.call(this,s,c,m.key,p);return B.mixIn(m),B},decrypt:function(s,c,b,p){p=this.cfg.extend(p),c=this._parse(c,p.format);var m=p.kdf.execute(b,s.keySize,s.ivSize,c.salt);p.iv=m.iv;var B=D.decrypt.call(this,s,c,m.key,p);return B}})}()})});var Jd=L((Yi,Kd)=>{(function(r,e,t){typeof Yi=="object"?Kd.exports=Yi=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Yi,function(r){return r.mode.CFB=function(){var e=r.lib.BlockCipherMode.extend();e.Encryptor=e.extend({processBlock:function(i,n){var f=this._cipher,a=f.blockSize;t.call(this,i,n,a,f),this._prevBlock=i.slice(n,n+a)}}),e.Decryptor=e.extend({processBlock:function(i,n){var f=this._cipher,a=f.blockSize,o=i.slice(n,n+a);t.call(this,i,n,a,f),this._prevBlock=o}});function t(i,n,f,a){var o,u=this._iv;u?(o=u.slice(0),this._iv=void 0):o=this._prevBlock,a.encryptBlock(o,0);for(var v=0;v<f;v++)i[n+v]^=o[v]}return e}(),r.mode.CFB})});var Gd=L(($i,Xd)=>{(function(r,e,t){typeof $i=="object"?Xd.exports=$i=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})($i,function(r){return r.mode.CTR=function(){var e=r.lib.BlockCipherMode.extend(),t=e.Encryptor=e.extend({processBlock:function(i,n){var f=this._cipher,a=f.blockSize,o=this._iv,u=this._counter;o&&(u=this._counter=o.slice(0),this._iv=void 0);var v=u.slice(0);f.encryptBlock(v,0),u[a-1]=u[a-1]+1|0;for(var h=0;h<a;h++)i[n+h]^=v[h]}});return e.Decryptor=t,e}(),r.mode.CTR})});var Zd=L((Qi,Vd)=>{(function(r,e,t){typeof Qi=="object"?Vd.exports=Qi=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Qi,function(r){return r.mode.CTRGladman=function(){var e=r.lib.BlockCipherMode.extend();function t(f){if((f>>24&255)==255){var a=f>>16&255,o=f>>8&255,u=f&255;a===255?(a=0,o===255?(o=0,u===255?u=0:++u):++o):++a,f=0,f+=a<<16,f+=o<<8,f+=u}else f+=1<<24;return f}function i(f){return(f[0]=t(f[0]))===0&&(f[1]=t(f[1])),f}var n=e.Encryptor=e.extend({processBlock:function(f,a){var o=this._cipher,u=o.blockSize,v=this._iv,h=this._counter;v&&(h=this._counter=v.slice(0),this._iv=void 0),i(h);var l=h.slice(0);o.encryptBlock(l,0);for(var x=0;x<u;x++)f[a+x]^=l[x]}});return e.Decryptor=n,e}(),r.mode.CTRGladman})});var $d=L((en,Yd)=>{(function(r,e,t){typeof en=="object"?Yd.exports=en=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(en,function(r){return r.mode.OFB=function(){var e=r.lib.BlockCipherMode.extend(),t=e.Encryptor=e.extend({processBlock:function(i,n){var f=this._cipher,a=f.blockSize,o=this._iv,u=this._keystream;o&&(u=this._keystream=o.slice(0),this._iv=void 0),f.encryptBlock(u,0);for(var v=0;v<a;v++)i[n+v]^=u[v]}});return e.Decryptor=t,e}(),r.mode.OFB})});var ec=L((rn,Qd)=>{(function(r,e,t){typeof rn=="object"?Qd.exports=rn=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(rn,function(r){return r.mode.ECB=function(){var e=r.lib.BlockCipherMode.extend();return e.Encryptor=e.extend({processBlock:function(t,i){this._cipher.encryptBlock(t,i)}}),e.Decryptor=e.extend({processBlock:function(t,i){this._cipher.decryptBlock(t,i)}}),e}(),r.mode.ECB})});var tc=L((tn,rc)=>{(function(r,e,t){typeof tn=="object"?rc.exports=tn=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(tn,function(r){return r.pad.AnsiX923={pad:function(e,t){var i=e.sigBytes,n=t*4,f=n-i%n,a=i+f-1;e.clamp(),e.words[a>>>2]|=f<<24-a%4*8,e.sigBytes+=f},unpad:function(e){var t=e.words[e.sigBytes-1>>>2]&255;e.sigBytes-=t}},r.pad.Ansix923})});var nc=L((nn,ic)=>{(function(r,e,t){typeof nn=="object"?ic.exports=nn=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(nn,function(r){return r.pad.Iso10126={pad:function(e,t){var i=t*4,n=i-e.sigBytes%i;e.concat(r.lib.WordArray.random(n-1)).concat(r.lib.WordArray.create([n<<24],1))},unpad:function(e){var t=e.words[e.sigBytes-1>>>2]&255;e.sigBytes-=t}},r.pad.Iso10126})});var ac=L((fn,fc)=>{(function(r,e,t){typeof fn=="object"?fc.exports=fn=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(fn,function(r){return r.pad.Iso97971={pad:function(e,t){e.concat(r.lib.WordArray.create([2147483648],1)),r.pad.ZeroPadding.pad(e,t)},unpad:function(e){r.pad.ZeroPadding.unpad(e),e.sigBytes--}},r.pad.Iso97971})});var oc=L((an,sc)=>{(function(r,e,t){typeof an=="object"?sc.exports=an=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(an,function(r){return r.pad.ZeroPadding={pad:function(e,t){var i=t*4;e.clamp(),e.sigBytes+=i-(e.sigBytes%i||i)},unpad:function(e){for(var t=e.words,i=e.sigBytes-1,i=e.sigBytes-1;i>=0;i--)if(t[i>>>2]>>>24-i%4*8&255){e.sigBytes=i+1;break}}},r.pad.ZeroPadding})});var cc=L((sn,dc)=>{(function(r,e,t){typeof sn=="object"?dc.exports=sn=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(sn,function(r){return r.pad.NoPadding={pad:function(){},unpad:function(){}},r.pad.NoPadding})});var hc=L((on,uc)=>{(function(r,e,t){typeof on=="object"?uc.exports=on=e(X(),je()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(on,function(r){return function(e){var t=r,i=t.lib,n=i.CipherParams,f=t.enc,a=f.Hex,o=t.format,u=o.Hex={stringify:function(v){return v.ciphertext.toString(a)},parse:function(v){var h=a.parse(v);return n.create({ciphertext:h})}}}(),r.format.Hex})});var bc=L((dn,lc)=>{(function(r,e,t){typeof dn=="object"?lc.exports=dn=e(X(),At(),Bt(),at(),je()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(dn,function(r){return function(){var e=r,t=e.lib,i=t.BlockCipher,n=e.algo,f=[],a=[],o=[],u=[],v=[],h=[],l=[],x=[],y=[],E=[];(function(){for(var _=[],S=0;S<256;S++)S<128?_[S]=S<<1:_[S]=S<<1^283;for(var C=0,I=0,S=0;S<256;S++){var P=I^I<<1^I<<2^I<<3^I<<4;P=P>>>8^P&255^99,f[C]=P,a[P]=C;var k=_[C],D=_[k],N=_[D],H=_[P]*257^P*16843008;o[C]=H<<24|H>>>8,u[C]=H<<16|H>>>16,v[C]=H<<8|H>>>24,h[C]=H;var H=N*16843009^D*65537^k*257^C*16843008;l[P]=H<<24|H>>>8,x[P]=H<<16|H>>>16,y[P]=H<<8|H>>>24,E[P]=H,C?(C=k^_[_[_[N^k]]],I^=_[_[I]]):C=I=1}})();var R=[0,1,2,4,8,16,32,64,128,27,54],A=n.AES=i.extend({_doReset:function(){var _;if(!(this._nRounds&&this._keyPriorReset===this._key)){for(var S=this._keyPriorReset=this._key,C=S.words,I=S.sigBytes/4,P=this._nRounds=I+6,k=(P+1)*4,D=this._keySchedule=[],N=0;N<k;N++)N<I?D[N]=C[N]:(_=D[N-1],N%I?I>6&&N%I==4&&(_=f[_>>>24]<<24|f[_>>>16&255]<<16|f[_>>>8&255]<<8|f[_&255]):(_=_<<8|_>>>24,_=f[_>>>24]<<24|f[_>>>16&255]<<16|f[_>>>8&255]<<8|f[_&255],_^=R[N/I|0]<<24),D[N]=D[N-I]^_);for(var H=this._invKeySchedule=[],M=0;M<k;M++){var N=k-M;if(M%4)var _=D[N];else var _=D[N-4];M<4||N<=4?H[M]=_:H[M]=l[f[_>>>24]]^x[f[_>>>16&255]]^y[f[_>>>8&255]]^E[f[_&255]]}}},encryptBlock:function(_,S){this._doCryptBlock(_,S,this._keySchedule,o,u,v,h,f)},decryptBlock:function(_,S){var C=_[S+1];_[S+1]=_[S+3],_[S+3]=C,this._doCryptBlock(_,S,this._invKeySchedule,l,x,y,E,a);var C=_[S+1];_[S+1]=_[S+3],_[S+3]=C},_doCryptBlock:function(_,S,C,I,P,k,D,N){for(var H=this._nRounds,M=_[S]^C[0],s=_[S+1]^C[1],c=_[S+2]^C[2],b=_[S+3]^C[3],p=4,m=1;m<H;m++){var B=I[M>>>24]^P[s>>>16&255]^k[c>>>8&255]^D[b&255]^C[p++],q=I[s>>>24]^P[c>>>16&255]^k[b>>>8&255]^D[M&255]^C[p++],w=I[c>>>24]^P[b>>>16&255]^k[M>>>8&255]^D[s&255]^C[p++],d=I[b>>>24]^P[M>>>16&255]^k[s>>>8&255]^D[c&255]^C[p++];M=B,s=q,c=w,b=d}var B=(N[M>>>24]<<24|N[s>>>16&255]<<16|N[c>>>8&255]<<8|N[b&255])^C[p++],q=(N[s>>>24]<<24|N[c>>>16&255]<<16|N[b>>>8&255]<<8|N[M&255])^C[p++],w=(N[c>>>24]<<24|N[b>>>16&255]<<16|N[M>>>8&255]<<8|N[s&255])^C[p++],d=(N[b>>>24]<<24|N[M>>>16&255]<<16|N[s>>>8&255]<<8|N[c&255])^C[p++];_[S]=B,_[S+1]=q,_[S+2]=w,_[S+3]=d},keySize:256/32});e.AES=i._createHelper(A)}(),r.AES})});var pc=L((cn,vc)=>{(function(r,e,t){typeof cn=="object"?vc.exports=cn=e(X(),At(),Bt(),at(),je()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(cn,function(r){return function(){var e=r,t=e.lib,i=t.WordArray,n=t.BlockCipher,f=e.algo,a=[57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4],o=[14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32],u=[1,2,4,6,8,10,12,14,15,17,19,21,23,25,27,28],v=[{0:8421888,268435456:32768,536870912:8421378,805306368:2,1073741824:512,1342177280:8421890,1610612736:8389122,1879048192:8388608,2147483648:514,2415919104:8389120,2684354560:33280,2952790016:8421376,3221225472:32770,3489660928:8388610,3758096384:0,4026531840:33282,134217728:0,402653184:8421890,671088640:33282,939524096:32768,1207959552:8421888,1476395008:512,1744830464:8421378,2013265920:2,2281701376:8389120,2550136832:33280,2818572288:8421376,3087007744:8389122,3355443200:8388610,3623878656:32770,3892314112:514,4160749568:8388608,1:32768,268435457:2,536870913:8421888,805306369:8388608,1073741825:8421378,1342177281:33280,1610612737:512,1879048193:8389122,2147483649:8421890,2415919105:8421376,2684354561:8388610,2952790017:33282,3221225473:514,3489660929:8389120,3758096385:32770,4026531841:0,134217729:8421890,402653185:8421376,671088641:8388608,939524097:512,1207959553:32768,1476395009:8388610,1744830465:2,2013265921:33282,2281701377:32770,2550136833:8389122,2818572289:514,3087007745:8421888,3355443201:8389120,3623878657:0,3892314113:33280,4160749569:8421378},{0:1074282512,16777216:16384,33554432:524288,50331648:1074266128,67108864:1073741840,83886080:1074282496,100663296:1073758208,117440512:16,134217728:540672,150994944:1073758224,167772160:1073741824,184549376:540688,201326592:524304,218103808:0,234881024:16400,251658240:1074266112,8388608:1073758208,25165824:540688,41943040:16,58720256:1073758224,75497472:1074282512,92274688:1073741824,109051904:524288,125829120:1074266128,142606336:524304,159383552:0,176160768:16384,192937984:1074266112,209715200:1073741840,226492416:540672,243269632:1074282496,260046848:16400,268435456:0,285212672:1074266128,301989888:1073758224,318767104:1074282496,335544320:1074266112,352321536:16,369098752:540688,385875968:16384,402653184:16400,419430400:524288,436207616:524304,452984832:1073741840,469762048:540672,486539264:1073758208,503316480:1073741824,520093696:1074282512,276824064:540688,293601280:524288,310378496:1074266112,327155712:16384,343932928:1073758208,360710144:1074282512,377487360:16,394264576:1073741824,411041792:1074282496,427819008:1073741840,444596224:1073758224,461373440:524304,478150656:0,494927872:16400,511705088:1074266128,528482304:540672},{0:260,1048576:0,2097152:67109120,3145728:65796,4194304:65540,5242880:67108868,6291456:67174660,7340032:67174400,8388608:67108864,9437184:67174656,10485760:65792,11534336:67174404,12582912:67109124,13631488:65536,14680064:4,15728640:256,524288:67174656,1572864:67174404,2621440:0,3670016:67109120,4718592:67108868,5767168:65536,6815744:65540,7864320:260,8912896:4,9961472:256,11010048:67174400,12058624:65796,13107200:65792,14155776:67109124,15204352:67174660,16252928:67108864,16777216:67174656,17825792:65540,18874368:65536,19922944:67109120,20971520:256,22020096:67174660,23068672:67108868,24117248:0,25165824:67109124,26214400:67108864,27262976:4,28311552:65792,29360128:67174400,30408704:260,31457280:65796,32505856:67174404,17301504:67108864,18350080:260,19398656:67174656,20447232:0,21495808:65540,22544384:67109120,23592960:256,24641536:67174404,25690112:65536,26738688:67174660,27787264:65796,28835840:67108868,29884416:67109124,30932992:67174400,31981568:4,33030144:65792},{0:2151682048,65536:2147487808,131072:4198464,196608:2151677952,262144:0,327680:4198400,393216:2147483712,458752:4194368,524288:2147483648,589824:4194304,655360:64,720896:2147487744,786432:2151678016,851968:4160,917504:4096,983040:2151682112,32768:2147487808,98304:64,163840:2151678016,229376:2147487744,294912:4198400,360448:2151682112,425984:0,491520:2151677952,557056:4096,622592:2151682048,688128:4194304,753664:4160,819200:2147483648,884736:4194368,950272:4198464,1015808:2147483712,1048576:4194368,1114112:4198400,1179648:2147483712,1245184:0,1310720:4160,1376256:2151678016,1441792:2151682048,1507328:2147487808,1572864:2151682112,1638400:2147483648,1703936:2151677952,1769472:4198464,1835008:2147487744,1900544:4194304,1966080:64,2031616:4096,1081344:2151677952,1146880:2151682112,1212416:0,1277952:4198400,1343488:4194368,1409024:2147483648,1474560:2147487808,1540096:64,1605632:2147483712,1671168:4096,1736704:2147487744,1802240:2151678016,1867776:4160,1933312:2151682048,1998848:4194304,2064384:4198464},{0:128,4096:17039360,8192:262144,12288:536870912,16384:537133184,20480:16777344,24576:553648256,28672:262272,32768:16777216,36864:537133056,40960:536871040,45056:553910400,49152:553910272,53248:0,57344:17039488,61440:553648128,2048:17039488,6144:553648256,10240:128,14336:17039360,18432:262144,22528:537133184,26624:553910272,30720:536870912,34816:537133056,38912:0,43008:553910400,47104:16777344,51200:536871040,55296:553648128,59392:16777216,63488:262272,65536:262144,69632:128,73728:536870912,77824:553648256,81920:16777344,86016:553910272,90112:537133184,94208:16777216,98304:553910400,102400:553648128,106496:17039360,110592:537133056,114688:262272,118784:536871040,122880:0,126976:17039488,67584:553648256,71680:16777216,75776:17039360,79872:537133184,83968:536870912,88064:17039488,92160:128,96256:553910272,100352:262272,104448:553910400,108544:0,112640:553648128,116736:16777344,120832:262144,124928:537133056,129024:536871040},{0:268435464,256:8192,512:270532608,768:270540808,1024:268443648,1280:2097152,1536:2097160,1792:268435456,2048:0,2304:268443656,2560:2105344,2816:8,3072:270532616,3328:2105352,3584:8200,3840:270540800,128:270532608,384:270540808,640:8,896:2097152,1152:2105352,1408:268435464,1664:268443648,1920:8200,2176:2097160,2432:8192,2688:268443656,2944:270532616,3200:0,3456:270540800,3712:2105344,3968:268435456,4096:268443648,4352:270532616,4608:270540808,4864:8200,5120:2097152,5376:268435456,5632:268435464,5888:2105344,6144:2105352,6400:0,6656:8,6912:270532608,7168:8192,7424:268443656,7680:270540800,7936:2097160,4224:8,4480:2105344,4736:2097152,4992:268435464,5248:268443648,5504:8200,5760:270540808,6016:270532608,6272:270540800,6528:270532616,6784:8192,7040:2105352,7296:2097160,7552:0,7808:268435456,8064:268443656},{0:1048576,16:33555457,32:1024,48:1049601,64:34604033,80:0,96:1,112:34603009,128:33555456,144:1048577,160:33554433,176:34604032,192:34603008,208:1025,224:1049600,240:33554432,8:34603009,24:0,40:33555457,56:34604032,72:1048576,88:33554433,104:33554432,120:1025,136:1049601,152:33555456,168:34603008,184:1048577,200:1024,216:34604033,232:1,248:1049600,256:33554432,272:1048576,288:33555457,304:34603009,320:1048577,336:33555456,352:34604032,368:1049601,384:1025,400:34604033,416:1049600,432:1,448:0,464:34603008,480:33554433,496:1024,264:1049600,280:33555457,296:34603009,312:1,328:33554432,344:1048576,360:1025,376:34604032,392:33554433,408:34603008,424:0,440:34604033,456:1049601,472:1024,488:33555456,504:1048577},{0:134219808,1:131072,2:134217728,3:32,4:131104,5:134350880,6:134350848,7:2048,8:134348800,9:134219776,10:133120,11:134348832,12:2080,13:0,14:134217760,15:133152,2147483648:2048,2147483649:134350880,2147483650:134219808,2147483651:134217728,2147483652:134348800,2147483653:133120,2147483654:133152,2147483655:32,2147483656:134217760,2147483657:2080,2147483658:131104,2147483659:134350848,2147483660:0,2147483661:134348832,2147483662:134219776,2147483663:131072,16:133152,17:134350848,18:32,19:2048,20:134219776,21:134217760,22:134348832,23:131072,24:0,25:131104,26:134348800,27:134219808,28:134350880,29:133120,30:2080,31:134217728,2147483664:131072,2147483665:2048,2147483666:134348832,2147483667:133152,2147483668:32,2147483669:134348800,2147483670:134217728,2147483671:134219808,2147483672:134350880,2147483673:134217760,2147483674:134219776,2147483675:0,2147483676:133120,2147483677:2080,2147483678:131104,2147483679:134350848}],h=[4160749569,528482304,33030144,2064384,129024,8064,504,2147483679],l=f.DES=n.extend({_doReset:function(){for(var R=this._key,A=R.words,_=[],S=0;S<56;S++){var C=a[S]-1;_[S]=A[C>>>5]>>>31-C%32&1}for(var I=this._subKeys=[],P=0;P<16;P++){for(var k=I[P]=[],D=u[P],S=0;S<24;S++)k[S/6|0]|=_[(o[S]-1+D)%28]<<31-S%6,k[4+(S/6|0)]|=_[28+(o[S+24]-1+D)%28]<<31-S%6;k[0]=k[0]<<1|k[0]>>>31;for(var S=1;S<7;S++)k[S]=k[S]>>>(S-1)*4+3;k[7]=k[7]<<5|k[7]>>>27}for(var N=this._invSubKeys=[],S=0;S<16;S++)N[S]=I[15-S]},encryptBlock:function(R,A){this._doCryptBlock(R,A,this._subKeys)},decryptBlock:function(R,A){this._doCryptBlock(R,A,this._invSubKeys)},_doCryptBlock:function(R,A,_){this._lBlock=R[A],this._rBlock=R[A+1],x.call(this,4,252645135),x.call(this,16,65535),y.call(this,2,858993459),y.call(this,8,16711935),x.call(this,1,1431655765);for(var S=0;S<16;S++){for(var C=_[S],I=this._lBlock,P=this._rBlock,k=0,D=0;D<8;D++)k|=v[D][((P^C[D])&h[D])>>>0];this._lBlock=P,this._rBlock=I^k}var N=this._lBlock;this._lBlock=this._rBlock,this._rBlock=N,x.call(this,1,1431655765),y.call(this,8,16711935),y.call(this,2,858993459),x.call(this,16,65535),x.call(this,4,252645135),R[A]=this._lBlock,R[A+1]=this._rBlock},keySize:64/32,ivSize:64/32,blockSize:64/32});function x(R,A){var _=(this._lBlock>>>R^this._rBlock)&A;this._rBlock^=_,this._lBlock^=_<<R}function y(R,A){var _=(this._rBlock>>>R^this._lBlock)&A;this._lBlock^=_,this._rBlock^=_<<R}e.DES=n._createHelper(l);var E=f.TripleDES=n.extend({_doReset:function(){var R=this._key,A=R.words;if(A.length!==2&&A.length!==4&&A.length<6)throw new Error("Invalid key length - 3DES requires the key length to be 64, 128, 192 or >192.");var _=A.slice(0,2),S=A.length<4?A.slice(0,2):A.slice(2,4),C=A.length<6?A.slice(0,2):A.slice(4,6);this._des1=l.createEncryptor(i.create(_)),this._des2=l.createEncryptor(i.create(S)),this._des3=l.createEncryptor(i.create(C))},encryptBlock:function(R,A){this._des1.encryptBlock(R,A),this._des2.decryptBlock(R,A),this._des3.encryptBlock(R,A)},decryptBlock:function(R,A){this._des3.decryptBlock(R,A),this._des2.encryptBlock(R,A),this._des1.decryptBlock(R,A)},keySize:192/32,ivSize:64/32,blockSize:64/32});e.TripleDES=n._createHelper(E)}(),r.TripleDES})});var gc=L((un,xc)=>{(function(r,e,t){typeof un=="object"?xc.exports=un=e(X(),At(),Bt(),at(),je()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(un,function(r){return function(){var e=r,t=e.lib,i=t.StreamCipher,n=e.algo,f=n.RC4=i.extend({_doReset:function(){for(var u=this._key,v=u.words,h=u.sigBytes,l=this._S=[],x=0;x<256;x++)l[x]=x;for(var x=0,y=0;x<256;x++){var E=x%h,R=v[E>>>2]>>>24-E%4*8&255;y=(y+l[x]+R)%256;var A=l[x];l[x]=l[y],l[y]=A}this._i=this._j=0},_doProcessBlock:function(u,v){u[v]^=a.call(this)},keySize:256/32,ivSize:0});function a(){for(var u=this._S,v=this._i,h=this._j,l=0,x=0;x<4;x++){v=(v+1)%256,h=(h+u[v])%256;var y=u[v];u[v]=u[h],u[h]=y,l|=u[(u[v]+u[h])%256]<<24-x*8}return this._i=v,this._j=h,l}e.RC4=i._createHelper(f);var o=n.RC4Drop=f.extend({cfg:f.cfg.extend({drop:192}),_doReset:function(){f._doReset.call(this);for(var u=this.cfg.drop;u>0;u--)a.call(this)}});e.RC4Drop=i._createHelper(o)}(),r.RC4})});var _c=L((hn,yc)=>{(function(r,e,t){typeof hn=="object"?yc.exports=hn=e(X(),At(),Bt(),at(),je()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(hn,function(r){return function(){var e=r,t=e.lib,i=t.StreamCipher,n=e.algo,f=[],a=[],o=[],u=n.Rabbit=i.extend({_doReset:function(){for(var h=this._key.words,l=this.cfg.iv,x=0;x<4;x++)h[x]=(h[x]<<8|h[x]>>>24)&16711935|(h[x]<<24|h[x]>>>8)&4278255360;var y=this._X=[h[0],h[3]<<16|h[2]>>>16,h[1],h[0]<<16|h[3]>>>16,h[2],h[1]<<16|h[0]>>>16,h[3],h[2]<<16|h[1]>>>16],E=this._C=[h[2]<<16|h[2]>>>16,h[0]&4294901760|h[1]&65535,h[3]<<16|h[3]>>>16,h[1]&4294901760|h[2]&65535,h[0]<<16|h[0]>>>16,h[2]&4294901760|h[3]&65535,h[1]<<16|h[1]>>>16,h[3]&4294901760|h[0]&65535];this._b=0;for(var x=0;x<4;x++)v.call(this);for(var x=0;x<8;x++)E[x]^=y[x+4&7];if(l){var R=l.words,A=R[0],_=R[1],S=(A<<8|A>>>24)&16711935|(A<<24|A>>>8)&4278255360,C=(_<<8|_>>>24)&16711935|(_<<24|_>>>8)&4278255360,I=S>>>16|C&4294901760,P=C<<16|S&65535;E[0]^=S,E[1]^=I,E[2]^=C,E[3]^=P,E[4]^=S,E[5]^=I,E[6]^=C,E[7]^=P;for(var x=0;x<4;x++)v.call(this)}},_doProcessBlock:function(h,l){var x=this._X;v.call(this),f[0]=x[0]^x[5]>>>16^x[3]<<16,f[1]=x[2]^x[7]>>>16^x[5]<<16,f[2]=x[4]^x[1]>>>16^x[7]<<16,f[3]=x[6]^x[3]>>>16^x[1]<<16;for(var y=0;y<4;y++)f[y]=(f[y]<<8|f[y]>>>24)&16711935|(f[y]<<24|f[y]>>>8)&4278255360,h[l+y]^=f[y]},blockSize:128/32,ivSize:64/32});function v(){for(var h=this._X,l=this._C,x=0;x<8;x++)a[x]=l[x];l[0]=l[0]+1295307597+this._b|0,l[1]=l[1]+3545052371+(l[0]>>>0<a[0]>>>0?1:0)|0,l[2]=l[2]+886263092+(l[1]>>>0<a[1]>>>0?1:0)|0,l[3]=l[3]+1295307597+(l[2]>>>0<a[2]>>>0?1:0)|0,l[4]=l[4]+3545052371+(l[3]>>>0<a[3]>>>0?1:0)|0,l[5]=l[5]+886263092+(l[4]>>>0<a[4]>>>0?1:0)|0,l[6]=l[6]+1295307597+(l[5]>>>0<a[5]>>>0?1:0)|0,l[7]=l[7]+3545052371+(l[6]>>>0<a[6]>>>0?1:0)|0,this._b=l[7]>>>0<a[7]>>>0?1:0;for(var x=0;x<8;x++){var y=h[x]+l[x],E=y&65535,R=y>>>16,A=((E*E>>>17)+E*R>>>15)+R*R,_=((y&4294901760)*y|0)+((y&65535)*y|0);o[x]=A^_}h[0]=o[0]+(o[7]<<16|o[7]>>>16)+(o[6]<<16|o[6]>>>16)|0,h[1]=o[1]+(o[0]<<8|o[0]>>>24)+o[7]|0,h[2]=o[2]+(o[1]<<16|o[1]>>>16)+(o[0]<<16|o[0]>>>16)|0,h[3]=o[3]+(o[2]<<8|o[2]>>>24)+o[1]|0,h[4]=o[4]+(o[3]<<16|o[3]>>>16)+(o[2]<<16|o[2]>>>16)|0,h[5]=o[5]+(o[4]<<8|o[4]>>>24)+o[3]|0,h[6]=o[6]+(o[5]<<16|o[5]>>>16)+(o[4]<<16|o[4]>>>16)|0,h[7]=o[7]+(o[6]<<8|o[6]>>>24)+o[5]|0}e.Rabbit=i._createHelper(u)}(),r.Rabbit})});var wc=L((ln,mc)=>{(function(r,e,t){typeof ln=="object"?mc.exports=ln=e(X(),At(),Bt(),at(),je()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(ln,function(r){return function(){var e=r,t=e.lib,i=t.StreamCipher,n=e.algo,f=[],a=[],o=[],u=n.RabbitLegacy=i.extend({_doReset:function(){var h=this._key.words,l=this.cfg.iv,x=this._X=[h[0],h[3]<<16|h[2]>>>16,h[1],h[0]<<16|h[3]>>>16,h[2],h[1]<<16|h[0]>>>16,h[3],h[2]<<16|h[1]>>>16],y=this._C=[h[2]<<16|h[2]>>>16,h[0]&4294901760|h[1]&65535,h[3]<<16|h[3]>>>16,h[1]&4294901760|h[2]&65535,h[0]<<16|h[0]>>>16,h[2]&4294901760|h[3]&65535,h[1]<<16|h[1]>>>16,h[3]&4294901760|h[0]&65535];this._b=0;for(var E=0;E<4;E++)v.call(this);for(var E=0;E<8;E++)y[E]^=x[E+4&7];if(l){var R=l.words,A=R[0],_=R[1],S=(A<<8|A>>>24)&16711935|(A<<24|A>>>8)&4278255360,C=(_<<8|_>>>24)&16711935|(_<<24|_>>>8)&4278255360,I=S>>>16|C&4294901760,P=C<<16|S&65535;y[0]^=S,y[1]^=I,y[2]^=C,y[3]^=P,y[4]^=S,y[5]^=I,y[6]^=C,y[7]^=P;for(var E=0;E<4;E++)v.call(this)}},_doProcessBlock:function(h,l){var x=this._X;v.call(this),f[0]=x[0]^x[5]>>>16^x[3]<<16,f[1]=x[2]^x[7]>>>16^x[5]<<16,f[2]=x[4]^x[1]>>>16^x[7]<<16,f[3]=x[6]^x[3]>>>16^x[1]<<16;for(var y=0;y<4;y++)f[y]=(f[y]<<8|f[y]>>>24)&16711935|(f[y]<<24|f[y]>>>8)&4278255360,h[l+y]^=f[y]},blockSize:128/32,ivSize:64/32});function v(){for(var h=this._X,l=this._C,x=0;x<8;x++)a[x]=l[x];l[0]=l[0]+1295307597+this._b|0,l[1]=l[1]+3545052371+(l[0]>>>0<a[0]>>>0?1:0)|0,l[2]=l[2]+886263092+(l[1]>>>0<a[1]>>>0?1:0)|0,l[3]=l[3]+1295307597+(l[2]>>>0<a[2]>>>0?1:0)|0,l[4]=l[4]+3545052371+(l[3]>>>0<a[3]>>>0?1:0)|0,l[5]=l[5]+886263092+(l[4]>>>0<a[4]>>>0?1:0)|0,l[6]=l[6]+1295307597+(l[5]>>>0<a[5]>>>0?1:0)|0,l[7]=l[7]+3545052371+(l[6]>>>0<a[6]>>>0?1:0)|0,this._b=l[7]>>>0<a[7]>>>0?1:0;for(var x=0;x<8;x++){var y=h[x]+l[x],E=y&65535,R=y>>>16,A=((E*E>>>17)+E*R>>>15)+R*R,_=((y&4294901760)*y|0)+((y&65535)*y|0);o[x]=A^_}h[0]=o[0]+(o[7]<<16|o[7]>>>16)+(o[6]<<16|o[6]>>>16)|0,h[1]=o[1]+(o[0]<<8|o[0]>>>24)+o[7]|0,h[2]=o[2]+(o[1]<<16|o[1]>>>16)+(o[0]<<16|o[0]>>>16)|0,h[3]=o[3]+(o[2]<<8|o[2]>>>24)+o[1]|0,h[4]=o[4]+(o[3]<<16|o[3]>>>16)+(o[2]<<16|o[2]>>>16)|0,h[5]=o[5]+(o[4]<<8|o[4]>>>24)+o[3]|0,h[6]=o[6]+(o[5]<<16|o[5]>>>16)+(o[4]<<16|o[4]>>>16)|0,h[7]=o[7]+(o[6]<<8|o[6]>>>24)+o[5]|0}e.RabbitLegacy=i._createHelper(u)}(),r.RabbitLegacy})});var Ec=L((bn,Sc)=>{(function(r,e,t){typeof bn=="object"?Sc.exports=bn=e(X(),B0(),wd(),Ed(),At(),Bd(),Bt(),Oi(),ca(),kd(),ua(),Fd(),Nd(),Od(),Xi(),Ud(),at(),je(),Jd(),Gd(),Zd(),$d(),ec(),tc(),nc(),ac(),oc(),cc(),hc(),bc(),pc(),gc(),_c(),wc()):typeof define=="function"&&define.amd?define(["./core","./x64-core","./lib-typedarrays","./enc-utf16","./enc-base64","./enc-base64url","./md5","./sha1","./sha256","./sha224","./sha512","./sha384","./sha3","./ripemd160","./hmac","./pbkdf2","./evpkdf","./cipher-core","./mode-cfb","./mode-ctr","./mode-ctr-gladman","./mode-ofb","./mode-ecb","./pad-ansix923","./pad-iso10126","./pad-iso97971","./pad-zeropadding","./pad-nopadding","./format-hex","./aes","./tripledes","./rc4","./rabbit","./rabbit-legacy"],e):r.CryptoJS=e(r.CryptoJS)})(bn,function(r){return r})});var Ac=L(vn=>{"use strict";vn.byteLength=zb;vn.toByteArray=Wb;vn.fromByteArray=Jb;var kr=[],vr=[],Ob=typeof Uint8Array!="undefined"?Uint8Array:Array,ha="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";for(var r0=0,Hb=ha.length;r0<Hb;++r0)kr[r0]=ha[r0],vr[ha.charCodeAt(r0)]=r0;vr["-".charCodeAt(0)]=62;vr["_".charCodeAt(0)]=63;function Mc(r){var e=r.length;if(e%4>0)throw new Error("Invalid string. Length must be a multiple of 4");var t=r.indexOf("=");t===-1&&(t=e);var i=t===e?0:4-t%4;return[t,i]}function zb(r){var e=Mc(r),t=e[0],i=e[1];return(t+i)*3/4-i}function Ub(r,e,t){return(e+t)*3/4-t}function Wb(r){var e,t=Mc(r),i=t[0],n=t[1],f=new Ob(Ub(r,i,n)),a=0,o=n>0?i-4:i,u;for(u=0;u<o;u+=4)e=vr[r.charCodeAt(u)]<<18|vr[r.charCodeAt(u+1)]<<12|vr[r.charCodeAt(u+2)]<<6|vr[r.charCodeAt(u+3)],f[a++]=e>>16&255,f[a++]=e>>8&255,f[a++]=e&255;return n===2&&(e=vr[r.charCodeAt(u)]<<2|vr[r.charCodeAt(u+1)]>>4,f[a++]=e&255),n===1&&(e=vr[r.charCodeAt(u)]<<10|vr[r.charCodeAt(u+1)]<<4|vr[r.charCodeAt(u+2)]>>2,f[a++]=e>>8&255,f[a++]=e&255),f}function jb(r){return kr[r>>18&63]+kr[r>>12&63]+kr[r>>6&63]+kr[r&63]}function Kb(r,e,t){for(var i,n=[],f=e;f<t;f+=3)i=(r[f]<<16&16711680)+(r[f+1]<<8&65280)+(r[f+2]&255),n.push(jb(i));return n.join("")}function Jb(r){for(var e,t=r.length,i=t%3,n=[],f=16383,a=0,o=t-i;a<o;a+=f)n.push(Kb(r,a,a+f>o?o:a+f));return i===1?(e=r[t-1],n.push(kr[e>>2]+kr[e<<4&63]+"==")):i===2&&(e=(r[t-2]<<8)+r[t-1],n.push(kr[e>>10]+kr[e>>4&63]+kr[e<<2&63]+"=")),n.join("")}});var Bc=L(la=>{la.read=function(r,e,t,i,n){var f,a,o=n*8-i-1,u=(1<<o)-1,v=u>>1,h=-7,l=t?n-1:0,x=t?-1:1,y=r[e+l];for(l+=x,f=y&(1<<-h)-1,y>>=-h,h+=o;h>0;f=f*256+r[e+l],l+=x,h-=8);for(a=f&(1<<-h)-1,f>>=-h,h+=i;h>0;a=a*256+r[e+l],l+=x,h-=8);if(f===0)f=1-v;else{if(f===u)return a?NaN:(y?-1:1)*Infinity;a=a+Math.pow(2,i),f=f-v}return(y?-1:1)*a*Math.pow(2,f-i)};la.write=function(r,e,t,i,n,f){var a,o,u,v=f*8-n-1,h=(1<<v)-1,l=h>>1,x=n===23?Math.pow(2,-24)-Math.pow(2,-77):0,y=i?0:f-1,E=i?1:-1,R=e<0||e===0&&1/e<0?1:0;for(e=Math.abs(e),isNaN(e)||e===Infinity?(o=isNaN(e)?1:0,a=h):(a=Math.floor(Math.log(e)/Math.LN2),e*(u=Math.pow(2,-a))<1&&(a--,u*=2),a+l>=1?e+=x/u:e+=x*Math.pow(2,1-l),e*u>=2&&(a++,u/=2),a+l>=h?(o=0,a=h):a+l>=1?(o=(e*u-1)*Math.pow(2,n),a=a+l):(o=e*Math.pow(2,l-1)*Math.pow(2,n),a=0));n>=8;r[t+y]=o&255,y+=E,o/=256,n-=8);for(a=a<<n|o,v+=n;v>0;r[t+y]=a&255,y+=E,a/=256,v-=8);r[t+y-E]|=R*128}});var st=L(i0=>{"use strict";var ba=Ac(),t0=Bc();i0.Buffer=O;i0.SlowBuffer=$b;i0.INSPECT_MAX_BYTES=50;var pn=2147483647;i0.kMaxLength=pn;O.TYPED_ARRAY_SUPPORT=Xb();!O.TYPED_ARRAY_SUPPORT&&typeof console!="undefined"&&typeof console.error=="function"&&console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support.");function Xb(){try{var r=new Uint8Array(1);return r.__proto__={__proto__:Uint8Array.prototype,foo:function(){return 42}},r.foo()===42}catch(e){return!1}}Object.defineProperty(O.prototype,"parent",{enumerable:!0,get:function(){if(!!O.isBuffer(this))return this.buffer}});Object.defineProperty(O.prototype,"offset",{enumerable:!0,get:function(){if(!!O.isBuffer(this))return this.byteOffset}});function zr(r){if(r>pn)throw new RangeError('The value "'+r+'" is invalid for option "size"');var e=new Uint8Array(r);return e.__proto__=O.prototype,e}function O(r,e,t){if(typeof r=="number"){if(typeof e=="string")throw new TypeError('The "string" argument must be of type string. Received type number');return va(r)}return Rc(r,e,t)}typeof Symbol!="undefined"&&Symbol.species!=null&&O[Symbol.species]===O&&Object.defineProperty(O,Symbol.species,{value:null,configurable:!0,enumerable:!1,writable:!1});O.poolSize=8192;function Rc(r,e,t){if(typeof r=="string")return Vb(r,e);if(ArrayBuffer.isView(r))return pa(r);if(r==null)throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "+typeof r);if(qt(r,ArrayBuffer)||r&&qt(r.buffer,ArrayBuffer))return Zb(r,e,t);if(typeof r=="number")throw new TypeError('The "value" argument must not be of type number. Received type number');var i=r.valueOf&&r.valueOf();if(i!=null&&i!==r)return O.from(i,e,t);var n=Yb(r);if(n)return n;if(typeof Symbol!="undefined"&&Symbol.toPrimitive!=null&&typeof r[Symbol.toPrimitive]=="function")return O.from(r[Symbol.toPrimitive]("string"),e,t);throw new TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "+typeof r)}O.from=function(r,e,t){return Rc(r,e,t)};O.prototype.__proto__=Uint8Array.prototype;O.__proto__=Uint8Array;function qc(r){if(typeof r!="number")throw new TypeError('"size" argument must be of type number');if(r<0)throw new RangeError('The value "'+r+'" is invalid for option "size"')}function Gb(r,e,t){return qc(r),r<=0?zr(r):e!==void 0?typeof t=="string"?zr(r).fill(e,t):zr(r).fill(e):zr(r)}O.alloc=function(r,e,t){return Gb(r,e,t)};function va(r){return qc(r),zr(r<0?0:xa(r)|0)}O.allocUnsafe=function(r){return va(r)};O.allocUnsafeSlow=function(r){return va(r)};function Vb(r,e){if((typeof e!="string"||e==="")&&(e="utf8"),!O.isEncoding(e))throw new TypeError("Unknown encoding: "+e);var t=Cc(r,e)|0,i=zr(t),n=i.write(r,e);return n!==t&&(i=i.slice(0,n)),i}function pa(r){for(var e=r.length<0?0:xa(r.length)|0,t=zr(e),i=0;i<e;i+=1)t[i]=r[i]&255;return t}function Zb(r,e,t){if(e<0||r.byteLength<e)throw new RangeError('"offset" is outside of buffer bounds');if(r.byteLength<e+(t||0))throw new RangeError('"length" is outside of buffer bounds');var i;return e===void 0&&t===void 0?i=new Uint8Array(r):t===void 0?i=new Uint8Array(r,e):i=new Uint8Array(r,e,t),i.__proto__=O.prototype,i}function Yb(r){if(O.isBuffer(r)){var e=xa(r.length)|0,t=zr(e);return t.length===0||r.copy(t,0,0,e),t}if(r.length!==void 0)return typeof r.length!="number"||ya(r.length)?zr(0):pa(r);if(r.type==="Buffer"&&Array.isArray(r.data))return pa(r.data)}function xa(r){if(r>=pn)throw new RangeError("Attempt to allocate Buffer larger than maximum size: 0x"+pn.toString(16)+" bytes");return r|0}function $b(r){return+r!=r&&(r=0),O.alloc(+r)}O.isBuffer=function(e){return e!=null&&e._isBuffer===!0&&e!==O.prototype};O.compare=function(e,t){if(qt(e,Uint8Array)&&(e=O.from(e,e.offset,e.byteLength)),qt(t,Uint8Array)&&(t=O.from(t,t.offset,t.byteLength)),!O.isBuffer(e)||!O.isBuffer(t))throw new TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');if(e===t)return 0;for(var i=e.length,n=t.length,f=0,a=Math.min(i,n);f<a;++f)if(e[f]!==t[f]){i=e[f],n=t[f];break}return i<n?-1:n<i?1:0};O.isEncoding=function(e){switch(String(e).toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"latin1":case"binary":case"base64":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return!0;default:return!1}};O.concat=function(e,t){if(!Array.isArray(e))throw new TypeError('"list" argument must be an Array of Buffers');if(e.length===0)return O.alloc(0);var i;if(t===void 0)for(t=0,i=0;i<e.length;++i)t+=e[i].length;var n=O.allocUnsafe(t),f=0;for(i=0;i<e.length;++i){var a=e[i];if(qt(a,Uint8Array)&&(a=O.from(a)),!O.isBuffer(a))throw new TypeError('"list" argument must be an Array of Buffers');a.copy(n,f),f+=a.length}return n};function Cc(r,e){if(O.isBuffer(r))return r.length;if(ArrayBuffer.isView(r)||qt(r,ArrayBuffer))return r.byteLength;if(typeof r!="string")throw new TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type '+typeof r);var t=r.length,i=arguments.length>2&&arguments[2]===!0;if(!i&&t===0)return 0;for(var n=!1;;)switch(e){case"ascii":case"latin1":case"binary":return t;case"utf8":case"utf-8":return ga(r).length;case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return t*2;case"hex":return t>>>1;case"base64":return Oc(r).length;default:if(n)return i?-1:ga(r).length;e=(""+e).toLowerCase(),n=!0}}O.byteLength=Cc;function Qb(r,e,t){var i=!1;if((e===void 0||e<0)&&(e=0),e>this.length||((t===void 0||t>this.length)&&(t=this.length),t<=0)||(t>>>=0,e>>>=0,t<=e))return"";for(r||(r="utf8");;)switch(r){case"hex":return dv(this,e,t);case"utf8":case"utf-8":return Pc(this,e,t);case"ascii":return sv(this,e,t);case"latin1":case"binary":return ov(this,e,t);case"base64":return fv(this,e,t);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return cv(this,e,t);default:if(i)throw new TypeError("Unknown encoding: "+r);r=(r+"").toLowerCase(),i=!0}}O.prototype._isBuffer=!0;function Rt(r,e,t){var i=r[e];r[e]=r[t],r[t]=i}O.prototype.swap16=function(){var e=this.length;if(e%2!=0)throw new RangeError("Buffer size must be a multiple of 16-bits");for(var t=0;t<e;t+=2)Rt(this,t,t+1);return this};O.prototype.swap32=function(){var e=this.length;if(e%4!=0)throw new RangeError("Buffer size must be a multiple of 32-bits");for(var t=0;t<e;t+=4)Rt(this,t,t+3),Rt(this,t+1,t+2);return this};O.prototype.swap64=function(){var e=this.length;if(e%8!=0)throw new RangeError("Buffer size must be a multiple of 64-bits");for(var t=0;t<e;t+=8)Rt(this,t,t+7),Rt(this,t+1,t+6),Rt(this,t+2,t+5),Rt(this,t+3,t+4);return this};O.prototype.toString=function(){var e=this.length;return e===0?"":arguments.length===0?Pc(this,0,e):Qb.apply(this,arguments)};O.prototype.toLocaleString=O.prototype.toString;O.prototype.equals=function(e){if(!O.isBuffer(e))throw new TypeError("Argument must be a Buffer");return this===e?!0:O.compare(this,e)===0};O.prototype.inspect=function(){var e="",t=i0.INSPECT_MAX_BYTES;return e=this.toString("hex",0,t).replace(/(.{2})/g,"$1 ").trim(),this.length>t&&(e+=" ... "),"<Buffer "+e+">"};O.prototype.compare=function(e,t,i,n,f){if(qt(e,Uint8Array)&&(e=O.from(e,e.offset,e.byteLength)),!O.isBuffer(e))throw new TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type '+typeof e);if(t===void 0&&(t=0),i===void 0&&(i=e?e.length:0),n===void 0&&(n=0),f===void 0&&(f=this.length),t<0||i>e.length||n<0||f>this.length)throw new RangeError("out of range index");if(n>=f&&t>=i)return 0;if(n>=f)return-1;if(t>=i)return 1;if(t>>>=0,i>>>=0,n>>>=0,f>>>=0,this===e)return 0;for(var a=f-n,o=i-t,u=Math.min(a,o),v=this.slice(n,f),h=e.slice(t,i),l=0;l<u;++l)if(v[l]!==h[l]){a=v[l],o=h[l];break}return a<o?-1:o<a?1:0};function Ic(r,e,t,i,n){if(r.length===0)return-1;if(typeof t=="string"?(i=t,t=0):t>2147483647?t=2147483647:t<-2147483648&&(t=-2147483648),t=+t,ya(t)&&(t=n?0:r.length-1),t<0&&(t=r.length+t),t>=r.length){if(n)return-1;t=r.length-1}else if(t<0)if(n)t=0;else return-1;if(typeof e=="string"&&(e=O.from(e,i)),O.isBuffer(e))return e.length===0?-1:kc(r,e,t,i,n);if(typeof e=="number")return e=e&255,typeof Uint8Array.prototype.indexOf=="function"?n?Uint8Array.prototype.indexOf.call(r,e,t):Uint8Array.prototype.lastIndexOf.call(r,e,t):kc(r,[e],t,i,n);throw new TypeError("val must be string, number or Buffer")}function kc(r,e,t,i,n){var f=1,a=r.length,o=e.length;if(i!==void 0&&(i=String(i).toLowerCase(),i==="ucs2"||i==="ucs-2"||i==="utf16le"||i==="utf-16le")){if(r.length<2||e.length<2)return-1;f=2,a/=2,o/=2,t/=2}function u(y,E){return f===1?y[E]:y.readUInt16BE(E*f)}var v;if(n){var h=-1;for(v=t;v<a;v++)if(u(r,v)===u(e,h===-1?0:v-h)){if(h===-1&&(h=v),v-h+1===o)return h*f}else h!==-1&&(v-=v-h),h=-1}else for(t+o>a&&(t=a-o),v=t;v>=0;v--){for(var l=!0,x=0;x<o;x++)if(u(r,v+x)!==u(e,x)){l=!1;break}if(l)return v}return-1}O.prototype.includes=function(e,t,i){return this.indexOf(e,t,i)!==-1};O.prototype.indexOf=function(e,t,i){return Ic(this,e,t,i,!0)};O.prototype.lastIndexOf=function(e,t,i){return Ic(this,e,t,i,!1)};function ev(r,e,t,i){t=Number(t)||0;var n=r.length-t;i?(i=Number(i),i>n&&(i=n)):i=n;var f=e.length;i>f/2&&(i=f/2);for(var a=0;a<i;++a){var o=parseInt(e.substr(a*2,2),16);if(ya(o))return a;r[t+a]=o}return a}function rv(r,e,t,i){return xn(ga(e,r.length-t),r,t,i)}function Tc(r,e,t,i){return xn(bv(e),r,t,i)}function tv(r,e,t,i){return Tc(r,e,t,i)}function iv(r,e,t,i){return xn(Oc(e),r,t,i)}function nv(r,e,t,i){return xn(vv(e,r.length-t),r,t,i)}O.prototype.write=function(e,t,i,n){if(t===void 0)n="utf8",i=this.length,t=0;else if(i===void 0&&typeof t=="string")n=t,i=this.length,t=0;else if(isFinite(t))t=t>>>0,isFinite(i)?(i=i>>>0,n===void 0&&(n="utf8")):(n=i,i=void 0);else throw new Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");var f=this.length-t;if((i===void 0||i>f)&&(i=f),e.length>0&&(i<0||t<0)||t>this.length)throw new RangeError("Attempt to write outside buffer bounds");n||(n="utf8");for(var a=!1;;)switch(n){case"hex":return ev(this,e,t,i);case"utf8":case"utf-8":return rv(this,e,t,i);case"ascii":return Tc(this,e,t,i);case"latin1":case"binary":return tv(this,e,t,i);case"base64":return iv(this,e,t,i);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return nv(this,e,t,i);default:if(a)throw new TypeError("Unknown encoding: "+n);n=(""+n).toLowerCase(),a=!0}};O.prototype.toJSON=function(){return{type:"Buffer",data:Array.prototype.slice.call(this._arr||this,0)}};function fv(r,e,t){return e===0&&t===r.length?ba.fromByteArray(r):ba.fromByteArray(r.slice(e,t))}function Pc(r,e,t){t=Math.min(r.length,t);for(var i=[],n=e;n<t;){var f=r[n],a=null,o=f>239?4:f>223?3:f>191?2:1;if(n+o<=t){var u,v,h,l;switch(o){case 1:f<128&&(a=f);break;case 2:u=r[n+1],(u&192)==128&&(l=(f&31)<<6|u&63,l>127&&(a=l));break;case 3:u=r[n+1],v=r[n+2],(u&192)==128&&(v&192)==128&&(l=(f&15)<<12|(u&63)<<6|v&63,l>2047&&(l<55296||l>57343)&&(a=l));break;case 4:u=r[n+1],v=r[n+2],h=r[n+3],(u&192)==128&&(v&192)==128&&(h&192)==128&&(l=(f&15)<<18|(u&63)<<12|(v&63)<<6|h&63,l>65535&&l<1114112&&(a=l))}}a===null?(a=65533,o=1):a>65535&&(a-=65536,i.push(a>>>10&1023|55296),a=56320|a&1023),i.push(a),n+=o}return av(i)}var Fc=4096;function av(r){var e=r.length;if(e<=Fc)return String.fromCharCode.apply(String,r);for(var t="",i=0;i<e;)t+=String.fromCharCode.apply(String,r.slice(i,i+=Fc));return t}function sv(r,e,t){var i="";t=Math.min(r.length,t);for(var n=e;n<t;++n)i+=String.fromCharCode(r[n]&127);return i}function ov(r,e,t){var i="";t=Math.min(r.length,t);for(var n=e;n<t;++n)i+=String.fromCharCode(r[n]);return i}function dv(r,e,t){var i=r.length;(!e||e<0)&&(e=0),(!t||t<0||t>i)&&(t=i);for(var n="",f=e;f<t;++f)n+=lv(r[f]);return n}function cv(r,e,t){for(var i=r.slice(e,t),n="",f=0;f<i.length;f+=2)n+=String.fromCharCode(i[f]+i[f+1]*256);return n}O.prototype.slice=function(e,t){var i=this.length;e=~~e,t=t===void 0?i:~~t,e<0?(e+=i,e<0&&(e=0)):e>i&&(e=i),t<0?(t+=i,t<0&&(t=0)):t>i&&(t=i),t<e&&(t=e);var n=this.subarray(e,t);return n.__proto__=O.prototype,n};function Ke(r,e,t){if(r%1!=0||r<0)throw new RangeError("offset is not uint");if(r+e>t)throw new RangeError("Trying to access beyond buffer length")}O.prototype.readUIntLE=function(e,t,i){e=e>>>0,t=t>>>0,i||Ke(e,t,this.length);for(var n=this[e],f=1,a=0;++a<t&&(f*=256);)n+=this[e+a]*f;return n};O.prototype.readUIntBE=function(e,t,i){e=e>>>0,t=t>>>0,i||Ke(e,t,this.length);for(var n=this[e+--t],f=1;t>0&&(f*=256);)n+=this[e+--t]*f;return n};O.prototype.readUInt8=function(e,t){return e=e>>>0,t||Ke(e,1,this.length),this[e]};O.prototype.readUInt16LE=function(e,t){return e=e>>>0,t||Ke(e,2,this.length),this[e]|this[e+1]<<8};O.prototype.readUInt16BE=function(e,t){return e=e>>>0,t||Ke(e,2,this.length),this[e]<<8|this[e+1]};O.prototype.readUInt32LE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),(this[e]|this[e+1]<<8|this[e+2]<<16)+this[e+3]*16777216};O.prototype.readUInt32BE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),this[e]*16777216+(this[e+1]<<16|this[e+2]<<8|this[e+3])};O.prototype.readIntLE=function(e,t,i){e=e>>>0,t=t>>>0,i||Ke(e,t,this.length);for(var n=this[e],f=1,a=0;++a<t&&(f*=256);)n+=this[e+a]*f;return f*=128,n>=f&&(n-=Math.pow(2,8*t)),n};O.prototype.readIntBE=function(e,t,i){e=e>>>0,t=t>>>0,i||Ke(e,t,this.length);for(var n=t,f=1,a=this[e+--n];n>0&&(f*=256);)a+=this[e+--n]*f;return f*=128,a>=f&&(a-=Math.pow(2,8*t)),a};O.prototype.readInt8=function(e,t){return e=e>>>0,t||Ke(e,1,this.length),this[e]&128?(255-this[e]+1)*-1:this[e]};O.prototype.readInt16LE=function(e,t){e=e>>>0,t||Ke(e,2,this.length);var i=this[e]|this[e+1]<<8;return i&32768?i|4294901760:i};O.prototype.readInt16BE=function(e,t){e=e>>>0,t||Ke(e,2,this.length);var i=this[e+1]|this[e]<<8;return i&32768?i|4294901760:i};O.prototype.readInt32LE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),this[e]|this[e+1]<<8|this[e+2]<<16|this[e+3]<<24};O.prototype.readInt32BE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),this[e]<<24|this[e+1]<<16|this[e+2]<<8|this[e+3]};O.prototype.readFloatLE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),t0.read(this,e,!0,23,4)};O.prototype.readFloatBE=function(e,t){return e=e>>>0,t||Ke(e,4,this.length),t0.read(this,e,!1,23,4)};O.prototype.readDoubleLE=function(e,t){return e=e>>>0,t||Ke(e,8,this.length),t0.read(this,e,!0,52,8)};O.prototype.readDoubleBE=function(e,t){return e=e>>>0,t||Ke(e,8,this.length),t0.read(this,e,!1,52,8)};function or(r,e,t,i,n,f){if(!O.isBuffer(r))throw new TypeError('"buffer" argument must be a Buffer instance');if(e>n||e<f)throw new RangeError('"value" argument is out of bounds');if(t+i>r.length)throw new RangeError("Index out of range")}O.prototype.writeUIntLE=function(e,t,i,n){if(e=+e,t=t>>>0,i=i>>>0,!n){var f=Math.pow(2,8*i)-1;or(this,e,t,i,f,0)}var a=1,o=0;for(this[t]=e&255;++o<i&&(a*=256);)this[t+o]=e/a&255;return t+i};O.prototype.writeUIntBE=function(e,t,i,n){if(e=+e,t=t>>>0,i=i>>>0,!n){var f=Math.pow(2,8*i)-1;or(this,e,t,i,f,0)}var a=i-1,o=1;for(this[t+a]=e&255;--a>=0&&(o*=256);)this[t+a]=e/o&255;return t+i};O.prototype.writeUInt8=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,1,255,0),this[t]=e&255,t+1};O.prototype.writeUInt16LE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,2,65535,0),this[t]=e&255,this[t+1]=e>>>8,t+2};O.prototype.writeUInt16BE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,2,65535,0),this[t]=e>>>8,this[t+1]=e&255,t+2};O.prototype.writeUInt32LE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,4,4294967295,0),this[t+3]=e>>>24,this[t+2]=e>>>16,this[t+1]=e>>>8,this[t]=e&255,t+4};O.prototype.writeUInt32BE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,4,4294967295,0),this[t]=e>>>24,this[t+1]=e>>>16,this[t+2]=e>>>8,this[t+3]=e&255,t+4};O.prototype.writeIntLE=function(e,t,i,n){if(e=+e,t=t>>>0,!n){var f=Math.pow(2,8*i-1);or(this,e,t,i,f-1,-f)}var a=0,o=1,u=0;for(this[t]=e&255;++a<i&&(o*=256);)e<0&&u===0&&this[t+a-1]!==0&&(u=1),this[t+a]=(e/o>>0)-u&255;return t+i};O.prototype.writeIntBE=function(e,t,i,n){if(e=+e,t=t>>>0,!n){var f=Math.pow(2,8*i-1);or(this,e,t,i,f-1,-f)}var a=i-1,o=1,u=0;for(this[t+a]=e&255;--a>=0&&(o*=256);)e<0&&u===0&&this[t+a+1]!==0&&(u=1),this[t+a]=(e/o>>0)-u&255;return t+i};O.prototype.writeInt8=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,1,127,-128),e<0&&(e=255+e+1),this[t]=e&255,t+1};O.prototype.writeInt16LE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,2,32767,-32768),this[t]=e&255,this[t+1]=e>>>8,t+2};O.prototype.writeInt16BE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,2,32767,-32768),this[t]=e>>>8,this[t+1]=e&255,t+2};O.prototype.writeInt32LE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,4,2147483647,-2147483648),this[t]=e&255,this[t+1]=e>>>8,this[t+2]=e>>>16,this[t+3]=e>>>24,t+4};O.prototype.writeInt32BE=function(e,t,i){return e=+e,t=t>>>0,i||or(this,e,t,4,2147483647,-2147483648),e<0&&(e=4294967295+e+1),this[t]=e>>>24,this[t+1]=e>>>16,this[t+2]=e>>>8,this[t+3]=e&255,t+4};function Lc(r,e,t,i,n,f){if(t+i>r.length)throw new RangeError("Index out of range");if(t<0)throw new RangeError("Index out of range")}function Nc(r,e,t,i,n){return e=+e,t=t>>>0,n||Lc(r,e,t,4,34028234663852886e22,-34028234663852886e22),t0.write(r,e,t,i,23,4),t+4}O.prototype.writeFloatLE=function(e,t,i){return Nc(this,e,t,!0,i)};O.prototype.writeFloatBE=function(e,t,i){return Nc(this,e,t,!1,i)};function Dc(r,e,t,i,n){return e=+e,t=t>>>0,n||Lc(r,e,t,8,17976931348623157e292,-17976931348623157e292),t0.write(r,e,t,i,52,8),t+8}O.prototype.writeDoubleLE=function(e,t,i){return Dc(this,e,t,!0,i)};O.prototype.writeDoubleBE=function(e,t,i){return Dc(this,e,t,!1,i)};O.prototype.copy=function(e,t,i,n){if(!O.isBuffer(e))throw new TypeError("argument should be a Buffer");if(i||(i=0),!n&&n!==0&&(n=this.length),t>=e.length&&(t=e.length),t||(t=0),n>0&&n<i&&(n=i),n===i||e.length===0||this.length===0)return 0;if(t<0)throw new RangeError("targetStart out of bounds");if(i<0||i>=this.length)throw new RangeError("Index out of range");if(n<0)throw new RangeError("sourceEnd out of bounds");n>this.length&&(n=this.length),e.length-t<n-i&&(n=e.length-t+i);var f=n-i;if(this===e&&typeof Uint8Array.prototype.copyWithin=="function")this.copyWithin(t,i,n);else if(this===e&&i<t&&t<n)for(var a=f-1;a>=0;--a)e[a+t]=this[a+i];else Uint8Array.prototype.set.call(e,this.subarray(i,n),t);return f};O.prototype.fill=function(e,t,i,n){if(typeof e=="string"){if(typeof t=="string"?(n=t,t=0,i=this.length):typeof i=="string"&&(n=i,i=this.length),n!==void 0&&typeof n!="string")throw new TypeError("encoding must be a string");if(typeof n=="string"&&!O.isEncoding(n))throw new TypeError("Unknown encoding: "+n);if(e.length===1){var f=e.charCodeAt(0);(n==="utf8"&&f<128||n==="latin1")&&(e=f)}}else typeof e=="number"&&(e=e&255);if(t<0||this.length<t||this.length<i)throw new RangeError("Out of range index");if(i<=t)return this;t=t>>>0,i=i===void 0?this.length:i>>>0,e||(e=0);var a;if(typeof e=="number")for(a=t;a<i;++a)this[a]=e;else{var o=O.isBuffer(e)?e:O.from(e,n),u=o.length;if(u===0)throw new TypeError('The value "'+e+'" is invalid for argument "value"');for(a=0;a<i-t;++a)this[a+t]=o[a%u]}return this};var uv=/[^+/0-9A-Za-z-_]/g;function hv(r){if(r=r.split("=")[0],r=r.trim().replace(uv,""),r.length<2)return"";for(;r.length%4!=0;)r=r+"=";return r}function lv(r){return r<16?"0"+r.toString(16):r.toString(16)}function ga(r,e){e=e||Infinity;for(var t,i=r.length,n=null,f=[],a=0;a<i;++a){if(t=r.charCodeAt(a),t>55295&&t<57344){if(!n){if(t>56319){(e-=3)>-1&&f.push(239,191,189);continue}else if(a+1===i){(e-=3)>-1&&f.push(239,191,189);continue}n=t;continue}if(t<56320){(e-=3)>-1&&f.push(239,191,189),n=t;continue}t=(n-55296<<10|t-56320)+65536}else n&&(e-=3)>-1&&f.push(239,191,189);if(n=null,t<128){if((e-=1)<0)break;f.push(t)}else if(t<2048){if((e-=2)<0)break;f.push(t>>6|192,t&63|128)}else if(t<65536){if((e-=3)<0)break;f.push(t>>12|224,t>>6&63|128,t&63|128)}else if(t<1114112){if((e-=4)<0)break;f.push(t>>18|240,t>>12&63|128,t>>6&63|128,t&63|128)}else throw new Error("Invalid code point")}return f}function bv(r){for(var e=[],t=0;t<r.length;++t)e.push(r.charCodeAt(t)&255);return e}function vv(r,e){for(var t,i,n,f=[],a=0;a<r.length&&!((e-=2)<0);++a)t=r.charCodeAt(a),i=t>>8,n=t%256,f.push(n),f.push(i);return f}function Oc(r){return ba.toByteArray(hv(r))}function xn(r,e,t,i){for(var n=0;n<i&&!(n+t>=e.length||n>=r.length);++n)e[n+t]=r[n];return n}function qt(r,e){return r instanceof e||r!=null&&r.constructor!=null&&r.constructor.name!=null&&r.constructor.name===e.name}function ya(r){return r!==r}});var Ve=L((_a,zc)=>{var gn=st(),Tr=gn.Buffer;function Hc(r,e){for(var t in r)e[t]=r[t]}Tr.from&&Tr.alloc&&Tr.allocUnsafe&&Tr.allocUnsafeSlow?zc.exports=gn:(Hc(gn,_a),_a.Buffer=Ct);function Ct(r,e,t){return Tr(r,e,t)}Ct.prototype=Object.create(Tr.prototype);Hc(Tr,Ct);Ct.from=function(r,e,t){if(typeof r=="number")throw new TypeError("Argument must not be a number");return Tr(r,e,t)};Ct.alloc=function(r,e,t){if(typeof r!="number")throw new TypeError("Argument must be a number");var i=Tr(r);return e!==void 0?typeof t=="string"?i.fill(e,t):i.fill(e):i.fill(0),i};Ct.allocUnsafe=function(r){if(typeof r!="number")throw new TypeError("Argument must be a number");return Tr(r)};Ct.allocUnsafeSlow=function(r){if(typeof r!="number")throw new TypeError("Argument must be a number");return gn.SlowBuffer(r)}});var R0=L((Jx,ma)=>{"use strict";var n0=typeof Reflect=="object"?Reflect:null,Uc=n0&&typeof n0.apply=="function"?n0.apply:function(e,t,i){return Function.prototype.apply.call(e,t,i)},yn;n0&&typeof n0.ownKeys=="function"?yn=n0.ownKeys:Object.getOwnPropertySymbols?yn=function(e){return Object.getOwnPropertyNames(e).concat(Object.getOwnPropertySymbols(e))}:yn=function(e){return Object.getOwnPropertyNames(e)};function pv(r){console&&console.warn&&console.warn(r)}var Wc=Number.isNaN||function(e){return e!==e};function ne(){ne.init.call(this)}ma.exports=ne;ma.exports.once=_v;ne.EventEmitter=ne;ne.prototype._events=void 0;ne.prototype._eventsCount=0;ne.prototype._maxListeners=void 0;var jc=10;function _n(r){if(typeof r!="function")throw new TypeError('The "listener" argument must be of type Function. Received type '+typeof r)}Object.defineProperty(ne,"defaultMaxListeners",{enumerable:!0,get:function(){return jc},set:function(r){if(typeof r!="number"||r<0||Wc(r))throw new RangeError('The value of "defaultMaxListeners" is out of range. It must be a non-negative number. Received '+r+".");jc=r}});ne.init=function(){(this._events===void 0||this._events===Object.getPrototypeOf(this)._events)&&(this._events=Object.create(null),this._eventsCount=0),this._maxListeners=this._maxListeners||void 0};ne.prototype.setMaxListeners=function(e){if(typeof e!="number"||e<0||Wc(e))throw new RangeError('The value of "n" is out of range. It must be a non-negative number. Received '+e+".");return this._maxListeners=e,this};function Kc(r){return r._maxListeners===void 0?ne.defaultMaxListeners:r._maxListeners}ne.prototype.getMaxListeners=function(){return Kc(this)};ne.prototype.emit=function(e){for(var t=[],i=1;i<arguments.length;i++)t.push(arguments[i]);var n=e==="error",f=this._events;if(f!==void 0)n=n&&f.error===void 0;else if(!n)return!1;if(n){var a;if(t.length>0&&(a=t[0]),a instanceof Error)throw a;var o=new Error("Unhandled error."+(a?" ("+a.message+")":""));throw o.context=a,o}var u=f[e];if(u===void 0)return!1;if(typeof u=="function")Uc(u,this,t);else for(var v=u.length,h=Zc(u,v),i=0;i<v;++i)Uc(h[i],this,t);return!0};function Jc(r,e,t,i){var n,f,a;if(_n(t),f=r._events,f===void 0?(f=r._events=Object.create(null),r._eventsCount=0):(f.newListener!==void 0&&(r.emit("newListener",e,t.listener?t.listener:t),f=r._events),a=f[e]),a===void 0)a=f[e]=t,++r._eventsCount;else if(typeof a=="function"?a=f[e]=i?[t,a]:[a,t]:i?a.unshift(t):a.push(t),n=Kc(r),n>0&&a.length>n&&!a.warned){a.warned=!0;var o=new Error("Possible EventEmitter memory leak detected. "+a.length+" "+String(e)+" listeners added. Use emitter.setMaxListeners() to increase limit");o.name="MaxListenersExceededWarning",o.emitter=r,o.type=e,o.count=a.length,pv(o)}return r}ne.prototype.addListener=function(e,t){return Jc(this,e,t,!1)};ne.prototype.on=ne.prototype.addListener;ne.prototype.prependListener=function(e,t){return Jc(this,e,t,!0)};function xv(){if(!this.fired)return this.target.removeListener(this.type,this.wrapFn),this.fired=!0,arguments.length===0?this.listener.call(this.target):this.listener.apply(this.target,arguments)}function Xc(r,e,t){var i={fired:!1,wrapFn:void 0,target:r,type:e,listener:t},n=xv.bind(i);return n.listener=t,i.wrapFn=n,n}ne.prototype.once=function(e,t){return _n(t),this.on(e,Xc(this,e,t)),this};ne.prototype.prependOnceListener=function(e,t){return _n(t),this.prependListener(e,Xc(this,e,t)),this};ne.prototype.removeListener=function(e,t){var i,n,f,a,o;if(_n(t),n=this._events,n===void 0)return this;if(i=n[e],i===void 0)return this;if(i===t||i.listener===t)--this._eventsCount==0?this._events=Object.create(null):(delete n[e],n.removeListener&&this.emit("removeListener",e,i.listener||t));else if(typeof i!="function"){for(f=-1,a=i.length-1;a>=0;a--)if(i[a]===t||i[a].listener===t){o=i[a].listener,f=a;break}if(f<0)return this;f===0?i.shift():gv(i,f),i.length===1&&(n[e]=i[0]),n.removeListener!==void 0&&this.emit("removeListener",e,o||t)}return this};ne.prototype.off=ne.prototype.removeListener;ne.prototype.removeAllListeners=function(e){var t,i,n;if(i=this._events,i===void 0)return this;if(i.removeListener===void 0)return arguments.length===0?(this._events=Object.create(null),this._eventsCount=0):i[e]!==void 0&&(--this._eventsCount==0?this._events=Object.create(null):delete i[e]),this;if(arguments.length===0){var f=Object.keys(i),a;for(n=0;n<f.length;++n)a=f[n],a!=="removeListener"&&this.removeAllListeners(a);return this.removeAllListeners("removeListener"),this._events=Object.create(null),this._eventsCount=0,this}if(t=i[e],typeof t=="function")this.removeListener(e,t);else if(t!==void 0)for(n=t.length-1;n>=0;n--)this.removeListener(e,t[n]);return this};function Gc(r,e,t){var i=r._events;if(i===void 0)return[];var n=i[e];return n===void 0?[]:typeof n=="function"?t?[n.listener||n]:[n]:t?yv(n):Zc(n,n.length)}ne.prototype.listeners=function(e){return Gc(this,e,!0)};ne.prototype.rawListeners=function(e){return Gc(this,e,!1)};ne.listenerCount=function(r,e){return typeof r.listenerCount=="function"?r.listenerCount(e):Vc.call(r,e)};ne.prototype.listenerCount=Vc;function Vc(r){var e=this._events;if(e!==void 0){var t=e[r];if(typeof t=="function")return 1;if(t!==void 0)return t.length}return 0}ne.prototype.eventNames=function(){return this._eventsCount>0?yn(this._events):[]};function Zc(r,e){for(var t=new Array(e),i=0;i<e;++i)t[i]=r[i];return t}function gv(r,e){for(;e+1<r.length;e++)r[e]=r[e+1];r.pop()}function yv(r){for(var e=new Array(r.length),t=0;t<e.length;++t)e[t]=r[t].listener||r[t];return e}function _v(r,e){return new Promise(function(t,i){function n(a){r.removeListener(e,f),i(a)}function f(){typeof r.removeListener=="function"&&r.removeListener("error",n),t([].slice.call(arguments))}Yc(r,e,f,{once:!0}),e!=="error"&&mv(r,n,{once:!0})})}function mv(r,e,t){typeof r.on=="function"&&Yc(r,"error",e,t)}function Yc(r,e,t,i){if(typeof r.on=="function")i.once?r.once(e,t):r.on(e,t);else if(typeof r.addEventListener=="function")r.addEventListener(e,function n(f){i.once&&r.removeEventListener(e,n),t(f)});else throw new TypeError('The "emitter" argument must be of type EventEmitter. Received type '+typeof r)}});var wa=L((Xx,$c)=>{$c.exports=R0().EventEmitter});var q0=L(()=>{});var tu=L((Zx,ru)=>{"use strict";function Qc(r,e){var t=Object.keys(r);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(r);e&&(i=i.filter(function(n){return Object.getOwnPropertyDescriptor(r,n).enumerable})),t.push.apply(t,i)}return t}function wv(r){for(var e=1;e<arguments.length;e++){var t=arguments[e]!=null?arguments[e]:{};e%2?Qc(Object(t),!0).forEach(function(i){Sv(r,i,t[i])}):Object.getOwnPropertyDescriptors?Object.defineProperties(r,Object.getOwnPropertyDescriptors(t)):Qc(Object(t)).forEach(function(i){Object.defineProperty(r,i,Object.getOwnPropertyDescriptor(t,i))})}return r}function Sv(r,e,t){return e in r?Object.defineProperty(r,e,{value:t,enumerable:!0,configurable:!0,writable:!0}):r[e]=t,r}function Ev(r,e){if(!(r instanceof e))throw new TypeError("Cannot call a class as a function")}function eu(r,e){for(var t=0;t<e.length;t++){var i=e[t];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(r,i.key,i)}}function Mv(r,e,t){return e&&eu(r.prototype,e),t&&eu(r,t),r}var Av=st(),mn=Av.Buffer,Bv=q0(),Sa=Bv.inspect,Rv=Sa&&Sa.custom||"inspect";function qv(r,e,t){mn.prototype.copy.call(r,e,t)}ru.exports=function(){function r(){Ev(this,r),this.head=null,this.tail=null,this.length=0}return Mv(r,[{key:"push",value:function(t){var i={data:t,next:null};this.length>0?this.tail.next=i:this.head=i,this.tail=i,++this.length}},{key:"unshift",value:function(t){var i={data:t,next:this.head};this.length===0&&(this.tail=i),this.head=i,++this.length}},{key:"shift",value:function(){if(this.length!==0){var t=this.head.data;return this.length===1?this.head=this.tail=null:this.head=this.head.next,--this.length,t}}},{key:"clear",value:function(){this.head=this.tail=null,this.length=0}},{key:"join",value:function(t){if(this.length===0)return"";for(var i=this.head,n=""+i.data;i=i.next;)n+=t+i.data;return n}},{key:"concat",value:function(t){if(this.length===0)return mn.alloc(0);for(var i=mn.allocUnsafe(t>>>0),n=this.head,f=0;n;)qv(n.data,i,f),f+=n.data.length,n=n.next;return i}},{key:"consume",value:function(t,i){var n;return t<this.head.data.length?(n=this.head.data.slice(0,t),this.head.data=this.head.data.slice(t)):t===this.head.data.length?n=this.shift():n=i?this._getString(t):this._getBuffer(t),n}},{key:"first",value:function(){return this.head.data}},{key:"_getString",value:function(t){var i=this.head,n=1,f=i.data;for(t-=f.length;i=i.next;){var a=i.data,o=t>a.length?a.length:t;if(o===a.length?f+=a:f+=a.slice(0,t),t-=o,t===0){o===a.length?(++n,i.next?this.head=i.next:this.head=this.tail=null):(this.head=i,i.data=a.slice(o));break}++n}return this.length-=n,f}},{key:"_getBuffer",value:function(t){var i=mn.allocUnsafe(t),n=this.head,f=1;for(n.data.copy(i),t-=n.data.length;n=n.next;){var a=n.data,o=t>a.length?a.length:t;if(a.copy(i,i.length-t,0,o),t-=o,t===0){o===a.length?(++f,n.next?this.head=n.next:this.head=this.tail=null):(this.head=n,n.data=a.slice(o));break}++f}return this.length-=f,i}},{key:Rv,value:function(t,i){return Sa(this,wv({},i,{depth:0,customInspect:!1}))}}]),r}()});var Ma=L((Yx,nu)=>{"use strict";function Cv(r,e){var t=this,i=this._readableState&&this._readableState.destroyed,n=this._writableState&&this._writableState.destroyed;return i||n?(e?e(r):r&&(this._writableState?this._writableState.errorEmitted||(this._writableState.errorEmitted=!0,process.nextTick(Ea,this,r)):process.nextTick(Ea,this,r)),this):(this._readableState&&(this._readableState.destroyed=!0),this._writableState&&(this._writableState.destroyed=!0),this._destroy(r||null,function(f){!e&&f?t._writableState?t._writableState.errorEmitted?process.nextTick(wn,t):(t._writableState.errorEmitted=!0,process.nextTick(iu,t,f)):process.nextTick(iu,t,f):e?(process.nextTick(wn,t),e(f)):process.nextTick(wn,t)}),this)}function iu(r,e){Ea(r,e),wn(r)}function wn(r){r._writableState&&!r._writableState.emitClose||r._readableState&&!r._readableState.emitClose||r.emit("close")}function Iv(){this._readableState&&(this._readableState.destroyed=!1,this._readableState.reading=!1,this._readableState.ended=!1,this._readableState.endEmitted=!1),this._writableState&&(this._writableState.destroyed=!1,this._writableState.ended=!1,this._writableState.ending=!1,this._writableState.finalCalled=!1,this._writableState.prefinished=!1,this._writableState.finished=!1,this._writableState.errorEmitted=!1)}function Ea(r,e){r.emit("error",e)}function kv(r,e){var t=r._readableState,i=r._writableState;t&&t.autoDestroy||i&&i.autoDestroy?r.destroy(e):r.emit("error",e)}nu.exports={destroy:Cv,undestroy:Iv,errorOrDestroy:kv}});var It=L(($x,su)=>{"use strict";function Tv(r,e){r.prototype=Object.create(e.prototype),r.prototype.constructor=r,r.__proto__=e}var fu={};function pr(r,e,t){t||(t=Error);function i(f,a,o){return typeof e=="string"?e:e(f,a,o)}var n=function(f){Tv(a,f);function a(o,u,v){return f.call(this,i(o,u,v))||this}return a}(t);n.prototype.name=t.name,n.prototype.code=r,fu[r]=n}function au(r,e){if(Array.isArray(r)){var t=r.length;return r=r.map(function(i){return String(i)}),t>2?"one of ".concat(e," ").concat(r.slice(0,t-1).join(", "),", or ")+r[t-1]:t===2?"one of ".concat(e," ").concat(r[0]," or ").concat(r[1]):"of ".concat(e," ").concat(r[0])}else return"of ".concat(e," ").concat(String(r))}function Pv(r,e,t){return r.substr(!t||t<0?0:+t,e.length)===e}function Fv(r,e,t){return(t===void 0||t>r.length)&&(t=r.length),r.substring(t-e.length,t)===e}function Lv(r,e,t){return typeof t!="number"&&(t=0),t+e.length>r.length?!1:r.indexOf(e,t)!==-1}pr("ERR_INVALID_OPT_VALUE",function(r,e){return'The value "'+e+'" is invalid for option "'+r+'"'},TypeError);pr("ERR_INVALID_ARG_TYPE",function(r,e,t){var i;typeof e=="string"&&Pv(e,"not ")?(i="must not be",e=e.replace(/^not /,"")):i="must be";var n;if(Fv(r," argument"))n="The ".concat(r," ").concat(i," ").concat(au(e,"type"));else{var f=Lv(r,".")?"property":"argument";n='The "'.concat(r,'" ').concat(f," ").concat(i," ").concat(au(e,"type"))}return n+=". Received type ".concat(typeof t),n},TypeError);pr("ERR_STREAM_PUSH_AFTER_EOF","stream.push() after EOF");pr("ERR_METHOD_NOT_IMPLEMENTED",function(r){return"The "+r+" method is not implemented"});pr("ERR_STREAM_PREMATURE_CLOSE","Premature close");pr("ERR_STREAM_DESTROYED",function(r){return"Cannot call "+r+" after a stream was destroyed"});pr("ERR_MULTIPLE_CALLBACK","Callback called multiple times");pr("ERR_STREAM_CANNOT_PIPE","Cannot pipe, not readable");pr("ERR_STREAM_WRITE_AFTER_END","write after end");pr("ERR_STREAM_NULL_VALUES","May not write null values to stream",TypeError);pr("ERR_UNKNOWN_ENCODING",function(r){return"Unknown encoding: "+r},TypeError);pr("ERR_STREAM_UNSHIFT_AFTER_END_EVENT","stream.unshift() after end event");su.exports.codes=fu});var Aa=L((Qx,ou)=>{"use strict";var Nv=It().codes.ERR_INVALID_OPT_VALUE;function Dv(r,e,t){return r.highWaterMark!=null?r.highWaterMark:e?r[t]:null}function Ov(r,e,t,i){var n=Dv(e,i,t);if(n!=null){if(!(isFinite(n)&&Math.floor(n)===n)||n<0){var f=i?t:"highWaterMark";throw new Nv(f,n)}return Math.floor(n)}return r.objectMode?16:16*1024}ou.exports={getHighWaterMark:Ov}});var Ra=L((e5,du)=>{du.exports=Hv;function Hv(r,e){if(Ba("noDeprecation"))return r;var t=!1;function i(){if(!t){if(Ba("throwDeprecation"))throw new Error(e);Ba("traceDeprecation")?console.trace(e):console.warn(e),t=!0}return r.apply(this,arguments)}return i}function Ba(r){try{if(!global.localStorage)return!1}catch(t){return!1}var e=global.localStorage[r];return e==null?!1:String(e).toLowerCase()==="true"}});var Ia=L((r5,vu)=>{"use strict";vu.exports=Pe;function cu(r){var e=this;this.next=null,this.entry=null,this.finish=function(){l4(e,r)}}var f0;Pe.WritableState=C0;var zv={deprecate:Ra()},uu=wa(),Sn=st().Buffer,Uv=global.Uint8Array||function(){};function Wv(r){return Sn.from(r)}function jv(r){return Sn.isBuffer(r)||r instanceof Uv}var qa=Ma(),Kv=Aa(),Jv=Kv.getHighWaterMark,ot=It().codes,Xv=ot.ERR_INVALID_ARG_TYPE,Gv=ot.ERR_METHOD_NOT_IMPLEMENTED,Vv=ot.ERR_MULTIPLE_CALLBACK,Zv=ot.ERR_STREAM_CANNOT_PIPE,Yv=ot.ERR_STREAM_DESTROYED,$v=ot.ERR_STREAM_NULL_VALUES,Qv=ot.ERR_STREAM_WRITE_AFTER_END,e4=ot.ERR_UNKNOWN_ENCODING,a0=qa.errorOrDestroy;ie()(Pe,uu);function r4(){}function C0(r,e,t){f0=f0||kt(),r=r||{},typeof t!="boolean"&&(t=e instanceof f0),this.objectMode=!!r.objectMode,t&&(this.objectMode=this.objectMode||!!r.writableObjectMode),this.highWaterMark=Jv(this,r,"writableHighWaterMark",t),this.finalCalled=!1,this.needDrain=!1,this.ending=!1,this.ended=!1,this.finished=!1,this.destroyed=!1;var i=r.decodeStrings===!1;this.decodeStrings=!i,this.defaultEncoding=r.defaultEncoding||"utf8",this.length=0,this.writing=!1,this.corked=0,this.sync=!0,this.bufferProcessing=!1,this.onwrite=function(n){o4(e,n)},this.writecb=null,this.writelen=0,this.bufferedRequest=null,this.lastBufferedRequest=null,this.pendingcb=0,this.prefinished=!1,this.errorEmitted=!1,this.emitClose=r.emitClose!==!1,this.autoDestroy=!!r.autoDestroy,this.bufferedRequestCount=0,this.corkedRequestsFree=new cu(this)}C0.prototype.getBuffer=function(){for(var e=this.bufferedRequest,t=[];e;)t.push(e),e=e.next;return t};(function(){try{Object.defineProperty(C0.prototype,"buffer",{get:zv.deprecate(function(){return this.getBuffer()},"_writableState.buffer is deprecated. Use _writableState.getBuffer instead.","DEP0003")})}catch(r){}})();var En;typeof Symbol=="function"&&Symbol.hasInstance&&typeof Function.prototype[Symbol.hasInstance]=="function"?(En=Function.prototype[Symbol.hasInstance],Object.defineProperty(Pe,Symbol.hasInstance,{value:function(e){return En.call(this,e)?!0:this!==Pe?!1:e&&e._writableState instanceof C0}})):En=function(e){return e instanceof this};function Pe(r){f0=f0||kt();var e=this instanceof f0;if(!e&&!En.call(Pe,this))return new Pe(r);this._writableState=new C0(r,this,e),this.writable=!0,r&&(typeof r.write=="function"&&(this._write=r.write),typeof r.writev=="function"&&(this._writev=r.writev),typeof r.destroy=="function"&&(this._destroy=r.destroy),typeof r.final=="function"&&(this._final=r.final)),uu.call(this)}Pe.prototype.pipe=function(){a0(this,new Zv)};function t4(r,e){var t=new Qv;a0(r,t),process.nextTick(e,t)}function i4(r,e,t,i){var n;return t===null?n=new $v:typeof t!="string"&&!e.objectMode&&(n=new Xv("chunk",["string","Buffer"],t)),n?(a0(r,n),process.nextTick(i,n),!1):!0}Pe.prototype.write=function(r,e,t){var i=this._writableState,n=!1,f=!i.objectMode&&jv(r);return f&&!Sn.isBuffer(r)&&(r=Wv(r)),typeof e=="function"&&(t=e,e=null),f?e="buffer":e||(e=i.defaultEncoding),typeof t!="function"&&(t=r4),i.ending?t4(this,t):(f||i4(this,i,r,t))&&(i.pendingcb++,n=f4(this,i,f,r,e,t)),n};Pe.prototype.cork=function(){this._writableState.corked++};Pe.prototype.uncork=function(){var r=this._writableState;r.corked&&(r.corked--,!r.writing&&!r.corked&&!r.bufferProcessing&&r.bufferedRequest&&lu(this,r))};Pe.prototype.setDefaultEncoding=function(e){if(typeof e=="string"&&(e=e.toLowerCase()),!(["hex","utf8","utf-8","ascii","binary","base64","ucs2","ucs-2","utf16le","utf-16le","raw"].indexOf((e+"").toLowerCase())>-1))throw new e4(e);return this._writableState.defaultEncoding=e,this};Object.defineProperty(Pe.prototype,"writableBuffer",{enumerable:!1,get:function(){return this._writableState&&this._writableState.getBuffer()}});function n4(r,e,t){return!r.objectMode&&r.decodeStrings!==!1&&typeof e=="string"&&(e=Sn.from(e,t)),e}Object.defineProperty(Pe.prototype,"writableHighWaterMark",{enumerable:!1,get:function(){return this._writableState.highWaterMark}});function f4(r,e,t,i,n,f){if(!t){var a=n4(e,i,n);i!==a&&(t=!0,n="buffer",i=a)}var o=e.objectMode?1:i.length;e.length+=o;var u=e.length<e.highWaterMark;if(u||(e.needDrain=!0),e.writing||e.corked){var v=e.lastBufferedRequest;e.lastBufferedRequest={chunk:i,encoding:n,isBuf:t,callback:f,next:null},v?v.next=e.lastBufferedRequest:e.bufferedRequest=e.lastBufferedRequest,e.bufferedRequestCount+=1}else Ca(r,e,!1,o,i,n,f);return u}function Ca(r,e,t,i,n,f,a){e.writelen=i,e.writecb=a,e.writing=!0,e.sync=!0,e.destroyed?e.onwrite(new Yv("write")):t?r._writev(n,e.onwrite):r._write(n,f,e.onwrite),e.sync=!1}function a4(r,e,t,i,n){--e.pendingcb,t?(process.nextTick(n,i),process.nextTick(I0,r,e),r._writableState.errorEmitted=!0,a0(r,i)):(n(i),r._writableState.errorEmitted=!0,a0(r,i),I0(r,e))}function s4(r){r.writing=!1,r.writecb=null,r.length-=r.writelen,r.writelen=0}function o4(r,e){var t=r._writableState,i=t.sync,n=t.writecb;if(typeof n!="function")throw new Vv;if(s4(t),e)a4(r,t,i,e,n);else{var f=bu(t)||r.destroyed;!f&&!t.corked&&!t.bufferProcessing&&t.bufferedRequest&&lu(r,t),i?process.nextTick(hu,r,t,f,n):hu(r,t,f,n)}}function hu(r,e,t,i){t||d4(r,e),e.pendingcb--,i(),I0(r,e)}function d4(r,e){e.length===0&&e.needDrain&&(e.needDrain=!1,r.emit("drain"))}function lu(r,e){e.bufferProcessing=!0;var t=e.bufferedRequest;if(r._writev&&t&&t.next){var i=e.bufferedRequestCount,n=new Array(i),f=e.corkedRequestsFree;f.entry=t;for(var a=0,o=!0;t;)n[a]=t,t.isBuf||(o=!1),t=t.next,a+=1;n.allBuffers=o,Ca(r,e,!0,e.length,n,"",f.finish),e.pendingcb++,e.lastBufferedRequest=null,f.next?(e.corkedRequestsFree=f.next,f.next=null):e.corkedRequestsFree=new cu(e),e.bufferedRequestCount=0}else{for(;t;){var u=t.chunk,v=t.encoding,h=t.callback,l=e.objectMode?1:u.length;if(Ca(r,e,!1,l,u,v,h),t=t.next,e.bufferedRequestCount--,e.writing)break}t===null&&(e.lastBufferedRequest=null)}e.bufferedRequest=t,e.bufferProcessing=!1}Pe.prototype._write=function(r,e,t){t(new Gv("_write()"))};Pe.prototype._writev=null;Pe.prototype.end=function(r,e,t){var i=this._writableState;return typeof r=="function"?(t=r,r=null,e=null):typeof e=="function"&&(t=e,e=null),r!=null&&this.write(r,e),i.corked&&(i.corked=1,this.uncork()),i.ending||h4(this,i,t),this};Object.defineProperty(Pe.prototype,"writableLength",{enumerable:!1,get:function(){return this._writableState.length}});function bu(r){return r.ending&&r.length===0&&r.bufferedRequest===null&&!r.finished&&!r.writing}function c4(r,e){r._final(function(t){e.pendingcb--,t&&a0(r,t),e.prefinished=!0,r.emit("prefinish"),I0(r,e)})}function u4(r,e){!e.prefinished&&!e.finalCalled&&(typeof r._final=="function"&&!e.destroyed?(e.pendingcb++,e.finalCalled=!0,process.nextTick(c4,r,e)):(e.prefinished=!0,r.emit("prefinish")))}function I0(r,e){var t=bu(e);if(t&&(u4(r,e),e.pendingcb===0&&(e.finished=!0,r.emit("finish"),e.autoDestroy))){var i=r._readableState;(!i||i.autoDestroy&&i.endEmitted)&&r.destroy()}return t}function h4(r,e,t){e.ending=!0,I0(r,e),t&&(e.finished?process.nextTick(t):r.once("finish",t)),e.ended=!0,r.writable=!1}function l4(r,e,t){var i=r.entry;for(r.entry=null;i;){var n=i.callback;e.pendingcb--,n(t),i=i.next}e.corkedRequestsFree.next=r}Object.defineProperty(Pe.prototype,"destroyed",{enumerable:!1,get:function(){return this._writableState===void 0?!1:this._writableState.destroyed},set:function(e){!this._writableState||(this._writableState.destroyed=e)}});Pe.prototype.destroy=qa.destroy;Pe.prototype._undestroy=qa.undestroy;Pe.prototype._destroy=function(r,e){e(r)}});var kt=L((t5,xu)=>{"use strict";var b4=Object.keys||function(r){var e=[];for(var t in r)e.push(t);return e};xu.exports=Pr;var pu=Pa(),ka=Ia();ie()(Pr,pu);for(Ta=b4(ka.prototype),Mn=0;Mn<Ta.length;Mn++)An=Ta[Mn],Pr.prototype[An]||(Pr.prototype[An]=ka.prototype[An]);var Ta,An,Mn;function Pr(r){if(!(this instanceof Pr))return new Pr(r);pu.call(this,r),ka.call(this,r),this.allowHalfOpen=!0,r&&(r.readable===!1&&(this.readable=!1),r.writable===!1&&(this.writable=!1),r.allowHalfOpen===!1&&(this.allowHalfOpen=!1,this.once("end",v4)))}Object.defineProperty(Pr.prototype,"writableHighWaterMark",{enumerable:!1,get:function(){return this._writableState.highWaterMark}});Object.defineProperty(Pr.prototype,"writableBuffer",{enumerable:!1,get:function(){return this._writableState&&this._writableState.getBuffer()}});Object.defineProperty(Pr.prototype,"writableLength",{enumerable:!1,get:function(){return this._writableState.length}});function v4(){this._writableState.ended||process.nextTick(p4,this)}function p4(r){r.end()}Object.defineProperty(Pr.prototype,"destroyed",{enumerable:!1,get:function(){return this._readableState===void 0||this._writableState===void 0?!1:this._readableState.destroyed&&this._writableState.destroyed},set:function(e){this._readableState===void 0||this._writableState===void 0||(this._readableState.destroyed=e,this._writableState.destroyed=e)}})});var Bn=L(yu=>{"use strict";var Fa=Ve().Buffer,gu=Fa.isEncoding||function(r){switch(r=""+r,r&&r.toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"binary":case"base64":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":case"raw":return!0;default:return!1}};function x4(r){if(!r)return"utf8";for(var e;;)switch(r){case"utf8":case"utf-8":return"utf8";case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return"utf16le";case"latin1":case"binary":return"latin1";case"base64":case"ascii":case"hex":return r;default:if(e)return;r=(""+r).toLowerCase(),e=!0}}function g4(r){var e=x4(r);if(typeof e!="string"&&(Fa.isEncoding===gu||!gu(r)))throw new Error("Unknown encoding: "+r);return e||r}yu.StringDecoder=k0;function k0(r){this.encoding=g4(r);var e;switch(this.encoding){case"utf16le":this.text=E4,this.end=M4,e=4;break;case"utf8":this.fillLast=m4,e=4;break;case"base64":this.text=A4,this.end=B4,e=3;break;default:this.write=R4,this.end=q4;return}this.lastNeed=0,this.lastTotal=0,this.lastChar=Fa.allocUnsafe(e)}k0.prototype.write=function(r){if(r.length===0)return"";var e,t;if(this.lastNeed){if(e=this.fillLast(r),e===void 0)return"";t=this.lastNeed,this.lastNeed=0}else t=0;return t<r.length?e?e+this.text(r,t):this.text(r,t):e||""};k0.prototype.end=S4;k0.prototype.text=w4;k0.prototype.fillLast=function(r){if(this.lastNeed<=r.length)return r.copy(this.lastChar,this.lastTotal-this.lastNeed,0,this.lastNeed),this.lastChar.toString(this.encoding,0,this.lastTotal);r.copy(this.lastChar,this.lastTotal-this.lastNeed,0,r.length),this.lastNeed-=r.length};function La(r){return r<=127?0:r>>5==6?2:r>>4==14?3:r>>3==30?4:r>>6==2?-1:-2}function y4(r,e,t){var i=e.length-1;if(i<t)return 0;var n=La(e[i]);return n>=0?(n>0&&(r.lastNeed=n-1),n):--i<t||n===-2?0:(n=La(e[i]),n>=0?(n>0&&(r.lastNeed=n-2),n):--i<t||n===-2?0:(n=La(e[i]),n>=0?(n>0&&(n===2?n=0:r.lastNeed=n-3),n):0))}function _4(r,e,t){if((e[0]&192)!=128)return r.lastNeed=0,"\uFFFD";if(r.lastNeed>1&&e.length>1){if((e[1]&192)!=128)return r.lastNeed=1,"\uFFFD";if(r.lastNeed>2&&e.length>2&&(e[2]&192)!=128)return r.lastNeed=2,"\uFFFD"}}function m4(r){var e=this.lastTotal-this.lastNeed,t=_4(this,r,e);if(t!==void 0)return t;if(this.lastNeed<=r.length)return r.copy(this.lastChar,e,0,this.lastNeed),this.lastChar.toString(this.encoding,0,this.lastTotal);r.copy(this.lastChar,e,0,r.length),this.lastNeed-=r.length}function w4(r,e){var t=y4(this,r,e);if(!this.lastNeed)return r.toString("utf8",e);this.lastTotal=t;var i=r.length-(t-this.lastNeed);return r.copy(this.lastChar,0,i),r.toString("utf8",e,i)}function S4(r){var e=r&&r.length?this.write(r):"";return this.lastNeed?e+"\uFFFD":e}function E4(r,e){if((r.length-e)%2==0){var t=r.toString("utf16le",e);if(t){var i=t.charCodeAt(t.length-1);if(i>=55296&&i<=56319)return this.lastNeed=2,this.lastTotal=4,this.lastChar[0]=r[r.length-2],this.lastChar[1]=r[r.length-1],t.slice(0,-1)}return t}return this.lastNeed=1,this.lastTotal=2,this.lastChar[0]=r[r.length-1],r.toString("utf16le",e,r.length-1)}function M4(r){var e=r&&r.length?this.write(r):"";if(this.lastNeed){var t=this.lastTotal-this.lastNeed;return e+this.lastChar.toString("utf16le",0,t)}return e}function A4(r,e){var t=(r.length-e)%3;return t===0?r.toString("base64",e):(this.lastNeed=3-t,this.lastTotal=3,t===1?this.lastChar[0]=r[r.length-1]:(this.lastChar[0]=r[r.length-2],this.lastChar[1]=r[r.length-1]),r.toString("base64",e,r.length-t))}function B4(r){var e=r&&r.length?this.write(r):"";return this.lastNeed?e+this.lastChar.toString("base64",0,3-this.lastNeed):e}function R4(r){return r.toString(this.encoding)}function q4(r){return r&&r.length?this.write(r):""}});var Rn=L((n5,wu)=>{"use strict";var _u=It().codes.ERR_STREAM_PREMATURE_CLOSE;function C4(r){var e=!1;return function(){if(!e){e=!0;for(var t=arguments.length,i=new Array(t),n=0;n<t;n++)i[n]=arguments[n];r.apply(this,i)}}}function I4(){}function k4(r){return r.setHeader&&typeof r.abort=="function"}function mu(r,e,t){if(typeof e=="function")return mu(r,null,e);e||(e={}),t=C4(t||I4);var i=e.readable||e.readable!==!1&&r.readable,n=e.writable||e.writable!==!1&&r.writable,f=function(){r.writable||o()},a=r._writableState&&r._writableState.finished,o=function(){n=!1,a=!0,i||t.call(r)},u=r._readableState&&r._readableState.endEmitted,v=function(){i=!1,u=!0,n||t.call(r)},h=function(E){t.call(r,E)},l=function(){var E;if(i&&!u)return(!r._readableState||!r._readableState.ended)&&(E=new _u),t.call(r,E);if(n&&!a)return(!r._writableState||!r._writableState.ended)&&(E=new _u),t.call(r,E)},x=function(){r.req.on("finish",o)};return k4(r)?(r.on("complete",o),r.on("abort",l),r.req?x():r.on("request",x)):n&&!r._writableState&&(r.on("end",f),r.on("close",f)),r.on("end",v),r.on("finish",o),e.error!==!1&&r.on("error",h),r.on("close",l),function(){r.removeListener("complete",o),r.removeListener("abort",l),r.removeListener("request",x),r.req&&r.req.removeListener("finish",o),r.removeListener("end",f),r.removeListener("close",f),r.removeListener("finish",o),r.removeListener("end",v),r.removeListener("error",h),r.removeListener("close",l)}}wu.exports=mu});var Eu=L((f5,Su)=>{"use strict";var qn;function dt(r,e,t){return e in r?Object.defineProperty(r,e,{value:t,enumerable:!0,configurable:!0,writable:!0}):r[e]=t,r}var T4=Rn(),ct=Symbol("lastResolve"),Tt=Symbol("lastReject"),T0=Symbol("error"),Cn=Symbol("ended"),Pt=Symbol("lastPromise"),Na=Symbol("handlePromise"),Ft=Symbol("stream");function ut(r,e){return{value:r,done:e}}function P4(r){var e=r[ct];if(e!==null){var t=r[Ft].read();t!==null&&(r[Pt]=null,r[ct]=null,r[Tt]=null,e(ut(t,!1)))}}function F4(r){process.nextTick(P4,r)}function L4(r,e){return function(t,i){r.then(function(){if(e[Cn]){t(ut(void 0,!0));return}e[Na](t,i)},i)}}var N4=Object.getPrototypeOf(function(){}),D4=Object.setPrototypeOf((qn={get stream(){return this[Ft]},next:function(){var e=this,t=this[T0];if(t!==null)return Promise.reject(t);if(this[Cn])return Promise.resolve(ut(void 0,!0));if(this[Ft].destroyed)return new Promise(function(a,o){process.nextTick(function(){e[T0]?o(e[T0]):a(ut(void 0,!0))})});var i=this[Pt],n;if(i)n=new Promise(L4(i,this));else{var f=this[Ft].read();if(f!==null)return Promise.resolve(ut(f,!1));n=new Promise(this[Na])}return this[Pt]=n,n}},dt(qn,Symbol.asyncIterator,function(){return this}),dt(qn,"return",function(){var e=this;return new Promise(function(t,i){e[Ft].destroy(null,function(n){if(n){i(n);return}t(ut(void 0,!0))})})}),qn),N4),O4=function(e){var t,i=Object.create(D4,(t={},dt(t,Ft,{value:e,writable:!0}),dt(t,ct,{value:null,writable:!0}),dt(t,Tt,{value:null,writable:!0}),dt(t,T0,{value:null,writable:!0}),dt(t,Cn,{value:e._readableState.endEmitted,writable:!0}),dt(t,Na,{value:function(f,a){var o=i[Ft].read();o?(i[Pt]=null,i[ct]=null,i[Tt]=null,f(ut(o,!1))):(i[ct]=f,i[Tt]=a)},writable:!0}),t));return i[Pt]=null,T4(e,function(n){if(n&&n.code!=="ERR_STREAM_PREMATURE_CLOSE"){var f=i[Tt];f!==null&&(i[Pt]=null,i[ct]=null,i[Tt]=null,f(n)),i[T0]=n;return}var a=i[ct];a!==null&&(i[Pt]=null,i[ct]=null,i[Tt]=null,a(ut(void 0,!0))),i[Cn]=!0}),e.on("readable",F4.bind(null,i)),i};Su.exports=O4});var Au=L((a5,Mu)=>{Mu.exports=function(){throw new Error("Readable.from is not available in the browser")}});var Pa=L((o5,Lu)=>{"use strict";Lu.exports=Y;var s0;Y.ReadableState=Ru;var s5=R0().EventEmitter,Bu=function(e,t){return e.listeners(t).length},P0=wa(),In=st().Buffer,H4=global.Uint8Array||function(){};function z4(r){return In.from(r)}function U4(r){return In.isBuffer(r)||r instanceof H4}var Da=q0(),K;Da&&Da.debuglog?K=Da.debuglog("stream"):K=function(){};var W4=tu(),Oa=Ma(),j4=Aa(),K4=j4.getHighWaterMark,kn=It().codes,J4=kn.ERR_INVALID_ARG_TYPE,X4=kn.ERR_STREAM_PUSH_AFTER_EOF,G4=kn.ERR_METHOD_NOT_IMPLEMENTED,V4=kn.ERR_STREAM_UNSHIFT_AFTER_END_EVENT,o0,Ha,za;ie()(Y,P0);var F0=Oa.errorOrDestroy,Ua=["error","close","destroy","pause","resume"];function Z4(r,e,t){if(typeof r.prependListener=="function")return r.prependListener(e,t);!r._events||!r._events[e]?r.on(e,t):Array.isArray(r._events[e])?r._events[e].unshift(t):r._events[e]=[t,r._events[e]]}function Ru(r,e,t){s0=s0||kt(),r=r||{},typeof t!="boolean"&&(t=e instanceof s0),this.objectMode=!!r.objectMode,t&&(this.objectMode=this.objectMode||!!r.readableObjectMode),this.highWaterMark=K4(this,r,"readableHighWaterMark",t),this.buffer=new W4,this.length=0,this.pipes=null,this.pipesCount=0,this.flowing=null,this.ended=!1,this.endEmitted=!1,this.reading=!1,this.sync=!0,this.needReadable=!1,this.emittedReadable=!1,this.readableListening=!1,this.resumeScheduled=!1,this.paused=!0,this.emitClose=r.emitClose!==!1,this.autoDestroy=!!r.autoDestroy,this.destroyed=!1,this.defaultEncoding=r.defaultEncoding||"utf8",this.awaitDrain=0,this.readingMore=!1,this.decoder=null,this.encoding=null,r.encoding&&(o0||(o0=Bn().StringDecoder),this.decoder=new o0(r.encoding),this.encoding=r.encoding)}function Y(r){if(s0=s0||kt(),!(this instanceof Y))return new Y(r);var e=this instanceof s0;this._readableState=new Ru(r,this,e),this.readable=!0,r&&(typeof r.read=="function"&&(this._read=r.read),typeof r.destroy=="function"&&(this._destroy=r.destroy)),P0.call(this)}Object.defineProperty(Y.prototype,"destroyed",{enumerable:!1,get:function(){return this._readableState===void 0?!1:this._readableState.destroyed},set:function(e){!this._readableState||(this._readableState.destroyed=e)}});Y.prototype.destroy=Oa.destroy;Y.prototype._undestroy=Oa.undestroy;Y.prototype._destroy=function(r,e){e(r)};Y.prototype.push=function(r,e){var t=this._readableState,i;return t.objectMode?i=!0:typeof r=="string"&&(e=e||t.defaultEncoding,e!==t.encoding&&(r=In.from(r,e),e=""),i=!0),qu(this,r,e,!1,i)};Y.prototype.unshift=function(r){return qu(this,r,null,!0,!1)};function qu(r,e,t,i,n){K("readableAddChunk",e);var f=r._readableState;if(e===null)f.reading=!1,Q4(r,f);else{var a;if(n||(a=Y4(f,e)),a)F0(r,a);else if(f.objectMode||e&&e.length>0)if(typeof e!="string"&&!f.objectMode&&Object.getPrototypeOf(e)!==In.prototype&&(e=z4(e)),i)f.endEmitted?F0(r,new V4):Wa(r,f,e,!0);else if(f.ended)F0(r,new X4);else{if(f.destroyed)return!1;f.reading=!1,f.decoder&&!t?(e=f.decoder.write(e),f.objectMode||e.length!==0?Wa(r,f,e,!1):ja(r,f)):Wa(r,f,e,!1)}else i||(f.reading=!1,ja(r,f))}return!f.ended&&(f.length<f.highWaterMark||f.length===0)}function Wa(r,e,t,i){e.flowing&&e.length===0&&!e.sync?(e.awaitDrain=0,r.emit("data",t)):(e.length+=e.objectMode?1:t.length,i?e.buffer.unshift(t):e.buffer.push(t),e.needReadable&&Tn(r)),ja(r,e)}function Y4(r,e){var t;return!U4(e)&&typeof e!="string"&&e!==void 0&&!r.objectMode&&(t=new J4("chunk",["string","Buffer","Uint8Array"],e)),t}Y.prototype.isPaused=function(){return this._readableState.flowing===!1};Y.prototype.setEncoding=function(r){o0||(o0=Bn().StringDecoder);var e=new o0(r);this._readableState.decoder=e,this._readableState.encoding=this._readableState.decoder.encoding;for(var t=this._readableState.buffer.head,i="";t!==null;)i+=e.write(t.data),t=t.next;return this._readableState.buffer.clear(),i!==""&&this._readableState.buffer.push(i),this._readableState.length=i.length,this};var Cu=1073741824;function $4(r){return r>=Cu?r=Cu:(r--,r|=r>>>1,r|=r>>>2,r|=r>>>4,r|=r>>>8,r|=r>>>16,r++),r}function Iu(r,e){return r<=0||e.length===0&&e.ended?0:e.objectMode?1:r!==r?e.flowing&&e.length?e.buffer.head.data.length:e.length:(r>e.highWaterMark&&(e.highWaterMark=$4(r)),r<=e.length?r:e.ended?e.length:(e.needReadable=!0,0))}Y.prototype.read=function(r){K("read",r),r=parseInt(r,10);var e=this._readableState,t=r;if(r!==0&&(e.emittedReadable=!1),r===0&&e.needReadable&&((e.highWaterMark!==0?e.length>=e.highWaterMark:e.length>0)||e.ended))return K("read: emitReadable",e.length,e.ended),e.length===0&&e.ended?Ja(this):Tn(this),null;if(r=Iu(r,e),r===0&&e.ended)return e.length===0&&Ja(this),null;var i=e.needReadable;K("need readable",i),(e.length===0||e.length-r<e.highWaterMark)&&(i=!0,K("length less than watermark",i)),e.ended||e.reading?(i=!1,K("reading or ended",i)):i&&(K("do read"),e.reading=!0,e.sync=!0,e.length===0&&(e.needReadable=!0),this._read(e.highWaterMark),e.sync=!1,e.reading||(r=Iu(t,e)));var n;return r>0?n=Pu(r,e):n=null,n===null?(e.needReadable=e.length<=e.highWaterMark,r=0):(e.length-=r,e.awaitDrain=0),e.length===0&&(e.ended||(e.needReadable=!0),t!==r&&e.ended&&Ja(this)),n!==null&&this.emit("data",n),n};function Q4(r,e){if(K("onEofChunk"),!e.ended){if(e.decoder){var t=e.decoder.end();t&&t.length&&(e.buffer.push(t),e.length+=e.objectMode?1:t.length)}e.ended=!0,e.sync?Tn(r):(e.needReadable=!1,e.emittedReadable||(e.emittedReadable=!0,ku(r)))}}function Tn(r){var e=r._readableState;K("emitReadable",e.needReadable,e.emittedReadable),e.needReadable=!1,e.emittedReadable||(K("emitReadable",e.flowing),e.emittedReadable=!0,process.nextTick(ku,r))}function ku(r){var e=r._readableState;K("emitReadable_",e.destroyed,e.length,e.ended),!e.destroyed&&(e.length||e.ended)&&(r.emit("readable"),e.emittedReadable=!1),e.needReadable=!e.flowing&&!e.ended&&e.length<=e.highWaterMark,Ka(r)}function ja(r,e){e.readingMore||(e.readingMore=!0,process.nextTick(ep,r,e))}function ep(r,e){for(;!e.reading&&!e.ended&&(e.length<e.highWaterMark||e.flowing&&e.length===0);){var t=e.length;if(K("maybeReadMore read 0"),r.read(0),t===e.length)break}e.readingMore=!1}Y.prototype._read=function(r){F0(this,new G4("_read()"))};Y.prototype.pipe=function(r,e){var t=this,i=this._readableState;switch(i.pipesCount){case 0:i.pipes=r;break;case 1:i.pipes=[i.pipes,r];break;default:i.pipes.push(r);break}i.pipesCount+=1,K("pipe count=%d opts=%j",i.pipesCount,e);var n=(!e||e.end!==!1)&&r!==process.stdout&&r!==process.stderr,f=n?o:R;i.endEmitted?process.nextTick(f):t.once("end",f),r.on("unpipe",a);function a(A,_){K("onunpipe"),A===t&&_&&_.hasUnpiped===!1&&(_.hasUnpiped=!0,h())}function o(){K("onend"),r.end()}var u=rp(t);r.on("drain",u);var v=!1;function h(){K("cleanup"),r.removeListener("close",y),r.removeListener("finish",E),r.removeListener("drain",u),r.removeListener("error",x),r.removeListener("unpipe",a),t.removeListener("end",o),t.removeListener("end",R),t.removeListener("data",l),v=!0,i.awaitDrain&&(!r._writableState||r._writableState.needDrain)&&u()}t.on("data",l);function l(A){K("ondata");var _=r.write(A);K("dest.write",_),_===!1&&((i.pipesCount===1&&i.pipes===r||i.pipesCount>1&&Fu(i.pipes,r)!==-1)&&!v&&(K("false write response, pause",i.awaitDrain),i.awaitDrain++),t.pause())}function x(A){K("onerror",A),R(),r.removeListener("error",x),Bu(r,"error")===0&&F0(r,A)}Z4(r,"error",x);function y(){r.removeListener("finish",E),R()}r.once("close",y);function E(){K("onfinish"),r.removeListener("close",y),R()}r.once("finish",E);function R(){K("unpipe"),t.unpipe(r)}return r.emit("pipe",t),i.flowing||(K("pipe resume"),t.resume()),r};function rp(r){return function(){var t=r._readableState;K("pipeOnDrain",t.awaitDrain),t.awaitDrain&&t.awaitDrain--,t.awaitDrain===0&&Bu(r,"data")&&(t.flowing=!0,Ka(r))}}Y.prototype.unpipe=function(r){var e=this._readableState,t={hasUnpiped:!1};if(e.pipesCount===0)return this;if(e.pipesCount===1)return r&&r!==e.pipes?this:(r||(r=e.pipes),e.pipes=null,e.pipesCount=0,e.flowing=!1,r&&r.emit("unpipe",this,t),this);if(!r){var i=e.pipes,n=e.pipesCount;e.pipes=null,e.pipesCount=0,e.flowing=!1;for(var f=0;f<n;f++)i[f].emit("unpipe",this,{hasUnpiped:!1});return this}var a=Fu(e.pipes,r);return a===-1?this:(e.pipes.splice(a,1),e.pipesCount-=1,e.pipesCount===1&&(e.pipes=e.pipes[0]),r.emit("unpipe",this,t),this)};Y.prototype.on=function(r,e){var t=P0.prototype.on.call(this,r,e),i=this._readableState;return r==="data"?(i.readableListening=this.listenerCount("readable")>0,i.flowing!==!1&&this.resume()):r==="readable"&&!i.endEmitted&&!i.readableListening&&(i.readableListening=i.needReadable=!0,i.flowing=!1,i.emittedReadable=!1,K("on readable",i.length,i.reading),i.length?Tn(this):i.reading||process.nextTick(tp,this)),t};Y.prototype.addListener=Y.prototype.on;Y.prototype.removeListener=function(r,e){var t=P0.prototype.removeListener.call(this,r,e);return r==="readable"&&process.nextTick(Tu,this),t};Y.prototype.removeAllListeners=function(r){var e=P0.prototype.removeAllListeners.apply(this,arguments);return(r==="readable"||r===void 0)&&process.nextTick(Tu,this),e};function Tu(r){var e=r._readableState;e.readableListening=r.listenerCount("readable")>0,e.resumeScheduled&&!e.paused?e.flowing=!0:r.listenerCount("data")>0&&r.resume()}function tp(r){K("readable nexttick read 0"),r.read(0)}Y.prototype.resume=function(){var r=this._readableState;return r.flowing||(K("resume"),r.flowing=!r.readableListening,ip(this,r)),r.paused=!1,this};function ip(r,e){e.resumeScheduled||(e.resumeScheduled=!0,process.nextTick(np,r,e))}function np(r,e){K("resume",e.reading),e.reading||r.read(0),e.resumeScheduled=!1,r.emit("resume"),Ka(r),e.flowing&&!e.reading&&r.read(0)}Y.prototype.pause=function(){return K("call pause flowing=%j",this._readableState.flowing),this._readableState.flowing!==!1&&(K("pause"),this._readableState.flowing=!1,this.emit("pause")),this._readableState.paused=!0,this};function Ka(r){var e=r._readableState;for(K("flow",e.flowing);e.flowing&&r.read()!==null;);}Y.prototype.wrap=function(r){var e=this,t=this._readableState,i=!1;r.on("end",function(){if(K("wrapped end"),t.decoder&&!t.ended){var a=t.decoder.end();a&&a.length&&e.push(a)}e.push(null)}),r.on("data",function(a){if(K("wrapped data"),t.decoder&&(a=t.decoder.write(a)),!(t.objectMode&&a==null)&&!(!t.objectMode&&(!a||!a.length))){var o=e.push(a);o||(i=!0,r.pause())}});for(var n in r)this[n]===void 0&&typeof r[n]=="function"&&(this[n]=function(o){return function(){return r[o].apply(r,arguments)}}(n));for(var f=0;f<Ua.length;f++)r.on(Ua[f],this.emit.bind(this,Ua[f]));return this._read=function(a){K("wrapped _read",a),i&&(i=!1,r.resume())},this};typeof Symbol=="function"&&(Y.prototype[Symbol.asyncIterator]=function(){return Ha===void 0&&(Ha=Eu()),Ha(this)});Object.defineProperty(Y.prototype,"readableHighWaterMark",{enumerable:!1,get:function(){return this._readableState.highWaterMark}});Object.defineProperty(Y.prototype,"readableBuffer",{enumerable:!1,get:function(){return this._readableState&&this._readableState.buffer}});Object.defineProperty(Y.prototype,"readableFlowing",{enumerable:!1,get:function(){return this._readableState.flowing},set:function(e){this._readableState&&(this._readableState.flowing=e)}});Y._fromList=Pu;Object.defineProperty(Y.prototype,"readableLength",{enumerable:!1,get:function(){return this._readableState.length}});function Pu(r,e){if(e.length===0)return null;var t;return e.objectMode?t=e.buffer.shift():!r||r>=e.length?(e.decoder?t=e.buffer.join(""):e.buffer.length===1?t=e.buffer.first():t=e.buffer.concat(e.length),e.buffer.clear()):t=e.buffer.consume(r,e.decoder),t}function Ja(r){var e=r._readableState;K("endReadable",e.endEmitted),e.endEmitted||(e.ended=!0,process.nextTick(fp,e,r))}function fp(r,e){if(K("endReadableNT",r.endEmitted,r.length),!r.endEmitted&&r.length===0&&(r.endEmitted=!0,e.readable=!1,e.emit("end"),r.autoDestroy)){var t=e._writableState;(!t||t.autoDestroy&&t.finished)&&e.destroy()}}typeof Symbol=="function"&&(Y.from=function(r,e){return za===void 0&&(za=Au()),za(Y,r,e)});function Fu(r,e){for(var t=0,i=r.length;t<i;t++)if(r[t]===e)return t;return-1}});var Xa=L((d5,Du)=>{"use strict";Du.exports=Ur;var Pn=It().codes,ap=Pn.ERR_METHOD_NOT_IMPLEMENTED,sp=Pn.ERR_MULTIPLE_CALLBACK,op=Pn.ERR_TRANSFORM_ALREADY_TRANSFORMING,dp=Pn.ERR_TRANSFORM_WITH_LENGTH_0,Fn=kt();ie()(Ur,Fn);function cp(r,e){var t=this._transformState;t.transforming=!1;var i=t.writecb;if(i===null)return this.emit("error",new sp);t.writechunk=null,t.writecb=null,e!=null&&this.push(e),i(r);var n=this._readableState;n.reading=!1,(n.needReadable||n.length<n.highWaterMark)&&this._read(n.highWaterMark)}function Ur(r){if(!(this instanceof Ur))return new Ur(r);Fn.call(this,r),this._transformState={afterTransform:cp.bind(this),needTransform:!1,transforming:!1,writecb:null,writechunk:null,writeencoding:null},this._readableState.needReadable=!0,this._readableState.sync=!1,r&&(typeof r.transform=="function"&&(this._transform=r.transform),typeof r.flush=="function"&&(this._flush=r.flush)),this.on("prefinish",up)}function up(){var r=this;typeof this._flush=="function"&&!this._readableState.destroyed?this._flush(function(e,t){Nu(r,e,t)}):Nu(this,null,null)}Ur.prototype.push=function(r,e){return this._transformState.needTransform=!1,Fn.prototype.push.call(this,r,e)};Ur.prototype._transform=function(r,e,t){t(new ap("_transform()"))};Ur.prototype._write=function(r,e,t){var i=this._transformState;if(i.writecb=t,i.writechunk=r,i.writeencoding=e,!i.transforming){var n=this._readableState;(i.needTransform||n.needReadable||n.length<n.highWaterMark)&&this._read(n.highWaterMark)}};Ur.prototype._read=function(r){var e=this._transformState;e.writechunk!==null&&!e.transforming?(e.transforming=!0,this._transform(e.writechunk,e.writeencoding,e.afterTransform)):e.needTransform=!0};Ur.prototype._destroy=function(r,e){Fn.prototype._destroy.call(this,r,function(t){e(t)})};function Nu(r,e,t){if(e)return r.emit("error",e);if(t!=null&&r.push(t),r._writableState.length)throw new dp;if(r._transformState.transforming)throw new op;return r.push(null)}});var zu=L((c5,Hu)=>{"use strict";Hu.exports=L0;var Ou=Xa();ie()(L0,Ou);function L0(r){if(!(this instanceof L0))return new L0(r);Ou.call(this,r)}L0.prototype._transform=function(r,e,t){t(null,r)}});var Ju=L((u5,Ku)=>{"use strict";var Ga;function hp(r){var e=!1;return function(){e||(e=!0,r.apply(void 0,arguments))}}var Uu=It().codes,lp=Uu.ERR_MISSING_ARGS,bp=Uu.ERR_STREAM_DESTROYED;function Wu(r){if(r)throw r}function vp(r){return r.setHeader&&typeof r.abort=="function"}function pp(r,e,t,i){i=hp(i);var n=!1;r.on("close",function(){n=!0}),Ga===void 0&&(Ga=Rn()),Ga(r,{readable:e,writable:t},function(a){if(a)return i(a);n=!0,i()});var f=!1;return function(a){if(!n&&!f){if(f=!0,vp(r))return r.abort();if(typeof r.destroy=="function")return r.destroy();i(a||new bp("pipe"))}}}function ju(r){r()}function xp(r,e){return r.pipe(e)}function gp(r){return!r.length||typeof r[r.length-1]!="function"?Wu:r.pop()}function yp(){for(var r=arguments.length,e=new Array(r),t=0;t<r;t++)e[t]=arguments[t];var i=gp(e);if(Array.isArray(e[0])&&(e=e[0]),e.length<2)throw new lp("streams");var n,f=e.map(function(a,o){var u=o<e.length-1,v=o>0;return pp(a,u,v,function(h){n||(n=h),h&&f.forEach(ju),!u&&(f.forEach(ju),i(n))})});return e.reduce(xp)}Ku.exports=yp});var Gu=L((xr,Xu)=>{xr=Xu.exports=Pa();xr.Stream=xr;xr.Readable=xr;xr.Writable=Ia();xr.Duplex=kt();xr.Transform=Xa();xr.PassThrough=zu();xr.finished=Rn();xr.pipeline=Ju()});var Va=L((h5,Zu)=>{"use strict";var Ln=Ve().Buffer,Vu=Gu().Transform,_p=ie();function mp(r,e){if(!Ln.isBuffer(r)&&typeof r!="string")throw new TypeError(e+" must be a string or a buffer")}function ht(r){Vu.call(this),this._block=Ln.allocUnsafe(r),this._blockSize=r,this._blockOffset=0,this._length=[0,0,0,0],this._finalized=!1}_p(ht,Vu);ht.prototype._transform=function(r,e,t){var i=null;try{this.update(r,e)}catch(n){i=n}t(i)};ht.prototype._flush=function(r){var e=null;try{this.push(this.digest())}catch(t){e=t}r(e)};ht.prototype.update=function(r,e){if(mp(r,"Data"),this._finalized)throw new Error("Digest already called");Ln.isBuffer(r)||(r=Ln.from(r,e));for(var t=this._block,i=0;this._blockOffset+r.length-i>=this._blockSize;){for(var n=this._blockOffset;n<this._blockSize;)t[n++]=r[i++];this._update(),this._blockOffset=0}for(;i<r.length;)t[this._blockOffset++]=r[i++];for(var f=0,a=r.length*8;a>0;++f)this._length[f]+=a,a=this._length[f]/4294967296|0,a>0&&(this._length[f]-=4294967296*a);return this};ht.prototype._update=function(){throw new Error("_update is not implemented")};ht.prototype.digest=function(r){if(this._finalized)throw new Error("Digest already called");this._finalized=!0;var e=this._digest();r!==void 0&&(e=e.toString(r)),this._block.fill(0),this._blockOffset=0;for(var t=0;t<4;++t)this._length[t]=0;return e};ht.prototype._digest=function(){throw new Error("_digest is not implemented")};Zu.exports=ht});var Za=L((l5,$u)=>{"use strict";var wp=ie(),Yu=Va(),Sp=Ve().Buffer,Ep=new Array(16);function Nn(){Yu.call(this,64),this._a=1732584193,this._b=4023233417,this._c=2562383102,this._d=271733878}wp(Nn,Yu);Nn.prototype._update=function(){for(var r=Ep,e=0;e<16;++e)r[e]=this._block.readInt32LE(e*4);var t=this._a,i=this._b,n=this._c,f=this._d;t=Qe(t,i,n,f,r[0],3614090360,7),f=Qe(f,t,i,n,r[1],3905402710,12),n=Qe(n,f,t,i,r[2],606105819,17),i=Qe(i,n,f,t,r[3],3250441966,22),t=Qe(t,i,n,f,r[4],4118548399,7),f=Qe(f,t,i,n,r[5],1200080426,12),n=Qe(n,f,t,i,r[6],2821735955,17),i=Qe(i,n,f,t,r[7],4249261313,22),t=Qe(t,i,n,f,r[8],1770035416,7),f=Qe(f,t,i,n,r[9],2336552879,12),n=Qe(n,f,t,i,r[10],4294925233,17),i=Qe(i,n,f,t,r[11],2304563134,22),t=Qe(t,i,n,f,r[12],1804603682,7),f=Qe(f,t,i,n,r[13],4254626195,12),n=Qe(n,f,t,i,r[14],2792965006,17),i=Qe(i,n,f,t,r[15],1236535329,22),t=er(t,i,n,f,r[1],4129170786,5),f=er(f,t,i,n,r[6],3225465664,9),n=er(n,f,t,i,r[11],643717713,14),i=er(i,n,f,t,r[0],3921069994,20),t=er(t,i,n,f,r[5],3593408605,5),f=er(f,t,i,n,r[10],38016083,9),n=er(n,f,t,i,r[15],3634488961,14),i=er(i,n,f,t,r[4],3889429448,20),t=er(t,i,n,f,r[9],568446438,5),f=er(f,t,i,n,r[14],3275163606,9),n=er(n,f,t,i,r[3],4107603335,14),i=er(i,n,f,t,r[8],1163531501,20),t=er(t,i,n,f,r[13],2850285829,5),f=er(f,t,i,n,r[2],4243563512,9),n=er(n,f,t,i,r[7],1735328473,14),i=er(i,n,f,t,r[12],2368359562,20),t=rr(t,i,n,f,r[5],4294588738,4),f=rr(f,t,i,n,r[8],2272392833,11),n=rr(n,f,t,i,r[11],1839030562,16),i=rr(i,n,f,t,r[14],4259657740,23),t=rr(t,i,n,f,r[1],2763975236,4),f=rr(f,t,i,n,r[4],1272893353,11),n=rr(n,f,t,i,r[7],4139469664,16),i=rr(i,n,f,t,r[10],3200236656,23),t=rr(t,i,n,f,r[13],681279174,4),f=rr(f,t,i,n,r[0],3936430074,11),n=rr(n,f,t,i,r[3],3572445317,16),i=rr(i,n,f,t,r[6],76029189,23),t=rr(t,i,n,f,r[9],3654602809,4),f=rr(f,t,i,n,r[12],3873151461,11),n=rr(n,f,t,i,r[15],530742520,16),i=rr(i,n,f,t,r[2],3299628645,23),t=tr(t,i,n,f,r[0],4096336452,6),f=tr(f,t,i,n,r[7],1126891415,10),n=tr(n,f,t,i,r[14],2878612391,15),i=tr(i,n,f,t,r[5],4237533241,21),t=tr(t,i,n,f,r[12],1700485571,6),f=tr(f,t,i,n,r[3],2399980690,10),n=tr(n,f,t,i,r[10],4293915773,15),i=tr(i,n,f,t,r[1],2240044497,21),t=tr(t,i,n,f,r[8],1873313359,6),f=tr(f,t,i,n,r[15],4264355552,10),n=tr(n,f,t,i,r[6],2734768916,15),i=tr(i,n,f,t,r[13],1309151649,21),t=tr(t,i,n,f,r[4],4149444226,6),f=tr(f,t,i,n,r[11],3174756917,10),n=tr(n,f,t,i,r[2],718787259,15),i=tr(i,n,f,t,r[9],3951481745,21),this._a=this._a+t|0,this._b=this._b+i|0,this._c=this._c+n|0,this._d=this._d+f|0};Nn.prototype._digest=function(){this._block[this._blockOffset++]=128,this._blockOffset>56&&(this._block.fill(0,this._blockOffset,64),this._update(),this._blockOffset=0),this._block.fill(0,this._blockOffset,56),this._block.writeUInt32LE(this._length[0],56),this._block.writeUInt32LE(this._length[1],60),this._update();var r=Sp.allocUnsafe(16);return r.writeInt32LE(this._a,0),r.writeInt32LE(this._b,4),r.writeInt32LE(this._c,8),r.writeInt32LE(this._d,12),r};function Dn(r,e){return r<<e|r>>>32-e}function Qe(r,e,t,i,n,f,a){return Dn(r+(e&t|~e&i)+n+f|0,a)+e|0}function er(r,e,t,i,n,f,a){return Dn(r+(e&i|t&~i)+n+f|0,a)+e|0}function rr(r,e,t,i,n,f,a){return Dn(r+(e^t^i)+n+f|0,a)+e|0}function tr(r,e,t,i,n,f,a){return Dn(r+(t^(e|~i))+n+f|0,a)+e|0}$u.exports=Nn});var $a=L((b5,fh)=>{"use strict";var Ya=st().Buffer,Mp=ie(),Qu=Va(),Ap=new Array(16),N0=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13],D0=[5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11],O0=[11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6],H0=[8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11],z0=[0,1518500249,1859775393,2400959708,2840853838],U0=[1352829926,1548603684,1836072691,2053994217,0];function On(){Qu.call(this,64),this._a=1732584193,this._b=4023233417,this._c=2562383102,this._d=271733878,this._e=3285377520}Mp(On,Qu);On.prototype._update=function(){for(var r=Ap,e=0;e<16;++e)r[e]=this._block.readInt32LE(e*4);for(var t=this._a|0,i=this._b|0,n=this._c|0,f=this._d|0,a=this._e|0,o=this._a|0,u=this._b|0,v=this._c|0,h=this._d|0,l=this._e|0,x=0;x<80;x+=1){var y,E;x<16?(y=eh(t,i,n,f,a,r[N0[x]],z0[0],O0[x]),E=nh(o,u,v,h,l,r[D0[x]],U0[0],H0[x])):x<32?(y=rh(t,i,n,f,a,r[N0[x]],z0[1],O0[x]),E=ih(o,u,v,h,l,r[D0[x]],U0[1],H0[x])):x<48?(y=th(t,i,n,f,a,r[N0[x]],z0[2],O0[x]),E=th(o,u,v,h,l,r[D0[x]],U0[2],H0[x])):x<64?(y=ih(t,i,n,f,a,r[N0[x]],z0[3],O0[x]),E=rh(o,u,v,h,l,r[D0[x]],U0[3],H0[x])):(y=nh(t,i,n,f,a,r[N0[x]],z0[4],O0[x]),E=eh(o,u,v,h,l,r[D0[x]],U0[4],H0[x])),t=a,a=f,f=Lt(n,10),n=i,i=y,o=l,l=h,h=Lt(v,10),v=u,u=E}var R=this._b+n+h|0;this._b=this._c+f+l|0,this._c=this._d+a+o|0,this._d=this._e+t+u|0,this._e=this._a+i+v|0,this._a=R};On.prototype._digest=function(){this._block[this._blockOffset++]=128,this._blockOffset>56&&(this._block.fill(0,this._blockOffset,64),this._update(),this._blockOffset=0),this._block.fill(0,this._blockOffset,56),this._block.writeUInt32LE(this._length[0],56),this._block.writeUInt32LE(this._length[1],60),this._update();var r=Ya.alloc?Ya.alloc(20):new Ya(20);return r.writeInt32LE(this._a,0),r.writeInt32LE(this._b,4),r.writeInt32LE(this._c,8),r.writeInt32LE(this._d,12),r.writeInt32LE(this._e,16),r};function Lt(r,e){return r<<e|r>>>32-e}function eh(r,e,t,i,n,f,a,o){return Lt(r+(e^t^i)+f+a|0,o)+n|0}function rh(r,e,t,i,n,f,a,o){return Lt(r+(e&t|~e&i)+f+a|0,o)+n|0}function th(r,e,t,i,n,f,a,o){return Lt(r+((e|~t)^i)+f+a|0,o)+n|0}function ih(r,e,t,i,n,f,a,o){return Lt(r+(e&i|t&~i)+f+a|0,o)+n|0}function nh(r,e,t,i,n,f,a,o){return Lt(r+(e^(t|~i))+f+a|0,o)+n|0}fh.exports=On});var Nt=L((v5,sh)=>{var ah=Ve().Buffer;function Hn(r,e){this._block=ah.alloc(r),this._finalSize=e,this._blockSize=r,this._len=0}Hn.prototype.update=function(r,e){typeof r=="string"&&(e=e||"utf8",r=ah.from(r,e));for(var t=this._block,i=this._blockSize,n=r.length,f=this._len,a=0;a<n;){for(var o=f%i,u=Math.min(n-a,i-o),v=0;v<u;v++)t[o+v]=r[a+v];f+=u,a+=u,f%i==0&&this._update(t)}return this._len+=n,this};Hn.prototype.digest=function(r){var e=this._len%this._blockSize;this._block[e]=128,this._block.fill(0,e+1),e>=this._finalSize&&(this._update(this._block),this._block.fill(0));var t=this._len*8;if(t<=4294967295)this._block.writeUInt32BE(t,this._blockSize-4);else{var i=(t&4294967295)>>>0,n=(t-i)/4294967296;this._block.writeUInt32BE(n,this._blockSize-8),this._block.writeUInt32BE(i,this._blockSize-4)}this._update(this._block);var f=this._hash();return r?f.toString(r):f};Hn.prototype._update=function(){throw new Error("_update must be implemented by subclass")};sh.exports=Hn});var ch=L((p5,dh)=>{var Bp=ie(),oh=Nt(),Rp=Ve().Buffer,qp=[1518500249,1859775393,2400959708|0,3395469782|0],Cp=new Array(80);function W0(){this.init(),this._w=Cp,oh.call(this,64,56)}Bp(W0,oh);W0.prototype.init=function(){return this._a=1732584193,this._b=4023233417,this._c=2562383102,this._d=271733878,this._e=3285377520,this};function Ip(r){return r<<5|r>>>27}function kp(r){return r<<30|r>>>2}function Tp(r,e,t,i){return r===0?e&t|~e&i:r===2?e&t|e&i|t&i:e^t^i}W0.prototype._update=function(r){for(var e=this._w,t=this._a|0,i=this._b|0,n=this._c|0,f=this._d|0,a=this._e|0,o=0;o<16;++o)e[o]=r.readInt32BE(o*4);for(;o<80;++o)e[o]=e[o-3]^e[o-8]^e[o-14]^e[o-16];for(var u=0;u<80;++u){var v=~~(u/20),h=Ip(t)+Tp(v,i,n,f)+a+e[u]+qp[v]|0;a=f,f=n,n=kp(i),i=t,t=h}this._a=t+this._a|0,this._b=i+this._b|0,this._c=n+this._c|0,this._d=f+this._d|0,this._e=a+this._e|0};W0.prototype._hash=function(){var r=Rp.allocUnsafe(20);return r.writeInt32BE(this._a|0,0),r.writeInt32BE(this._b|0,4),r.writeInt32BE(this._c|0,8),r.writeInt32BE(this._d|0,12),r.writeInt32BE(this._e|0,16),r};dh.exports=W0});var lh=L((x5,hh)=>{var Pp=ie(),uh=Nt(),Fp=Ve().Buffer,Lp=[1518500249,1859775393,2400959708|0,3395469782|0],Np=new Array(80);function j0(){this.init(),this._w=Np,uh.call(this,64,56)}Pp(j0,uh);j0.prototype.init=function(){return this._a=1732584193,this._b=4023233417,this._c=2562383102,this._d=271733878,this._e=3285377520,this};function Dp(r){return r<<1|r>>>31}function Op(r){return r<<5|r>>>27}function Hp(r){return r<<30|r>>>2}function zp(r,e,t,i){return r===0?e&t|~e&i:r===2?e&t|e&i|t&i:e^t^i}j0.prototype._update=function(r){for(var e=this._w,t=this._a|0,i=this._b|0,n=this._c|0,f=this._d|0,a=this._e|0,o=0;o<16;++o)e[o]=r.readInt32BE(o*4);for(;o<80;++o)e[o]=Dp(e[o-3]^e[o-8]^e[o-14]^e[o-16]);for(var u=0;u<80;++u){var v=~~(u/20),h=Op(t)+zp(v,i,n,f)+a+e[u]+Lp[v]|0;a=f,f=n,n=Hp(i),i=t,t=h}this._a=t+this._a|0,this._b=i+this._b|0,this._c=n+this._c|0,this._d=f+this._d|0,this._e=a+this._e|0};j0.prototype._hash=function(){var r=Fp.allocUnsafe(20);return r.writeInt32BE(this._a|0,0),r.writeInt32BE(this._b|0,4),r.writeInt32BE(this._c|0,8),r.writeInt32BE(this._d|0,12),r.writeInt32BE(this._e|0,16),r};hh.exports=j0});var Qa=L((g5,vh)=>{var Up=ie(),bh=Nt(),Wp=Ve().Buffer,jp=[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298],Kp=new Array(64);function K0(){this.init(),this._w=Kp,bh.call(this,64,56)}Up(K0,bh);K0.prototype.init=function(){return this._a=1779033703,this._b=3144134277,this._c=1013904242,this._d=2773480762,this._e=1359893119,this._f=2600822924,this._g=528734635,this._h=1541459225,this};function Jp(r,e,t){return t^r&(e^t)}function Xp(r,e,t){return r&e|t&(r|e)}function Gp(r){return(r>>>2|r<<30)^(r>>>13|r<<19)^(r>>>22|r<<10)}function Vp(r){return(r>>>6|r<<26)^(r>>>11|r<<21)^(r>>>25|r<<7)}function Zp(r){return(r>>>7|r<<25)^(r>>>18|r<<14)^r>>>3}function Yp(r){return(r>>>17|r<<15)^(r>>>19|r<<13)^r>>>10}K0.prototype._update=function(r){for(var e=this._w,t=this._a|0,i=this._b|0,n=this._c|0,f=this._d|0,a=this._e|0,o=this._f|0,u=this._g|0,v=this._h|0,h=0;h<16;++h)e[h]=r.readInt32BE(h*4);for(;h<64;++h)e[h]=Yp(e[h-2])+e[h-7]+Zp(e[h-15])+e[h-16]|0;for(var l=0;l<64;++l){var x=v+Vp(a)+Jp(a,o,u)+jp[l]+e[l]|0,y=Gp(t)+Xp(t,i,n)|0;v=u,u=o,o=a,a=f+x|0,f=n,n=i,i=t,t=x+y|0}this._a=t+this._a|0,this._b=i+this._b|0,this._c=n+this._c|0,this._d=f+this._d|0,this._e=a+this._e|0,this._f=o+this._f|0,this._g=u+this._g|0,this._h=v+this._h|0};K0.prototype._hash=function(){var r=Wp.allocUnsafe(32);return r.writeInt32BE(this._a,0),r.writeInt32BE(this._b,4),r.writeInt32BE(this._c,8),r.writeInt32BE(this._d,12),r.writeInt32BE(this._e,16),r.writeInt32BE(this._f,20),r.writeInt32BE(this._g,24),r.writeInt32BE(this._h,28),r};vh.exports=K0});var xh=L((y5,ph)=>{var $p=ie(),Qp=Qa(),e8=Nt(),r8=Ve().Buffer,t8=new Array(64);function zn(){this.init(),this._w=t8,e8.call(this,64,56)}$p(zn,Qp);zn.prototype.init=function(){return this._a=3238371032,this._b=914150663,this._c=812702999,this._d=4144912697,this._e=4290775857,this._f=1750603025,this._g=1694076839,this._h=3204075428,this};zn.prototype._hash=function(){var r=r8.allocUnsafe(28);return r.writeInt32BE(this._a,0),r.writeInt32BE(this._b,4),r.writeInt32BE(this._c,8),r.writeInt32BE(this._d,12),r.writeInt32BE(this._e,16),r.writeInt32BE(this._f,20),r.writeInt32BE(this._g,24),r};ph.exports=zn});var es=L((_5,Eh)=>{var i8=ie(),gh=Nt(),n8=Ve().Buffer,yh=[1116352408,3609767458,1899447441,602891725,3049323471,3964484399,3921009573,2173295548,961987163,4081628472,1508970993,3053834265,2453635748,2937671579,2870763221,3664609560,3624381080,2734883394,310598401,1164996542,607225278,1323610764,1426881987,3590304994,1925078388,4068182383,2162078206,991336113,2614888103,633803317,3248222580,3479774868,3835390401,2666613458,4022224774,944711139,264347078,2341262773,604807628,2007800933,770255983,1495990901,1249150122,1856431235,1555081692,3175218132,1996064986,2198950837,2554220882,3999719339,2821834349,766784016,2952996808,2566594879,3210313671,3203337956,3336571891,1034457026,3584528711,2466948901,113926993,3758326383,338241895,168717936,666307205,1188179964,773529912,1546045734,1294757372,1522805485,1396182291,2643833823,1695183700,2343527390,1986661051,1014477480,2177026350,1206759142,2456956037,344077627,2730485921,1290863460,2820302411,3158454273,3259730800,3505952657,3345764771,106217008,3516065817,3606008344,3600352804,1432725776,4094571909,1467031594,275423344,851169720,430227734,3100823752,506948616,1363258195,659060556,3750685593,883997877,3785050280,958139571,3318307427,1322822218,3812723403,1537002063,2003034995,1747873779,3602036899,1955562222,1575990012,2024104815,1125592928,2227730452,2716904306,2361852424,442776044,2428436474,593698344,2756734187,3733110249,3204031479,2999351573,3329325298,3815920427,3391569614,3928383900,3515267271,566280711,3940187606,3454069534,4118630271,4000239992,116418474,1914138554,174292421,2731055270,289380356,3203993006,460393269,320620315,685471733,587496836,852142971,1086792851,1017036298,365543100,1126000580,2618297676,1288033470,3409855158,1501505948,4234509866,1607167915,987167468,1816402316,1246189591],f8=new Array(160);function J0(){this.init(),this._w=f8,gh.call(this,128,112)}i8(J0,gh);J0.prototype.init=function(){return this._ah=1779033703,this._bh=3144134277,this._ch=1013904242,this._dh=2773480762,this._eh=1359893119,this._fh=2600822924,this._gh=528734635,this._hh=1541459225,this._al=4089235720,this._bl=2227873595,this._cl=4271175723,this._dl=1595750129,this._el=2917565137,this._fl=725511199,this._gl=4215389547,this._hl=327033209,this};function _h(r,e,t){return t^r&(e^t)}function mh(r,e,t){return r&e|t&(r|e)}function wh(r,e){return(r>>>28|e<<4)^(e>>>2|r<<30)^(e>>>7|r<<25)}function Sh(r,e){return(r>>>14|e<<18)^(r>>>18|e<<14)^(e>>>9|r<<23)}function a8(r,e){return(r>>>1|e<<31)^(r>>>8|e<<24)^r>>>7}function s8(r,e){return(r>>>1|e<<31)^(r>>>8|e<<24)^(r>>>7|e<<25)}function o8(r,e){return(r>>>19|e<<13)^(e>>>29|r<<3)^r>>>6}function d8(r,e){return(r>>>19|e<<13)^(e>>>29|r<<3)^(r>>>6|e<<26)}function Je(r,e){return r>>>0<e>>>0?1:0}J0.prototype._update=function(r){for(var e=this._w,t=this._ah|0,i=this._bh|0,n=this._ch|0,f=this._dh|0,a=this._eh|0,o=this._fh|0,u=this._gh|0,v=this._hh|0,h=this._al|0,l=this._bl|0,x=this._cl|0,y=this._dl|0,E=this._el|0,R=this._fl|0,A=this._gl|0,_=this._hl|0,S=0;S<32;S+=2)e[S]=r.readInt32BE(S*4),e[S+1]=r.readInt32BE(S*4+4);for(;S<160;S+=2){var C=e[S-15*2],I=e[S-15*2+1],P=a8(C,I),k=s8(I,C);C=e[S-2*2],I=e[S-2*2+1];var D=o8(C,I),N=d8(I,C),H=e[S-7*2],M=e[S-7*2+1],s=e[S-16*2],c=e[S-16*2+1],b=k+M|0,p=P+H+Je(b,k)|0;b=b+N|0,p=p+D+Je(b,N)|0,b=b+c|0,p=p+s+Je(b,c)|0,e[S]=p,e[S+1]=b}for(var m=0;m<160;m+=2){p=e[m],b=e[m+1];var B=mh(t,i,n),q=mh(h,l,x),w=wh(t,h),d=wh(h,t),g=Sh(a,E),F=Sh(E,a),T=yh[m],z=yh[m+1],W=_h(a,o,u),j=_h(E,R,A),U=_+F|0,pe=v+g+Je(U,_)|0;U=U+j|0,pe=pe+W+Je(U,j)|0,U=U+z|0,pe=pe+T+Je(U,z)|0,U=U+b|0,pe=pe+p+Je(U,b)|0;var J=d+q|0,ee=w+B+Je(J,d)|0;v=u,_=A,u=o,A=R,o=a,R=E,E=y+U|0,a=f+pe+Je(E,y)|0,f=n,y=x,n=i,x=l,i=t,l=h,h=U+J|0,t=pe+ee+Je(h,U)|0}this._al=this._al+h|0,this._bl=this._bl+l|0,this._cl=this._cl+x|0,this._dl=this._dl+y|0,this._el=this._el+E|0,this._fl=this._fl+R|0,this._gl=this._gl+A|0,this._hl=this._hl+_|0,this._ah=this._ah+t+Je(this._al,h)|0,this._bh=this._bh+i+Je(this._bl,l)|0,this._ch=this._ch+n+Je(this._cl,x)|0,this._dh=this._dh+f+Je(this._dl,y)|0,this._eh=this._eh+a+Je(this._el,E)|0,this._fh=this._fh+o+Je(this._fl,R)|0,this._gh=this._gh+u+Je(this._gl,A)|0,this._hh=this._hh+v+Je(this._hl,_)|0};J0.prototype._hash=function(){var r=n8.allocUnsafe(64);function e(t,i,n){r.writeInt32BE(t,n),r.writeInt32BE(i,n+4)}return e(this._ah,this._al,0),e(this._bh,this._bl,8),e(this._ch,this._cl,16),e(this._dh,this._dl,24),e(this._eh,this._el,32),e(this._fh,this._fl,40),e(this._gh,this._gl,48),e(this._hh,this._hl,56),r};Eh.exports=J0});var Ah=L((m5,Mh)=>{var c8=ie(),u8=es(),h8=Nt(),l8=Ve().Buffer,b8=new Array(160);function Un(){this.init(),this._w=b8,h8.call(this,128,112)}c8(Un,u8);Un.prototype.init=function(){return this._ah=3418070365,this._bh=1654270250,this._ch=2438529370,this._dh=355462360,this._eh=1731405415,this._fh=2394180231,this._gh=3675008525,this._hh=1203062813,this._al=3238371032,this._bl=914150663,this._cl=812702999,this._dl=4144912697,this._el=4290775857,this._fl=1750603025,this._gl=1694076839,this._hl=3204075428,this};Un.prototype._hash=function(){var r=l8.allocUnsafe(48);function e(t,i,n){r.writeInt32BE(t,n),r.writeInt32BE(i,n+4)}return e(this._ah,this._al,0),e(this._bh,this._bl,8),e(this._ch,this._cl,16),e(this._dh,this._dl,24),e(this._eh,this._el,32),e(this._fh,this._fl,40),r};Mh.exports=Un});var rs=L((Wr,Bh)=>{var Wr=Bh.exports=function(e){e=e.toLowerCase();var t=Wr[e];if(!t)throw new Error(e+" is not supported (we accept pull requests)");return new t};Wr.sha=ch();Wr.sha1=lh();Wr.sha224=xh();Wr.sha256=Qa();Wr.sha384=Ah();Wr.sha512=es()});var X0=L((w5,ts)=>{"use strict";typeof process=="undefined"||!process.version||process.version.indexOf("v0.")===0||process.version.indexOf("v1.")===0&&process.version.indexOf("v1.8.")!==0?ts.exports={nextTick:v8}:ts.exports=process;function v8(r,e,t,i){if(typeof r!="function")throw new TypeError('"callback" argument must be a function');var n=arguments.length,f,a;switch(n){case 0:case 1:return process.nextTick(r);case 2:return process.nextTick(function(){r.call(null,e)});case 3:return process.nextTick(function(){r.call(null,e,t)});case 4:return process.nextTick(function(){r.call(null,e,t,i)});default:for(f=new Array(n-1),a=0;a<f.length;)f[a++]=arguments[a];return process.nextTick(function(){r.apply(null,f)})}}});var qh=L((S5,Rh)=>{var p8={}.toString;Rh.exports=Array.isArray||function(r){return p8.call(r)=="[object Array]"}});var is=L((E5,Ch)=>{Ch.exports=R0().EventEmitter});var G0=L((ns,kh)=>{var Wn=st(),jr=Wn.Buffer;function Ih(r,e){for(var t in r)e[t]=r[t]}jr.from&&jr.alloc&&jr.allocUnsafe&&jr.allocUnsafeSlow?kh.exports=Wn:(Ih(Wn,ns),ns.Buffer=d0);function d0(r,e,t){return jr(r,e,t)}Ih(jr,d0);d0.from=function(r,e,t){if(typeof r=="number")throw new TypeError("Argument must not be a number");return jr(r,e,t)};d0.alloc=function(r,e,t){if(typeof r!="number")throw new TypeError("Argument must be a number");var i=jr(r);return e!==void 0?typeof t=="string"?i.fill(e,t):i.fill(e):i.fill(0),i};d0.allocUnsafe=function(r){if(typeof r!="number")throw new TypeError("Argument must be a number");return jr(r)};d0.allocUnsafeSlow=function(r){if(typeof r!="number")throw new TypeError("Argument must be a number");return Wn.SlowBuffer(r)}});var c0=L(ir=>{function x8(r){return Array.isArray?Array.isArray(r):jn(r)==="[object Array]"}ir.isArray=x8;function g8(r){return typeof r=="boolean"}ir.isBoolean=g8;function y8(r){return r===null}ir.isNull=y8;function _8(r){return r==null}ir.isNullOrUndefined=_8;function m8(r){return typeof r=="number"}ir.isNumber=m8;function w8(r){return typeof r=="string"}ir.isString=w8;function S8(r){return typeof r=="symbol"}ir.isSymbol=S8;function E8(r){return r===void 0}ir.isUndefined=E8;function M8(r){return jn(r)==="[object RegExp]"}ir.isRegExp=M8;function A8(r){return typeof r=="object"&&r!==null}ir.isObject=A8;function B8(r){return jn(r)==="[object Date]"}ir.isDate=B8;function R8(r){return jn(r)==="[object Error]"||r instanceof Error}ir.isError=R8;function q8(r){return typeof r=="function"}ir.isFunction=q8;function C8(r){return r===null||typeof r=="boolean"||typeof r=="number"||typeof r=="string"||typeof r=="symbol"||typeof r=="undefined"}ir.isPrimitive=C8;ir.isBuffer=st().Buffer.isBuffer;function jn(r){return Object.prototype.toString.call(r)}});var Ph=L((A5,fs)=>{"use strict";function I8(r,e){if(!(r instanceof e))throw new TypeError("Cannot call a class as a function")}var Th=G0().Buffer,V0=q0();function k8(r,e,t){r.copy(e,t)}fs.exports=function(){function r(){I8(this,r),this.head=null,this.tail=null,this.length=0}return r.prototype.push=function(t){var i={data:t,next:null};this.length>0?this.tail.next=i:this.head=i,this.tail=i,++this.length},r.prototype.unshift=function(t){var i={data:t,next:this.head};this.length===0&&(this.tail=i),this.head=i,++this.length},r.prototype.shift=function(){if(this.length!==0){var t=this.head.data;return this.length===1?this.head=this.tail=null:this.head=this.head.next,--this.length,t}},r.prototype.clear=function(){this.head=this.tail=null,this.length=0},r.prototype.join=function(t){if(this.length===0)return"";for(var i=this.head,n=""+i.data;i=i.next;)n+=t+i.data;return n},r.prototype.concat=function(t){if(this.length===0)return Th.alloc(0);if(this.length===1)return this.head.data;for(var i=Th.allocUnsafe(t>>>0),n=this.head,f=0;n;)k8(n.data,i,f),f+=n.data.length,n=n.next;return i},r}();V0&&V0.inspect&&V0.inspect.custom&&(fs.exports.prototype[V0.inspect.custom]=function(){var r=V0.inspect({length:this.length});return this.constructor.name+" "+r})});var as=L((B5,Nh)=>{"use strict";var Fh=X0();function T8(r,e){var t=this,i=this._readableState&&this._readableState.destroyed,n=this._writableState&&this._writableState.destroyed;return i||n?(e?e(r):r&&(!this._writableState||!this._writableState.errorEmitted)&&Fh.nextTick(Lh,this,r),this):(this._readableState&&(this._readableState.destroyed=!0),this._writableState&&(this._writableState.destroyed=!0),this._destroy(r||null,function(f){!e&&f?(Fh.nextTick(Lh,t,f),t._writableState&&(t._writableState.errorEmitted=!0)):e&&e(f)}),this)}function P8(){this._readableState&&(this._readableState.destroyed=!1,this._readableState.reading=!1,this._readableState.ended=!1,this._readableState.endEmitted=!1),this._writableState&&(this._writableState.destroyed=!1,this._writableState.ended=!1,this._writableState.ending=!1,this._writableState.finished=!1,this._writableState.errorEmitted=!1)}function Lh(r,e){r.emit("error",e)}Nh.exports={destroy:T8,undestroy:P8}});var os=L((R5,Kh)=>{"use strict";var Dt=X0();Kh.exports=He;function Dh(r){var e=this;this.next=null,this.entry=null,this.finish=function(){$8(e,r)}}var F8=!process.browser&&["v0.10","v0.9."].indexOf(process.version.slice(0,5))>-1?setImmediate:Dt.nextTick,u0;He.WritableState=Z0;var Oh=Object.create(c0());Oh.inherits=ie();var L8={deprecate:Ra()},Hh=is(),Kn=G0().Buffer,N8=global.Uint8Array||function(){};function D8(r){return Kn.from(r)}function O8(r){return Kn.isBuffer(r)||r instanceof N8}var zh=as();Oh.inherits(He,Hh);function H8(){}function Z0(r,e){u0=u0||Ot(),r=r||{};var t=e instanceof u0;this.objectMode=!!r.objectMode,t&&(this.objectMode=this.objectMode||!!r.writableObjectMode);var i=r.highWaterMark,n=r.writableHighWaterMark,f=this.objectMode?16:16*1024;i||i===0?this.highWaterMark=i:t&&(n||n===0)?this.highWaterMark=n:this.highWaterMark=f,this.highWaterMark=Math.floor(this.highWaterMark),this.finalCalled=!1,this.needDrain=!1,this.ending=!1,this.ended=!1,this.finished=!1,this.destroyed=!1;var a=r.decodeStrings===!1;this.decodeStrings=!a,this.defaultEncoding=r.defaultEncoding||"utf8",this.length=0,this.writing=!1,this.corked=0,this.sync=!0,this.bufferProcessing=!1,this.onwrite=function(o){X8(e,o)},this.writecb=null,this.writelen=0,this.bufferedRequest=null,this.lastBufferedRequest=null,this.pendingcb=0,this.prefinished=!1,this.errorEmitted=!1,this.bufferedRequestCount=0,this.corkedRequestsFree=new Dh(this)}Z0.prototype.getBuffer=function(){for(var e=this.bufferedRequest,t=[];e;)t.push(e),e=e.next;return t};(function(){try{Object.defineProperty(Z0.prototype,"buffer",{get:L8.deprecate(function(){return this.getBuffer()},"_writableState.buffer is deprecated. Use _writableState.getBuffer instead.","DEP0003")})}catch(r){}})();var Jn;typeof Symbol=="function"&&Symbol.hasInstance&&typeof Function.prototype[Symbol.hasInstance]=="function"?(Jn=Function.prototype[Symbol.hasInstance],Object.defineProperty(He,Symbol.hasInstance,{value:function(r){return Jn.call(this,r)?!0:this!==He?!1:r&&r._writableState instanceof Z0}})):Jn=function(r){return r instanceof this};function He(r){if(u0=u0||Ot(),!Jn.call(He,this)&&!(this instanceof u0))return new He(r);this._writableState=new Z0(r,this),this.writable=!0,r&&(typeof r.write=="function"&&(this._write=r.write),typeof r.writev=="function"&&(this._writev=r.writev),typeof r.destroy=="function"&&(this._destroy=r.destroy),typeof r.final=="function"&&(this._final=r.final)),Hh.call(this)}He.prototype.pipe=function(){this.emit("error",new Error("Cannot pipe, not readable"))};function z8(r,e){var t=new Error("write after end");r.emit("error",t),Dt.nextTick(e,t)}function U8(r,e,t,i){var n=!0,f=!1;return t===null?f=new TypeError("May not write null values to stream"):typeof t!="string"&&t!==void 0&&!e.objectMode&&(f=new TypeError("Invalid non-string/buffer chunk")),f&&(r.emit("error",f),Dt.nextTick(i,f),n=!1),n}He.prototype.write=function(r,e,t){var i=this._writableState,n=!1,f=!i.objectMode&&O8(r);return f&&!Kn.isBuffer(r)&&(r=D8(r)),typeof e=="function"&&(t=e,e=null),f?e="buffer":e||(e=i.defaultEncoding),typeof t!="function"&&(t=H8),i.ended?z8(this,t):(f||U8(this,i,r,t))&&(i.pendingcb++,n=j8(this,i,f,r,e,t)),n};He.prototype.cork=function(){var r=this._writableState;r.corked++};He.prototype.uncork=function(){var r=this._writableState;r.corked&&(r.corked--,!r.writing&&!r.corked&&!r.finished&&!r.bufferProcessing&&r.bufferedRequest&&Wh(this,r))};He.prototype.setDefaultEncoding=function(e){if(typeof e=="string"&&(e=e.toLowerCase()),!(["hex","utf8","utf-8","ascii","binary","base64","ucs2","ucs-2","utf16le","utf-16le","raw"].indexOf((e+"").toLowerCase())>-1))throw new TypeError("Unknown encoding: "+e);return this._writableState.defaultEncoding=e,this};function W8(r,e,t){return!r.objectMode&&r.decodeStrings!==!1&&typeof e=="string"&&(e=Kn.from(e,t)),e}Object.defineProperty(He.prototype,"writableHighWaterMark",{enumerable:!1,get:function(){return this._writableState.highWaterMark}});function j8(r,e,t,i,n,f){if(!t){var a=W8(e,i,n);i!==a&&(t=!0,n="buffer",i=a)}var o=e.objectMode?1:i.length;e.length+=o;var u=e.length<e.highWaterMark;if(u||(e.needDrain=!0),e.writing||e.corked){var v=e.lastBufferedRequest;e.lastBufferedRequest={chunk:i,encoding:n,isBuf:t,callback:f,next:null},v?v.next=e.lastBufferedRequest:e.bufferedRequest=e.lastBufferedRequest,e.bufferedRequestCount+=1}else ss(r,e,!1,o,i,n,f);return u}function ss(r,e,t,i,n,f,a){e.writelen=i,e.writecb=a,e.writing=!0,e.sync=!0,t?r._writev(n,e.onwrite):r._write(n,f,e.onwrite),e.sync=!1}function K8(r,e,t,i,n){--e.pendingcb,t?(Dt.nextTick(n,i),Dt.nextTick(Y0,r,e),r._writableState.errorEmitted=!0,r.emit("error",i)):(n(i),r._writableState.errorEmitted=!0,r.emit("error",i),Y0(r,e))}function J8(r){r.writing=!1,r.writecb=null,r.length-=r.writelen,r.writelen=0}function X8(r,e){var t=r._writableState,i=t.sync,n=t.writecb;if(J8(t),e)K8(r,t,i,e,n);else{var f=jh(t);!f&&!t.corked&&!t.bufferProcessing&&t.bufferedRequest&&Wh(r,t),i?F8(Uh,r,t,f,n):Uh(r,t,f,n)}}function Uh(r,e,t,i){t||G8(r,e),e.pendingcb--,i(),Y0(r,e)}function G8(r,e){e.length===0&&e.needDrain&&(e.needDrain=!1,r.emit("drain"))}function Wh(r,e){e.bufferProcessing=!0;var t=e.bufferedRequest;if(r._writev&&t&&t.next){var i=e.bufferedRequestCount,n=new Array(i),f=e.corkedRequestsFree;f.entry=t;for(var a=0,o=!0;t;)n[a]=t,t.isBuf||(o=!1),t=t.next,a+=1;n.allBuffers=o,ss(r,e,!0,e.length,n,"",f.finish),e.pendingcb++,e.lastBufferedRequest=null,f.next?(e.corkedRequestsFree=f.next,f.next=null):e.corkedRequestsFree=new Dh(e),e.bufferedRequestCount=0}else{for(;t;){var u=t.chunk,v=t.encoding,h=t.callback,l=e.objectMode?1:u.length;if(ss(r,e,!1,l,u,v,h),t=t.next,e.bufferedRequestCount--,e.writing)break}t===null&&(e.lastBufferedRequest=null)}e.bufferedRequest=t,e.bufferProcessing=!1}He.prototype._write=function(r,e,t){t(new Error("_write() is not implemented"))};He.prototype._writev=null;He.prototype.end=function(r,e,t){var i=this._writableState;typeof r=="function"?(t=r,r=null,e=null):typeof e=="function"&&(t=e,e=null),r!=null&&this.write(r,e),i.corked&&(i.corked=1,this.uncork()),!i.ending&&!i.finished&&Y8(this,i,t)};function jh(r){return r.ending&&r.length===0&&r.bufferedRequest===null&&!r.finished&&!r.writing}function V8(r,e){r._final(function(t){e.pendingcb--,t&&r.emit("error",t),e.prefinished=!0,r.emit("prefinish"),Y0(r,e)})}function Z8(r,e){!e.prefinished&&!e.finalCalled&&(typeof r._final=="function"?(e.pendingcb++,e.finalCalled=!0,Dt.nextTick(V8,r,e)):(e.prefinished=!0,r.emit("prefinish")))}function Y0(r,e){var t=jh(e);return t&&(Z8(r,e),e.pendingcb===0&&(e.finished=!0,r.emit("finish"))),t}function Y8(r,e,t){e.ending=!0,Y0(r,e),t&&(e.finished?Dt.nextTick(t):r.once("finish",t)),e.ended=!0,r.writable=!1}function $8(r,e,t){var i=r.entry;for(r.entry=null;i;){var n=i.callback;e.pendingcb--,n(t),i=i.next}e.corkedRequestsFree?e.corkedRequestsFree.next=r:e.corkedRequestsFree=r}Object.defineProperty(He.prototype,"destroyed",{get:function(){return this._writableState===void 0?!1:this._writableState.destroyed},set:function(r){!this._writableState||(this._writableState.destroyed=r)}});He.prototype.destroy=zh.destroy;He.prototype._undestroy=zh.undestroy;He.prototype._destroy=function(r,e){this.end(),e(r)}});var Ot=L((q5,Vh)=>{"use strict";var Jh=X0(),Q8=Object.keys||function(r){var e=[];for(var t in r)e.push(t);return e};Vh.exports=Kr;var Xh=Object.create(c0());Xh.inherits=ie();var Gh=us(),ds=os();Xh.inherits(Kr,Gh);for(cs=Q8(ds.prototype),Xn=0;Xn<cs.length;Xn++)Gn=cs[Xn],Kr.prototype[Gn]||(Kr.prototype[Gn]=ds.prototype[Gn]);var cs,Gn,Xn;function Kr(r){if(!(this instanceof Kr))return new Kr(r);Gh.call(this,r),ds.call(this,r),r&&r.readable===!1&&(this.readable=!1),r&&r.writable===!1&&(this.writable=!1),this.allowHalfOpen=!0,r&&r.allowHalfOpen===!1&&(this.allowHalfOpen=!1),this.once("end",e6)}Object.defineProperty(Kr.prototype,"writableHighWaterMark",{enumerable:!1,get:function(){return this._writableState.highWaterMark}});function e6(){this.allowHalfOpen||this._writableState.ended||Jh.nextTick(r6,this)}function r6(r){r.end()}Object.defineProperty(Kr.prototype,"destroyed",{get:function(){return this._readableState===void 0||this._writableState===void 0?!1:this._readableState.destroyed&&this._writableState.destroyed},set:function(r){this._readableState===void 0||this._writableState===void 0||(this._readableState.destroyed=r,this._writableState.destroyed=r)}});Kr.prototype._destroy=function(r,e){this.push(null),this.end(),Jh.nextTick(e,r)}});var bs=L(Yh=>{"use strict";var hs=G0().Buffer,Zh=hs.isEncoding||function(r){switch(r=""+r,r&&r.toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"binary":case"base64":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":case"raw":return!0;default:return!1}};function t6(r){if(!r)return"utf8";for(var e;;)switch(r){case"utf8":case"utf-8":return"utf8";case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return"utf16le";case"latin1":case"binary":return"latin1";case"base64":case"ascii":case"hex":return r;default:if(e)return;r=(""+r).toLowerCase(),e=!0}}function i6(r){var e=t6(r);if(typeof e!="string"&&(hs.isEncoding===Zh||!Zh(r)))throw new Error("Unknown encoding: "+r);return e||r}Yh.StringDecoder=$0;function $0(r){this.encoding=i6(r);var e;switch(this.encoding){case"utf16le":this.text=d6,this.end=c6,e=4;break;case"utf8":this.fillLast=a6,e=4;break;case"base64":this.text=u6,this.end=h6,e=3;break;default:this.write=l6,this.end=b6;return}this.lastNeed=0,this.lastTotal=0,this.lastChar=hs.allocUnsafe(e)}$0.prototype.write=function(r){if(r.length===0)return"";var e,t;if(this.lastNeed){if(e=this.fillLast(r),e===void 0)return"";t=this.lastNeed,this.lastNeed=0}else t=0;return t<r.length?e?e+this.text(r,t):this.text(r,t):e||""};$0.prototype.end=o6;$0.prototype.text=s6;$0.prototype.fillLast=function(r){if(this.lastNeed<=r.length)return r.copy(this.lastChar,this.lastTotal-this.lastNeed,0,this.lastNeed),this.lastChar.toString(this.encoding,0,this.lastTotal);r.copy(this.lastChar,this.lastTotal-this.lastNeed,0,r.length),this.lastNeed-=r.length};function ls(r){return r<=127?0:r>>5==6?2:r>>4==14?3:r>>3==30?4:r>>6==2?-1:-2}function n6(r,e,t){var i=e.length-1;if(i<t)return 0;var n=ls(e[i]);return n>=0?(n>0&&(r.lastNeed=n-1),n):--i<t||n===-2?0:(n=ls(e[i]),n>=0?(n>0&&(r.lastNeed=n-2),n):--i<t||n===-2?0:(n=ls(e[i]),n>=0?(n>0&&(n===2?n=0:r.lastNeed=n-3),n):0))}function f6(r,e,t){if((e[0]&192)!=128)return r.lastNeed=0,"\uFFFD";if(r.lastNeed>1&&e.length>1){if((e[1]&192)!=128)return r.lastNeed=1,"\uFFFD";if(r.lastNeed>2&&e.length>2&&(e[2]&192)!=128)return r.lastNeed=2,"\uFFFD"}}function a6(r){var e=this.lastTotal-this.lastNeed,t=f6(this,r,e);if(t!==void 0)return t;if(this.lastNeed<=r.length)return r.copy(this.lastChar,e,0,this.lastNeed),this.lastChar.toString(this.encoding,0,this.lastTotal);r.copy(this.lastChar,e,0,r.length),this.lastNeed-=r.length}function s6(r,e){var t=n6(this,r,e);if(!this.lastNeed)return r.toString("utf8",e);this.lastTotal=t;var i=r.length-(t-this.lastNeed);return r.copy(this.lastChar,0,i),r.toString("utf8",e,i)}function o6(r){var e=r&&r.length?this.write(r):"";return this.lastNeed?e+"\uFFFD":e}function d6(r,e){if((r.length-e)%2==0){var t=r.toString("utf16le",e);if(t){var i=t.charCodeAt(t.length-1);if(i>=55296&&i<=56319)return this.lastNeed=2,this.lastTotal=4,this.lastChar[0]=r[r.length-2],this.lastChar[1]=r[r.length-1],t.slice(0,-1)}return t}return this.lastNeed=1,this.lastTotal=2,this.lastChar[0]=r[r.length-1],r.toString("utf16le",e,r.length-1)}function c6(r){var e=r&&r.length?this.write(r):"";if(this.lastNeed){var t=this.lastTotal-this.lastNeed;return e+this.lastChar.toString("utf16le",0,t)}return e}function u6(r,e){var t=(r.length-e)%3;return t===0?r.toString("base64",e):(this.lastNeed=3-t,this.lastTotal=3,t===1?this.lastChar[0]=r[r.length-1]:(this.lastChar[0]=r[r.length-2],this.lastChar[1]=r[r.length-1]),r.toString("base64",e,r.length-t))}function h6(r){var e=r&&r.length?this.write(r):"";return this.lastNeed?e+this.lastChar.toString("base64",0,3-this.lastNeed):e}function l6(r){return r.toString(this.encoding)}function b6(r){return r&&r.length?this.write(r):""}});var us=L((k5,dl)=>{"use strict";var h0=X0();dl.exports=be;var v6=qh(),Q0;be.ReadableState=rl;var I5=R0().EventEmitter,$h=function(r,e){return r.listeners(e).length},vs=is(),ei=G0().Buffer,p6=global.Uint8Array||function(){};function x6(r){return ei.from(r)}function g6(r){return ei.isBuffer(r)||r instanceof p6}var Qh=Object.create(c0());Qh.inherits=ie();var ps=q0(),Q=void 0;ps&&ps.debuglog?Q=ps.debuglog("stream"):Q=function(){};var y6=Ph(),el=as(),l0;Qh.inherits(be,vs);var xs=["error","close","destroy","pause","resume"];function _6(r,e,t){if(typeof r.prependListener=="function")return r.prependListener(e,t);!r._events||!r._events[e]?r.on(e,t):v6(r._events[e])?r._events[e].unshift(t):r._events[e]=[t,r._events[e]]}function rl(r,e){Q0=Q0||Ot(),r=r||{};var t=e instanceof Q0;this.objectMode=!!r.objectMode,t&&(this.objectMode=this.objectMode||!!r.readableObjectMode);var i=r.highWaterMark,n=r.readableHighWaterMark,f=this.objectMode?16:16*1024;i||i===0?this.highWaterMark=i:t&&(n||n===0)?this.highWaterMark=n:this.highWaterMark=f,this.highWaterMark=Math.floor(this.highWaterMark),this.buffer=new y6,this.length=0,this.pipes=null,this.pipesCount=0,this.flowing=null,this.ended=!1,this.endEmitted=!1,this.reading=!1,this.sync=!0,this.needReadable=!1,this.emittedReadable=!1,this.readableListening=!1,this.resumeScheduled=!1,this.destroyed=!1,this.defaultEncoding=r.defaultEncoding||"utf8",this.awaitDrain=0,this.readingMore=!1,this.decoder=null,this.encoding=null,r.encoding&&(l0||(l0=bs().StringDecoder),this.decoder=new l0(r.encoding),this.encoding=r.encoding)}function be(r){if(Q0=Q0||Ot(),!(this instanceof be))return new be(r);this._readableState=new rl(r,this),this.readable=!0,r&&(typeof r.read=="function"&&(this._read=r.read),typeof r.destroy=="function"&&(this._destroy=r.destroy)),vs.call(this)}Object.defineProperty(be.prototype,"destroyed",{get:function(){return this._readableState===void 0?!1:this._readableState.destroyed},set:function(r){!this._readableState||(this._readableState.destroyed=r)}});be.prototype.destroy=el.destroy;be.prototype._undestroy=el.undestroy;be.prototype._destroy=function(r,e){this.push(null),e(r)};be.prototype.push=function(r,e){var t=this._readableState,i;return t.objectMode?i=!0:typeof r=="string"&&(e=e||t.defaultEncoding,e!==t.encoding&&(r=ei.from(r,e),e=""),i=!0),tl(this,r,e,!1,i)};be.prototype.unshift=function(r){return tl(this,r,null,!0,!1)};function tl(r,e,t,i,n){var f=r._readableState;if(e===null)f.reading=!1,E6(r,f);else{var a;n||(a=m6(f,e)),a?r.emit("error",a):f.objectMode||e&&e.length>0?(typeof e!="string"&&!f.objectMode&&Object.getPrototypeOf(e)!==ei.prototype&&(e=x6(e)),i?f.endEmitted?r.emit("error",new Error("stream.unshift() after end event")):gs(r,f,e,!0):f.ended?r.emit("error",new Error("stream.push() after EOF")):(f.reading=!1,f.decoder&&!t?(e=f.decoder.write(e),f.objectMode||e.length!==0?gs(r,f,e,!1):al(r,f)):gs(r,f,e,!1))):i||(f.reading=!1)}return w6(f)}function gs(r,e,t,i){e.flowing&&e.length===0&&!e.sync?(r.emit("data",t),r.read(0)):(e.length+=e.objectMode?1:t.length,i?e.buffer.unshift(t):e.buffer.push(t),e.needReadable&&Vn(r)),al(r,e)}function m6(r,e){var t;return!g6(e)&&typeof e!="string"&&e!==void 0&&!r.objectMode&&(t=new TypeError("Invalid non-string/buffer chunk")),t}function w6(r){return!r.ended&&(r.needReadable||r.length<r.highWaterMark||r.length===0)}be.prototype.isPaused=function(){return this._readableState.flowing===!1};be.prototype.setEncoding=function(r){return l0||(l0=bs().StringDecoder),this._readableState.decoder=new l0(r),this._readableState.encoding=r,this};var il=8388608;function S6(r){return r>=il?r=il:(r--,r|=r>>>1,r|=r>>>2,r|=r>>>4,r|=r>>>8,r|=r>>>16,r++),r}function nl(r,e){return r<=0||e.length===0&&e.ended?0:e.objectMode?1:r!==r?e.flowing&&e.length?e.buffer.head.data.length:e.length:(r>e.highWaterMark&&(e.highWaterMark=S6(r)),r<=e.length?r:e.ended?e.length:(e.needReadable=!0,0))}be.prototype.read=function(r){Q("read",r),r=parseInt(r,10);var e=this._readableState,t=r;if(r!==0&&(e.emittedReadable=!1),r===0&&e.needReadable&&(e.length>=e.highWaterMark||e.ended))return Q("read: emitReadable",e.length,e.ended),e.length===0&&e.ended?_s(this):Vn(this),null;if(r=nl(r,e),r===0&&e.ended)return e.length===0&&_s(this),null;var i=e.needReadable;Q("need readable",i),(e.length===0||e.length-r<e.highWaterMark)&&(i=!0,Q("length less than watermark",i)),e.ended||e.reading?(i=!1,Q("reading or ended",i)):i&&(Q("do read"),e.reading=!0,e.sync=!0,e.length===0&&(e.needReadable=!0),this._read(e.highWaterMark),e.sync=!1,e.reading||(r=nl(t,e)));var n;return r>0?n=sl(r,e):n=null,n===null?(e.needReadable=!0,r=0):e.length-=r,e.length===0&&(e.ended||(e.needReadable=!0),t!==r&&e.ended&&_s(this)),n!==null&&this.emit("data",n),n};function E6(r,e){if(!e.ended){if(e.decoder){var t=e.decoder.end();t&&t.length&&(e.buffer.push(t),e.length+=e.objectMode?1:t.length)}e.ended=!0,Vn(r)}}function Vn(r){var e=r._readableState;e.needReadable=!1,e.emittedReadable||(Q("emitReadable",e.flowing),e.emittedReadable=!0,e.sync?h0.nextTick(fl,r):fl(r))}function fl(r){Q("emit readable"),r.emit("readable"),ys(r)}function al(r,e){e.readingMore||(e.readingMore=!0,h0.nextTick(M6,r,e))}function M6(r,e){for(var t=e.length;!e.reading&&!e.flowing&&!e.ended&&e.length<e.highWaterMark&&(Q("maybeReadMore read 0"),r.read(0),t!==e.length);)t=e.length;e.readingMore=!1}be.prototype._read=function(r){this.emit("error",new Error("_read() is not implemented"))};be.prototype.pipe=function(r,e){var t=this,i=this._readableState;switch(i.pipesCount){case 0:i.pipes=r;break;case 1:i.pipes=[i.pipes,r];break;default:i.pipes.push(r);break}i.pipesCount+=1,Q("pipe count=%d opts=%j",i.pipesCount,e);var n=(!e||e.end!==!1)&&r!==process.stdout&&r!==process.stderr,f=n?o:A;i.endEmitted?h0.nextTick(f):t.once("end",f),r.on("unpipe",a);function a(_,S){Q("onunpipe"),_===t&&S&&S.hasUnpiped===!1&&(S.hasUnpiped=!0,h())}function o(){Q("onend"),r.end()}var u=A6(t);r.on("drain",u);var v=!1;function h(){Q("cleanup"),r.removeListener("close",E),r.removeListener("finish",R),r.removeListener("drain",u),r.removeListener("error",y),r.removeListener("unpipe",a),t.removeListener("end",o),t.removeListener("end",A),t.removeListener("data",x),v=!0,i.awaitDrain&&(!r._writableState||r._writableState.needDrain)&&u()}var l=!1;t.on("data",x);function x(_){Q("ondata"),l=!1;var S=r.write(_);S===!1&&!l&&((i.pipesCount===1&&i.pipes===r||i.pipesCount>1&&ol(i.pipes,r)!==-1)&&!v&&(Q("false write response, pause",t._readableState.awaitDrain),t._readableState.awaitDrain++,l=!0),t.pause())}function y(_){Q("onerror",_),A(),r.removeListener("error",y),$h(r,"error")===0&&r.emit("error",_)}_6(r,"error",y);function E(){r.removeListener("finish",R),A()}r.once("close",E);function R(){Q("onfinish"),r.removeListener("close",E),A()}r.once("finish",R);function A(){Q("unpipe"),t.unpipe(r)}return r.emit("pipe",t),i.flowing||(Q("pipe resume"),t.resume()),r};function A6(r){return function(){var e=r._readableState;Q("pipeOnDrain",e.awaitDrain),e.awaitDrain&&e.awaitDrain--,e.awaitDrain===0&&$h(r,"data")&&(e.flowing=!0,ys(r))}}be.prototype.unpipe=function(r){var e=this._readableState,t={hasUnpiped:!1};if(e.pipesCount===0)return this;if(e.pipesCount===1)return r&&r!==e.pipes?this:(r||(r=e.pipes),e.pipes=null,e.pipesCount=0,e.flowing=!1,r&&r.emit("unpipe",this,t),this);if(!r){var i=e.pipes,n=e.pipesCount;e.pipes=null,e.pipesCount=0,e.flowing=!1;for(var f=0;f<n;f++)i[f].emit("unpipe",this,t);return this}var a=ol(e.pipes,r);return a===-1?this:(e.pipes.splice(a,1),e.pipesCount-=1,e.pipesCount===1&&(e.pipes=e.pipes[0]),r.emit("unpipe",this,t),this)};be.prototype.on=function(r,e){var t=vs.prototype.on.call(this,r,e);if(r==="data")this._readableState.flowing!==!1&&this.resume();else if(r==="readable"){var i=this._readableState;!i.endEmitted&&!i.readableListening&&(i.readableListening=i.needReadable=!0,i.emittedReadable=!1,i.reading?i.length&&Vn(this):h0.nextTick(B6,this))}return t};be.prototype.addListener=be.prototype.on;function B6(r){Q("readable nexttick read 0"),r.read(0)}be.prototype.resume=function(){var r=this._readableState;return r.flowing||(Q("resume"),r.flowing=!0,R6(this,r)),this};function R6(r,e){e.resumeScheduled||(e.resumeScheduled=!0,h0.nextTick(q6,r,e))}function q6(r,e){e.reading||(Q("resume read 0"),r.read(0)),e.resumeScheduled=!1,e.awaitDrain=0,r.emit("resume"),ys(r),e.flowing&&!e.reading&&r.read(0)}be.prototype.pause=function(){return Q("call pause flowing=%j",this._readableState.flowing),this._readableState.flowing!==!1&&(Q("pause"),this._readableState.flowing=!1,this.emit("pause")),this};function ys(r){var e=r._readableState;for(Q("flow",e.flowing);e.flowing&&r.read()!==null;);}be.prototype.wrap=function(r){var e=this,t=this._readableState,i=!1;r.on("end",function(){if(Q("wrapped end"),t.decoder&&!t.ended){var a=t.decoder.end();a&&a.length&&e.push(a)}e.push(null)}),r.on("data",function(a){if(Q("wrapped data"),t.decoder&&(a=t.decoder.write(a)),!(t.objectMode&&a==null)&&!(!t.objectMode&&(!a||!a.length))){var o=e.push(a);o||(i=!0,r.pause())}});for(var n in r)this[n]===void 0&&typeof r[n]=="function"&&(this[n]=function(a){return function(){return r[a].apply(r,arguments)}}(n));for(var f=0;f<xs.length;f++)r.on(xs[f],this.emit.bind(this,xs[f]));return this._read=function(a){Q("wrapped _read",a),i&&(i=!1,r.resume())},this};Object.defineProperty(be.prototype,"readableHighWaterMark",{enumerable:!1,get:function(){return this._readableState.highWaterMark}});be._fromList=sl;function sl(r,e){if(e.length===0)return null;var t;return e.objectMode?t=e.buffer.shift():!r||r>=e.length?(e.decoder?t=e.buffer.join(""):e.buffer.length===1?t=e.buffer.head.data:t=e.buffer.concat(e.length),e.buffer.clear()):t=C6(r,e.buffer,e.decoder),t}function C6(r,e,t){var i;return r<e.head.data.length?(i=e.head.data.slice(0,r),e.head.data=e.head.data.slice(r)):r===e.head.data.length?i=e.shift():i=t?I6(r,e):k6(r,e),i}function I6(r,e){var t=e.head,i=1,n=t.data;for(r-=n.length;t=t.next;){var f=t.data,a=r>f.length?f.length:r;if(a===f.length?n+=f:n+=f.slice(0,r),r-=a,r===0){a===f.length?(++i,t.next?e.head=t.next:e.head=e.tail=null):(e.head=t,t.data=f.slice(a));break}++i}return e.length-=i,n}function k6(r,e){var t=ei.allocUnsafe(r),i=e.head,n=1;for(i.data.copy(t),r-=i.data.length;i=i.next;){var f=i.data,a=r>f.length?f.length:r;if(f.copy(t,t.length-r,0,a),r-=a,r===0){a===f.length?(++n,i.next?e.head=i.next:e.head=e.tail=null):(e.head=i,i.data=f.slice(a));break}++n}return e.length-=n,t}function _s(r){var e=r._readableState;if(e.length>0)throw new Error('"endReadable()" called on non-empty stream');e.endEmitted||(e.ended=!0,h0.nextTick(T6,e,r))}function T6(r,e){!r.endEmitted&&r.length===0&&(r.endEmitted=!0,e.readable=!1,e.emit("end"))}function ol(r,e){for(var t=0,i=r.length;t<i;t++)if(r[t]===e)return t;return-1}});var ms=L((T5,hl)=>{"use strict";hl.exports=Jr;var Zn=Ot(),cl=Object.create(c0());cl.inherits=ie();cl.inherits(Jr,Zn);function P6(r,e){var t=this._transformState;t.transforming=!1;var i=t.writecb;if(!i)return this.emit("error",new Error("write callback called multiple times"));t.writechunk=null,t.writecb=null,e!=null&&this.push(e),i(r);var n=this._readableState;n.reading=!1,(n.needReadable||n.length<n.highWaterMark)&&this._read(n.highWaterMark)}function Jr(r){if(!(this instanceof Jr))return new Jr(r);Zn.call(this,r),this._transformState={afterTransform:P6.bind(this),needTransform:!1,transforming:!1,writecb:null,writechunk:null,writeencoding:null},this._readableState.needReadable=!0,this._readableState.sync=!1,r&&(typeof r.transform=="function"&&(this._transform=r.transform),typeof r.flush=="function"&&(this._flush=r.flush)),this.on("prefinish",F6)}function F6(){var r=this;typeof this._flush=="function"?this._flush(function(e,t){ul(r,e,t)}):ul(this,null,null)}Jr.prototype.push=function(r,e){return this._transformState.needTransform=!1,Zn.prototype.push.call(this,r,e)};Jr.prototype._transform=function(r,e,t){throw new Error("_transform() is not implemented")};Jr.prototype._write=function(r,e,t){var i=this._transformState;if(i.writecb=t,i.writechunk=r,i.writeencoding=e,!i.transforming){var n=this._readableState;(i.needTransform||n.needReadable||n.length<n.highWaterMark)&&this._read(n.highWaterMark)}};Jr.prototype._read=function(r){var e=this._transformState;e.writechunk!==null&&e.writecb&&!e.transforming?(e.transforming=!0,this._transform(e.writechunk,e.writeencoding,e.afterTransform)):e.needTransform=!0};Jr.prototype._destroy=function(r,e){var t=this;Zn.prototype._destroy.call(this,r,function(i){e(i),t.emit("close")})};function ul(r,e,t){if(e)return r.emit("error",e);if(t!=null&&r.push(t),r._writableState.length)throw new Error("Calling transform done when ws.length != 0");if(r._transformState.transforming)throw new Error("Calling transform done when still transforming");return r.push(null)}});var pl=L((P5,vl)=>{"use strict";vl.exports=ri;var ll=ms(),bl=Object.create(c0());bl.inherits=ie();bl.inherits(ri,ll);function ri(r){if(!(this instanceof ri))return new ri(r);ll.call(this,r)}ri.prototype._transform=function(r,e,t){t(null,r)}});var gl=L((Fr,xl)=>{Fr=xl.exports=us();Fr.Stream=Fr;Fr.Readable=Fr;Fr.Writable=os();Fr.Duplex=Ot();Fr.Transform=ms();Fr.PassThrough=pl()});var Yn=L((F5,ml)=>{var yl=Ve().Buffer,_l=gl().Transform,L6=Bn().StringDecoder,N6=ie();function Sr(r){_l.call(this),this.hashMode=typeof r=="string",this.hashMode?this[r]=this._finalOrDigest:this.final=this._finalOrDigest,this._final&&(this.__final=this._final,this._final=null),this._decoder=null,this._encoding=null}N6(Sr,_l);Sr.prototype.update=function(r,e,t){typeof r=="string"&&(r=yl.from(r,e));var i=this._update(r);return this.hashMode?this:(t&&(i=this._toString(i,t)),i)};Sr.prototype.setAutoPadding=function(){};Sr.prototype.getAuthTag=function(){throw new Error("trying to get auth tag in unsupported state")};Sr.prototype.setAuthTag=function(){throw new Error("trying to set auth tag in unsupported state")};Sr.prototype.setAAD=function(){throw new Error("trying to set aad in unsupported state")};Sr.prototype._transform=function(r,e,t){var i;try{this.hashMode?this._update(r):this.push(this._update(r))}catch(n){i=n}finally{t(i)}};Sr.prototype._flush=function(r){var e;try{this.push(this.__final())}catch(t){e=t}r(e)};Sr.prototype._finalOrDigest=function(r){var e=this.__final()||yl.alloc(0);return r&&(e=this._toString(e,r,!0)),e};Sr.prototype._toString=function(r,e,t){if(this._decoder||(this._decoder=new L6(e),this._encoding=e),this._encoding!==e)throw new Error("can't switch encodings");var i=this._decoder.write(r);return t&&(i+=this._decoder.end()),i};ml.exports=Sr});var Qn=L((L5,Sl)=>{"use strict";var D6=ie(),O6=Za(),H6=$a(),z6=rs(),wl=Yn();function $n(r){wl.call(this,"digest"),this._hash=r}D6($n,wl);$n.prototype._update=function(r){this._hash.update(r)};$n.prototype._final=function(){return this._hash.digest()};Sl.exports=function(e){return e=e.toLowerCase(),e==="md5"?new O6:e==="rmd160"||e==="ripemd160"?new H6:new $n(z6(e))}});var Al=L((N5,Ml)=>{"use strict";var U6=ie(),Ht=Ve().Buffer,El=Yn(),W6=Ht.alloc(128),b0=64;function ef(r,e){El.call(this,"digest"),typeof e=="string"&&(e=Ht.from(e)),this._alg=r,this._key=e,e.length>b0?e=r(e):e.length<b0&&(e=Ht.concat([e,W6],b0));for(var t=this._ipad=Ht.allocUnsafe(b0),i=this._opad=Ht.allocUnsafe(b0),n=0;n<b0;n++)t[n]=e[n]^54,i[n]=e[n]^92;this._hash=[t]}U6(ef,El);ef.prototype._update=function(r){this._hash.push(r)};ef.prototype._final=function(){var r=this._alg(Ht.concat(this._hash));return this._alg(Ht.concat([this._opad,r]))};Ml.exports=ef});var Rl=L((D5,Bl)=>{var j6=Za();Bl.exports=function(r){return new j6().update(r).digest()}});var Es=L((O5,Cl)=>{"use strict";var K6=ie(),J6=Al(),ql=Yn(),ti=Ve().Buffer,X6=Rl(),ws=$a(),Ss=rs(),G6=ti.alloc(128);function ii(r,e){ql.call(this,"digest"),typeof e=="string"&&(e=ti.from(e));var t=r==="sha512"||r==="sha384"?128:64;if(this._alg=r,this._key=e,e.length>t){var i=r==="rmd160"?new ws:Ss(r);e=i.update(e).digest()}else e.length<t&&(e=ti.concat([e,G6],t));for(var n=this._ipad=ti.allocUnsafe(t),f=this._opad=ti.allocUnsafe(t),a=0;a<t;a++)n[a]=e[a]^54,f[a]=e[a]^92;this._hash=r==="rmd160"?new ws:Ss(r),this._hash.update(n)}K6(ii,ql);ii.prototype._update=function(r){this._hash.update(r)};ii.prototype._final=function(){var r=this._hash.digest(),e=this._alg==="rmd160"?new ws:Ss(this._alg);return e.update(this._opad).update(r).digest()};Cl.exports=function(e,t){return e=e.toLowerCase(),e==="rmd160"||e==="ripemd160"?new ii("rmd160",t):e==="md5"?new J6(X6,t):new ii(e,t)}});var Il=L(rf=>{"use strict";Object.defineProperty(rf,"__esModule",{value:!0});var Ms=Qn(),V6=Es();function Z6(r){let e=Ms("sha256").update(r).digest();try{return Ms("rmd160").update(e).digest()}catch(t){return Ms("ripemd160").update(e).digest()}}rf.hash160=Z6;function Y6(r,e){return V6("sha512",r).update(e).digest()}rf.hmacSHA512=Y6});var kl=L(As=>{"use strict";Object.defineProperty(As,"__esModule",{value:!0});var fe=r=>Buffer.from(r,"hex");function $6(r){dr(r.isPoint(fe("0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"))),dr(!r.isPoint(fe("030000000000000000000000000000000000000000000000000000000000000005"))),dr(r.isPrivate(fe("79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"))),dr(r.isPrivate(fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364140"))),dr(!r.isPrivate(fe("0000000000000000000000000000000000000000000000000000000000000000"))),dr(!r.isPrivate(fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141"))),dr(!r.isPrivate(fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364142"))),dr(Buffer.from(r.pointFromScalar(fe("b1121e4088a66a28f5b6b0f5844943ecd9f610196d7bb83b25214b60452c09af"))).equals(fe("02b07ba9dca9523b7ef4bd97703d43d20399eb698e194704791a25ce77a400df99"))),dr(Buffer.from(r.pointAddScalar(fe("0379be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"),fe("0000000000000000000000000000000000000000000000000000000000000003"))).equals(fe("02c6047f9441ed7d6d3045406e95c07cd85c778e4b8cef3ca7abac09b95c709ee5"))),dr(Buffer.from(r.privateAdd(fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd036413e"),fe("0000000000000000000000000000000000000000000000000000000000000002"))).equals(fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364140"))),dr(Buffer.from(r.sign(fe("5e9f0a0d593efdcf78ac923bc3313e4e7d408d574354ee2b3288c0da9fbba6ed"),fe("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364140"))).equals(fe("54c4a33c6423d689378f160a7ff8b61330444abb58fb470f96ea16d99d4a2fed07082304410efa6b2943111b6a4e0aaa7b7db55a07e9861d1fb3cb1f421044a5"))),dr(r.verify(fe("5e9f0a0d593efdcf78ac923bc3313e4e7d408d574354ee2b3288c0da9fbba6ed"),fe("0379be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"),fe("54c4a33c6423d689378f160a7ff8b61330444abb58fb470f96ea16d99d4a2fed07082304410efa6b2943111b6a4e0aaa7b7db55a07e9861d1fb3cb1f421044a5"))),r.signSchnorr&&dr(Buffer.from(r.signSchnorr(fe("7e2d58d8b3bcdf1abadec7829054f90dda9805aab56c77333024b9d0a508b75c"),fe("c90fdaa22168c234c4c6628b80dc1cd129024e088a67cc74020bbea63b14e5c9"),fe("c87aa53824b4d7ae2eb035a2b5bbbccc080e76cdc6d1692c4b0b62d798e6d906"))).equals(fe("5831aaeed7b44bb74e5eab94ba9d4294c49bcf2a60728d8b4c200f50dd313c1bab745879a5ad954a72c45a91c3a51d3c7adea98d82f8481e0e1e03674a6f3fb7"))),r.verifySchnorr&&dr(r.verifySchnorr(fe("7e2d58d8b3bcdf1abadec7829054f90dda9805aab56c77333024b9d0a508b75c"),fe("dd308afec5777e13121fa72b9cc1b7cc0139715309b086c960e18fd969774eb8"),fe("5831aaeed7b44bb74e5eab94ba9d4294c49bcf2a60728d8b4c200f50dd313c1bab745879a5ad954a72c45a91c3a51d3c7adea98d82f8481e0e1e03674a6f3fb7")))}As.testEcc=$6;function dr(r){if(!r)throw new Error("ecc library invalid")}});var Bs=L((U5,Tl)=>{"use strict";var tf=Ve().Buffer;function Q6(r){if(r.length>=255)throw new TypeError("Alphabet too long");for(var e=new Uint8Array(256),t=0;t<e.length;t++)e[t]=255;for(var i=0;i<r.length;i++){var n=r.charAt(i),f=n.charCodeAt(0);if(e[f]!==255)throw new TypeError(n+" is ambiguous");e[f]=i}var a=r.length,o=r.charAt(0),u=Math.log(a)/Math.log(256),v=Math.log(256)/Math.log(a);function h(y){if((Array.isArray(y)||y instanceof Uint8Array)&&(y=tf.from(y)),!tf.isBuffer(y))throw new TypeError("Expected Buffer");if(y.length===0)return"";for(var E=0,R=0,A=0,_=y.length;A!==_&&y[A]===0;)A++,E++;for(var S=(_-A)*v+1>>>0,C=new Uint8Array(S);A!==_;){for(var I=y[A],P=0,k=S-1;(I!==0||P<R)&&k!==-1;k--,P++)I+=256*C[k]>>>0,C[k]=I%a>>>0,I=I/a>>>0;if(I!==0)throw new Error("Non-zero carry");R=P,A++}for(var D=S-R;D!==S&&C[D]===0;)D++;for(var N=o.repeat(E);D<S;++D)N+=r.charAt(C[D]);return N}function l(y){if(typeof y!="string")throw new TypeError("Expected String");if(y.length===0)return tf.alloc(0);for(var E=0,R=0,A=0;y[E]===o;)R++,E++;for(var _=(y.length-E)*u+1>>>0,S=new Uint8Array(_);y[E];){var C=e[y.charCodeAt(E)];if(C===255)return;for(var I=0,P=_-1;(C!==0||I<A)&&P!==-1;P--,I++)C+=a*S[P]>>>0,S[P]=C%256>>>0,C=C/256>>>0;if(C!==0)throw new Error("Non-zero carry");A=I,E++}for(var k=_-A;k!==_&&S[k]===0;)k++;var D=tf.allocUnsafe(R+(_-k));D.fill(0,0,R);for(var N=R;k!==_;)D[N++]=S[k++];return D}function x(y){var E=l(y);if(E)return E;throw new Error("Non-base"+a+" character")}return{encode:h,decodeUnsafe:l,decode:x}}Tl.exports=Q6});var Fl=L((W5,Pl)=>{var e3=Bs(),r3="123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";Pl.exports=e3(r3)});var Nl=L((j5,Ll)=>{"use strict";var Rs=Fl(),t3=Ve().Buffer;Ll.exports=function(r){function e(f){var a=r(f);return Rs.encode(t3.concat([f,a],f.length+4))}function t(f){var a=f.slice(0,-4),o=f.slice(-4),u=r(a);if(!(o[0]^u[0]|o[1]^u[1]|o[2]^u[2]|o[3]^u[3]))return a}function i(f){var a=Rs.decodeUnsafe(f);if(!!a)return t(a)}function n(f){var a=Rs.decode(f),o=t(a,r);if(!o)throw new Error("Invalid checksum");return o}return{encode:e,decode:n,decodeUnsafe:i}}});var Hl=L((K5,Ol)=>{"use strict";var Dl=Qn(),i3=Nl();function n3(r){var e=Dl("sha256").update(r).digest();return Dl("sha256").update(e).digest()}Ol.exports=i3(n3)});var nf=L((J5,Ul)=>{var ni={Array:function(r){return r!=null&&r.constructor===Array},Boolean:function(r){return typeof r=="boolean"},Function:function(r){return typeof r=="function"},Nil:function(r){return r==null},Number:function(r){return typeof r=="number"},Object:function(r){return typeof r=="object"},String:function(r){return typeof r=="string"},"":function(){return!0}};ni.Null=ni.Nil;for(var zl in ni)ni[zl].toJSON=function(r){return r}.bind(null,zl);Ul.exports=ni});var Is=L((X5,Kl)=>{var zt=nf();function Wl(r){return r.name||r.toString().match(/function (.*?)\s*\(/)[1]}function qs(r){return zt.Nil(r)?"":Wl(r.constructor)}function f3(r){return zt.Function(r)?"":zt.String(r)?JSON.stringify(r):r&&zt.Object(r)?"":r}function Cs(r,e){Error.captureStackTrace&&Error.captureStackTrace(r,e)}function ff(r){return zt.Function(r)?r.toJSON?r.toJSON():Wl(r):zt.Array(r)?"Array":r&&zt.Object(r)?"Object":r!==void 0?r:""}function jl(r,e,t){var i=f3(e);return"Expected "+ff(r)+", got"+(t!==""?" "+t:"")+(i!==""?" "+i:"")}function Xr(r,e,t){t=t||qs(e),this.message=jl(r,e,t),Cs(this,Xr),this.__type=r,this.__value=e,this.__valueTypeName=t}Xr.prototype=Object.create(Error.prototype);Xr.prototype.constructor=Xr;function a3(r,e,t,i,n){var f='" of type ';return e==="key"&&(f='" with key type '),jl('property "'+ff(t)+f+ff(r),i,n)}function v0(r,e,t,i,n){r?(n=n||qs(i),this.message=a3(r,t,e,i,n)):this.message='Unexpected property "'+e+'"',Cs(this,Xr),this.__label=t,this.__property=e,this.__type=r,this.__value=i,this.__valueTypeName=n}v0.prototype=Object.create(Error.prototype);v0.prototype.constructor=Xr;function s3(r,e){return new Xr(r,{},e)}function o3(r,e,t){return r instanceof v0?(e=e+"."+r.__property,r=new v0(r.__type,e,r.__label,r.__value,r.__valueTypeName)):r instanceof Xr&&(r=new v0(r.__type,e,t,r.__value,r.__valueTypeName)),Cs(r),r}Kl.exports={TfTypeError:Xr,TfPropertyTypeError:v0,tfCustomError:s3,tfSubError:o3,tfJSON:ff,getValueTypeName:qs}});var Zl=L((G5,Vl)=>{var ks=nf(),d3=Is();function Jl(r){return Buffer.isBuffer(r)}function Xl(r){return typeof r=="string"&&/^([0-9a-f]{2})+$/i.test(r)}function af(r,e){var t=r.toJSON();function i(n){if(!r(n))return!1;if(n.length===e)return!0;throw d3.tfCustomError(t+"(Length: "+e+")",t+"(Length: "+n.length+")")}return i.toJSON=function(){return t},i}var c3=af.bind(null,ks.Array),u3=af.bind(null,Jl),h3=af.bind(null,Xl),l3=af.bind(null,ks.String);function b3(r,e,t){t=t||ks.Number;function i(n,f){return t(n,f)&&n>r&&n<e}return i.toJSON=function(){return`${t.toJSON()} between [${r}, ${e}]`},i}var Ts=Math.pow(2,53)-1;function v3(r){return typeof r=="number"&&isFinite(r)}function p3(r){return r<<24>>24===r}function x3(r){return r<<16>>16===r}function g3(r){return(r|0)===r}function y3(r){return typeof r=="number"&&r>=-Ts&&r<=Ts&&Math.floor(r)===r}function _3(r){return(r&255)===r}function m3(r){return(r&65535)===r}function w3(r){return r>>>0===r}function S3(r){return typeof r=="number"&&r>=0&&r<=Ts&&Math.floor(r)===r}var Ps={ArrayN:c3,Buffer:Jl,BufferN:u3,Finite:v3,Hex:Xl,HexN:h3,Int8:p3,Int16:x3,Int32:g3,Int53:y3,Range:b3,StringN:l3,UInt8:_3,UInt16:m3,UInt32:w3,UInt53:S3};for(var Gl in Ps)Ps[Gl].toJSON=function(r){return r}.bind(null,Gl);Vl.exports=Ps});var r1=L((V5,e1)=>{var fi=Is(),Ze=nf(),Gr=fi.tfJSON,Yl=fi.TfTypeError,$l=fi.TfPropertyTypeError,ai=fi.tfSubError,E3=fi.getValueTypeName,Vr={arrayOf:function(e,t){e=Lr(e),t=t||{};function i(n,f){return!Ze.Array(n)||Ze.Nil(n)||t.minLength!==void 0&&n.length<t.minLength||t.maxLength!==void 0&&n.length>t.maxLength||t.length!==void 0&&n.length!==t.length?!1:n.every(function(a,o){try{return nr(e,a,f)}catch(u){throw ai(u,o)}})}return i.toJSON=function(){var n="["+Gr(e)+"]";return t.length!==void 0?n+="{"+t.length+"}":(t.minLength!==void 0||t.maxLength!==void 0)&&(n+="{"+(t.minLength===void 0?0:t.minLength)+","+(t.maxLength===void 0?Infinity:t.maxLength)+"}"),n},i},maybe:function r(e){e=Lr(e);function t(i,n){return Ze.Nil(i)||e(i,n,r)}return t.toJSON=function(){return"?"+Gr(e)},t},map:function(e,t){e=Lr(e),t&&(t=Lr(t));function i(n,f){if(!Ze.Object(n)||Ze.Nil(n))return!1;for(var a in n){try{t&&nr(t,a,f)}catch(u){throw ai(u,a,"key")}try{var o=n[a];nr(e,o,f)}catch(u){throw ai(u,a)}}return!0}return t?i.toJSON=function(){return"{"+Gr(t)+": "+Gr(e)+"}"}:i.toJSON=function(){return"{"+Gr(e)+"}"},i},object:function(e){var t={};for(var i in e)t[i]=Lr(e[i]);function n(f,a){if(!Ze.Object(f)||Ze.Nil(f))return!1;var o;try{for(o in t){var u=t[o],v=f[o];nr(u,v,a)}}catch(h){throw ai(h,o)}if(a){for(o in f)if(!t[o])throw new $l(void 0,o)}return!0}return n.toJSON=function(){return Gr(t)},n},anyOf:function(){var e=[].slice.call(arguments).map(Lr);function t(i,n){return e.some(function(f){try{return nr(f,i,n)}catch(a){return!1}})}return t.toJSON=function(){return e.map(Gr).join("|")},t},allOf:function(){var e=[].slice.call(arguments).map(Lr);function t(i,n){return e.every(function(f){try{return nr(f,i,n)}catch(a){return!1}})}return t.toJSON=function(){return e.map(Gr).join(" & ")},t},quacksLike:function(e){function t(i){return e===E3(i)}return t.toJSON=function(){return e},t},tuple:function(){var e=[].slice.call(arguments).map(Lr);function t(i,n){return Ze.Nil(i)||Ze.Nil(i.length)||n&&i.length!==e.length?!1:e.every(function(f,a){try{return nr(f,i[a],n)}catch(o){throw ai(o,a)}})}return t.toJSON=function(){return"("+e.map(Gr).join(", ")+")"},t},value:function(e){function t(i){return i===e}return t.toJSON=function(){return e},t}};Vr.oneOf=Vr.anyOf;function Lr(r){if(Ze.String(r))return r[0]==="?"?Vr.maybe(r.slice(1)):Ze[r]||Vr.quacksLike(r);if(r&&Ze.Object(r)){if(Ze.Array(r)){if(r.length!==1)throw new TypeError("Expected compile() parameter of type Array of length 1");return Vr.arrayOf(r[0])}return Vr.object(r)}else if(Ze.Function(r))return r;return Vr.value(r)}function nr(r,e,t,i){if(Ze.Function(r)){if(r(e,t))return!0;throw new Yl(i||r,e)}return nr(Lr(r),e,t)}for(var lt in Ze)nr[lt]=Ze[lt];for(lt in Vr)nr[lt]=Vr[lt];var Ql=Zl();for(lt in Ql)nr[lt]=Ql[lt];nr.compile=Lr;nr.TfTypeError=Yl;nr.TfPropertyTypeError=$l;e1.exports=nr});var i1=L((Z5,t1)=>{var M3=Bs(),A3="123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";t1.exports=M3(A3)});var f1=L((Y5,n1)=>{"use strict";var Fs=i1(),B3=Ve().Buffer;n1.exports=function(r){function e(f){var a=r(f);return Fs.encode(B3.concat([f,a],f.length+4))}function t(f){var a=f.slice(0,-4),o=f.slice(-4),u=r(a);if(!(o[0]^u[0]|o[1]^u[1]|o[2]^u[2]|o[3]^u[3]))return a}function i(f){var a=Fs.decodeUnsafe(f);if(!!a)return t(a)}function n(f){var a=Fs.decode(f),o=t(a,r);if(!o)throw new Error("Invalid checksum");return o}return{encode:e,decode:n,decodeUnsafe:i}}});var o1=L(($5,s1)=>{"use strict";var a1=Qn(),R3=f1();function q3(r){var e=a1("sha256").update(r).digest();return a1("sha256").update(e).digest()}s1.exports=R3(q3)});var u1=L((Q5,c1)=>{var Ls=o1();function d1(r,e){if(e!==void 0&&r[0]!==e)throw new Error("Invalid network version");if(r.length===33)return{version:r[0],privateKey:r.slice(1,33),compressed:!1};if(r.length!==34)throw new Error("Invalid WIF length");if(r[33]!==1)throw new Error("Invalid compression flag");return{version:r[0],privateKey:r.slice(1,33),compressed:!0}}function Ns(r,e,t){var i=new Buffer(t?34:33);return i.writeUInt8(r,0),e.copy(i,1),t&&(i[33]=1),i}function C3(r,e){return d1(Ls.decode(r),e)}function I3(r,e,t){return typeof r=="number"?Ls.encode(Ns(r,e,t)):Ls.encode(Ns(r.version,r.privateKey,r.compressed))}c1.exports={decode:C3,decodeRaw:d1,encode:I3,encodeRaw:Ns}});var l1=L(Os=>{"use strict";Object.defineProperty(Os,"__esModule",{value:!0});var Ds=Il(),k3=kl(),h1=Hl(),Ye=r1(),T3=u1();function P3(r){k3.testEcc(r);let e=Ye.BufferN(32),t=Ye.compile({wif:Ye.UInt8,bip32:{public:Ye.UInt32,private:Ye.UInt32}}),i={messagePrefix:`Bitcoin Signed Message:
`,bech32:"bc",bip32:{public:76067358,private:76066276},pubKeyHash:0,scriptHash:5,wif:128},n=2147483648,f=Math.pow(2,31)-1;function a(R){return Ye.String(R)&&R.match(/^(m\/)?(\d+'?\/)*\d+'?$/)!==null}function o(R){return Ye.UInt32(R)&&R<=f}class u{constructor(A,_,S,C,I=0,P=0,k=0){this.__D=A,this.__Q=_,this.chainCode=S,this.network=C,this.__DEPTH=I,this.__INDEX=P,this.__PARENT_FINGERPRINT=k,Ye(t,C),this.lowR=!1}get depth(){return this.__DEPTH}get index(){return this.__INDEX}get parentFingerprint(){return this.__PARENT_FINGERPRINT}get publicKey(){return this.__Q===void 0&&(this.__Q=Buffer.from(r.pointFromScalar(this.__D,!0))),this.__Q}get privateKey(){return this.__D}get identifier(){return Ds.hash160(this.publicKey)}get fingerprint(){return this.identifier.slice(0,4)}get compressed(){return!0}isNeutered(){return this.__D===void 0}neutered(){return y(this.publicKey,this.chainCode,this.network,this.depth,this.index,this.parentFingerprint)}toBase58(){let A=this.network,_=this.isNeutered()?A.bip32.public:A.bip32.private,S=Buffer.allocUnsafe(78);return S.writeUInt32BE(_,0),S.writeUInt8(this.depth,4),S.writeUInt32BE(this.parentFingerprint,5),S.writeUInt32BE(this.index,9),this.chainCode.copy(S,13),this.isNeutered()?this.publicKey.copy(S,45):(S.writeUInt8(0,45),this.privateKey.copy(S,46)),h1.encode(S)}toWIF(){if(!this.privateKey)throw new TypeError("Missing private key");return T3.encode(this.network.wif,this.privateKey,!0)}derive(A){Ye(Ye.UInt32,A);let _=A>=n,S=Buffer.allocUnsafe(37);if(_){if(this.isNeutered())throw new TypeError("Missing private key for hardened child key");S[0]=0,this.privateKey.copy(S,1),S.writeUInt32BE(A,33)}else this.publicKey.copy(S,0),S.writeUInt32BE(A,33);let C=Ds.hmacSHA512(this.chainCode,S),I=C.slice(0,32),P=C.slice(32);if(!r.isPrivate(I))return this.derive(A+1);let k;if(this.isNeutered()){let D=Buffer.from(r.pointAddScalar(this.publicKey,I,!0));if(D===null)return this.derive(A+1);k=y(D,P,this.network,this.depth+1,A,this.fingerprint.readUInt32BE(0))}else{let D=Buffer.from(r.privateAdd(this.privateKey,I));if(D==null)return this.derive(A+1);k=l(D,P,this.network,this.depth+1,A,this.fingerprint.readUInt32BE(0))}return k}deriveHardened(A){return Ye(o,A),this.derive(A+n)}derivePath(A){Ye(a,A);let _=A.split("/");if(_[0]==="m"){if(this.parentFingerprint)throw new TypeError("Expected master, got child");_=_.slice(1)}return _.reduce((S,C)=>{let I;return C.slice(-1)==="'"?(I=parseInt(C.slice(0,-1),10),S.deriveHardened(I)):(I=parseInt(C,10),S.derive(I))},this)}sign(A,_){if(!this.privateKey)throw new Error("Missing private key");if(_===void 0&&(_=this.lowR),_===!1)return Buffer.from(r.sign(A,this.privateKey));{let S=Buffer.from(r.sign(A,this.privateKey)),C=Buffer.alloc(32,0),I=0;for(;S[0]>127;)I++,C.writeUIntLE(I,0,6),S=Buffer.from(r.sign(A,this.privateKey,C));return S}}signSchnorr(A){if(!this.privateKey)throw new Error("Missing private key");if(!r.signSchnorr)throw new Error("signSchnorr not supported by ecc library");return Buffer.from(r.signSchnorr(A,this.privateKey))}verify(A,_){return r.verify(A,this.publicKey,_)}verifySchnorr(A,_){if(!r.verifySchnorr)throw new Error("verifySchnorr not supported by ecc library");return r.verifySchnorr(A,this.publicKey.subarray(1,33),_)}}function v(R,A){let _=h1.decode(R);if(_.length!==78)throw new TypeError("Invalid buffer length");A=A||i;let S=_.readUInt32BE(0);if(S!==A.bip32.private&&S!==A.bip32.public)throw new TypeError("Invalid network version");let C=_[4],I=_.readUInt32BE(5);if(C===0&&I!==0)throw new TypeError("Invalid parent fingerprint");let P=_.readUInt32BE(9);if(C===0&&P!==0)throw new TypeError("Invalid index");let k=_.slice(13,45),D;if(S===A.bip32.private){if(_.readUInt8(45)!==0)throw new TypeError("Invalid private key");let N=_.slice(46,78);D=l(N,k,A,C,P,I)}else{let N=_.slice(45,78);D=y(N,k,A,C,P,I)}return D}function h(R,A,_){return l(R,A,_)}function l(R,A,_,S,C,I){if(Ye({privateKey:e,chainCode:e},{privateKey:R,chainCode:A}),_=_||i,!r.isPrivate(R))throw new TypeError("Private key not in range [1, n)");return new u(R,void 0,A,_,S,C,I)}function x(R,A,_){return y(R,A,_)}function y(R,A,_,S,C,I){if(Ye({publicKey:Ye.BufferN(33),chainCode:e},{publicKey:R,chainCode:A}),_=_||i,!r.isPoint(R))throw new TypeError("Point is not on the curve");return new u(void 0,R,A,_,S,C,I)}function E(R,A){if(Ye(Ye.Buffer,R),R.length<16)throw new TypeError("Seed should be at least 128 bits");if(R.length>64)throw new TypeError("Seed should be at most 512 bits");A=A||i;let _=Ds.hmacSHA512(Buffer.from("Bitcoin seed","utf8"),R),S=_.slice(0,32),C=_.slice(32);return h(S,C,A)}return{fromSeed:E,fromBase58:v,fromPublicKey:x,fromPrivateKey:h}}Os.BIP32Factory=P3});var v1=L(sf=>{"use strict";Object.defineProperty(sf,"__esModule",{value:!0});var b1=l1();sf.default=b1.BIP32Factory;sf.BIP32Factory=b1.BIP32Factory});var g1=L((t7,x1)=>{var bt=Es(),F3=Buffer.alloc(1,1),p1=Buffer.alloc(1,0);function L3(r,e,t,i,n){let f=Buffer.alloc(32,0),a=Buffer.alloc(32,1);f=bt("sha256",f).update(a).update(p1).update(e).update(r).update(n||"").digest(),a=bt("sha256",f).update(a).digest(),f=bt("sha256",f).update(a).update(F3).update(e).update(r).update(n||"").digest(),a=bt("sha256",f).update(a).digest(),a=bt("sha256",f).update(a).digest();let o=a;for(;!i(o)||!t(o);)f=bt("sha256",f).update(a).update(p1).digest(),a=bt("sha256",f).update(a).digest(),a=bt("sha256",f).update(a).digest(),o=a;return o}x1.exports=L3});var M1=L((i7,E1)=>{var N3=gr(),D3=Ci().ec,Hs=new D3("secp256k1"),O3=g1(),of=Buffer.alloc(32,0),df=Buffer.from("fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141","hex"),y1=Buffer.from("fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f","hex"),Er=Hs.curve.n,_1=Er.shrn(1),cf=Hs.curve.g,uf="Expected Private",Ut="Expected Point",hf="Expected Tweak",m1="Expected Hash",H3="Expected Signature",z3="Expected Extra Data (32 bytes)";function si(r){return Buffer.isBuffer(r)&&r.length===32}function lf(r){return si(r)?r.compare(df)<0:!1}function vt(r){if(!Buffer.isBuffer(r)||r.length<33)return!1;let e=r[0],t=r.slice(1,33);if(t.compare(of)===0||t.compare(y1)>=0)return!1;if((e===2||e===3)&&r.length===33){try{Wt(r)}catch(n){return!1}return!0}let i=r.slice(33);return i.compare(of)===0||i.compare(y1)>=0?!1:e===4&&r.length===65}function w1(r){return r[0]!==4}function U3(r){return vt(r)?w1(r):!1}function pt(r){return si(r)?r.compare(of)>0&&r.compare(df)<0:!1}function W3(r){let e=r.slice(0,32),t=r.slice(32,64);return Buffer.isBuffer(r)&&r.length===64&&e.compare(df)<0&&t.compare(df)<0}function oi(r,e){return r===void 0&&e!==void 0?w1(e):r===void 0?!0:r}function ur(r){return new N3(r)}function bf(r){return r.toArrayLike(Buffer,"be",32)}function Wt(r){return Hs.curve.decodePoint(r)}function p0(r,e){return Buffer.from(r._encode(e))}function j3(r,e,t){if(!vt(r))throw new TypeError(Ut);if(!vt(e))throw new TypeError(Ut);let i=Wt(r),n=Wt(e),f=i.add(n);if(f.isInfinity())return null;let a=oi(t,r);return p0(f,a)}function K3(r,e,t){if(!vt(r))throw new TypeError(Ut);if(!lf(e))throw new TypeError(hf);let i=oi(t,r),n=Wt(r);if(e.compare(of)===0)return p0(n,i);let f=ur(e),a=cf.mul(f),o=n.add(a);return o.isInfinity()?null:p0(o,i)}function J3(r,e){if(!vt(r))throw new TypeError(Ut);let t=Wt(r);if(t.isInfinity())throw new TypeError(Ut);let i=oi(e,r);return p0(t,i)}function X3(r,e){if(!pt(r))throw new TypeError(uf);let t=ur(r),i=cf.mul(t);if(i.isInfinity())return null;let n=oi(e);return p0(i,n)}function G3(r,e,t){if(!vt(r))throw new TypeError(Ut);if(!lf(e))throw new TypeError(hf);let i=oi(t,r),n=Wt(r),f=ur(e),a=n.mul(f);return a.isInfinity()?null:p0(a,i)}function V3(r,e){if(!pt(r))throw new TypeError(uf);if(!lf(e))throw new TypeError(hf);let t=ur(r),i=ur(e),n=bf(t.add(i).umod(Er));return pt(n)?n:null}function Z3(r,e){if(!pt(r))throw new TypeError(uf);if(!lf(e))throw new TypeError(hf);let t=ur(r),i=ur(e),n=bf(t.sub(i).umod(Er));return pt(n)?n:null}function Y3(r,e){return S1(r,e)}function $3(r,e,t){return S1(r,e,t)}function S1(r,e,t){if(!si(r))throw new TypeError(m1);if(!pt(e))throw new TypeError(uf);if(t!==void 0&&!si(t))throw new TypeError(z3);let i=ur(e),n=ur(r),f,a;O3(r,e,function(v){let h=ur(v),l=cf.mul(h);return!(l.isInfinity()||(f=l.x.umod(Er),f.isZero()===0)||(a=h.invm(Er).mul(n.add(i.mul(f))).umod(Er),a.isZero()===0))},pt,t),a.cmp(_1)>0&&(a=Er.sub(a));let u=Buffer.allocUnsafe(64);return bf(f).copy(u,0),bf(a).copy(u,32),u}function Q3(r,e,t,i){if(!si(r))throw new TypeError(m1);if(!vt(e))throw new TypeError(Ut);if(!W3(t))throw new TypeError(H3);let n=Wt(e),f=ur(t.slice(0,32)),a=ur(t.slice(32,64));if(i&&a.cmp(_1)>0||f.gtn(0)<=0||a.gtn(0)<=0)return!1;let o=ur(r),u=a.invm(Er),v=o.mul(u).umod(Er),h=f.mul(u).umod(Er),l=cf.mulAdd(v,n,h);return l.isInfinity()?!1:l.x.umod(Er).eq(f)}E1.exports={isPoint:vt,isPointCompressed:U3,isPrivate:pt,pointAdd:j3,pointAddScalar:K3,pointCompress:J3,pointFromScalar:X3,pointMultiply:G3,privateAdd:V3,privateSub:Z3,sign:Y3,signWithEntropy:$3,verify:Q3}});var zs=m0(Ci()),xt=m0(Ec()),A1=m0(v1()),ex=m0(M1());function B1(r){let e=r.reduce((n,f)=>n+f.length,0),t=new Uint8Array(e),i=0;return r.forEach(n=>{t.set(n,i),i+=n.length}),t}function rx(r){let e=r.words.length,t=new Uint8Array(e<<2),i=0;for(let n=0;n<e;n++){let f=r.words[n];t[i++]=f>>24,t[i++]=f>>16&255,t[i++]=f>>8&255,t[i++]=f&255}return t}function tx(r){let e=Buffer.from(r,"hex");return new Uint8Array(e)}function ix(r){let e=[];for(let t=0;t<r.length;t++)e[t/4|0]|=r[t]<<24-8*t;return xt.default.lib.WordArray.create(e,r.length)}function nx(r){let e="123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz",t="",i=BigInt(e.length),n=BigInt(0);for(let f=0;f<r.length;++f)n=n*BigInt(256)+BigInt(r[f]);for(;n>BigInt(0);){let f=Number(n%i);n=n/i,t=e[f]+t}for(let f=0;f<r.length&&r[f]===0;++f)t=e[0]+t;return t}function vf(r){return new zs.default.ec("secp256k1").keyFromPrivate(r).getPublic("hex")}function pf(r,e=!1){let n=new zs.default.ec("secp256k1").keyFromPrivate(r).getPublic("hex"),f=xt.default.SHA256(xt.default.enc.Hex.parse(n)),a=xt.default.RIPEMD160(f),o=B1([new Uint8Array(e?[137]:[60]),rx(a)]),u=xt.default.SHA256(ix(o)),h=xt.default.SHA256(u).toString(xt.default.enc.Hex).slice(0,8),l=B1([o,tx(h)]);return nx(l)}var R1=(r,e=0)=>{let t=(0,A1.default)(ex),i=Buffer.from(r,"utf-8"),f=t.fromSeed(i).derivePath(`m/0'/0'/${e}'`);return f.privateKey?f.privateKey?.toString("hex"):""};var q1=m0(Ci()),C1=(r=!1)=>{let i=new q1.default.ec("secp256k1").genKeyPair().getPrivate("hex"),n=vf(i);return`${pf(i,r)}:${n}:${i}`},I1=(r,e=!1)=>{let t=vf(r);return`${pf(r,e)}:${t}:${r}`},k1=(r,e)=>pf(r,e),T1=r=>vf(r),P1=(r,e=0)=>R1(r,e);window.generate=C1;window.importPrivateKey=I1;window.addressFromPrivateKey=k1;window.publicKeyFromPrivateKey=T1;window.seedToPrivate=P1;})();
/*!
 * The buffer module from node.js, for the browser.
 *
 * @author   Feross Aboukhadijeh <https://feross.org>
 * @license  MIT
 */
/*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
/*! safe-buffer. MIT License. Feross Aboukhadijeh <https://feross.org/opensource> */
/** @preserve
	(c) 2012 by Cédric Mesnil. All rights reserved.

	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	    - Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	    - Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	*/
/** @preserve
 * Counter block mode compatible with  Dr Brian Gladman fileenc.c
 * derived from CryptoJS.mode.CTR
 * Jan Hruby jhruby.web@gmail.com
 */

}).call(this)}).call(this,require('_process'),typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {},require("buffer").Buffer,arguments[3],arguments[4],arguments[5],arguments[6],require("timers").setImmediate)
},{"_process":5,"buffer":3,"timers":6}],2:[function(require,module,exports){
'use strict'

exports.byteLength = byteLength
exports.toByteArray = toByteArray
exports.fromByteArray = fromByteArray

var lookup = []
var revLookup = []
var Arr = typeof Uint8Array !== 'undefined' ? Uint8Array : Array

var code = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
for (var i = 0, len = code.length; i < len; ++i) {
  lookup[i] = code[i]
  revLookup[code.charCodeAt(i)] = i
}

// Support decoding URL-safe base64 strings, as Node.js does.
// See: https://en.wikipedia.org/wiki/Base64#URL_applications
revLookup['-'.charCodeAt(0)] = 62
revLookup['_'.charCodeAt(0)] = 63

function getLens (b64) {
  var len = b64.length

  if (len % 4 > 0) {
    throw new Error('Invalid string. Length must be a multiple of 4')
  }

  // Trim off extra bytes after placeholder bytes are found
  // See: https://github.com/beatgammit/base64-js/issues/42
  var validLen = b64.indexOf('=')
  if (validLen === -1) validLen = len

  var placeHoldersLen = validLen === len
    ? 0
    : 4 - (validLen % 4)

  return [validLen, placeHoldersLen]
}

// base64 is 4/3 + up to two characters of the original data
function byteLength (b64) {
  var lens = getLens(b64)
  var validLen = lens[0]
  var placeHoldersLen = lens[1]
  return ((validLen + placeHoldersLen) * 3 / 4) - placeHoldersLen
}

function _byteLength (b64, validLen, placeHoldersLen) {
  return ((validLen + placeHoldersLen) * 3 / 4) - placeHoldersLen
}

function toByteArray (b64) {
  var tmp
  var lens = getLens(b64)
  var validLen = lens[0]
  var placeHoldersLen = lens[1]

  var arr = new Arr(_byteLength(b64, validLen, placeHoldersLen))

  var curByte = 0

  // if there are placeholders, only get up to the last complete 4 chars
  var len = placeHoldersLen > 0
    ? validLen - 4
    : validLen

  var i
  for (i = 0; i < len; i += 4) {
    tmp =
      (revLookup[b64.charCodeAt(i)] << 18) |
      (revLookup[b64.charCodeAt(i + 1)] << 12) |
      (revLookup[b64.charCodeAt(i + 2)] << 6) |
      revLookup[b64.charCodeAt(i + 3)]
    arr[curByte++] = (tmp >> 16) & 0xFF
    arr[curByte++] = (tmp >> 8) & 0xFF
    arr[curByte++] = tmp & 0xFF
  }

  if (placeHoldersLen === 2) {
    tmp =
      (revLookup[b64.charCodeAt(i)] << 2) |
      (revLookup[b64.charCodeAt(i + 1)] >> 4)
    arr[curByte++] = tmp & 0xFF
  }

  if (placeHoldersLen === 1) {
    tmp =
      (revLookup[b64.charCodeAt(i)] << 10) |
      (revLookup[b64.charCodeAt(i + 1)] << 4) |
      (revLookup[b64.charCodeAt(i + 2)] >> 2)
    arr[curByte++] = (tmp >> 8) & 0xFF
    arr[curByte++] = tmp & 0xFF
  }

  return arr
}

function tripletToBase64 (num) {
  return lookup[num >> 18 & 0x3F] +
    lookup[num >> 12 & 0x3F] +
    lookup[num >> 6 & 0x3F] +
    lookup[num & 0x3F]
}

function encodeChunk (uint8, start, end) {
  var tmp
  var output = []
  for (var i = start; i < end; i += 3) {
    tmp =
      ((uint8[i] << 16) & 0xFF0000) +
      ((uint8[i + 1] << 8) & 0xFF00) +
      (uint8[i + 2] & 0xFF)
    output.push(tripletToBase64(tmp))
  }
  return output.join('')
}

function fromByteArray (uint8) {
  var tmp
  var len = uint8.length
  var extraBytes = len % 3 // if we have 1 byte left, pad 2 bytes
  var parts = []
  var maxChunkLength = 16383 // must be multiple of 3

  // go through the array every three bytes, we'll deal with trailing stuff later
  for (var i = 0, len2 = len - extraBytes; i < len2; i += maxChunkLength) {
    parts.push(encodeChunk(uint8, i, (i + maxChunkLength) > len2 ? len2 : (i + maxChunkLength)))
  }

  // pad the end with zeros, but make sure to not forget the extra bytes
  if (extraBytes === 1) {
    tmp = uint8[len - 1]
    parts.push(
      lookup[tmp >> 2] +
      lookup[(tmp << 4) & 0x3F] +
      '=='
    )
  } else if (extraBytes === 2) {
    tmp = (uint8[len - 2] << 8) + uint8[len - 1]
    parts.push(
      lookup[tmp >> 10] +
      lookup[(tmp >> 4) & 0x3F] +
      lookup[(tmp << 2) & 0x3F] +
      '='
    )
  }

  return parts.join('')
}

},{}],3:[function(require,module,exports){
(function (Buffer){(function (){
/*!
 * The buffer module from node.js, for the browser.
 *
 * @author   Feross Aboukhadijeh <https://feross.org>
 * @license  MIT
 */
/* eslint-disable no-proto */

'use strict'

var base64 = require('base64-js')
var ieee754 = require('ieee754')

exports.Buffer = Buffer
exports.SlowBuffer = SlowBuffer
exports.INSPECT_MAX_BYTES = 50

var K_MAX_LENGTH = 0x7fffffff
exports.kMaxLength = K_MAX_LENGTH

/**
 * If `Buffer.TYPED_ARRAY_SUPPORT`:
 *   === true    Use Uint8Array implementation (fastest)
 *   === false   Print warning and recommend using `buffer` v4.x which has an Object
 *               implementation (most compatible, even IE6)
 *
 * Browsers that support typed arrays are IE 10+, Firefox 4+, Chrome 7+, Safari 5.1+,
 * Opera 11.6+, iOS 4.2+.
 *
 * We report that the browser does not support typed arrays if the are not subclassable
 * using __proto__. Firefox 4-29 lacks support for adding new properties to `Uint8Array`
 * (See: https://bugzilla.mozilla.org/show_bug.cgi?id=695438). IE 10 lacks support
 * for __proto__ and has a buggy typed array implementation.
 */
Buffer.TYPED_ARRAY_SUPPORT = typedArraySupport()

if (!Buffer.TYPED_ARRAY_SUPPORT && typeof console !== 'undefined' &&
    typeof console.error === 'function') {
  console.error(
    'This browser lacks typed array (Uint8Array) support which is required by ' +
    '`buffer` v5.x. Use `buffer` v4.x if you require old browser support.'
  )
}

function typedArraySupport () {
  // Can typed array instances can be augmented?
  try {
    var arr = new Uint8Array(1)
    arr.__proto__ = { __proto__: Uint8Array.prototype, foo: function () { return 42 } }
    return arr.foo() === 42
  } catch (e) {
    return false
  }
}

Object.defineProperty(Buffer.prototype, 'parent', {
  enumerable: true,
  get: function () {
    if (!Buffer.isBuffer(this)) return undefined
    return this.buffer
  }
})

Object.defineProperty(Buffer.prototype, 'offset', {
  enumerable: true,
  get: function () {
    if (!Buffer.isBuffer(this)) return undefined
    return this.byteOffset
  }
})

function createBuffer (length) {
  if (length > K_MAX_LENGTH) {
    throw new RangeError('The value "' + length + '" is invalid for option "size"')
  }
  // Return an augmented `Uint8Array` instance
  var buf = new Uint8Array(length)
  buf.__proto__ = Buffer.prototype
  return buf
}

/**
 * The Buffer constructor returns instances of `Uint8Array` that have their
 * prototype changed to `Buffer.prototype`. Furthermore, `Buffer` is a subclass of
 * `Uint8Array`, so the returned instances will have all the node `Buffer` methods
 * and the `Uint8Array` methods. Square bracket notation works as expected -- it
 * returns a single octet.
 *
 * The `Uint8Array` prototype remains unmodified.
 */

function Buffer (arg, encodingOrOffset, length) {
  // Common case.
  if (typeof arg === 'number') {
    if (typeof encodingOrOffset === 'string') {
      throw new TypeError(
        'The "string" argument must be of type string. Received type number'
      )
    }
    return allocUnsafe(arg)
  }
  return from(arg, encodingOrOffset, length)
}

// Fix subarray() in ES2016. See: https://github.com/feross/buffer/pull/97
if (typeof Symbol !== 'undefined' && Symbol.species != null &&
    Buffer[Symbol.species] === Buffer) {
  Object.defineProperty(Buffer, Symbol.species, {
    value: null,
    configurable: true,
    enumerable: false,
    writable: false
  })
}

Buffer.poolSize = 8192 // not used by this implementation

function from (value, encodingOrOffset, length) {
  if (typeof value === 'string') {
    return fromString(value, encodingOrOffset)
  }

  if (ArrayBuffer.isView(value)) {
    return fromArrayLike(value)
  }

  if (value == null) {
    throw TypeError(
      'The first argument must be one of type string, Buffer, ArrayBuffer, Array, ' +
      'or Array-like Object. Received type ' + (typeof value)
    )
  }

  if (isInstance(value, ArrayBuffer) ||
      (value && isInstance(value.buffer, ArrayBuffer))) {
    return fromArrayBuffer(value, encodingOrOffset, length)
  }

  if (typeof value === 'number') {
    throw new TypeError(
      'The "value" argument must not be of type number. Received type number'
    )
  }

  var valueOf = value.valueOf && value.valueOf()
  if (valueOf != null && valueOf !== value) {
    return Buffer.from(valueOf, encodingOrOffset, length)
  }

  var b = fromObject(value)
  if (b) return b

  if (typeof Symbol !== 'undefined' && Symbol.toPrimitive != null &&
      typeof value[Symbol.toPrimitive] === 'function') {
    return Buffer.from(
      value[Symbol.toPrimitive]('string'), encodingOrOffset, length
    )
  }

  throw new TypeError(
    'The first argument must be one of type string, Buffer, ArrayBuffer, Array, ' +
    'or Array-like Object. Received type ' + (typeof value)
  )
}

/**
 * Functionally equivalent to Buffer(arg, encoding) but throws a TypeError
 * if value is a number.
 * Buffer.from(str[, encoding])
 * Buffer.from(array)
 * Buffer.from(buffer)
 * Buffer.from(arrayBuffer[, byteOffset[, length]])
 **/
Buffer.from = function (value, encodingOrOffset, length) {
  return from(value, encodingOrOffset, length)
}

// Note: Change prototype *after* Buffer.from is defined to workaround Chrome bug:
// https://github.com/feross/buffer/pull/148
Buffer.prototype.__proto__ = Uint8Array.prototype
Buffer.__proto__ = Uint8Array

function assertSize (size) {
  if (typeof size !== 'number') {
    throw new TypeError('"size" argument must be of type number')
  } else if (size < 0) {
    throw new RangeError('The value "' + size + '" is invalid for option "size"')
  }
}

function alloc (size, fill, encoding) {
  assertSize(size)
  if (size <= 0) {
    return createBuffer(size)
  }
  if (fill !== undefined) {
    // Only pay attention to encoding if it's a string. This
    // prevents accidentally sending in a number that would
    // be interpretted as a start offset.
    return typeof encoding === 'string'
      ? createBuffer(size).fill(fill, encoding)
      : createBuffer(size).fill(fill)
  }
  return createBuffer(size)
}

/**
 * Creates a new filled Buffer instance.
 * alloc(size[, fill[, encoding]])
 **/
Buffer.alloc = function (size, fill, encoding) {
  return alloc(size, fill, encoding)
}

function allocUnsafe (size) {
  assertSize(size)
  return createBuffer(size < 0 ? 0 : checked(size) | 0)
}

/**
 * Equivalent to Buffer(num), by default creates a non-zero-filled Buffer instance.
 * */
Buffer.allocUnsafe = function (size) {
  return allocUnsafe(size)
}
/**
 * Equivalent to SlowBuffer(num), by default creates a non-zero-filled Buffer instance.
 */
Buffer.allocUnsafeSlow = function (size) {
  return allocUnsafe(size)
}

function fromString (string, encoding) {
  if (typeof encoding !== 'string' || encoding === '') {
    encoding = 'utf8'
  }

  if (!Buffer.isEncoding(encoding)) {
    throw new TypeError('Unknown encoding: ' + encoding)
  }

  var length = byteLength(string, encoding) | 0
  var buf = createBuffer(length)

  var actual = buf.write(string, encoding)

  if (actual !== length) {
    // Writing a hex string, for example, that contains invalid characters will
    // cause everything after the first invalid character to be ignored. (e.g.
    // 'abxxcd' will be treated as 'ab')
    buf = buf.slice(0, actual)
  }

  return buf
}

function fromArrayLike (array) {
  var length = array.length < 0 ? 0 : checked(array.length) | 0
  var buf = createBuffer(length)
  for (var i = 0; i < length; i += 1) {
    buf[i] = array[i] & 255
  }
  return buf
}

function fromArrayBuffer (array, byteOffset, length) {
  if (byteOffset < 0 || array.byteLength < byteOffset) {
    throw new RangeError('"offset" is outside of buffer bounds')
  }

  if (array.byteLength < byteOffset + (length || 0)) {
    throw new RangeError('"length" is outside of buffer bounds')
  }

  var buf
  if (byteOffset === undefined && length === undefined) {
    buf = new Uint8Array(array)
  } else if (length === undefined) {
    buf = new Uint8Array(array, byteOffset)
  } else {
    buf = new Uint8Array(array, byteOffset, length)
  }

  // Return an augmented `Uint8Array` instance
  buf.__proto__ = Buffer.prototype
  return buf
}

function fromObject (obj) {
  if (Buffer.isBuffer(obj)) {
    var len = checked(obj.length) | 0
    var buf = createBuffer(len)

    if (buf.length === 0) {
      return buf
    }

    obj.copy(buf, 0, 0, len)
    return buf
  }

  if (obj.length !== undefined) {
    if (typeof obj.length !== 'number' || numberIsNaN(obj.length)) {
      return createBuffer(0)
    }
    return fromArrayLike(obj)
  }

  if (obj.type === 'Buffer' && Array.isArray(obj.data)) {
    return fromArrayLike(obj.data)
  }
}

function checked (length) {
  // Note: cannot use `length < K_MAX_LENGTH` here because that fails when
  // length is NaN (which is otherwise coerced to zero.)
  if (length >= K_MAX_LENGTH) {
    throw new RangeError('Attempt to allocate Buffer larger than maximum ' +
                         'size: 0x' + K_MAX_LENGTH.toString(16) + ' bytes')
  }
  return length | 0
}

function SlowBuffer (length) {
  if (+length != length) { // eslint-disable-line eqeqeq
    length = 0
  }
  return Buffer.alloc(+length)
}

Buffer.isBuffer = function isBuffer (b) {
  return b != null && b._isBuffer === true &&
    b !== Buffer.prototype // so Buffer.isBuffer(Buffer.prototype) will be false
}

Buffer.compare = function compare (a, b) {
  if (isInstance(a, Uint8Array)) a = Buffer.from(a, a.offset, a.byteLength)
  if (isInstance(b, Uint8Array)) b = Buffer.from(b, b.offset, b.byteLength)
  if (!Buffer.isBuffer(a) || !Buffer.isBuffer(b)) {
    throw new TypeError(
      'The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array'
    )
  }

  if (a === b) return 0

  var x = a.length
  var y = b.length

  for (var i = 0, len = Math.min(x, y); i < len; ++i) {
    if (a[i] !== b[i]) {
      x = a[i]
      y = b[i]
      break
    }
  }

  if (x < y) return -1
  if (y < x) return 1
  return 0
}

Buffer.isEncoding = function isEncoding (encoding) {
  switch (String(encoding).toLowerCase()) {
    case 'hex':
    case 'utf8':
    case 'utf-8':
    case 'ascii':
    case 'latin1':
    case 'binary':
    case 'base64':
    case 'ucs2':
    case 'ucs-2':
    case 'utf16le':
    case 'utf-16le':
      return true
    default:
      return false
  }
}

Buffer.concat = function concat (list, length) {
  if (!Array.isArray(list)) {
    throw new TypeError('"list" argument must be an Array of Buffers')
  }

  if (list.length === 0) {
    return Buffer.alloc(0)
  }

  var i
  if (length === undefined) {
    length = 0
    for (i = 0; i < list.length; ++i) {
      length += list[i].length
    }
  }

  var buffer = Buffer.allocUnsafe(length)
  var pos = 0
  for (i = 0; i < list.length; ++i) {
    var buf = list[i]
    if (isInstance(buf, Uint8Array)) {
      buf = Buffer.from(buf)
    }
    if (!Buffer.isBuffer(buf)) {
      throw new TypeError('"list" argument must be an Array of Buffers')
    }
    buf.copy(buffer, pos)
    pos += buf.length
  }
  return buffer
}

function byteLength (string, encoding) {
  if (Buffer.isBuffer(string)) {
    return string.length
  }
  if (ArrayBuffer.isView(string) || isInstance(string, ArrayBuffer)) {
    return string.byteLength
  }
  if (typeof string !== 'string') {
    throw new TypeError(
      'The "string" argument must be one of type string, Buffer, or ArrayBuffer. ' +
      'Received type ' + typeof string
    )
  }

  var len = string.length
  var mustMatch = (arguments.length > 2 && arguments[2] === true)
  if (!mustMatch && len === 0) return 0

  // Use a for loop to avoid recursion
  var loweredCase = false
  for (;;) {
    switch (encoding) {
      case 'ascii':
      case 'latin1':
      case 'binary':
        return len
      case 'utf8':
      case 'utf-8':
        return utf8ToBytes(string).length
      case 'ucs2':
      case 'ucs-2':
      case 'utf16le':
      case 'utf-16le':
        return len * 2
      case 'hex':
        return len >>> 1
      case 'base64':
        return base64ToBytes(string).length
      default:
        if (loweredCase) {
          return mustMatch ? -1 : utf8ToBytes(string).length // assume utf8
        }
        encoding = ('' + encoding).toLowerCase()
        loweredCase = true
    }
  }
}
Buffer.byteLength = byteLength

function slowToString (encoding, start, end) {
  var loweredCase = false

  // No need to verify that "this.length <= MAX_UINT32" since it's a read-only
  // property of a typed array.

  // This behaves neither like String nor Uint8Array in that we set start/end
  // to their upper/lower bounds if the value passed is out of range.
  // undefined is handled specially as per ECMA-262 6th Edition,
  // Section 13.3.3.7 Runtime Semantics: KeyedBindingInitialization.
  if (start === undefined || start < 0) {
    start = 0
  }
  // Return early if start > this.length. Done here to prevent potential uint32
  // coercion fail below.
  if (start > this.length) {
    return ''
  }

  if (end === undefined || end > this.length) {
    end = this.length
  }

  if (end <= 0) {
    return ''
  }

  // Force coersion to uint32. This will also coerce falsey/NaN values to 0.
  end >>>= 0
  start >>>= 0

  if (end <= start) {
    return ''
  }

  if (!encoding) encoding = 'utf8'

  while (true) {
    switch (encoding) {
      case 'hex':
        return hexSlice(this, start, end)

      case 'utf8':
      case 'utf-8':
        return utf8Slice(this, start, end)

      case 'ascii':
        return asciiSlice(this, start, end)

      case 'latin1':
      case 'binary':
        return latin1Slice(this, start, end)

      case 'base64':
        return base64Slice(this, start, end)

      case 'ucs2':
      case 'ucs-2':
      case 'utf16le':
      case 'utf-16le':
        return utf16leSlice(this, start, end)

      default:
        if (loweredCase) throw new TypeError('Unknown encoding: ' + encoding)
        encoding = (encoding + '').toLowerCase()
        loweredCase = true
    }
  }
}

// This property is used by `Buffer.isBuffer` (and the `is-buffer` npm package)
// to detect a Buffer instance. It's not possible to use `instanceof Buffer`
// reliably in a browserify context because there could be multiple different
// copies of the 'buffer' package in use. This method works even for Buffer
// instances that were created from another copy of the `buffer` package.
// See: https://github.com/feross/buffer/issues/154
Buffer.prototype._isBuffer = true

function swap (b, n, m) {
  var i = b[n]
  b[n] = b[m]
  b[m] = i
}

Buffer.prototype.swap16 = function swap16 () {
  var len = this.length
  if (len % 2 !== 0) {
    throw new RangeError('Buffer size must be a multiple of 16-bits')
  }
  for (var i = 0; i < len; i += 2) {
    swap(this, i, i + 1)
  }
  return this
}

Buffer.prototype.swap32 = function swap32 () {
  var len = this.length
  if (len % 4 !== 0) {
    throw new RangeError('Buffer size must be a multiple of 32-bits')
  }
  for (var i = 0; i < len; i += 4) {
    swap(this, i, i + 3)
    swap(this, i + 1, i + 2)
  }
  return this
}

Buffer.prototype.swap64 = function swap64 () {
  var len = this.length
  if (len % 8 !== 0) {
    throw new RangeError('Buffer size must be a multiple of 64-bits')
  }
  for (var i = 0; i < len; i += 8) {
    swap(this, i, i + 7)
    swap(this, i + 1, i + 6)
    swap(this, i + 2, i + 5)
    swap(this, i + 3, i + 4)
  }
  return this
}

Buffer.prototype.toString = function toString () {
  var length = this.length
  if (length === 0) return ''
  if (arguments.length === 0) return utf8Slice(this, 0, length)
  return slowToString.apply(this, arguments)
}

Buffer.prototype.toLocaleString = Buffer.prototype.toString

Buffer.prototype.equals = function equals (b) {
  if (!Buffer.isBuffer(b)) throw new TypeError('Argument must be a Buffer')
  if (this === b) return true
  return Buffer.compare(this, b) === 0
}

Buffer.prototype.inspect = function inspect () {
  var str = ''
  var max = exports.INSPECT_MAX_BYTES
  str = this.toString('hex', 0, max).replace(/(.{2})/g, '$1 ').trim()
  if (this.length > max) str += ' ... '
  return '<Buffer ' + str + '>'
}

Buffer.prototype.compare = function compare (target, start, end, thisStart, thisEnd) {
  if (isInstance(target, Uint8Array)) {
    target = Buffer.from(target, target.offset, target.byteLength)
  }
  if (!Buffer.isBuffer(target)) {
    throw new TypeError(
      'The "target" argument must be one of type Buffer or Uint8Array. ' +
      'Received type ' + (typeof target)
    )
  }

  if (start === undefined) {
    start = 0
  }
  if (end === undefined) {
    end = target ? target.length : 0
  }
  if (thisStart === undefined) {
    thisStart = 0
  }
  if (thisEnd === undefined) {
    thisEnd = this.length
  }

  if (start < 0 || end > target.length || thisStart < 0 || thisEnd > this.length) {
    throw new RangeError('out of range index')
  }

  if (thisStart >= thisEnd && start >= end) {
    return 0
  }
  if (thisStart >= thisEnd) {
    return -1
  }
  if (start >= end) {
    return 1
  }

  start >>>= 0
  end >>>= 0
  thisStart >>>= 0
  thisEnd >>>= 0

  if (this === target) return 0

  var x = thisEnd - thisStart
  var y = end - start
  var len = Math.min(x, y)

  var thisCopy = this.slice(thisStart, thisEnd)
  var targetCopy = target.slice(start, end)

  for (var i = 0; i < len; ++i) {
    if (thisCopy[i] !== targetCopy[i]) {
      x = thisCopy[i]
      y = targetCopy[i]
      break
    }
  }

  if (x < y) return -1
  if (y < x) return 1
  return 0
}

// Finds either the first index of `val` in `buffer` at offset >= `byteOffset`,
// OR the last index of `val` in `buffer` at offset <= `byteOffset`.
//
// Arguments:
// - buffer - a Buffer to search
// - val - a string, Buffer, or number
// - byteOffset - an index into `buffer`; will be clamped to an int32
// - encoding - an optional encoding, relevant is val is a string
// - dir - true for indexOf, false for lastIndexOf
function bidirectionalIndexOf (buffer, val, byteOffset, encoding, dir) {
  // Empty buffer means no match
  if (buffer.length === 0) return -1

  // Normalize byteOffset
  if (typeof byteOffset === 'string') {
    encoding = byteOffset
    byteOffset = 0
  } else if (byteOffset > 0x7fffffff) {
    byteOffset = 0x7fffffff
  } else if (byteOffset < -0x80000000) {
    byteOffset = -0x80000000
  }
  byteOffset = +byteOffset // Coerce to Number.
  if (numberIsNaN(byteOffset)) {
    // byteOffset: it it's undefined, null, NaN, "foo", etc, search whole buffer
    byteOffset = dir ? 0 : (buffer.length - 1)
  }

  // Normalize byteOffset: negative offsets start from the end of the buffer
  if (byteOffset < 0) byteOffset = buffer.length + byteOffset
  if (byteOffset >= buffer.length) {
    if (dir) return -1
    else byteOffset = buffer.length - 1
  } else if (byteOffset < 0) {
    if (dir) byteOffset = 0
    else return -1
  }

  // Normalize val
  if (typeof val === 'string') {
    val = Buffer.from(val, encoding)
  }

  // Finally, search either indexOf (if dir is true) or lastIndexOf
  if (Buffer.isBuffer(val)) {
    // Special case: looking for empty string/buffer always fails
    if (val.length === 0) {
      return -1
    }
    return arrayIndexOf(buffer, val, byteOffset, encoding, dir)
  } else if (typeof val === 'number') {
    val = val & 0xFF // Search for a byte value [0-255]
    if (typeof Uint8Array.prototype.indexOf === 'function') {
      if (dir) {
        return Uint8Array.prototype.indexOf.call(buffer, val, byteOffset)
      } else {
        return Uint8Array.prototype.lastIndexOf.call(buffer, val, byteOffset)
      }
    }
    return arrayIndexOf(buffer, [ val ], byteOffset, encoding, dir)
  }

  throw new TypeError('val must be string, number or Buffer')
}

function arrayIndexOf (arr, val, byteOffset, encoding, dir) {
  var indexSize = 1
  var arrLength = arr.length
  var valLength = val.length

  if (encoding !== undefined) {
    encoding = String(encoding).toLowerCase()
    if (encoding === 'ucs2' || encoding === 'ucs-2' ||
        encoding === 'utf16le' || encoding === 'utf-16le') {
      if (arr.length < 2 || val.length < 2) {
        return -1
      }
      indexSize = 2
      arrLength /= 2
      valLength /= 2
      byteOffset /= 2
    }
  }

  function read (buf, i) {
    if (indexSize === 1) {
      return buf[i]
    } else {
      return buf.readUInt16BE(i * indexSize)
    }
  }

  var i
  if (dir) {
    var foundIndex = -1
    for (i = byteOffset; i < arrLength; i++) {
      if (read(arr, i) === read(val, foundIndex === -1 ? 0 : i - foundIndex)) {
        if (foundIndex === -1) foundIndex = i
        if (i - foundIndex + 1 === valLength) return foundIndex * indexSize
      } else {
        if (foundIndex !== -1) i -= i - foundIndex
        foundIndex = -1
      }
    }
  } else {
    if (byteOffset + valLength > arrLength) byteOffset = arrLength - valLength
    for (i = byteOffset; i >= 0; i--) {
      var found = true
      for (var j = 0; j < valLength; j++) {
        if (read(arr, i + j) !== read(val, j)) {
          found = false
          break
        }
      }
      if (found) return i
    }
  }

  return -1
}

Buffer.prototype.includes = function includes (val, byteOffset, encoding) {
  return this.indexOf(val, byteOffset, encoding) !== -1
}

Buffer.prototype.indexOf = function indexOf (val, byteOffset, encoding) {
  return bidirectionalIndexOf(this, val, byteOffset, encoding, true)
}

Buffer.prototype.lastIndexOf = function lastIndexOf (val, byteOffset, encoding) {
  return bidirectionalIndexOf(this, val, byteOffset, encoding, false)
}

function hexWrite (buf, string, offset, length) {
  offset = Number(offset) || 0
  var remaining = buf.length - offset
  if (!length) {
    length = remaining
  } else {
    length = Number(length)
    if (length > remaining) {
      length = remaining
    }
  }

  var strLen = string.length

  if (length > strLen / 2) {
    length = strLen / 2
  }
  for (var i = 0; i < length; ++i) {
    var parsed = parseInt(string.substr(i * 2, 2), 16)
    if (numberIsNaN(parsed)) return i
    buf[offset + i] = parsed
  }
  return i
}

function utf8Write (buf, string, offset, length) {
  return blitBuffer(utf8ToBytes(string, buf.length - offset), buf, offset, length)
}

function asciiWrite (buf, string, offset, length) {
  return blitBuffer(asciiToBytes(string), buf, offset, length)
}

function latin1Write (buf, string, offset, length) {
  return asciiWrite(buf, string, offset, length)
}

function base64Write (buf, string, offset, length) {
  return blitBuffer(base64ToBytes(string), buf, offset, length)
}

function ucs2Write (buf, string, offset, length) {
  return blitBuffer(utf16leToBytes(string, buf.length - offset), buf, offset, length)
}

Buffer.prototype.write = function write (string, offset, length, encoding) {
  // Buffer#write(string)
  if (offset === undefined) {
    encoding = 'utf8'
    length = this.length
    offset = 0
  // Buffer#write(string, encoding)
  } else if (length === undefined && typeof offset === 'string') {
    encoding = offset
    length = this.length
    offset = 0
  // Buffer#write(string, offset[, length][, encoding])
  } else if (isFinite(offset)) {
    offset = offset >>> 0
    if (isFinite(length)) {
      length = length >>> 0
      if (encoding === undefined) encoding = 'utf8'
    } else {
      encoding = length
      length = undefined
    }
  } else {
    throw new Error(
      'Buffer.write(string, encoding, offset[, length]) is no longer supported'
    )
  }

  var remaining = this.length - offset
  if (length === undefined || length > remaining) length = remaining

  if ((string.length > 0 && (length < 0 || offset < 0)) || offset > this.length) {
    throw new RangeError('Attempt to write outside buffer bounds')
  }

  if (!encoding) encoding = 'utf8'

  var loweredCase = false
  for (;;) {
    switch (encoding) {
      case 'hex':
        return hexWrite(this, string, offset, length)

      case 'utf8':
      case 'utf-8':
        return utf8Write(this, string, offset, length)

      case 'ascii':
        return asciiWrite(this, string, offset, length)

      case 'latin1':
      case 'binary':
        return latin1Write(this, string, offset, length)

      case 'base64':
        // Warning: maxLength not taken into account in base64Write
        return base64Write(this, string, offset, length)

      case 'ucs2':
      case 'ucs-2':
      case 'utf16le':
      case 'utf-16le':
        return ucs2Write(this, string, offset, length)

      default:
        if (loweredCase) throw new TypeError('Unknown encoding: ' + encoding)
        encoding = ('' + encoding).toLowerCase()
        loweredCase = true
    }
  }
}

Buffer.prototype.toJSON = function toJSON () {
  return {
    type: 'Buffer',
    data: Array.prototype.slice.call(this._arr || this, 0)
  }
}

function base64Slice (buf, start, end) {
  if (start === 0 && end === buf.length) {
    return base64.fromByteArray(buf)
  } else {
    return base64.fromByteArray(buf.slice(start, end))
  }
}

function utf8Slice (buf, start, end) {
  end = Math.min(buf.length, end)
  var res = []

  var i = start
  while (i < end) {
    var firstByte = buf[i]
    var codePoint = null
    var bytesPerSequence = (firstByte > 0xEF) ? 4
      : (firstByte > 0xDF) ? 3
        : (firstByte > 0xBF) ? 2
          : 1

    if (i + bytesPerSequence <= end) {
      var secondByte, thirdByte, fourthByte, tempCodePoint

      switch (bytesPerSequence) {
        case 1:
          if (firstByte < 0x80) {
            codePoint = firstByte
          }
          break
        case 2:
          secondByte = buf[i + 1]
          if ((secondByte & 0xC0) === 0x80) {
            tempCodePoint = (firstByte & 0x1F) << 0x6 | (secondByte & 0x3F)
            if (tempCodePoint > 0x7F) {
              codePoint = tempCodePoint
            }
          }
          break
        case 3:
          secondByte = buf[i + 1]
          thirdByte = buf[i + 2]
          if ((secondByte & 0xC0) === 0x80 && (thirdByte & 0xC0) === 0x80) {
            tempCodePoint = (firstByte & 0xF) << 0xC | (secondByte & 0x3F) << 0x6 | (thirdByte & 0x3F)
            if (tempCodePoint > 0x7FF && (tempCodePoint < 0xD800 || tempCodePoint > 0xDFFF)) {
              codePoint = tempCodePoint
            }
          }
          break
        case 4:
          secondByte = buf[i + 1]
          thirdByte = buf[i + 2]
          fourthByte = buf[i + 3]
          if ((secondByte & 0xC0) === 0x80 && (thirdByte & 0xC0) === 0x80 && (fourthByte & 0xC0) === 0x80) {
            tempCodePoint = (firstByte & 0xF) << 0x12 | (secondByte & 0x3F) << 0xC | (thirdByte & 0x3F) << 0x6 | (fourthByte & 0x3F)
            if (tempCodePoint > 0xFFFF && tempCodePoint < 0x110000) {
              codePoint = tempCodePoint
            }
          }
      }
    }

    if (codePoint === null) {
      // we did not generate a valid codePoint so insert a
      // replacement char (U+FFFD) and advance only 1 byte
      codePoint = 0xFFFD
      bytesPerSequence = 1
    } else if (codePoint > 0xFFFF) {
      // encode to utf16 (surrogate pair dance)
      codePoint -= 0x10000
      res.push(codePoint >>> 10 & 0x3FF | 0xD800)
      codePoint = 0xDC00 | codePoint & 0x3FF
    }

    res.push(codePoint)
    i += bytesPerSequence
  }

  return decodeCodePointsArray(res)
}

// Based on http://stackoverflow.com/a/22747272/680742, the browser with
// the lowest limit is Chrome, with 0x10000 args.
// We go 1 magnitude less, for safety
var MAX_ARGUMENTS_LENGTH = 0x1000

function decodeCodePointsArray (codePoints) {
  var len = codePoints.length
  if (len <= MAX_ARGUMENTS_LENGTH) {
    return String.fromCharCode.apply(String, codePoints) // avoid extra slice()
  }

  // Decode in chunks to avoid "call stack size exceeded".
  var res = ''
  var i = 0
  while (i < len) {
    res += String.fromCharCode.apply(
      String,
      codePoints.slice(i, i += MAX_ARGUMENTS_LENGTH)
    )
  }
  return res
}

function asciiSlice (buf, start, end) {
  var ret = ''
  end = Math.min(buf.length, end)

  for (var i = start; i < end; ++i) {
    ret += String.fromCharCode(buf[i] & 0x7F)
  }
  return ret
}

function latin1Slice (buf, start, end) {
  var ret = ''
  end = Math.min(buf.length, end)

  for (var i = start; i < end; ++i) {
    ret += String.fromCharCode(buf[i])
  }
  return ret
}

function hexSlice (buf, start, end) {
  var len = buf.length

  if (!start || start < 0) start = 0
  if (!end || end < 0 || end > len) end = len

  var out = ''
  for (var i = start; i < end; ++i) {
    out += toHex(buf[i])
  }
  return out
}

function utf16leSlice (buf, start, end) {
  var bytes = buf.slice(start, end)
  var res = ''
  for (var i = 0; i < bytes.length; i += 2) {
    res += String.fromCharCode(bytes[i] + (bytes[i + 1] * 256))
  }
  return res
}

Buffer.prototype.slice = function slice (start, end) {
  var len = this.length
  start = ~~start
  end = end === undefined ? len : ~~end

  if (start < 0) {
    start += len
    if (start < 0) start = 0
  } else if (start > len) {
    start = len
  }

  if (end < 0) {
    end += len
    if (end < 0) end = 0
  } else if (end > len) {
    end = len
  }

  if (end < start) end = start

  var newBuf = this.subarray(start, end)
  // Return an augmented `Uint8Array` instance
  newBuf.__proto__ = Buffer.prototype
  return newBuf
}

/*
 * Need to make sure that buffer isn't trying to write out of bounds.
 */
function checkOffset (offset, ext, length) {
  if ((offset % 1) !== 0 || offset < 0) throw new RangeError('offset is not uint')
  if (offset + ext > length) throw new RangeError('Trying to access beyond buffer length')
}

Buffer.prototype.readUIntLE = function readUIntLE (offset, byteLength, noAssert) {
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) checkOffset(offset, byteLength, this.length)

  var val = this[offset]
  var mul = 1
  var i = 0
  while (++i < byteLength && (mul *= 0x100)) {
    val += this[offset + i] * mul
  }

  return val
}

Buffer.prototype.readUIntBE = function readUIntBE (offset, byteLength, noAssert) {
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) {
    checkOffset(offset, byteLength, this.length)
  }

  var val = this[offset + --byteLength]
  var mul = 1
  while (byteLength > 0 && (mul *= 0x100)) {
    val += this[offset + --byteLength] * mul
  }

  return val
}

Buffer.prototype.readUInt8 = function readUInt8 (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 1, this.length)
  return this[offset]
}

Buffer.prototype.readUInt16LE = function readUInt16LE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 2, this.length)
  return this[offset] | (this[offset + 1] << 8)
}

Buffer.prototype.readUInt16BE = function readUInt16BE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 2, this.length)
  return (this[offset] << 8) | this[offset + 1]
}

Buffer.prototype.readUInt32LE = function readUInt32LE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)

  return ((this[offset]) |
      (this[offset + 1] << 8) |
      (this[offset + 2] << 16)) +
      (this[offset + 3] * 0x1000000)
}

Buffer.prototype.readUInt32BE = function readUInt32BE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)

  return (this[offset] * 0x1000000) +
    ((this[offset + 1] << 16) |
    (this[offset + 2] << 8) |
    this[offset + 3])
}

Buffer.prototype.readIntLE = function readIntLE (offset, byteLength, noAssert) {
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) checkOffset(offset, byteLength, this.length)

  var val = this[offset]
  var mul = 1
  var i = 0
  while (++i < byteLength && (mul *= 0x100)) {
    val += this[offset + i] * mul
  }
  mul *= 0x80

  if (val >= mul) val -= Math.pow(2, 8 * byteLength)

  return val
}

Buffer.prototype.readIntBE = function readIntBE (offset, byteLength, noAssert) {
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) checkOffset(offset, byteLength, this.length)

  var i = byteLength
  var mul = 1
  var val = this[offset + --i]
  while (i > 0 && (mul *= 0x100)) {
    val += this[offset + --i] * mul
  }
  mul *= 0x80

  if (val >= mul) val -= Math.pow(2, 8 * byteLength)

  return val
}

Buffer.prototype.readInt8 = function readInt8 (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 1, this.length)
  if (!(this[offset] & 0x80)) return (this[offset])
  return ((0xff - this[offset] + 1) * -1)
}

Buffer.prototype.readInt16LE = function readInt16LE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 2, this.length)
  var val = this[offset] | (this[offset + 1] << 8)
  return (val & 0x8000) ? val | 0xFFFF0000 : val
}

Buffer.prototype.readInt16BE = function readInt16BE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 2, this.length)
  var val = this[offset + 1] | (this[offset] << 8)
  return (val & 0x8000) ? val | 0xFFFF0000 : val
}

Buffer.prototype.readInt32LE = function readInt32LE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)

  return (this[offset]) |
    (this[offset + 1] << 8) |
    (this[offset + 2] << 16) |
    (this[offset + 3] << 24)
}

Buffer.prototype.readInt32BE = function readInt32BE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)

  return (this[offset] << 24) |
    (this[offset + 1] << 16) |
    (this[offset + 2] << 8) |
    (this[offset + 3])
}

Buffer.prototype.readFloatLE = function readFloatLE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)
  return ieee754.read(this, offset, true, 23, 4)
}

Buffer.prototype.readFloatBE = function readFloatBE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 4, this.length)
  return ieee754.read(this, offset, false, 23, 4)
}

Buffer.prototype.readDoubleLE = function readDoubleLE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 8, this.length)
  return ieee754.read(this, offset, true, 52, 8)
}

Buffer.prototype.readDoubleBE = function readDoubleBE (offset, noAssert) {
  offset = offset >>> 0
  if (!noAssert) checkOffset(offset, 8, this.length)
  return ieee754.read(this, offset, false, 52, 8)
}

function checkInt (buf, value, offset, ext, max, min) {
  if (!Buffer.isBuffer(buf)) throw new TypeError('"buffer" argument must be a Buffer instance')
  if (value > max || value < min) throw new RangeError('"value" argument is out of bounds')
  if (offset + ext > buf.length) throw new RangeError('Index out of range')
}

Buffer.prototype.writeUIntLE = function writeUIntLE (value, offset, byteLength, noAssert) {
  value = +value
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) {
    var maxBytes = Math.pow(2, 8 * byteLength) - 1
    checkInt(this, value, offset, byteLength, maxBytes, 0)
  }

  var mul = 1
  var i = 0
  this[offset] = value & 0xFF
  while (++i < byteLength && (mul *= 0x100)) {
    this[offset + i] = (value / mul) & 0xFF
  }

  return offset + byteLength
}

Buffer.prototype.writeUIntBE = function writeUIntBE (value, offset, byteLength, noAssert) {
  value = +value
  offset = offset >>> 0
  byteLength = byteLength >>> 0
  if (!noAssert) {
    var maxBytes = Math.pow(2, 8 * byteLength) - 1
    checkInt(this, value, offset, byteLength, maxBytes, 0)
  }

  var i = byteLength - 1
  var mul = 1
  this[offset + i] = value & 0xFF
  while (--i >= 0 && (mul *= 0x100)) {
    this[offset + i] = (value / mul) & 0xFF
  }

  return offset + byteLength
}

Buffer.prototype.writeUInt8 = function writeUInt8 (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 1, 0xff, 0)
  this[offset] = (value & 0xff)
  return offset + 1
}

Buffer.prototype.writeUInt16LE = function writeUInt16LE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 2, 0xffff, 0)
  this[offset] = (value & 0xff)
  this[offset + 1] = (value >>> 8)
  return offset + 2
}

Buffer.prototype.writeUInt16BE = function writeUInt16BE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 2, 0xffff, 0)
  this[offset] = (value >>> 8)
  this[offset + 1] = (value & 0xff)
  return offset + 2
}

Buffer.prototype.writeUInt32LE = function writeUInt32LE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 4, 0xffffffff, 0)
  this[offset + 3] = (value >>> 24)
  this[offset + 2] = (value >>> 16)
  this[offset + 1] = (value >>> 8)
  this[offset] = (value & 0xff)
  return offset + 4
}

Buffer.prototype.writeUInt32BE = function writeUInt32BE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 4, 0xffffffff, 0)
  this[offset] = (value >>> 24)
  this[offset + 1] = (value >>> 16)
  this[offset + 2] = (value >>> 8)
  this[offset + 3] = (value & 0xff)
  return offset + 4
}

Buffer.prototype.writeIntLE = function writeIntLE (value, offset, byteLength, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) {
    var limit = Math.pow(2, (8 * byteLength) - 1)

    checkInt(this, value, offset, byteLength, limit - 1, -limit)
  }

  var i = 0
  var mul = 1
  var sub = 0
  this[offset] = value & 0xFF
  while (++i < byteLength && (mul *= 0x100)) {
    if (value < 0 && sub === 0 && this[offset + i - 1] !== 0) {
      sub = 1
    }
    this[offset + i] = ((value / mul) >> 0) - sub & 0xFF
  }

  return offset + byteLength
}

Buffer.prototype.writeIntBE = function writeIntBE (value, offset, byteLength, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) {
    var limit = Math.pow(2, (8 * byteLength) - 1)

    checkInt(this, value, offset, byteLength, limit - 1, -limit)
  }

  var i = byteLength - 1
  var mul = 1
  var sub = 0
  this[offset + i] = value & 0xFF
  while (--i >= 0 && (mul *= 0x100)) {
    if (value < 0 && sub === 0 && this[offset + i + 1] !== 0) {
      sub = 1
    }
    this[offset + i] = ((value / mul) >> 0) - sub & 0xFF
  }

  return offset + byteLength
}

Buffer.prototype.writeInt8 = function writeInt8 (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 1, 0x7f, -0x80)
  if (value < 0) value = 0xff + value + 1
  this[offset] = (value & 0xff)
  return offset + 1
}

Buffer.prototype.writeInt16LE = function writeInt16LE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 2, 0x7fff, -0x8000)
  this[offset] = (value & 0xff)
  this[offset + 1] = (value >>> 8)
  return offset + 2
}

Buffer.prototype.writeInt16BE = function writeInt16BE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 2, 0x7fff, -0x8000)
  this[offset] = (value >>> 8)
  this[offset + 1] = (value & 0xff)
  return offset + 2
}

Buffer.prototype.writeInt32LE = function writeInt32LE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 4, 0x7fffffff, -0x80000000)
  this[offset] = (value & 0xff)
  this[offset + 1] = (value >>> 8)
  this[offset + 2] = (value >>> 16)
  this[offset + 3] = (value >>> 24)
  return offset + 4
}

Buffer.prototype.writeInt32BE = function writeInt32BE (value, offset, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) checkInt(this, value, offset, 4, 0x7fffffff, -0x80000000)
  if (value < 0) value = 0xffffffff + value + 1
  this[offset] = (value >>> 24)
  this[offset + 1] = (value >>> 16)
  this[offset + 2] = (value >>> 8)
  this[offset + 3] = (value & 0xff)
  return offset + 4
}

function checkIEEE754 (buf, value, offset, ext, max, min) {
  if (offset + ext > buf.length) throw new RangeError('Index out of range')
  if (offset < 0) throw new RangeError('Index out of range')
}

function writeFloat (buf, value, offset, littleEndian, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) {
    checkIEEE754(buf, value, offset, 4, 3.4028234663852886e+38, -3.4028234663852886e+38)
  }
  ieee754.write(buf, value, offset, littleEndian, 23, 4)
  return offset + 4
}

Buffer.prototype.writeFloatLE = function writeFloatLE (value, offset, noAssert) {
  return writeFloat(this, value, offset, true, noAssert)
}

Buffer.prototype.writeFloatBE = function writeFloatBE (value, offset, noAssert) {
  return writeFloat(this, value, offset, false, noAssert)
}

function writeDouble (buf, value, offset, littleEndian, noAssert) {
  value = +value
  offset = offset >>> 0
  if (!noAssert) {
    checkIEEE754(buf, value, offset, 8, 1.7976931348623157E+308, -1.7976931348623157E+308)
  }
  ieee754.write(buf, value, offset, littleEndian, 52, 8)
  return offset + 8
}

Buffer.prototype.writeDoubleLE = function writeDoubleLE (value, offset, noAssert) {
  return writeDouble(this, value, offset, true, noAssert)
}

Buffer.prototype.writeDoubleBE = function writeDoubleBE (value, offset, noAssert) {
  return writeDouble(this, value, offset, false, noAssert)
}

// copy(targetBuffer, targetStart=0, sourceStart=0, sourceEnd=buffer.length)
Buffer.prototype.copy = function copy (target, targetStart, start, end) {
  if (!Buffer.isBuffer(target)) throw new TypeError('argument should be a Buffer')
  if (!start) start = 0
  if (!end && end !== 0) end = this.length
  if (targetStart >= target.length) targetStart = target.length
  if (!targetStart) targetStart = 0
  if (end > 0 && end < start) end = start

  // Copy 0 bytes; we're done
  if (end === start) return 0
  if (target.length === 0 || this.length === 0) return 0

  // Fatal error conditions
  if (targetStart < 0) {
    throw new RangeError('targetStart out of bounds')
  }
  if (start < 0 || start >= this.length) throw new RangeError('Index out of range')
  if (end < 0) throw new RangeError('sourceEnd out of bounds')

  // Are we oob?
  if (end > this.length) end = this.length
  if (target.length - targetStart < end - start) {
    end = target.length - targetStart + start
  }

  var len = end - start

  if (this === target && typeof Uint8Array.prototype.copyWithin === 'function') {
    // Use built-in when available, missing from IE11
    this.copyWithin(targetStart, start, end)
  } else if (this === target && start < targetStart && targetStart < end) {
    // descending copy from end
    for (var i = len - 1; i >= 0; --i) {
      target[i + targetStart] = this[i + start]
    }
  } else {
    Uint8Array.prototype.set.call(
      target,
      this.subarray(start, end),
      targetStart
    )
  }

  return len
}

// Usage:
//    buffer.fill(number[, offset[, end]])
//    buffer.fill(buffer[, offset[, end]])
//    buffer.fill(string[, offset[, end]][, encoding])
Buffer.prototype.fill = function fill (val, start, end, encoding) {
  // Handle string cases:
  if (typeof val === 'string') {
    if (typeof start === 'string') {
      encoding = start
      start = 0
      end = this.length
    } else if (typeof end === 'string') {
      encoding = end
      end = this.length
    }
    if (encoding !== undefined && typeof encoding !== 'string') {
      throw new TypeError('encoding must be a string')
    }
    if (typeof encoding === 'string' && !Buffer.isEncoding(encoding)) {
      throw new TypeError('Unknown encoding: ' + encoding)
    }
    if (val.length === 1) {
      var code = val.charCodeAt(0)
      if ((encoding === 'utf8' && code < 128) ||
          encoding === 'latin1') {
        // Fast path: If `val` fits into a single byte, use that numeric value.
        val = code
      }
    }
  } else if (typeof val === 'number') {
    val = val & 255
  }

  // Invalid ranges are not set to a default, so can range check early.
  if (start < 0 || this.length < start || this.length < end) {
    throw new RangeError('Out of range index')
  }

  if (end <= start) {
    return this
  }

  start = start >>> 0
  end = end === undefined ? this.length : end >>> 0

  if (!val) val = 0

  var i
  if (typeof val === 'number') {
    for (i = start; i < end; ++i) {
      this[i] = val
    }
  } else {
    var bytes = Buffer.isBuffer(val)
      ? val
      : Buffer.from(val, encoding)
    var len = bytes.length
    if (len === 0) {
      throw new TypeError('The value "' + val +
        '" is invalid for argument "value"')
    }
    for (i = 0; i < end - start; ++i) {
      this[i + start] = bytes[i % len]
    }
  }

  return this
}

// HELPER FUNCTIONS
// ================

var INVALID_BASE64_RE = /[^+/0-9A-Za-z-_]/g

function base64clean (str) {
  // Node takes equal signs as end of the Base64 encoding
  str = str.split('=')[0]
  // Node strips out invalid characters like \n and \t from the string, base64-js does not
  str = str.trim().replace(INVALID_BASE64_RE, '')
  // Node converts strings with length < 2 to ''
  if (str.length < 2) return ''
  // Node allows for non-padded base64 strings (missing trailing ===), base64-js does not
  while (str.length % 4 !== 0) {
    str = str + '='
  }
  return str
}

function toHex (n) {
  if (n < 16) return '0' + n.toString(16)
  return n.toString(16)
}

function utf8ToBytes (string, units) {
  units = units || Infinity
  var codePoint
  var length = string.length
  var leadSurrogate = null
  var bytes = []

  for (var i = 0; i < length; ++i) {
    codePoint = string.charCodeAt(i)

    // is surrogate component
    if (codePoint > 0xD7FF && codePoint < 0xE000) {
      // last char was a lead
      if (!leadSurrogate) {
        // no lead yet
        if (codePoint > 0xDBFF) {
          // unexpected trail
          if ((units -= 3) > -1) bytes.push(0xEF, 0xBF, 0xBD)
          continue
        } else if (i + 1 === length) {
          // unpaired lead
          if ((units -= 3) > -1) bytes.push(0xEF, 0xBF, 0xBD)
          continue
        }

        // valid lead
        leadSurrogate = codePoint

        continue
      }

      // 2 leads in a row
      if (codePoint < 0xDC00) {
        if ((units -= 3) > -1) bytes.push(0xEF, 0xBF, 0xBD)
        leadSurrogate = codePoint
        continue
      }

      // valid surrogate pair
      codePoint = (leadSurrogate - 0xD800 << 10 | codePoint - 0xDC00) + 0x10000
    } else if (leadSurrogate) {
      // valid bmp char, but last char was a lead
      if ((units -= 3) > -1) bytes.push(0xEF, 0xBF, 0xBD)
    }

    leadSurrogate = null

    // encode utf8
    if (codePoint < 0x80) {
      if ((units -= 1) < 0) break
      bytes.push(codePoint)
    } else if (codePoint < 0x800) {
      if ((units -= 2) < 0) break
      bytes.push(
        codePoint >> 0x6 | 0xC0,
        codePoint & 0x3F | 0x80
      )
    } else if (codePoint < 0x10000) {
      if ((units -= 3) < 0) break
      bytes.push(
        codePoint >> 0xC | 0xE0,
        codePoint >> 0x6 & 0x3F | 0x80,
        codePoint & 0x3F | 0x80
      )
    } else if (codePoint < 0x110000) {
      if ((units -= 4) < 0) break
      bytes.push(
        codePoint >> 0x12 | 0xF0,
        codePoint >> 0xC & 0x3F | 0x80,
        codePoint >> 0x6 & 0x3F | 0x80,
        codePoint & 0x3F | 0x80
      )
    } else {
      throw new Error('Invalid code point')
    }
  }

  return bytes
}

function asciiToBytes (str) {
  var byteArray = []
  for (var i = 0; i < str.length; ++i) {
    // Node's code seems to be doing this and not & 0x7F..
    byteArray.push(str.charCodeAt(i) & 0xFF)
  }
  return byteArray
}

function utf16leToBytes (str, units) {
  var c, hi, lo
  var byteArray = []
  for (var i = 0; i < str.length; ++i) {
    if ((units -= 2) < 0) break

    c = str.charCodeAt(i)
    hi = c >> 8
    lo = c % 256
    byteArray.push(lo)
    byteArray.push(hi)
  }

  return byteArray
}

function base64ToBytes (str) {
  return base64.toByteArray(base64clean(str))
}

function blitBuffer (src, dst, offset, length) {
  for (var i = 0; i < length; ++i) {
    if ((i + offset >= dst.length) || (i >= src.length)) break
    dst[i + offset] = src[i]
  }
  return i
}

// ArrayBuffer or Uint8Array objects from other contexts (i.e. iframes) do not pass
// the `instanceof` check but they should be treated as of that type.
// See: https://github.com/feross/buffer/issues/166
function isInstance (obj, type) {
  return obj instanceof type ||
    (obj != null && obj.constructor != null && obj.constructor.name != null &&
      obj.constructor.name === type.name)
}
function numberIsNaN (obj) {
  // For IE11 support
  return obj !== obj // eslint-disable-line no-self-compare
}

}).call(this)}).call(this,require("buffer").Buffer)
},{"base64-js":2,"buffer":3,"ieee754":4}],4:[function(require,module,exports){
/*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
exports.read = function (buffer, offset, isLE, mLen, nBytes) {
  var e, m
  var eLen = (nBytes * 8) - mLen - 1
  var eMax = (1 << eLen) - 1
  var eBias = eMax >> 1
  var nBits = -7
  var i = isLE ? (nBytes - 1) : 0
  var d = isLE ? -1 : 1
  var s = buffer[offset + i]

  i += d

  e = s & ((1 << (-nBits)) - 1)
  s >>= (-nBits)
  nBits += eLen
  for (; nBits > 0; e = (e * 256) + buffer[offset + i], i += d, nBits -= 8) {}

  m = e & ((1 << (-nBits)) - 1)
  e >>= (-nBits)
  nBits += mLen
  for (; nBits > 0; m = (m * 256) + buffer[offset + i], i += d, nBits -= 8) {}

  if (e === 0) {
    e = 1 - eBias
  } else if (e === eMax) {
    return m ? NaN : ((s ? -1 : 1) * Infinity)
  } else {
    m = m + Math.pow(2, mLen)
    e = e - eBias
  }
  return (s ? -1 : 1) * m * Math.pow(2, e - mLen)
}

exports.write = function (buffer, value, offset, isLE, mLen, nBytes) {
  var e, m, c
  var eLen = (nBytes * 8) - mLen - 1
  var eMax = (1 << eLen) - 1
  var eBias = eMax >> 1
  var rt = (mLen === 23 ? Math.pow(2, -24) - Math.pow(2, -77) : 0)
  var i = isLE ? 0 : (nBytes - 1)
  var d = isLE ? 1 : -1
  var s = value < 0 || (value === 0 && 1 / value < 0) ? 1 : 0

  value = Math.abs(value)

  if (isNaN(value) || value === Infinity) {
    m = isNaN(value) ? 1 : 0
    e = eMax
  } else {
    e = Math.floor(Math.log(value) / Math.LN2)
    if (value * (c = Math.pow(2, -e)) < 1) {
      e--
      c *= 2
    }
    if (e + eBias >= 1) {
      value += rt / c
    } else {
      value += rt * Math.pow(2, 1 - eBias)
    }
    if (value * c >= 2) {
      e++
      c /= 2
    }

    if (e + eBias >= eMax) {
      m = 0
      e = eMax
    } else if (e + eBias >= 1) {
      m = ((value * c) - 1) * Math.pow(2, mLen)
      e = e + eBias
    } else {
      m = value * Math.pow(2, eBias - 1) * Math.pow(2, mLen)
      e = 0
    }
  }

  for (; mLen >= 8; buffer[offset + i] = m & 0xff, i += d, m /= 256, mLen -= 8) {}

  e = (e << mLen) | m
  eLen += mLen
  for (; eLen > 0; buffer[offset + i] = e & 0xff, i += d, e /= 256, eLen -= 8) {}

  buffer[offset + i - d] |= s * 128
}

},{}],5:[function(require,module,exports){
// shim for using process in browser
var process = module.exports = {};

// cached from whatever global is present so that test runners that stub it
// don't break things.  But we need to wrap it in a try catch in case it is
// wrapped in strict mode code which doesn't define any globals.  It's inside a
// function because try/catches deoptimize in certain engines.

var cachedSetTimeout;
var cachedClearTimeout;

function defaultSetTimout() {
    throw new Error('setTimeout has not been defined');
}
function defaultClearTimeout () {
    throw new Error('clearTimeout has not been defined');
}
(function () {
    try {
        if (typeof setTimeout === 'function') {
            cachedSetTimeout = setTimeout;
        } else {
            cachedSetTimeout = defaultSetTimout;
        }
    } catch (e) {
        cachedSetTimeout = defaultSetTimout;
    }
    try {
        if (typeof clearTimeout === 'function') {
            cachedClearTimeout = clearTimeout;
        } else {
            cachedClearTimeout = defaultClearTimeout;
        }
    } catch (e) {
        cachedClearTimeout = defaultClearTimeout;
    }
} ())
function runTimeout(fun) {
    if (cachedSetTimeout === setTimeout) {
        //normal enviroments in sane situations
        return setTimeout(fun, 0);
    }
    // if setTimeout wasn't available but was latter defined
    if ((cachedSetTimeout === defaultSetTimout || !cachedSetTimeout) && setTimeout) {
        cachedSetTimeout = setTimeout;
        return setTimeout(fun, 0);
    }
    try {
        // when when somebody has screwed with setTimeout but no I.E. maddness
        return cachedSetTimeout(fun, 0);
    } catch(e){
        try {
            // When we are in I.E. but the script has been evaled so I.E. doesn't trust the global object when called normally
            return cachedSetTimeout.call(null, fun, 0);
        } catch(e){
            // same as above but when it's a version of I.E. that must have the global object for 'this', hopfully our context correct otherwise it will throw a global error
            return cachedSetTimeout.call(this, fun, 0);
        }
    }


}
function runClearTimeout(marker) {
    if (cachedClearTimeout === clearTimeout) {
        //normal enviroments in sane situations
        return clearTimeout(marker);
    }
    // if clearTimeout wasn't available but was latter defined
    if ((cachedClearTimeout === defaultClearTimeout || !cachedClearTimeout) && clearTimeout) {
        cachedClearTimeout = clearTimeout;
        return clearTimeout(marker);
    }
    try {
        // when when somebody has screwed with setTimeout but no I.E. maddness
        return cachedClearTimeout(marker);
    } catch (e){
        try {
            // When we are in I.E. but the script has been evaled so I.E. doesn't  trust the global object when called normally
            return cachedClearTimeout.call(null, marker);
        } catch (e){
            // same as above but when it's a version of I.E. that must have the global object for 'this', hopfully our context correct otherwise it will throw a global error.
            // Some versions of I.E. have different rules for clearTimeout vs setTimeout
            return cachedClearTimeout.call(this, marker);
        }
    }



}
var queue = [];
var draining = false;
var currentQueue;
var queueIndex = -1;

function cleanUpNextTick() {
    if (!draining || !currentQueue) {
        return;
    }
    draining = false;
    if (currentQueue.length) {
        queue = currentQueue.concat(queue);
    } else {
        queueIndex = -1;
    }
    if (queue.length) {
        drainQueue();
    }
}

function drainQueue() {
    if (draining) {
        return;
    }
    var timeout = runTimeout(cleanUpNextTick);
    draining = true;

    var len = queue.length;
    while(len) {
        currentQueue = queue;
        queue = [];
        while (++queueIndex < len) {
            if (currentQueue) {
                currentQueue[queueIndex].run();
            }
        }
        queueIndex = -1;
        len = queue.length;
    }
    currentQueue = null;
    draining = false;
    runClearTimeout(timeout);
}

process.nextTick = function (fun) {
    var args = new Array(arguments.length - 1);
    if (arguments.length > 1) {
        for (var i = 1; i < arguments.length; i++) {
            args[i - 1] = arguments[i];
        }
    }
    queue.push(new Item(fun, args));
    if (queue.length === 1 && !draining) {
        runTimeout(drainQueue);
    }
};

// v8 likes predictible objects
function Item(fun, array) {
    this.fun = fun;
    this.array = array;
}
Item.prototype.run = function () {
    this.fun.apply(null, this.array);
};
process.title = 'browser';
process.browser = true;
process.env = {};
process.argv = [];
process.version = ''; // empty string to avoid regexp issues
process.versions = {};

function noop() {}

process.on = noop;
process.addListener = noop;
process.once = noop;
process.off = noop;
process.removeListener = noop;
process.removeAllListeners = noop;
process.emit = noop;
process.prependListener = noop;
process.prependOnceListener = noop;

process.listeners = function (name) { return [] }

process.binding = function (name) {
    throw new Error('process.binding is not supported');
};

process.cwd = function () { return '/' };
process.chdir = function (dir) {
    throw new Error('process.chdir is not supported');
};
process.umask = function() { return 0; };

},{}],6:[function(require,module,exports){
(function (setImmediate,clearImmediate){(function (){
var nextTick = require('process/browser.js').nextTick;
var apply = Function.prototype.apply;
var slice = Array.prototype.slice;
var immediateIds = {};
var nextImmediateId = 0;

// DOM APIs, for completeness

exports.setTimeout = function() {
  return new Timeout(apply.call(setTimeout, window, arguments), clearTimeout);
};
exports.setInterval = function() {
  return new Timeout(apply.call(setInterval, window, arguments), clearInterval);
};
exports.clearTimeout =
exports.clearInterval = function(timeout) { timeout.close(); };

function Timeout(id, clearFn) {
  this._id = id;
  this._clearFn = clearFn;
}
Timeout.prototype.unref = Timeout.prototype.ref = function() {};
Timeout.prototype.close = function() {
  this._clearFn.call(window, this._id);
};

// Does not start the time, just sets up the members needed.
exports.enroll = function(item, msecs) {
  clearTimeout(item._idleTimeoutId);
  item._idleTimeout = msecs;
};

exports.unenroll = function(item) {
  clearTimeout(item._idleTimeoutId);
  item._idleTimeout = -1;
};

exports._unrefActive = exports.active = function(item) {
  clearTimeout(item._idleTimeoutId);

  var msecs = item._idleTimeout;
  if (msecs >= 0) {
    item._idleTimeoutId = setTimeout(function onTimeout() {
      if (item._onTimeout)
        item._onTimeout();
    }, msecs);
  }
};

// That's not how node.js implements it but the exposed api is the same.
exports.setImmediate = typeof setImmediate === "function" ? setImmediate : function(fn) {
  var id = nextImmediateId++;
  var args = arguments.length < 2 ? false : slice.call(arguments, 1);

  immediateIds[id] = true;

  nextTick(function onNextTick() {
    if (immediateIds[id]) {
      // fn.call() is faster so we optimize for the common use-case
      // @see http://jsperf.com/call-apply-segu
      if (args) {
        fn.apply(null, args);
      } else {
        fn.call(null);
      }
      // Prevent ids from leaking
      exports.clearImmediate(id);
    }
  });

  return id;
};

exports.clearImmediate = typeof clearImmediate === "function" ? clearImmediate : function(id) {
  delete immediateIds[id];
};
}).call(this)}).call(this,require("timers").setImmediate,require("timers").clearImmediate)
},{"process/browser.js":5,"timers":6}]},{},[1]);
