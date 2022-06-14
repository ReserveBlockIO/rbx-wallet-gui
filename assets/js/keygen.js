(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
(function (global,Buffer){(function (){
(()=>{var en=Object.create,_t=Object.defineProperty;var rn=Object.getOwnPropertyDescriptor;var tn=Object.getOwnPropertyNames;var fn=Object.getPrototypeOf,an=Object.prototype.hasOwnProperty;var nn=r=>_t(r,"__esModule",{value:!0});var af=r=>{if(typeof require!="undefined")return require(r);throw new Error('Dynamic require of "'+r+'" is not supported')};var W=(r,e)=>()=>(e||r((e={exports:{}}).exports,e),e.exports);var dn=(r,e,t)=>{if(e&&typeof e=="object"||typeof e=="function")for(let n of tn(e))!an.call(r,n)&&n!=="default"&&_t(r,n,{get:()=>e[n],enumerable:!(t=rn(e,n))||t.enumerable});return r},tr=r=>dn(nn(_t(r!=null?en(fn(r)):{},"default",r&&r.__esModule&&"default"in r?{get:()=>r.default,enumerable:!0}:{value:r,enumerable:!0})),r);var Mt=W(()=>{});var U=W((fr,df)=>{(function(r,e){typeof fr=="object"?df.exports=fr=e():typeof define=="function"&&define.amd?define([],e):r.CryptoJS=e()})(fr,function(){var r=r||function(e,t){var n;if(typeof window!="undefined"&&window.crypto&&(n=window.crypto),typeof self!="undefined"&&self.crypto&&(n=self.crypto),typeof globalThis!="undefined"&&globalThis.crypto&&(n=globalThis.crypto),!n&&typeof window!="undefined"&&window.msCrypto&&(n=window.msCrypto),!n&&typeof global!="undefined"&&global.crypto&&(n=global.crypto),!n&&typeof af=="function")try{n=Mt()}catch(M){}var a=function(){if(n){if(typeof n.getRandomValues=="function")try{return n.getRandomValues(new Uint32Array(1))[0]}catch(M){}if(typeof n.randomBytes=="function")try{return n.randomBytes(4).readInt32LE()}catch(M){}}throw new Error("Native crypto module could not be used to get secure random number.")},c=Object.create||function(){function M(){}return function(B){var k;return M.prototype=B,k=new M,M.prototype=null,k}}(),v={},s=v.lib={},l=s.Base=function(){return{extend:function(M){var B=c(this);return M&&B.mixIn(M),(!B.hasOwnProperty("init")||this.init===B.init)&&(B.init=function(){B.$super.init.apply(this,arguments)}),B.init.prototype=B,B.$super=this,B},create:function(){var M=this.extend();return M.init.apply(M,arguments),M},init:function(){},mixIn:function(M){for(var B in M)M.hasOwnProperty(B)&&(this[B]=M[B]);M.hasOwnProperty("toString")&&(this.toString=M.toString)},clone:function(){return this.init.prototype.extend(this)}}}(),g=s.WordArray=l.extend({init:function(M,B){M=this.words=M||[],B!=t?this.sigBytes=B:this.sigBytes=M.length*4},toString:function(M){return(M||p).stringify(this)},concat:function(M){var B=this.words,k=M.words,I=this.sigBytes,E=M.sigBytes;if(this.clamp(),I%4)for(var H=0;H<E;H++){var D=k[H>>>2]>>>24-H%4*8&255;B[I+H>>>2]|=D<<24-(I+H)%4*8}else for(var F=0;F<E;F+=4)B[I+F>>>2]=k[F>>>2];return this.sigBytes+=E,this},clamp:function(){var M=this.words,B=this.sigBytes;M[B>>>2]&=4294967295<<32-B%4*8,M.length=e.ceil(B/4)},clone:function(){var M=l.clone.call(this);return M.words=this.words.slice(0),M},random:function(M){for(var B=[],k=0;k<M;k+=4)B.push(a());return new g.init(B,M)}}),u=v.enc={},p=u.Hex={stringify:function(M){for(var B=M.words,k=M.sigBytes,I=[],E=0;E<k;E++){var H=B[E>>>2]>>>24-E%4*8&255;I.push((H>>>4).toString(16)),I.push((H&15).toString(16))}return I.join("")},parse:function(M){for(var B=M.length,k=[],I=0;I<B;I+=2)k[I>>>3]|=parseInt(M.substr(I,2),16)<<24-I%8*4;return new g.init(k,B/2)}},x=u.Latin1={stringify:function(M){for(var B=M.words,k=M.sigBytes,I=[],E=0;E<k;E++){var H=B[E>>>2]>>>24-E%4*8&255;I.push(String.fromCharCode(H))}return I.join("")},parse:function(M){for(var B=M.length,k=[],I=0;I<B;I++)k[I>>>2]|=(M.charCodeAt(I)&255)<<24-I%4*8;return new g.init(k,B)}},_=u.Utf8={stringify:function(M){try{return decodeURIComponent(escape(x.stringify(M)))}catch(B){throw new Error("Malformed UTF-8 data")}},parse:function(M){return x.parse(unescape(encodeURIComponent(M)))}},S=s.BufferedBlockAlgorithm=l.extend({reset:function(){this._data=new g.init,this._nDataBytes=0},_append:function(M){typeof M=="string"&&(M=_.parse(M)),this._data.concat(M),this._nDataBytes+=M.sigBytes},_process:function(M){var B,k=this._data,I=k.words,E=k.sigBytes,H=this.blockSize,D=H*4,F=E/D;M?F=e.ceil(F):F=e.max((F|0)-this._minBufferSize,0);var N=F*H,w=e.min(N*4,E);if(N){for(var f=0;f<N;f+=H)this._doProcessBlock(I,f);B=I.splice(0,N),k.sigBytes-=w}return new g.init(B,w)},clone:function(){var M=l.clone.call(this);return M._data=this._data.clone(),M},_minBufferSize:0}),z=s.Hasher=S.extend({cfg:l.extend(),init:function(M){this.cfg=this.cfg.extend(M),this.reset()},reset:function(){S.reset.call(this),this._doReset()},update:function(M){return this._append(M),this._process(),this},finalize:function(M){M&&this._append(M);var B=this._doFinalize();return B},blockSize:512/32,_createHelper:function(M){return function(B,k){return new M.init(k).finalize(B)}},_createHmacHelper:function(M){return function(B,k){return new C.HMAC.init(M,k).finalize(B)}}}),C=v.algo={};return v}(Math);return r})});var Ue=W((ar,cf)=>{(function(r,e){typeof ar=="object"?cf.exports=ar=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(ar,function(r){return function(e){var t=r,n=t.lib,a=n.Base,c=n.WordArray,v=t.x64={},s=v.Word=a.extend({init:function(g,u){this.high=g,this.low=u}}),l=v.WordArray=a.extend({init:function(g,u){g=this.words=g||[],u!=e?this.sigBytes=u:this.sigBytes=g.length*8},toX32:function(){for(var g=this.words,u=g.length,p=[],x=0;x<u;x++){var _=g[x];p.push(_.high),p.push(_.low)}return c.create(p,this.sigBytes)},clone:function(){for(var g=a.clone.call(this),u=g.words=this.words.slice(0),p=u.length,x=0;x<p;x++)u[x]=u[x].clone();return g}})}(),r})});var of=W((ir,sf)=>{(function(r,e){typeof ir=="object"?sf.exports=ir=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(ir,function(r){return function(){if(typeof ArrayBuffer=="function"){var e=r,t=e.lib,n=t.WordArray,a=n.init,c=n.init=function(v){if(v instanceof ArrayBuffer&&(v=new Uint8Array(v)),(v instanceof Int8Array||typeof Uint8ClampedArray!="undefined"&&v instanceof Uint8ClampedArray||v instanceof Int16Array||v instanceof Uint16Array||v instanceof Int32Array||v instanceof Uint32Array||v instanceof Float32Array||v instanceof Float64Array)&&(v=new Uint8Array(v.buffer,v.byteOffset,v.byteLength)),v instanceof Uint8Array){for(var s=v.byteLength,l=[],g=0;g<s;g++)l[g>>>2]|=v[g]<<24-g%4*8;a.call(this,l,s)}else a.apply(this,arguments)};c.prototype=n}}(),r.lib.WordArray})});var uf=W((nr,hf)=>{(function(r,e){typeof nr=="object"?hf.exports=nr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(nr,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=e.enc,c=a.Utf16=a.Utf16BE={stringify:function(s){for(var l=s.words,g=s.sigBytes,u=[],p=0;p<g;p+=2){var x=l[p>>>2]>>>16-p%4*8&65535;u.push(String.fromCharCode(x))}return u.join("")},parse:function(s){for(var l=s.length,g=[],u=0;u<l;u++)g[u>>>1]|=s.charCodeAt(u)<<16-u%2*16;return n.create(g,l*2)}};a.Utf16LE={stringify:function(s){for(var l=s.words,g=s.sigBytes,u=[],p=0;p<g;p+=2){var x=v(l[p>>>2]>>>16-p%4*8&65535);u.push(String.fromCharCode(x))}return u.join("")},parse:function(s){for(var l=s.length,g=[],u=0;u<l;u++)g[u>>>1]|=v(s.charCodeAt(u)<<16-u%2*16);return n.create(g,l*2)}};function v(s){return s<<8&4278255360|s>>>8&16711935}}(),r.enc.Utf16})});var _e=W((dr,lf)=>{(function(r,e){typeof dr=="object"?lf.exports=dr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(dr,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=e.enc,c=a.Base64={stringify:function(s){var l=s.words,g=s.sigBytes,u=this._map;s.clamp();for(var p=[],x=0;x<g;x+=3)for(var _=l[x>>>2]>>>24-x%4*8&255,S=l[x+1>>>2]>>>24-(x+1)%4*8&255,z=l[x+2>>>2]>>>24-(x+2)%4*8&255,C=_<<16|S<<8|z,M=0;M<4&&x+M*.75<g;M++)p.push(u.charAt(C>>>6*(3-M)&63));var B=u.charAt(64);if(B)for(;p.length%4;)p.push(B);return p.join("")},parse:function(s){var l=s.length,g=this._map,u=this._reverseMap;if(!u){u=this._reverseMap=[];for(var p=0;p<g.length;p++)u[g.charCodeAt(p)]=p}var x=g.charAt(64);if(x){var _=s.indexOf(x);_!==-1&&(l=_)}return v(s,l,u)},_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="};function v(s,l,g){for(var u=[],p=0,x=0;x<l;x++)if(x%4){var _=g[s.charCodeAt(x-1)]<<x%4*2,S=g[s.charCodeAt(x)]>>>6-x%4*2,z=_|S;u[p>>>2]|=z<<24-p%4*8,p++}return n.create(u,p)}}(),r.enc.Base64})});var vf=W((cr,bf)=>{(function(r,e){typeof cr=="object"?bf.exports=cr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(cr,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=e.enc,c=a.Base64url={stringify:function(s,l=!0){var g=s.words,u=s.sigBytes,p=l?this._safe_map:this._map;s.clamp();for(var x=[],_=0;_<u;_+=3)for(var S=g[_>>>2]>>>24-_%4*8&255,z=g[_+1>>>2]>>>24-(_+1)%4*8&255,C=g[_+2>>>2]>>>24-(_+2)%4*8&255,M=S<<16|z<<8|C,B=0;B<4&&_+B*.75<u;B++)x.push(p.charAt(M>>>6*(3-B)&63));var k=p.charAt(64);if(k)for(;x.length%4;)x.push(k);return x.join("")},parse:function(s,l=!0){var g=s.length,u=l?this._safe_map:this._map,p=this._reverseMap;if(!p){p=this._reverseMap=[];for(var x=0;x<u.length;x++)p[u.charCodeAt(x)]=x}var _=u.charAt(64);if(_){var S=s.indexOf(_);S!==-1&&(g=S)}return v(s,g,p)},_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",_safe_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"};function v(s,l,g){for(var u=[],p=0,x=0;x<l;x++)if(x%4){var _=g[s.charCodeAt(x-1)]<<x%4*2,S=g[s.charCodeAt(x)]>>>6-x%4*2,z=_|S;u[p>>>2]|=z<<24-p%4*8,p++}return n.create(u,p)}}(),r.enc.Base64url})});var we=W((sr,xf)=>{(function(r,e){typeof sr=="object"?xf.exports=sr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(sr,function(r){return function(e){var t=r,n=t.lib,a=n.WordArray,c=n.Hasher,v=t.algo,s=[];(function(){for(var _=0;_<64;_++)s[_]=e.abs(e.sin(_+1))*4294967296|0})();var l=v.MD5=c.extend({_doReset:function(){this._hash=new a.init([1732584193,4023233417,2562383102,271733878])},_doProcessBlock:function(_,S){for(var z=0;z<16;z++){var C=S+z,M=_[C];_[C]=(M<<8|M>>>24)&16711935|(M<<24|M>>>8)&4278255360}var B=this._hash.words,k=_[S+0],I=_[S+1],E=_[S+2],H=_[S+3],D=_[S+4],F=_[S+5],N=_[S+6],w=_[S+7],f=_[S+8],d=_[S+9],o=_[S+10],h=_[S+11],y=_[S+12],A=_[S+13],q=_[S+14],m=_[S+15],i=B[0],b=B[1],P=B[2],R=B[3];i=g(i,b,P,R,k,7,s[0]),R=g(R,i,b,P,I,12,s[1]),P=g(P,R,i,b,E,17,s[2]),b=g(b,P,R,i,H,22,s[3]),i=g(i,b,P,R,D,7,s[4]),R=g(R,i,b,P,F,12,s[5]),P=g(P,R,i,b,N,17,s[6]),b=g(b,P,R,i,w,22,s[7]),i=g(i,b,P,R,f,7,s[8]),R=g(R,i,b,P,d,12,s[9]),P=g(P,R,i,b,o,17,s[10]),b=g(b,P,R,i,h,22,s[11]),i=g(i,b,P,R,y,7,s[12]),R=g(R,i,b,P,A,12,s[13]),P=g(P,R,i,b,q,17,s[14]),b=g(b,P,R,i,m,22,s[15]),i=u(i,b,P,R,I,5,s[16]),R=u(R,i,b,P,N,9,s[17]),P=u(P,R,i,b,h,14,s[18]),b=u(b,P,R,i,k,20,s[19]),i=u(i,b,P,R,F,5,s[20]),R=u(R,i,b,P,o,9,s[21]),P=u(P,R,i,b,m,14,s[22]),b=u(b,P,R,i,D,20,s[23]),i=u(i,b,P,R,d,5,s[24]),R=u(R,i,b,P,q,9,s[25]),P=u(P,R,i,b,H,14,s[26]),b=u(b,P,R,i,f,20,s[27]),i=u(i,b,P,R,A,5,s[28]),R=u(R,i,b,P,E,9,s[29]),P=u(P,R,i,b,w,14,s[30]),b=u(b,P,R,i,y,20,s[31]),i=p(i,b,P,R,F,4,s[32]),R=p(R,i,b,P,f,11,s[33]),P=p(P,R,i,b,h,16,s[34]),b=p(b,P,R,i,q,23,s[35]),i=p(i,b,P,R,I,4,s[36]),R=p(R,i,b,P,D,11,s[37]),P=p(P,R,i,b,w,16,s[38]),b=p(b,P,R,i,o,23,s[39]),i=p(i,b,P,R,A,4,s[40]),R=p(R,i,b,P,k,11,s[41]),P=p(P,R,i,b,H,16,s[42]),b=p(b,P,R,i,N,23,s[43]),i=p(i,b,P,R,d,4,s[44]),R=p(R,i,b,P,y,11,s[45]),P=p(P,R,i,b,m,16,s[46]),b=p(b,P,R,i,E,23,s[47]),i=x(i,b,P,R,k,6,s[48]),R=x(R,i,b,P,w,10,s[49]),P=x(P,R,i,b,q,15,s[50]),b=x(b,P,R,i,F,21,s[51]),i=x(i,b,P,R,y,6,s[52]),R=x(R,i,b,P,H,10,s[53]),P=x(P,R,i,b,o,15,s[54]),b=x(b,P,R,i,I,21,s[55]),i=x(i,b,P,R,f,6,s[56]),R=x(R,i,b,P,m,10,s[57]),P=x(P,R,i,b,N,15,s[58]),b=x(b,P,R,i,A,21,s[59]),i=x(i,b,P,R,D,6,s[60]),R=x(R,i,b,P,h,10,s[61]),P=x(P,R,i,b,E,15,s[62]),b=x(b,P,R,i,d,21,s[63]),B[0]=B[0]+i|0,B[1]=B[1]+b|0,B[2]=B[2]+P|0,B[3]=B[3]+R|0},_doFinalize:function(){var _=this._data,S=_.words,z=this._nDataBytes*8,C=_.sigBytes*8;S[C>>>5]|=128<<24-C%32;var M=e.floor(z/4294967296),B=z;S[(C+64>>>9<<4)+15]=(M<<8|M>>>24)&16711935|(M<<24|M>>>8)&4278255360,S[(C+64>>>9<<4)+14]=(B<<8|B>>>24)&16711935|(B<<24|B>>>8)&4278255360,_.sigBytes=(S.length+1)*4,this._process();for(var k=this._hash,I=k.words,E=0;E<4;E++){var H=I[E];I[E]=(H<<8|H>>>24)&16711935|(H<<24|H>>>8)&4278255360}return k},clone:function(){var _=c.clone.call(this);return _._hash=this._hash.clone(),_}});function g(_,S,z,C,M,B,k){var I=_+(S&z|~S&C)+M+k;return(I<<B|I>>>32-B)+S}function u(_,S,z,C,M,B,k){var I=_+(S&C|z&~C)+M+k;return(I<<B|I>>>32-B)+S}function p(_,S,z,C,M,B,k){var I=_+(S^z^C)+M+k;return(I<<B|I>>>32-B)+S}function x(_,S,z,C,M,B,k){var I=_+(z^(S|~C))+M+k;return(I<<B|I>>>32-B)+S}t.MD5=c._createHelper(l),t.HmacMD5=c._createHmacHelper(l)}(Math),r.MD5})});var hr=W((or,pf)=>{(function(r,e){typeof or=="object"?pf.exports=or=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(or,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=t.Hasher,c=e.algo,v=[],s=c.SHA1=a.extend({_doReset:function(){this._hash=new n.init([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(l,g){for(var u=this._hash.words,p=u[0],x=u[1],_=u[2],S=u[3],z=u[4],C=0;C<80;C++){if(C<16)v[C]=l[g+C]|0;else{var M=v[C-3]^v[C-8]^v[C-14]^v[C-16];v[C]=M<<1|M>>>31}var B=(p<<5|p>>>27)+z+v[C];C<20?B+=(x&_|~x&S)+1518500249:C<40?B+=(x^_^S)+1859775393:C<60?B+=(x&_|x&S|_&S)-1894007588:B+=(x^_^S)-899497514,z=S,S=_,_=x<<30|x>>>2,x=p,p=B}u[0]=u[0]+p|0,u[1]=u[1]+x|0,u[2]=u[2]+_|0,u[3]=u[3]+S|0,u[4]=u[4]+z|0},_doFinalize:function(){var l=this._data,g=l.words,u=this._nDataBytes*8,p=l.sigBytes*8;return g[p>>>5]|=128<<24-p%32,g[(p+64>>>9<<4)+14]=Math.floor(u/4294967296),g[(p+64>>>9<<4)+15]=u,l.sigBytes=g.length*4,this._process(),this._hash},clone:function(){var l=a.clone.call(this);return l._hash=this._hash.clone(),l}});e.SHA1=a._createHelper(s),e.HmacSHA1=a._createHmacHelper(s)}(),r.SHA1})});var St=W((ur,mf)=>{(function(r,e){typeof ur=="object"?mf.exports=ur=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(ur,function(r){return function(e){var t=r,n=t.lib,a=n.WordArray,c=n.Hasher,v=t.algo,s=[],l=[];(function(){function p(z){for(var C=e.sqrt(z),M=2;M<=C;M++)if(!(z%M))return!1;return!0}function x(z){return(z-(z|0))*4294967296|0}for(var _=2,S=0;S<64;)p(_)&&(S<8&&(s[S]=x(e.pow(_,1/2))),l[S]=x(e.pow(_,1/3)),S++),_++})();var g=[],u=v.SHA256=c.extend({_doReset:function(){this._hash=new a.init(s.slice(0))},_doProcessBlock:function(p,x){for(var _=this._hash.words,S=_[0],z=_[1],C=_[2],M=_[3],B=_[4],k=_[5],I=_[6],E=_[7],H=0;H<64;H++){if(H<16)g[H]=p[x+H]|0;else{var D=g[H-15],F=(D<<25|D>>>7)^(D<<14|D>>>18)^D>>>3,N=g[H-2],w=(N<<15|N>>>17)^(N<<13|N>>>19)^N>>>10;g[H]=F+g[H-7]+w+g[H-16]}var f=B&k^~B&I,d=S&z^S&C^z&C,o=(S<<30|S>>>2)^(S<<19|S>>>13)^(S<<10|S>>>22),h=(B<<26|B>>>6)^(B<<21|B>>>11)^(B<<7|B>>>25),y=E+h+f+l[H]+g[H],A=o+d;E=I,I=k,k=B,B=M+y|0,M=C,C=z,z=S,S=y+A|0}_[0]=_[0]+S|0,_[1]=_[1]+z|0,_[2]=_[2]+C|0,_[3]=_[3]+M|0,_[4]=_[4]+B|0,_[5]=_[5]+k|0,_[6]=_[6]+I|0,_[7]=_[7]+E|0},_doFinalize:function(){var p=this._data,x=p.words,_=this._nDataBytes*8,S=p.sigBytes*8;return x[S>>>5]|=128<<24-S%32,x[(S+64>>>9<<4)+14]=e.floor(_/4294967296),x[(S+64>>>9<<4)+15]=_,p.sigBytes=x.length*4,this._process(),this._hash},clone:function(){var p=c.clone.call(this);return p._hash=this._hash.clone(),p}});t.SHA256=c._createHelper(u),t.HmacSHA256=c._createHmacHelper(u)}(Math),r.SHA256})});var yf=W((lr,gf)=>{(function(r,e,t){typeof lr=="object"?gf.exports=lr=e(U(),St()):typeof define=="function"&&define.amd?define(["./core","./sha256"],e):e(r.CryptoJS)})(lr,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=e.algo,c=a.SHA256,v=a.SHA224=c.extend({_doReset:function(){this._hash=new n.init([3238371032,914150663,812702999,4144912697,4290775857,1750603025,1694076839,3204075428])},_doFinalize:function(){var s=c._doFinalize.call(this);return s.sigBytes-=4,s}});e.SHA224=c._createHelper(v),e.HmacSHA224=c._createHmacHelper(v)}(),r.SHA224})});var At=W((br,_f)=>{(function(r,e,t){typeof br=="object"?_f.exports=br=e(U(),Ue()):typeof define=="function"&&define.amd?define(["./core","./x64-core"],e):e(r.CryptoJS)})(br,function(r){return function(){var e=r,t=e.lib,n=t.Hasher,a=e.x64,c=a.Word,v=a.WordArray,s=e.algo;function l(){return c.create.apply(c,arguments)}var g=[l(1116352408,3609767458),l(1899447441,602891725),l(3049323471,3964484399),l(3921009573,2173295548),l(961987163,4081628472),l(1508970993,3053834265),l(2453635748,2937671579),l(2870763221,3664609560),l(3624381080,2734883394),l(310598401,1164996542),l(607225278,1323610764),l(1426881987,3590304994),l(1925078388,4068182383),l(2162078206,991336113),l(2614888103,633803317),l(3248222580,3479774868),l(3835390401,2666613458),l(4022224774,944711139),l(264347078,2341262773),l(604807628,2007800933),l(770255983,1495990901),l(1249150122,1856431235),l(1555081692,3175218132),l(1996064986,2198950837),l(2554220882,3999719339),l(2821834349,766784016),l(2952996808,2566594879),l(3210313671,3203337956),l(3336571891,1034457026),l(3584528711,2466948901),l(113926993,3758326383),l(338241895,168717936),l(666307205,1188179964),l(773529912,1546045734),l(1294757372,1522805485),l(1396182291,2643833823),l(1695183700,2343527390),l(1986661051,1014477480),l(2177026350,1206759142),l(2456956037,344077627),l(2730485921,1290863460),l(2820302411,3158454273),l(3259730800,3505952657),l(3345764771,106217008),l(3516065817,3606008344),l(3600352804,1432725776),l(4094571909,1467031594),l(275423344,851169720),l(430227734,3100823752),l(506948616,1363258195),l(659060556,3750685593),l(883997877,3785050280),l(958139571,3318307427),l(1322822218,3812723403),l(1537002063,2003034995),l(1747873779,3602036899),l(1955562222,1575990012),l(2024104815,1125592928),l(2227730452,2716904306),l(2361852424,442776044),l(2428436474,593698344),l(2756734187,3733110249),l(3204031479,2999351573),l(3329325298,3815920427),l(3391569614,3928383900),l(3515267271,566280711),l(3940187606,3454069534),l(4118630271,4000239992),l(116418474,1914138554),l(174292421,2731055270),l(289380356,3203993006),l(460393269,320620315),l(685471733,587496836),l(852142971,1086792851),l(1017036298,365543100),l(1126000580,2618297676),l(1288033470,3409855158),l(1501505948,4234509866),l(1607167915,987167468),l(1816402316,1246189591)],u=[];(function(){for(var x=0;x<80;x++)u[x]=l()})();var p=s.SHA512=n.extend({_doReset:function(){this._hash=new v.init([new c.init(1779033703,4089235720),new c.init(3144134277,2227873595),new c.init(1013904242,4271175723),new c.init(2773480762,1595750129),new c.init(1359893119,2917565137),new c.init(2600822924,725511199),new c.init(528734635,4215389547),new c.init(1541459225,327033209)])},_doProcessBlock:function(x,_){for(var S=this._hash.words,z=S[0],C=S[1],M=S[2],B=S[3],k=S[4],I=S[5],E=S[6],H=S[7],D=z.high,F=z.low,N=C.high,w=C.low,f=M.high,d=M.low,o=B.high,h=B.low,y=k.high,A=k.low,q=I.high,m=I.low,i=E.high,b=E.low,P=H.high,R=H.low,L=D,T=F,K=N,O=w,D0=f,J=d,$=o,de=h,Y=y,j=A,ge=q,t0=m,n0=i,ce=b,d0=P,f0=R,N0=0;N0<80;N0++){var Z,G,ye=u[N0];if(N0<16)G=ye.high=x[_+N0*2]|0,Z=ye.low=x[_+N0*2+1]|0;else{var c0=u[N0-15],Q=c0.high,se=c0.low,x0=(Q>>>1|se<<31)^(Q>>>8|se<<24)^Q>>>7,s0=(se>>>1|Q<<31)^(se>>>8|Q<<24)^(se>>>7|Q<<25),We=u[N0-2],e0=We.high,a0=We.low,Ve=(e0>>>19|a0<<13)^(e0<<3|a0>>>29)^e0>>>6,o0=(a0>>>19|e0<<13)^(a0<<3|e0>>>29)^(a0>>>6|e0<<26),h0=u[N0-7],$e=h0.high,p0=h0.low,u0=u[N0-16],Qe=u0.high,l0=u0.low;Z=s0+p0,G=x0+$e+(Z>>>0<s0>>>0?1:0),Z=Z+o0,G=G+Ve+(Z>>>0<o0>>>0?1:0),Z=Z+l0,G=G+Qe+(Z>>>0<l0>>>0?1:0),ye.high=G,ye.low=Z}var m0=Y&ge^~Y&n0,Te=j&t0^~j&ce,g0=L&K^L&D0^K&D0,y0=T&O^T&J^O&J,er=(L>>>28|T<<4)^(L<<30|T>>>2)^(L<<25|T>>>7),b0=(T>>>28|L<<4)^(T<<30|L>>>2)^(T<<25|L>>>7),_0=(Y>>>14|j<<18)^(Y>>>18|j<<14)^(Y<<23|j>>>9),rr=(j>>>14|Y<<18)^(j>>>18|Y<<14)^(j<<23|Y>>>9),v0=g[N0],w0=v0.high,Oe=v0.low,X=f0+rr,V=d0+_0+(X>>>0<f0>>>0?1:0),X=X+Te,V=V+m0+(X>>>0<Te>>>0?1:0),X=X+Oe,V=V+w0+(X>>>0<Oe>>>0?1:0),X=X+Z,V=V+G+(X>>>0<Z>>>0?1:0),Ke=b0+y0,M0=er+g0+(Ke>>>0<b0>>>0?1:0);d0=n0,f0=ce,n0=ge,ce=t0,ge=Y,t0=j,j=de+X|0,Y=$+V+(j>>>0<de>>>0?1:0)|0,$=D0,de=J,D0=K,J=O,K=L,O=T,T=X+Ke|0,L=V+M0+(T>>>0<X>>>0?1:0)|0}F=z.low=F+T,z.high=D+L+(F>>>0<T>>>0?1:0),w=C.low=w+O,C.high=N+K+(w>>>0<O>>>0?1:0),d=M.low=d+J,M.high=f+D0+(d>>>0<J>>>0?1:0),h=B.low=h+de,B.high=o+$+(h>>>0<de>>>0?1:0),A=k.low=A+j,k.high=y+Y+(A>>>0<j>>>0?1:0),m=I.low=m+t0,I.high=q+ge+(m>>>0<t0>>>0?1:0),b=E.low=b+ce,E.high=i+n0+(b>>>0<ce>>>0?1:0),R=H.low=R+f0,H.high=P+d0+(R>>>0<f0>>>0?1:0)},_doFinalize:function(){var x=this._data,_=x.words,S=this._nDataBytes*8,z=x.sigBytes*8;_[z>>>5]|=128<<24-z%32,_[(z+128>>>10<<5)+30]=Math.floor(S/4294967296),_[(z+128>>>10<<5)+31]=S,x.sigBytes=_.length*4,this._process();var C=this._hash.toX32();return C},clone:function(){var x=n.clone.call(this);return x._hash=this._hash.clone(),x},blockSize:1024/32});e.SHA512=n._createHelper(p),e.HmacSHA512=n._createHmacHelper(p)}(),r.SHA512})});var Mf=W((vr,wf)=>{(function(r,e,t){typeof vr=="object"?wf.exports=vr=e(U(),Ue(),At()):typeof define=="function"&&define.amd?define(["./core","./x64-core","./sha512"],e):e(r.CryptoJS)})(vr,function(r){return function(){var e=r,t=e.x64,n=t.Word,a=t.WordArray,c=e.algo,v=c.SHA512,s=c.SHA384=v.extend({_doReset:function(){this._hash=new a.init([new n.init(3418070365,3238371032),new n.init(1654270250,914150663),new n.init(2438529370,812702999),new n.init(355462360,4144912697),new n.init(1731405415,4290775857),new n.init(2394180231,1750603025),new n.init(3675008525,1694076839),new n.init(1203062813,3204075428)])},_doFinalize:function(){var l=v._doFinalize.call(this);return l.sigBytes-=16,l}});e.SHA384=v._createHelper(s),e.HmacSHA384=v._createHmacHelper(s)}(),r.SHA384})});var Af=W((xr,Sf)=>{(function(r,e,t){typeof xr=="object"?Sf.exports=xr=e(U(),Ue()):typeof define=="function"&&define.amd?define(["./core","./x64-core"],e):e(r.CryptoJS)})(xr,function(r){return function(e){var t=r,n=t.lib,a=n.WordArray,c=n.Hasher,v=t.x64,s=v.Word,l=t.algo,g=[],u=[],p=[];(function(){for(var S=1,z=0,C=0;C<24;C++){g[S+5*z]=(C+1)*(C+2)/2%64;var M=z%5,B=(2*S+3*z)%5;S=M,z=B}for(var S=0;S<5;S++)for(var z=0;z<5;z++)u[S+5*z]=z+(2*S+3*z)%5*5;for(var k=1,I=0;I<24;I++){for(var E=0,H=0,D=0;D<7;D++){if(k&1){var F=(1<<D)-1;F<32?H^=1<<F:E^=1<<F-32}k&128?k=k<<1^113:k<<=1}p[I]=s.create(E,H)}})();var x=[];(function(){for(var S=0;S<25;S++)x[S]=s.create()})();var _=l.SHA3=c.extend({cfg:c.cfg.extend({outputLength:512}),_doReset:function(){for(var S=this._state=[],z=0;z<25;z++)S[z]=new s.init;this.blockSize=(1600-2*this.cfg.outputLength)/32},_doProcessBlock:function(S,z){for(var C=this._state,M=this.blockSize/2,B=0;B<M;B++){var k=S[z+2*B],I=S[z+2*B+1];k=(k<<8|k>>>24)&16711935|(k<<24|k>>>8)&4278255360,I=(I<<8|I>>>24)&16711935|(I<<24|I>>>8)&4278255360;var E=C[B];E.high^=I,E.low^=k}for(var H=0;H<24;H++){for(var D=0;D<5;D++){for(var F=0,N=0,w=0;w<5;w++){var E=C[D+5*w];F^=E.high,N^=E.low}var f=x[D];f.high=F,f.low=N}for(var D=0;D<5;D++)for(var d=x[(D+4)%5],o=x[(D+1)%5],h=o.high,y=o.low,F=d.high^(h<<1|y>>>31),N=d.low^(y<<1|h>>>31),w=0;w<5;w++){var E=C[D+5*w];E.high^=F,E.low^=N}for(var A=1;A<25;A++){var F,N,E=C[A],q=E.high,m=E.low,i=g[A];i<32?(F=q<<i|m>>>32-i,N=m<<i|q>>>32-i):(F=m<<i-32|q>>>64-i,N=q<<i-32|m>>>64-i);var b=x[u[A]];b.high=F,b.low=N}var P=x[0],R=C[0];P.high=R.high,P.low=R.low;for(var D=0;D<5;D++)for(var w=0;w<5;w++){var A=D+5*w,E=C[A],L=x[A],T=x[(D+1)%5+5*w],K=x[(D+2)%5+5*w];E.high=L.high^~T.high&K.high,E.low=L.low^~T.low&K.low}var E=C[0],O=p[H];E.high^=O.high,E.low^=O.low}},_doFinalize:function(){var S=this._data,z=S.words,C=this._nDataBytes*8,M=S.sigBytes*8,B=this.blockSize*32;z[M>>>5]|=1<<24-M%32,z[(e.ceil((M+1)/B)*B>>>5)-1]|=128,S.sigBytes=z.length*4,this._process();for(var k=this._state,I=this.cfg.outputLength/8,E=I/8,H=[],D=0;D<E;D++){var F=k[D],N=F.high,w=F.low;N=(N<<8|N>>>24)&16711935|(N<<24|N>>>8)&4278255360,w=(w<<8|w>>>24)&16711935|(w<<24|w>>>8)&4278255360,H.push(w),H.push(N)}return new a.init(H,I)},clone:function(){for(var S=c.clone.call(this),z=S._state=this._state.slice(0),C=0;C<25;C++)z[C]=z[C].clone();return S}});t.SHA3=c._createHelper(_),t.HmacSHA3=c._createHmacHelper(_)}(Math),r.SHA3})});var qf=W((pr,Bf)=>{(function(r,e){typeof pr=="object"?Bf.exports=pr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(pr,function(r){return function(e){var t=r,n=t.lib,a=n.WordArray,c=n.Hasher,v=t.algo,s=a.create([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13]),l=a.create([5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11]),g=a.create([11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6]),u=a.create([8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11]),p=a.create([0,1518500249,1859775393,2400959708,2840853838]),x=a.create([1352829926,1548603684,1836072691,2053994217,0]),_=v.RIPEMD160=c.extend({_doReset:function(){this._hash=a.create([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(I,E){for(var H=0;H<16;H++){var D=E+H,F=I[D];I[D]=(F<<8|F>>>24)&16711935|(F<<24|F>>>8)&4278255360}var N=this._hash.words,w=p.words,f=x.words,d=s.words,o=l.words,h=g.words,y=u.words,A,q,m,i,b,P,R,L,T,K;P=A=N[0],R=q=N[1],L=m=N[2],T=i=N[3],K=b=N[4];for(var O,H=0;H<80;H+=1)O=A+I[E+d[H]]|0,H<16?O+=S(q,m,i)+w[0]:H<32?O+=z(q,m,i)+w[1]:H<48?O+=C(q,m,i)+w[2]:H<64?O+=M(q,m,i)+w[3]:O+=B(q,m,i)+w[4],O=O|0,O=k(O,h[H]),O=O+b|0,A=b,b=i,i=k(m,10),m=q,q=O,O=P+I[E+o[H]]|0,H<16?O+=B(R,L,T)+f[0]:H<32?O+=M(R,L,T)+f[1]:H<48?O+=C(R,L,T)+f[2]:H<64?O+=z(R,L,T)+f[3]:O+=S(R,L,T)+f[4],O=O|0,O=k(O,y[H]),O=O+K|0,P=K,K=T,T=k(L,10),L=R,R=O;O=N[1]+m+T|0,N[1]=N[2]+i+K|0,N[2]=N[3]+b+P|0,N[3]=N[4]+A+R|0,N[4]=N[0]+q+L|0,N[0]=O},_doFinalize:function(){var I=this._data,E=I.words,H=this._nDataBytes*8,D=I.sigBytes*8;E[D>>>5]|=128<<24-D%32,E[(D+64>>>9<<4)+14]=(H<<8|H>>>24)&16711935|(H<<24|H>>>8)&4278255360,I.sigBytes=(E.length+1)*4,this._process();for(var F=this._hash,N=F.words,w=0;w<5;w++){var f=N[w];N[w]=(f<<8|f>>>24)&16711935|(f<<24|f>>>8)&4278255360}return F},clone:function(){var I=c.clone.call(this);return I._hash=this._hash.clone(),I}});function S(I,E,H){return I^E^H}function z(I,E,H){return I&E|~I&H}function C(I,E,H){return(I|~E)^H}function M(I,E,H){return I&H|E&~H}function B(I,E,H){return I^(E|~H)}function k(I,E){return I<<E|I>>>32-E}t.RIPEMD160=c._createHelper(_),t.HmacRIPEMD160=c._createHmacHelper(_)}(Math),r.RIPEMD160})});var gr=W((mr,zf)=>{(function(r,e){typeof mr=="object"?zf.exports=mr=e(U()):typeof define=="function"&&define.amd?define(["./core"],e):e(r.CryptoJS)})(mr,function(r){(function(){var e=r,t=e.lib,n=t.Base,a=e.enc,c=a.Utf8,v=e.algo,s=v.HMAC=n.extend({init:function(l,g){l=this._hasher=new l.init,typeof g=="string"&&(g=c.parse(g));var u=l.blockSize,p=u*4;g.sigBytes>p&&(g=l.finalize(g)),g.clamp();for(var x=this._oKey=g.clone(),_=this._iKey=g.clone(),S=x.words,z=_.words,C=0;C<u;C++)S[C]^=1549556828,z[C]^=909522486;x.sigBytes=_.sigBytes=p,this.reset()},reset:function(){var l=this._hasher;l.reset(),l.update(this._iKey)},update:function(l){return this._hasher.update(l),this},finalize:function(l){var g=this._hasher,u=g.finalize(l);g.reset();var p=g.finalize(this._oKey.clone().concat(u));return p}})})()})});var kf=W((yr,Cf)=>{(function(r,e,t){typeof yr=="object"?Cf.exports=yr=e(U(),hr(),gr()):typeof define=="function"&&define.amd?define(["./core","./sha1","./hmac"],e):e(r.CryptoJS)})(yr,function(r){return function(){var e=r,t=e.lib,n=t.Base,a=t.WordArray,c=e.algo,v=c.SHA1,s=c.HMAC,l=c.PBKDF2=n.extend({cfg:n.extend({keySize:128/32,hasher:v,iterations:1}),init:function(g){this.cfg=this.cfg.extend(g)},compute:function(g,u){for(var p=this.cfg,x=s.create(p.hasher,g),_=a.create(),S=a.create([1]),z=_.words,C=S.words,M=p.keySize,B=p.iterations;z.length<M;){var k=x.update(u).finalize(S);x.reset();for(var I=k.words,E=I.length,H=k,D=1;D<B;D++){H=x.finalize(H),x.reset();for(var F=H.words,N=0;N<E;N++)I[N]^=F[N]}_.concat(k),C[0]++}return _.sigBytes=M*4,_}});e.PBKDF2=function(g,u,p){return l.create(p).compute(g,u)}}(),r.PBKDF2})});var oe=W((_r,If)=>{(function(r,e,t){typeof _r=="object"?If.exports=_r=e(U(),hr(),gr()):typeof define=="function"&&define.amd?define(["./core","./sha1","./hmac"],e):e(r.CryptoJS)})(_r,function(r){return function(){var e=r,t=e.lib,n=t.Base,a=t.WordArray,c=e.algo,v=c.MD5,s=c.EvpKDF=n.extend({cfg:n.extend({keySize:128/32,hasher:v,iterations:1}),init:function(l){this.cfg=this.cfg.extend(l)},compute:function(l,g){for(var u,p=this.cfg,x=p.hasher.create(),_=a.create(),S=_.words,z=p.keySize,C=p.iterations;S.length<z;){u&&x.update(u),u=x.update(l).finalize(g),x.reset();for(var M=1;M<C;M++)u=x.finalize(u),x.reset();_.concat(u)}return _.sigBytes=z*4,_}});e.EvpKDF=function(l,g,u){return s.create(u).compute(l,g)}}(),r.EvpKDF})});var k0=W((wr,Rf)=>{(function(r,e,t){typeof wr=="object"?Rf.exports=wr=e(U(),oe()):typeof define=="function"&&define.amd?define(["./core","./evpkdf"],e):e(r.CryptoJS)})(wr,function(r){r.lib.Cipher||function(e){var t=r,n=t.lib,a=n.Base,c=n.WordArray,v=n.BufferedBlockAlgorithm,s=t.enc,l=s.Utf8,g=s.Base64,u=t.algo,p=u.EvpKDF,x=n.Cipher=v.extend({cfg:a.extend(),createEncryptor:function(f,d){return this.create(this._ENC_XFORM_MODE,f,d)},createDecryptor:function(f,d){return this.create(this._DEC_XFORM_MODE,f,d)},init:function(f,d,o){this.cfg=this.cfg.extend(o),this._xformMode=f,this._key=d,this.reset()},reset:function(){v.reset.call(this),this._doReset()},process:function(f){return this._append(f),this._process()},finalize:function(f){f&&this._append(f);var d=this._doFinalize();return d},keySize:128/32,ivSize:128/32,_ENC_XFORM_MODE:1,_DEC_XFORM_MODE:2,_createHelper:function(){function f(d){return typeof d=="string"?w:D}return function(d){return{encrypt:function(o,h,y){return f(h).encrypt(d,o,h,y)},decrypt:function(o,h,y){return f(h).decrypt(d,o,h,y)}}}}()}),_=n.StreamCipher=x.extend({_doFinalize:function(){var f=this._process(!0);return f},blockSize:1}),S=t.mode={},z=n.BlockCipherMode=a.extend({createEncryptor:function(f,d){return this.Encryptor.create(f,d)},createDecryptor:function(f,d){return this.Decryptor.create(f,d)},init:function(f,d){this._cipher=f,this._iv=d}}),C=S.CBC=function(){var f=z.extend();f.Encryptor=f.extend({processBlock:function(o,h){var y=this._cipher,A=y.blockSize;d.call(this,o,h,A),y.encryptBlock(o,h),this._prevBlock=o.slice(h,h+A)}}),f.Decryptor=f.extend({processBlock:function(o,h){var y=this._cipher,A=y.blockSize,q=o.slice(h,h+A);y.decryptBlock(o,h),d.call(this,o,h,A),this._prevBlock=q}});function d(o,h,y){var A,q=this._iv;q?(A=q,this._iv=e):A=this._prevBlock;for(var m=0;m<y;m++)o[h+m]^=A[m]}return f}(),M=t.pad={},B=M.Pkcs7={pad:function(f,d){for(var o=d*4,h=o-f.sigBytes%o,y=h<<24|h<<16|h<<8|h,A=[],q=0;q<h;q+=4)A.push(y);var m=c.create(A,h);f.concat(m)},unpad:function(f){var d=f.words[f.sigBytes-1>>>2]&255;f.sigBytes-=d}},k=n.BlockCipher=x.extend({cfg:x.cfg.extend({mode:C,padding:B}),reset:function(){var f;x.reset.call(this);var d=this.cfg,o=d.iv,h=d.mode;this._xformMode==this._ENC_XFORM_MODE?f=h.createEncryptor:(f=h.createDecryptor,this._minBufferSize=1),this._mode&&this._mode.__creator==f?this._mode.init(this,o&&o.words):(this._mode=f.call(h,this,o&&o.words),this._mode.__creator=f)},_doProcessBlock:function(f,d){this._mode.processBlock(f,d)},_doFinalize:function(){var f,d=this.cfg.padding;return this._xformMode==this._ENC_XFORM_MODE?(d.pad(this._data,this.blockSize),f=this._process(!0)):(f=this._process(!0),d.unpad(f)),f},blockSize:128/32}),I=n.CipherParams=a.extend({init:function(f){this.mixIn(f)},toString:function(f){return(f||this.formatter).stringify(this)}}),E=t.format={},H=E.OpenSSL={stringify:function(f){var d,o=f.ciphertext,h=f.salt;return h?d=c.create([1398893684,1701076831]).concat(h).concat(o):d=o,d.toString(g)},parse:function(f){var d,o=g.parse(f),h=o.words;return h[0]==1398893684&&h[1]==1701076831&&(d=c.create(h.slice(2,4)),h.splice(0,4),o.sigBytes-=16),I.create({ciphertext:o,salt:d})}},D=n.SerializableCipher=a.extend({cfg:a.extend({format:H}),encrypt:function(f,d,o,h){h=this.cfg.extend(h);var y=f.createEncryptor(o,h),A=y.finalize(d),q=y.cfg;return I.create({ciphertext:A,key:o,iv:q.iv,algorithm:f,mode:q.mode,padding:q.padding,blockSize:f.blockSize,formatter:h.format})},decrypt:function(f,d,o,h){h=this.cfg.extend(h),d=this._parse(d,h.format);var y=f.createDecryptor(o,h).finalize(d.ciphertext);return y},_parse:function(f,d){return typeof f=="string"?d.parse(f,this):f}}),F=t.kdf={},N=F.OpenSSL={execute:function(f,d,o,h){h||(h=c.random(64/8));var y=p.create({keySize:d+o}).compute(f,h),A=c.create(y.words.slice(d),o*4);return y.sigBytes=d*4,I.create({key:y,iv:A,salt:h})}},w=n.PasswordBasedCipher=D.extend({cfg:D.cfg.extend({kdf:N}),encrypt:function(f,d,o,h){h=this.cfg.extend(h);var y=h.kdf.execute(o,f.keySize,f.ivSize);h.iv=y.iv;var A=D.encrypt.call(this,f,d,y.key,h);return A.mixIn(y),A},decrypt:function(f,d,o,h){h=this.cfg.extend(h),d=this._parse(d,h.format);var y=h.kdf.execute(o,f.keySize,f.ivSize,d.salt);h.iv=y.iv;var A=D.decrypt.call(this,f,d,y.key,h);return A}})}()})});var Hf=W((Mr,Pf)=>{(function(r,e,t){typeof Mr=="object"?Pf.exports=Mr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Mr,function(r){return r.mode.CFB=function(){var e=r.lib.BlockCipherMode.extend();e.Encryptor=e.extend({processBlock:function(n,a){var c=this._cipher,v=c.blockSize;t.call(this,n,a,v,c),this._prevBlock=n.slice(a,a+v)}}),e.Decryptor=e.extend({processBlock:function(n,a){var c=this._cipher,v=c.blockSize,s=n.slice(a,a+v);t.call(this,n,a,v,c),this._prevBlock=s}});function t(n,a,c,v){var s,l=this._iv;l?(s=l.slice(0),this._iv=void 0):s=this._prevBlock,v.encryptBlock(s,0);for(var g=0;g<c;g++)n[a+g]^=s[g]}return e}(),r.mode.CFB})});var Ff=W((Sr,Ef)=>{(function(r,e,t){typeof Sr=="object"?Ef.exports=Sr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Sr,function(r){return r.mode.CTR=function(){var e=r.lib.BlockCipherMode.extend(),t=e.Encryptor=e.extend({processBlock:function(n,a){var c=this._cipher,v=c.blockSize,s=this._iv,l=this._counter;s&&(l=this._counter=s.slice(0),this._iv=void 0);var g=l.slice(0);c.encryptBlock(g,0),l[v-1]=l[v-1]+1|0;for(var u=0;u<v;u++)n[a+u]^=g[u]}});return e.Decryptor=t,e}(),r.mode.CTR})});var Nf=W((Ar,Df)=>{(function(r,e,t){typeof Ar=="object"?Df.exports=Ar=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Ar,function(r){return r.mode.CTRGladman=function(){var e=r.lib.BlockCipherMode.extend();function t(c){if((c>>24&255)==255){var v=c>>16&255,s=c>>8&255,l=c&255;v===255?(v=0,s===255?(s=0,l===255?l=0:++l):++s):++v,c=0,c+=v<<16,c+=s<<8,c+=l}else c+=1<<24;return c}function n(c){return(c[0]=t(c[0]))===0&&(c[1]=t(c[1])),c}var a=e.Encryptor=e.extend({processBlock:function(c,v){var s=this._cipher,l=s.blockSize,g=this._iv,u=this._counter;g&&(u=this._counter=g.slice(0),this._iv=void 0),n(u);var p=u.slice(0);s.encryptBlock(p,0);for(var x=0;x<l;x++)c[v+x]^=p[x]}});return e.Decryptor=a,e}(),r.mode.CTRGladman})});var Wf=W((Br,Lf)=>{(function(r,e,t){typeof Br=="object"?Lf.exports=Br=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Br,function(r){return r.mode.OFB=function(){var e=r.lib.BlockCipherMode.extend(),t=e.Encryptor=e.extend({processBlock:function(n,a){var c=this._cipher,v=c.blockSize,s=this._iv,l=this._keystream;s&&(l=this._keystream=s.slice(0),this._iv=void 0),c.encryptBlock(l,0);for(var g=0;g<v;g++)n[a+g]^=l[g]}});return e.Decryptor=t,e}(),r.mode.OFB})});var Of=W((qr,Tf)=>{(function(r,e,t){typeof qr=="object"?Tf.exports=qr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(qr,function(r){return r.mode.ECB=function(){var e=r.lib.BlockCipherMode.extend();return e.Encryptor=e.extend({processBlock:function(t,n){this._cipher.encryptBlock(t,n)}}),e.Decryptor=e.extend({processBlock:function(t,n){this._cipher.decryptBlock(t,n)}}),e}(),r.mode.ECB})});var Uf=W((zr,Kf)=>{(function(r,e,t){typeof zr=="object"?Kf.exports=zr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(zr,function(r){return r.pad.AnsiX923={pad:function(e,t){var n=e.sigBytes,a=t*4,c=a-n%a,v=n+c-1;e.clamp(),e.words[v>>>2]|=c<<24-v%4*8,e.sigBytes+=c},unpad:function(e){var t=e.words[e.sigBytes-1>>>2]&255;e.sigBytes-=t}},r.pad.Ansix923})});var Xf=W((Cr,jf)=>{(function(r,e,t){typeof Cr=="object"?jf.exports=Cr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Cr,function(r){return r.pad.Iso10126={pad:function(e,t){var n=t*4,a=n-e.sigBytes%n;e.concat(r.lib.WordArray.random(a-1)).concat(r.lib.WordArray.create([a<<24],1))},unpad:function(e){var t=e.words[e.sigBytes-1>>>2]&255;e.sigBytes-=t}},r.pad.Iso10126})});var Zf=W((kr,Jf)=>{(function(r,e,t){typeof kr=="object"?Jf.exports=kr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(kr,function(r){return r.pad.Iso97971={pad:function(e,t){e.concat(r.lib.WordArray.create([2147483648],1)),r.pad.ZeroPadding.pad(e,t)},unpad:function(e){r.pad.ZeroPadding.unpad(e),e.sigBytes--}},r.pad.Iso97971})});var Gf=W((Ir,Yf)=>{(function(r,e,t){typeof Ir=="object"?Yf.exports=Ir=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Ir,function(r){return r.pad.ZeroPadding={pad:function(e,t){var n=t*4;e.clamp(),e.sigBytes+=n-(e.sigBytes%n||n)},unpad:function(e){for(var t=e.words,n=e.sigBytes-1,n=e.sigBytes-1;n>=0;n--)if(t[n>>>2]>>>24-n%4*8&255){e.sigBytes=n+1;break}}},r.pad.ZeroPadding})});var $f=W((Rr,Vf)=>{(function(r,e,t){typeof Rr=="object"?Vf.exports=Rr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Rr,function(r){return r.pad.NoPadding={pad:function(){},unpad:function(){}},r.pad.NoPadding})});var ea=W((Pr,Qf)=>{(function(r,e,t){typeof Pr=="object"?Qf.exports=Pr=e(U(),k0()):typeof define=="function"&&define.amd?define(["./core","./cipher-core"],e):e(r.CryptoJS)})(Pr,function(r){return function(e){var t=r,n=t.lib,a=n.CipherParams,c=t.enc,v=c.Hex,s=t.format,l=s.Hex={stringify:function(g){return g.ciphertext.toString(v)},parse:function(g){var u=v.parse(g);return a.create({ciphertext:u})}}}(),r.format.Hex})});var ta=W((Hr,ra)=>{(function(r,e,t){typeof Hr=="object"?ra.exports=Hr=e(U(),_e(),we(),oe(),k0()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(Hr,function(r){return function(){var e=r,t=e.lib,n=t.BlockCipher,a=e.algo,c=[],v=[],s=[],l=[],g=[],u=[],p=[],x=[],_=[],S=[];(function(){for(var M=[],B=0;B<256;B++)B<128?M[B]=B<<1:M[B]=B<<1^283;for(var k=0,I=0,B=0;B<256;B++){var E=I^I<<1^I<<2^I<<3^I<<4;E=E>>>8^E&255^99,c[k]=E,v[E]=k;var H=M[k],D=M[H],F=M[D],N=M[E]*257^E*16843008;s[k]=N<<24|N>>>8,l[k]=N<<16|N>>>16,g[k]=N<<8|N>>>24,u[k]=N;var N=F*16843009^D*65537^H*257^k*16843008;p[E]=N<<24|N>>>8,x[E]=N<<16|N>>>16,_[E]=N<<8|N>>>24,S[E]=N,k?(k=H^M[M[M[F^H]]],I^=M[M[I]]):k=I=1}})();var z=[0,1,2,4,8,16,32,64,128,27,54],C=a.AES=n.extend({_doReset:function(){var M;if(!(this._nRounds&&this._keyPriorReset===this._key)){for(var B=this._keyPriorReset=this._key,k=B.words,I=B.sigBytes/4,E=this._nRounds=I+6,H=(E+1)*4,D=this._keySchedule=[],F=0;F<H;F++)F<I?D[F]=k[F]:(M=D[F-1],F%I?I>6&&F%I==4&&(M=c[M>>>24]<<24|c[M>>>16&255]<<16|c[M>>>8&255]<<8|c[M&255]):(M=M<<8|M>>>24,M=c[M>>>24]<<24|c[M>>>16&255]<<16|c[M>>>8&255]<<8|c[M&255],M^=z[F/I|0]<<24),D[F]=D[F-I]^M);for(var N=this._invKeySchedule=[],w=0;w<H;w++){var F=H-w;if(w%4)var M=D[F];else var M=D[F-4];w<4||F<=4?N[w]=M:N[w]=p[c[M>>>24]]^x[c[M>>>16&255]]^_[c[M>>>8&255]]^S[c[M&255]]}}},encryptBlock:function(M,B){this._doCryptBlock(M,B,this._keySchedule,s,l,g,u,c)},decryptBlock:function(M,B){var k=M[B+1];M[B+1]=M[B+3],M[B+3]=k,this._doCryptBlock(M,B,this._invKeySchedule,p,x,_,S,v);var k=M[B+1];M[B+1]=M[B+3],M[B+3]=k},_doCryptBlock:function(M,B,k,I,E,H,D,F){for(var N=this._nRounds,w=M[B]^k[0],f=M[B+1]^k[1],d=M[B+2]^k[2],o=M[B+3]^k[3],h=4,y=1;y<N;y++){var A=I[w>>>24]^E[f>>>16&255]^H[d>>>8&255]^D[o&255]^k[h++],q=I[f>>>24]^E[d>>>16&255]^H[o>>>8&255]^D[w&255]^k[h++],m=I[d>>>24]^E[o>>>16&255]^H[w>>>8&255]^D[f&255]^k[h++],i=I[o>>>24]^E[w>>>16&255]^H[f>>>8&255]^D[d&255]^k[h++];w=A,f=q,d=m,o=i}var A=(F[w>>>24]<<24|F[f>>>16&255]<<16|F[d>>>8&255]<<8|F[o&255])^k[h++],q=(F[f>>>24]<<24|F[d>>>16&255]<<16|F[o>>>8&255]<<8|F[w&255])^k[h++],m=(F[d>>>24]<<24|F[o>>>16&255]<<16|F[w>>>8&255]<<8|F[f&255])^k[h++],i=(F[o>>>24]<<24|F[w>>>16&255]<<16|F[f>>>8&255]<<8|F[d&255])^k[h++];M[B]=A,M[B+1]=q,M[B+2]=m,M[B+3]=i},keySize:256/32});e.AES=n._createHelper(C)}(),r.AES})});var aa=W((Er,fa)=>{(function(r,e,t){typeof Er=="object"?fa.exports=Er=e(U(),_e(),we(),oe(),k0()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(Er,function(r){return function(){var e=r,t=e.lib,n=t.WordArray,a=t.BlockCipher,c=e.algo,v=[57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4],s=[14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32],l=[1,2,4,6,8,10,12,14,15,17,19,21,23,25,27,28],g=[{0:8421888,268435456:32768,536870912:8421378,805306368:2,1073741824:512,1342177280:8421890,1610612736:8389122,1879048192:8388608,2147483648:514,2415919104:8389120,2684354560:33280,2952790016:8421376,3221225472:32770,3489660928:8388610,3758096384:0,4026531840:33282,134217728:0,402653184:8421890,671088640:33282,939524096:32768,1207959552:8421888,1476395008:512,1744830464:8421378,2013265920:2,2281701376:8389120,2550136832:33280,2818572288:8421376,3087007744:8389122,3355443200:8388610,3623878656:32770,3892314112:514,4160749568:8388608,1:32768,268435457:2,536870913:8421888,805306369:8388608,1073741825:8421378,1342177281:33280,1610612737:512,1879048193:8389122,2147483649:8421890,2415919105:8421376,2684354561:8388610,2952790017:33282,3221225473:514,3489660929:8389120,3758096385:32770,4026531841:0,134217729:8421890,402653185:8421376,671088641:8388608,939524097:512,1207959553:32768,1476395009:8388610,1744830465:2,2013265921:33282,2281701377:32770,2550136833:8389122,2818572289:514,3087007745:8421888,3355443201:8389120,3623878657:0,3892314113:33280,4160749569:8421378},{0:1074282512,16777216:16384,33554432:524288,50331648:1074266128,67108864:1073741840,83886080:1074282496,100663296:1073758208,117440512:16,134217728:540672,150994944:1073758224,167772160:1073741824,184549376:540688,201326592:524304,218103808:0,234881024:16400,251658240:1074266112,8388608:1073758208,25165824:540688,41943040:16,58720256:1073758224,75497472:1074282512,92274688:1073741824,109051904:524288,125829120:1074266128,142606336:524304,159383552:0,176160768:16384,192937984:1074266112,209715200:1073741840,226492416:540672,243269632:1074282496,260046848:16400,268435456:0,285212672:1074266128,301989888:1073758224,318767104:1074282496,335544320:1074266112,352321536:16,369098752:540688,385875968:16384,402653184:16400,419430400:524288,436207616:524304,452984832:1073741840,469762048:540672,486539264:1073758208,503316480:1073741824,520093696:1074282512,276824064:540688,293601280:524288,310378496:1074266112,327155712:16384,343932928:1073758208,360710144:1074282512,377487360:16,394264576:1073741824,411041792:1074282496,427819008:1073741840,444596224:1073758224,461373440:524304,478150656:0,494927872:16400,511705088:1074266128,528482304:540672},{0:260,1048576:0,2097152:67109120,3145728:65796,4194304:65540,5242880:67108868,6291456:67174660,7340032:67174400,8388608:67108864,9437184:67174656,10485760:65792,11534336:67174404,12582912:67109124,13631488:65536,14680064:4,15728640:256,524288:67174656,1572864:67174404,2621440:0,3670016:67109120,4718592:67108868,5767168:65536,6815744:65540,7864320:260,8912896:4,9961472:256,11010048:67174400,12058624:65796,13107200:65792,14155776:67109124,15204352:67174660,16252928:67108864,16777216:67174656,17825792:65540,18874368:65536,19922944:67109120,20971520:256,22020096:67174660,23068672:67108868,24117248:0,25165824:67109124,26214400:67108864,27262976:4,28311552:65792,29360128:67174400,30408704:260,31457280:65796,32505856:67174404,17301504:67108864,18350080:260,19398656:67174656,20447232:0,21495808:65540,22544384:67109120,23592960:256,24641536:67174404,25690112:65536,26738688:67174660,27787264:65796,28835840:67108868,29884416:67109124,30932992:67174400,31981568:4,33030144:65792},{0:2151682048,65536:2147487808,131072:4198464,196608:2151677952,262144:0,327680:4198400,393216:2147483712,458752:4194368,524288:2147483648,589824:4194304,655360:64,720896:2147487744,786432:2151678016,851968:4160,917504:4096,983040:2151682112,32768:2147487808,98304:64,163840:2151678016,229376:2147487744,294912:4198400,360448:2151682112,425984:0,491520:2151677952,557056:4096,622592:2151682048,688128:4194304,753664:4160,819200:2147483648,884736:4194368,950272:4198464,1015808:2147483712,1048576:4194368,1114112:4198400,1179648:2147483712,1245184:0,1310720:4160,1376256:2151678016,1441792:2151682048,1507328:2147487808,1572864:2151682112,1638400:2147483648,1703936:2151677952,1769472:4198464,1835008:2147487744,1900544:4194304,1966080:64,2031616:4096,1081344:2151677952,1146880:2151682112,1212416:0,1277952:4198400,1343488:4194368,1409024:2147483648,1474560:2147487808,1540096:64,1605632:2147483712,1671168:4096,1736704:2147487744,1802240:2151678016,1867776:4160,1933312:2151682048,1998848:4194304,2064384:4198464},{0:128,4096:17039360,8192:262144,12288:536870912,16384:537133184,20480:16777344,24576:553648256,28672:262272,32768:16777216,36864:537133056,40960:536871040,45056:553910400,49152:553910272,53248:0,57344:17039488,61440:553648128,2048:17039488,6144:553648256,10240:128,14336:17039360,18432:262144,22528:537133184,26624:553910272,30720:536870912,34816:537133056,38912:0,43008:553910400,47104:16777344,51200:536871040,55296:553648128,59392:16777216,63488:262272,65536:262144,69632:128,73728:536870912,77824:553648256,81920:16777344,86016:553910272,90112:537133184,94208:16777216,98304:553910400,102400:553648128,106496:17039360,110592:537133056,114688:262272,118784:536871040,122880:0,126976:17039488,67584:553648256,71680:16777216,75776:17039360,79872:537133184,83968:536870912,88064:17039488,92160:128,96256:553910272,100352:262272,104448:553910400,108544:0,112640:553648128,116736:16777344,120832:262144,124928:537133056,129024:536871040},{0:268435464,256:8192,512:270532608,768:270540808,1024:268443648,1280:2097152,1536:2097160,1792:268435456,2048:0,2304:268443656,2560:2105344,2816:8,3072:270532616,3328:2105352,3584:8200,3840:270540800,128:270532608,384:270540808,640:8,896:2097152,1152:2105352,1408:268435464,1664:268443648,1920:8200,2176:2097160,2432:8192,2688:268443656,2944:270532616,3200:0,3456:270540800,3712:2105344,3968:268435456,4096:268443648,4352:270532616,4608:270540808,4864:8200,5120:2097152,5376:268435456,5632:268435464,5888:2105344,6144:2105352,6400:0,6656:8,6912:270532608,7168:8192,7424:268443656,7680:270540800,7936:2097160,4224:8,4480:2105344,4736:2097152,4992:268435464,5248:268443648,5504:8200,5760:270540808,6016:270532608,6272:270540800,6528:270532616,6784:8192,7040:2105352,7296:2097160,7552:0,7808:268435456,8064:268443656},{0:1048576,16:33555457,32:1024,48:1049601,64:34604033,80:0,96:1,112:34603009,128:33555456,144:1048577,160:33554433,176:34604032,192:34603008,208:1025,224:1049600,240:33554432,8:34603009,24:0,40:33555457,56:34604032,72:1048576,88:33554433,104:33554432,120:1025,136:1049601,152:33555456,168:34603008,184:1048577,200:1024,216:34604033,232:1,248:1049600,256:33554432,272:1048576,288:33555457,304:34603009,320:1048577,336:33555456,352:34604032,368:1049601,384:1025,400:34604033,416:1049600,432:1,448:0,464:34603008,480:33554433,496:1024,264:1049600,280:33555457,296:34603009,312:1,328:33554432,344:1048576,360:1025,376:34604032,392:33554433,408:34603008,424:0,440:34604033,456:1049601,472:1024,488:33555456,504:1048577},{0:134219808,1:131072,2:134217728,3:32,4:131104,5:134350880,6:134350848,7:2048,8:134348800,9:134219776,10:133120,11:134348832,12:2080,13:0,14:134217760,15:133152,2147483648:2048,2147483649:134350880,2147483650:134219808,2147483651:134217728,2147483652:134348800,2147483653:133120,2147483654:133152,2147483655:32,2147483656:134217760,2147483657:2080,2147483658:131104,2147483659:134350848,2147483660:0,2147483661:134348832,2147483662:134219776,2147483663:131072,16:133152,17:134350848,18:32,19:2048,20:134219776,21:134217760,22:134348832,23:131072,24:0,25:131104,26:134348800,27:134219808,28:134350880,29:133120,30:2080,31:134217728,2147483664:131072,2147483665:2048,2147483666:134348832,2147483667:133152,2147483668:32,2147483669:134348800,2147483670:134217728,2147483671:134219808,2147483672:134350880,2147483673:134217760,2147483674:134219776,2147483675:0,2147483676:133120,2147483677:2080,2147483678:131104,2147483679:134350848}],u=[4160749569,528482304,33030144,2064384,129024,8064,504,2147483679],p=c.DES=a.extend({_doReset:function(){for(var z=this._key,C=z.words,M=[],B=0;B<56;B++){var k=v[B]-1;M[B]=C[k>>>5]>>>31-k%32&1}for(var I=this._subKeys=[],E=0;E<16;E++){for(var H=I[E]=[],D=l[E],B=0;B<24;B++)H[B/6|0]|=M[(s[B]-1+D)%28]<<31-B%6,H[4+(B/6|0)]|=M[28+(s[B+24]-1+D)%28]<<31-B%6;H[0]=H[0]<<1|H[0]>>>31;for(var B=1;B<7;B++)H[B]=H[B]>>>(B-1)*4+3;H[7]=H[7]<<5|H[7]>>>27}for(var F=this._invSubKeys=[],B=0;B<16;B++)F[B]=I[15-B]},encryptBlock:function(z,C){this._doCryptBlock(z,C,this._subKeys)},decryptBlock:function(z,C){this._doCryptBlock(z,C,this._invSubKeys)},_doCryptBlock:function(z,C,M){this._lBlock=z[C],this._rBlock=z[C+1],x.call(this,4,252645135),x.call(this,16,65535),_.call(this,2,858993459),_.call(this,8,16711935),x.call(this,1,1431655765);for(var B=0;B<16;B++){for(var k=M[B],I=this._lBlock,E=this._rBlock,H=0,D=0;D<8;D++)H|=g[D][((E^k[D])&u[D])>>>0];this._lBlock=E,this._rBlock=I^H}var F=this._lBlock;this._lBlock=this._rBlock,this._rBlock=F,x.call(this,1,1431655765),_.call(this,8,16711935),_.call(this,2,858993459),x.call(this,16,65535),x.call(this,4,252645135),z[C]=this._lBlock,z[C+1]=this._rBlock},keySize:64/32,ivSize:64/32,blockSize:64/32});function x(z,C){var M=(this._lBlock>>>z^this._rBlock)&C;this._rBlock^=M,this._lBlock^=M<<z}function _(z,C){var M=(this._rBlock>>>z^this._lBlock)&C;this._lBlock^=M,this._rBlock^=M<<z}e.DES=a._createHelper(p);var S=c.TripleDES=a.extend({_doReset:function(){var z=this._key,C=z.words;if(C.length!==2&&C.length!==4&&C.length<6)throw new Error("Invalid key length - 3DES requires the key length to be 64, 128, 192 or >192.");var M=C.slice(0,2),B=C.length<4?C.slice(0,2):C.slice(2,4),k=C.length<6?C.slice(0,2):C.slice(4,6);this._des1=p.createEncryptor(n.create(M)),this._des2=p.createEncryptor(n.create(B)),this._des3=p.createEncryptor(n.create(k))},encryptBlock:function(z,C){this._des1.encryptBlock(z,C),this._des2.decryptBlock(z,C),this._des3.encryptBlock(z,C)},decryptBlock:function(z,C){this._des3.decryptBlock(z,C),this._des2.encryptBlock(z,C),this._des1.decryptBlock(z,C)},keySize:192/32,ivSize:64/32,blockSize:64/32});e.TripleDES=a._createHelper(S)}(),r.TripleDES})});var na=W((Fr,ia)=>{(function(r,e,t){typeof Fr=="object"?ia.exports=Fr=e(U(),_e(),we(),oe(),k0()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(Fr,function(r){return function(){var e=r,t=e.lib,n=t.StreamCipher,a=e.algo,c=a.RC4=n.extend({_doReset:function(){for(var l=this._key,g=l.words,u=l.sigBytes,p=this._S=[],x=0;x<256;x++)p[x]=x;for(var x=0,_=0;x<256;x++){var S=x%u,z=g[S>>>2]>>>24-S%4*8&255;_=(_+p[x]+z)%256;var C=p[x];p[x]=p[_],p[_]=C}this._i=this._j=0},_doProcessBlock:function(l,g){l[g]^=v.call(this)},keySize:256/32,ivSize:0});function v(){for(var l=this._S,g=this._i,u=this._j,p=0,x=0;x<4;x++){g=(g+1)%256,u=(u+l[g])%256;var _=l[g];l[g]=l[u],l[u]=_,p|=l[(l[g]+l[u])%256]<<24-x*8}return this._i=g,this._j=u,p}e.RC4=n._createHelper(c);var s=a.RC4Drop=c.extend({cfg:c.cfg.extend({drop:192}),_doReset:function(){c._doReset.call(this);for(var l=this.cfg.drop;l>0;l--)v.call(this)}});e.RC4Drop=n._createHelper(s)}(),r.RC4})});var ca=W((Dr,da)=>{(function(r,e,t){typeof Dr=="object"?da.exports=Dr=e(U(),_e(),we(),oe(),k0()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(Dr,function(r){return function(){var e=r,t=e.lib,n=t.StreamCipher,a=e.algo,c=[],v=[],s=[],l=a.Rabbit=n.extend({_doReset:function(){for(var u=this._key.words,p=this.cfg.iv,x=0;x<4;x++)u[x]=(u[x]<<8|u[x]>>>24)&16711935|(u[x]<<24|u[x]>>>8)&4278255360;var _=this._X=[u[0],u[3]<<16|u[2]>>>16,u[1],u[0]<<16|u[3]>>>16,u[2],u[1]<<16|u[0]>>>16,u[3],u[2]<<16|u[1]>>>16],S=this._C=[u[2]<<16|u[2]>>>16,u[0]&4294901760|u[1]&65535,u[3]<<16|u[3]>>>16,u[1]&4294901760|u[2]&65535,u[0]<<16|u[0]>>>16,u[2]&4294901760|u[3]&65535,u[1]<<16|u[1]>>>16,u[3]&4294901760|u[0]&65535];this._b=0;for(var x=0;x<4;x++)g.call(this);for(var x=0;x<8;x++)S[x]^=_[x+4&7];if(p){var z=p.words,C=z[0],M=z[1],B=(C<<8|C>>>24)&16711935|(C<<24|C>>>8)&4278255360,k=(M<<8|M>>>24)&16711935|(M<<24|M>>>8)&4278255360,I=B>>>16|k&4294901760,E=k<<16|B&65535;S[0]^=B,S[1]^=I,S[2]^=k,S[3]^=E,S[4]^=B,S[5]^=I,S[6]^=k,S[7]^=E;for(var x=0;x<4;x++)g.call(this)}},_doProcessBlock:function(u,p){var x=this._X;g.call(this),c[0]=x[0]^x[5]>>>16^x[3]<<16,c[1]=x[2]^x[7]>>>16^x[5]<<16,c[2]=x[4]^x[1]>>>16^x[7]<<16,c[3]=x[6]^x[3]>>>16^x[1]<<16;for(var _=0;_<4;_++)c[_]=(c[_]<<8|c[_]>>>24)&16711935|(c[_]<<24|c[_]>>>8)&4278255360,u[p+_]^=c[_]},blockSize:128/32,ivSize:64/32});function g(){for(var u=this._X,p=this._C,x=0;x<8;x++)v[x]=p[x];p[0]=p[0]+1295307597+this._b|0,p[1]=p[1]+3545052371+(p[0]>>>0<v[0]>>>0?1:0)|0,p[2]=p[2]+886263092+(p[1]>>>0<v[1]>>>0?1:0)|0,p[3]=p[3]+1295307597+(p[2]>>>0<v[2]>>>0?1:0)|0,p[4]=p[4]+3545052371+(p[3]>>>0<v[3]>>>0?1:0)|0,p[5]=p[5]+886263092+(p[4]>>>0<v[4]>>>0?1:0)|0,p[6]=p[6]+1295307597+(p[5]>>>0<v[5]>>>0?1:0)|0,p[7]=p[7]+3545052371+(p[6]>>>0<v[6]>>>0?1:0)|0,this._b=p[7]>>>0<v[7]>>>0?1:0;for(var x=0;x<8;x++){var _=u[x]+p[x],S=_&65535,z=_>>>16,C=((S*S>>>17)+S*z>>>15)+z*z,M=((_&4294901760)*_|0)+((_&65535)*_|0);s[x]=C^M}u[0]=s[0]+(s[7]<<16|s[7]>>>16)+(s[6]<<16|s[6]>>>16)|0,u[1]=s[1]+(s[0]<<8|s[0]>>>24)+s[7]|0,u[2]=s[2]+(s[1]<<16|s[1]>>>16)+(s[0]<<16|s[0]>>>16)|0,u[3]=s[3]+(s[2]<<8|s[2]>>>24)+s[1]|0,u[4]=s[4]+(s[3]<<16|s[3]>>>16)+(s[2]<<16|s[2]>>>16)|0,u[5]=s[5]+(s[4]<<8|s[4]>>>24)+s[3]|0,u[6]=s[6]+(s[5]<<16|s[5]>>>16)+(s[4]<<16|s[4]>>>16)|0,u[7]=s[7]+(s[6]<<8|s[6]>>>24)+s[5]|0}e.Rabbit=n._createHelper(l)}(),r.Rabbit})});var oa=W((Nr,sa)=>{(function(r,e,t){typeof Nr=="object"?sa.exports=Nr=e(U(),_e(),we(),oe(),k0()):typeof define=="function"&&define.amd?define(["./core","./enc-base64","./md5","./evpkdf","./cipher-core"],e):e(r.CryptoJS)})(Nr,function(r){return function(){var e=r,t=e.lib,n=t.StreamCipher,a=e.algo,c=[],v=[],s=[],l=a.RabbitLegacy=n.extend({_doReset:function(){var u=this._key.words,p=this.cfg.iv,x=this._X=[u[0],u[3]<<16|u[2]>>>16,u[1],u[0]<<16|u[3]>>>16,u[2],u[1]<<16|u[0]>>>16,u[3],u[2]<<16|u[1]>>>16],_=this._C=[u[2]<<16|u[2]>>>16,u[0]&4294901760|u[1]&65535,u[3]<<16|u[3]>>>16,u[1]&4294901760|u[2]&65535,u[0]<<16|u[0]>>>16,u[2]&4294901760|u[3]&65535,u[1]<<16|u[1]>>>16,u[3]&4294901760|u[0]&65535];this._b=0;for(var S=0;S<4;S++)g.call(this);for(var S=0;S<8;S++)_[S]^=x[S+4&7];if(p){var z=p.words,C=z[0],M=z[1],B=(C<<8|C>>>24)&16711935|(C<<24|C>>>8)&4278255360,k=(M<<8|M>>>24)&16711935|(M<<24|M>>>8)&4278255360,I=B>>>16|k&4294901760,E=k<<16|B&65535;_[0]^=B,_[1]^=I,_[2]^=k,_[3]^=E,_[4]^=B,_[5]^=I,_[6]^=k,_[7]^=E;for(var S=0;S<4;S++)g.call(this)}},_doProcessBlock:function(u,p){var x=this._X;g.call(this),c[0]=x[0]^x[5]>>>16^x[3]<<16,c[1]=x[2]^x[7]>>>16^x[5]<<16,c[2]=x[4]^x[1]>>>16^x[7]<<16,c[3]=x[6]^x[3]>>>16^x[1]<<16;for(var _=0;_<4;_++)c[_]=(c[_]<<8|c[_]>>>24)&16711935|(c[_]<<24|c[_]>>>8)&4278255360,u[p+_]^=c[_]},blockSize:128/32,ivSize:64/32});function g(){for(var u=this._X,p=this._C,x=0;x<8;x++)v[x]=p[x];p[0]=p[0]+1295307597+this._b|0,p[1]=p[1]+3545052371+(p[0]>>>0<v[0]>>>0?1:0)|0,p[2]=p[2]+886263092+(p[1]>>>0<v[1]>>>0?1:0)|0,p[3]=p[3]+1295307597+(p[2]>>>0<v[2]>>>0?1:0)|0,p[4]=p[4]+3545052371+(p[3]>>>0<v[3]>>>0?1:0)|0,p[5]=p[5]+886263092+(p[4]>>>0<v[4]>>>0?1:0)|0,p[6]=p[6]+1295307597+(p[5]>>>0<v[5]>>>0?1:0)|0,p[7]=p[7]+3545052371+(p[6]>>>0<v[6]>>>0?1:0)|0,this._b=p[7]>>>0<v[7]>>>0?1:0;for(var x=0;x<8;x++){var _=u[x]+p[x],S=_&65535,z=_>>>16,C=((S*S>>>17)+S*z>>>15)+z*z,M=((_&4294901760)*_|0)+((_&65535)*_|0);s[x]=C^M}u[0]=s[0]+(s[7]<<16|s[7]>>>16)+(s[6]<<16|s[6]>>>16)|0,u[1]=s[1]+(s[0]<<8|s[0]>>>24)+s[7]|0,u[2]=s[2]+(s[1]<<16|s[1]>>>16)+(s[0]<<16|s[0]>>>16)|0,u[3]=s[3]+(s[2]<<8|s[2]>>>24)+s[1]|0,u[4]=s[4]+(s[3]<<16|s[3]>>>16)+(s[2]<<16|s[2]>>>16)|0,u[5]=s[5]+(s[4]<<8|s[4]>>>24)+s[3]|0,u[6]=s[6]+(s[5]<<16|s[5]>>>16)+(s[4]<<16|s[4]>>>16)|0,u[7]=s[7]+(s[6]<<8|s[6]>>>24)+s[5]|0}e.RabbitLegacy=n._createHelper(l)}(),r.RabbitLegacy})});var Bt=W((Lr,ha)=>{(function(r,e,t){typeof Lr=="object"?ha.exports=Lr=e(U(),Ue(),of(),uf(),_e(),vf(),we(),hr(),St(),yf(),At(),Mf(),Af(),qf(),gr(),kf(),oe(),k0(),Hf(),Ff(),Nf(),Wf(),Of(),Uf(),Xf(),Zf(),Gf(),$f(),ea(),ta(),aa(),na(),ca(),oa()):typeof define=="function"&&define.amd?define(["./core","./x64-core","./lib-typedarrays","./enc-utf16","./enc-base64","./enc-base64url","./md5","./sha1","./sha256","./sha224","./sha512","./sha384","./sha3","./ripemd160","./hmac","./pbkdf2","./evpkdf","./cipher-core","./mode-cfb","./mode-ctr","./mode-ctr-gladman","./mode-ofb","./mode-ecb","./pad-ansix923","./pad-iso10126","./pad-iso97971","./pad-zeropadding","./pad-nopadding","./format-hex","./aes","./tripledes","./rc4","./rabbit","./rabbit-legacy"],e):r.CryptoJS=e(r.CryptoJS)})(Lr,function(r){return r})});var ma=W((xc,pa)=>{"use strict";function cn(r){if(r.length>=255)throw new TypeError("Alphabet too long");for(var e=new Uint8Array(256),t=0;t<e.length;t++)e[t]=255;for(var n=0;n<r.length;n++){var a=r.charAt(n),c=a.charCodeAt(0);if(e[c]!==255)throw new TypeError(a+" is ambiguous");e[c]=n}var v=r.length,s=r.charAt(0),l=Math.log(v)/Math.log(256),g=Math.log(256)/Math.log(v);function u(_){if(_ instanceof Uint8Array||(ArrayBuffer.isView(_)?_=new Uint8Array(_.buffer,_.byteOffset,_.byteLength):Array.isArray(_)&&(_=Uint8Array.from(_))),!(_ instanceof Uint8Array))throw new TypeError("Expected Uint8Array");if(_.length===0)return"";for(var S=0,z=0,C=0,M=_.length;C!==M&&_[C]===0;)C++,S++;for(var B=(M-C)*g+1>>>0,k=new Uint8Array(B);C!==M;){for(var I=_[C],E=0,H=B-1;(I!==0||E<z)&&H!==-1;H--,E++)I+=256*k[H]>>>0,k[H]=I%v>>>0,I=I/v>>>0;if(I!==0)throw new Error("Non-zero carry");z=E,C++}for(var D=B-z;D!==B&&k[D]===0;)D++;for(var F=s.repeat(S);D<B;++D)F+=r.charAt(k[D]);return F}function p(_){if(typeof _!="string")throw new TypeError("Expected String");if(_.length===0)return new Uint8Array;for(var S=0,z=0,C=0;_[S]===s;)z++,S++;for(var M=(_.length-S)*l+1>>>0,B=new Uint8Array(M);_[S];){var k=e[_.charCodeAt(S)];if(k===255)return;for(var I=0,E=M-1;(k!==0||I<C)&&E!==-1;E--,I++)k+=v*B[E]>>>0,B[E]=k%256>>>0,k=k/256>>>0;if(k!==0)throw new Error("Non-zero carry");C=I,S++}for(var H=M-C;H!==M&&B[H]===0;)H++;for(var D=new Uint8Array(z+(M-H)),F=z;H!==M;)D[F++]=B[H++];return D}function x(_){var S=p(_);if(S)return S;throw new Error("Non-base"+v+" character")}return{encode:u,decodeUnsafe:p,decode:x}}pa.exports=cn});var ya=W((pc,ga)=>{var sn=ma(),on="123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";ga.exports=sn(on)});var Ma=W((yc,hn)=>{hn.exports={name:"elliptic",version:"6.5.4",description:"EC cryptography",main:"lib/elliptic.js",files:["lib"],scripts:{lint:"eslint lib test","lint:fix":"npm run lint -- --fix",unit:"istanbul test _mocha --reporter=spec test/index.js",test:"npm run lint && npm run unit",version:"grunt dist && git add dist/"},repository:{type:"git",url:"git@github.com:indutny/elliptic"},keywords:["EC","Elliptic","curve","Cryptography"],author:"Fedor Indutny <fedor@indutny.com>",license:"MIT",bugs:{url:"https://github.com/indutny/elliptic/issues"},homepage:"https://github.com/indutny/elliptic",devDependencies:{brfs:"^2.0.2",coveralls:"^3.1.0",eslint:"^7.6.0",grunt:"^1.2.1","grunt-browserify":"^5.3.0","grunt-cli":"^1.3.2","grunt-contrib-connect":"^3.0.0","grunt-contrib-copy":"^1.0.0","grunt-contrib-uglify":"^5.0.0","grunt-mocha-istanbul":"^5.0.2","grunt-saucelabs":"^9.0.1",istanbul:"^0.4.5",mocha:"^8.0.1"},dependencies:{"bn.js":"^4.11.9",brorand:"^1.1.0","hash.js":"^1.0.0","hmac-drbg":"^1.0.1",inherits:"^2.0.4","minimalistic-assert":"^1.0.1","minimalistic-crypto-utils":"^1.0.1"}}});var Sa=W(()=>{});var Y0=W((Aa,Ct)=>{(function(r,e){"use strict";function t(w,f){if(!w)throw new Error(f||"Assertion failed")}function n(w,f){w.super_=f;var d=function(){};d.prototype=f.prototype,w.prototype=new d,w.prototype.constructor=w}function a(w,f,d){if(a.isBN(w))return w;this.negative=0,this.words=null,this.length=0,this.red=null,w!==null&&((f==="le"||f==="be")&&(d=f,f=10),this._init(w||0,f||10,d||"be"))}typeof r=="object"?r.exports=a:e.BN=a,a.BN=a,a.wordSize=26;var c;try{typeof window!="undefined"&&typeof window.Buffer!="undefined"?c=window.Buffer:c=Sa().Buffer}catch(w){}a.isBN=function(f){return f instanceof a?!0:f!==null&&typeof f=="object"&&f.constructor.wordSize===a.wordSize&&Array.isArray(f.words)},a.max=function(f,d){return f.cmp(d)>0?f:d},a.min=function(f,d){return f.cmp(d)<0?f:d},a.prototype._init=function(f,d,o){if(typeof f=="number")return this._initNumber(f,d,o);if(typeof f=="object")return this._initArray(f,d,o);d==="hex"&&(d=16),t(d===(d|0)&&d>=2&&d<=36),f=f.toString().replace(/\s+/g,"");var h=0;f[0]==="-"&&(h++,this.negative=1),h<f.length&&(d===16?this._parseHex(f,h,o):(this._parseBase(f,d,h),o==="le"&&this._initArray(this.toArray(),d,o)))},a.prototype._initNumber=function(f,d,o){f<0&&(this.negative=1,f=-f),f<67108864?(this.words=[f&67108863],this.length=1):f<4503599627370496?(this.words=[f&67108863,f/67108864&67108863],this.length=2):(t(f<9007199254740992),this.words=[f&67108863,f/67108864&67108863,1],this.length=3),o==="le"&&this._initArray(this.toArray(),d,o)},a.prototype._initArray=function(f,d,o){if(t(typeof f.length=="number"),f.length<=0)return this.words=[0],this.length=1,this;this.length=Math.ceil(f.length/3),this.words=new Array(this.length);for(var h=0;h<this.length;h++)this.words[h]=0;var y,A,q=0;if(o==="be")for(h=f.length-1,y=0;h>=0;h-=3)A=f[h]|f[h-1]<<8|f[h-2]<<16,this.words[y]|=A<<q&67108863,this.words[y+1]=A>>>26-q&67108863,q+=24,q>=26&&(q-=26,y++);else if(o==="le")for(h=0,y=0;h<f.length;h+=3)A=f[h]|f[h+1]<<8|f[h+2]<<16,this.words[y]|=A<<q&67108863,this.words[y+1]=A>>>26-q&67108863,q+=24,q>=26&&(q-=26,y++);return this.strip()};function v(w,f){var d=w.charCodeAt(f);return d>=65&&d<=70?d-55:d>=97&&d<=102?d-87:d-48&15}function s(w,f,d){var o=v(w,d);return d-1>=f&&(o|=v(w,d-1)<<4),o}a.prototype._parseHex=function(f,d,o){this.length=Math.ceil((f.length-d)/6),this.words=new Array(this.length);for(var h=0;h<this.length;h++)this.words[h]=0;var y=0,A=0,q;if(o==="be")for(h=f.length-1;h>=d;h-=2)q=s(f,d,h)<<y,this.words[A]|=q&67108863,y>=18?(y-=18,A+=1,this.words[A]|=q>>>26):y+=8;else{var m=f.length-d;for(h=m%2==0?d+1:d;h<f.length;h+=2)q=s(f,d,h)<<y,this.words[A]|=q&67108863,y>=18?(y-=18,A+=1,this.words[A]|=q>>>26):y+=8}this.strip()};function l(w,f,d,o){for(var h=0,y=Math.min(w.length,d),A=f;A<y;A++){var q=w.charCodeAt(A)-48;h*=o,q>=49?h+=q-49+10:q>=17?h+=q-17+10:h+=q}return h}a.prototype._parseBase=function(f,d,o){this.words=[0],this.length=1;for(var h=0,y=1;y<=67108863;y*=d)h++;h--,y=y/d|0;for(var A=f.length-o,q=A%h,m=Math.min(A,A-q)+o,i=0,b=o;b<m;b+=h)i=l(f,b,b+h,d),this.imuln(y),this.words[0]+i<67108864?this.words[0]+=i:this._iaddn(i);if(q!==0){var P=1;for(i=l(f,b,f.length,d),b=0;b<q;b++)P*=d;this.imuln(P),this.words[0]+i<67108864?this.words[0]+=i:this._iaddn(i)}this.strip()},a.prototype.copy=function(f){f.words=new Array(this.length);for(var d=0;d<this.length;d++)f.words[d]=this.words[d];f.length=this.length,f.negative=this.negative,f.red=this.red},a.prototype.clone=function(){var f=new a(null);return this.copy(f),f},a.prototype._expand=function(f){for(;this.length<f;)this.words[this.length++]=0;return this},a.prototype.strip=function(){for(;this.length>1&&this.words[this.length-1]===0;)this.length--;return this._normSign()},a.prototype._normSign=function(){return this.length===1&&this.words[0]===0&&(this.negative=0),this},a.prototype.inspect=function(){return(this.red?"<BN-R: ":"<BN: ")+this.toString(16)+">"};var g=["","0","00","000","0000","00000","000000","0000000","00000000","000000000","0000000000","00000000000","000000000000","0000000000000","00000000000000","000000000000000","0000000000000000","00000000000000000","000000000000000000","0000000000000000000","00000000000000000000","000000000000000000000","0000000000000000000000","00000000000000000000000","000000000000000000000000","0000000000000000000000000"],u=[0,0,25,16,12,11,10,9,8,8,7,7,7,7,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5],p=[0,0,33554432,43046721,16777216,48828125,60466176,40353607,16777216,43046721,1e7,19487171,35831808,62748517,7529536,11390625,16777216,24137569,34012224,47045881,64e6,4084101,5153632,6436343,7962624,9765625,11881376,14348907,17210368,20511149,243e5,28629151,33554432,39135393,45435424,52521875,60466176];a.prototype.toString=function(f,d){f=f||10,d=d|0||1;var o;if(f===16||f==="hex"){o="";for(var h=0,y=0,A=0;A<this.length;A++){var q=this.words[A],m=((q<<h|y)&16777215).toString(16);y=q>>>24-h&16777215,y!==0||A!==this.length-1?o=g[6-m.length]+m+o:o=m+o,h+=2,h>=26&&(h-=26,A--)}for(y!==0&&(o=y.toString(16)+o);o.length%d!=0;)o="0"+o;return this.negative!==0&&(o="-"+o),o}if(f===(f|0)&&f>=2&&f<=36){var i=u[f],b=p[f];o="";var P=this.clone();for(P.negative=0;!P.isZero();){var R=P.modn(b).toString(f);P=P.idivn(b),P.isZero()?o=R+o:o=g[i-R.length]+R+o}for(this.isZero()&&(o="0"+o);o.length%d!=0;)o="0"+o;return this.negative!==0&&(o="-"+o),o}t(!1,"Base should be between 2 and 36")},a.prototype.toNumber=function(){var f=this.words[0];return this.length===2?f+=this.words[1]*67108864:this.length===3&&this.words[2]===1?f+=4503599627370496+this.words[1]*67108864:this.length>2&&t(!1,"Number can only safely store up to 53 bits"),this.negative!==0?-f:f},a.prototype.toJSON=function(){return this.toString(16)},a.prototype.toBuffer=function(f,d){return t(typeof c!="undefined"),this.toArrayLike(c,f,d)},a.prototype.toArray=function(f,d){return this.toArrayLike(Array,f,d)},a.prototype.toArrayLike=function(f,d,o){var h=this.byteLength(),y=o||Math.max(1,h);t(h<=y,"byte array longer than desired length"),t(y>0,"Requested array length <= 0"),this.strip();var A=d==="le",q=new f(y),m,i,b=this.clone();if(A){for(i=0;!b.isZero();i++)m=b.andln(255),b.iushrn(8),q[i]=m;for(;i<y;i++)q[i]=0}else{for(i=0;i<y-h;i++)q[i]=0;for(i=0;!b.isZero();i++)m=b.andln(255),b.iushrn(8),q[y-i-1]=m}return q},Math.clz32?a.prototype._countBits=function(f){return 32-Math.clz32(f)}:a.prototype._countBits=function(f){var d=f,o=0;return d>=4096&&(o+=13,d>>>=13),d>=64&&(o+=7,d>>>=7),d>=8&&(o+=4,d>>>=4),d>=2&&(o+=2,d>>>=2),o+d},a.prototype._zeroBits=function(f){if(f===0)return 26;var d=f,o=0;return(d&8191)==0&&(o+=13,d>>>=13),(d&127)==0&&(o+=7,d>>>=7),(d&15)==0&&(o+=4,d>>>=4),(d&3)==0&&(o+=2,d>>>=2),(d&1)==0&&o++,o},a.prototype.bitLength=function(){var f=this.words[this.length-1],d=this._countBits(f);return(this.length-1)*26+d};function x(w){for(var f=new Array(w.bitLength()),d=0;d<f.length;d++){var o=d/26|0,h=d%26;f[d]=(w.words[o]&1<<h)>>>h}return f}a.prototype.zeroBits=function(){if(this.isZero())return 0;for(var f=0,d=0;d<this.length;d++){var o=this._zeroBits(this.words[d]);if(f+=o,o!==26)break}return f},a.prototype.byteLength=function(){return Math.ceil(this.bitLength()/8)},a.prototype.toTwos=function(f){return this.negative!==0?this.abs().inotn(f).iaddn(1):this.clone()},a.prototype.fromTwos=function(f){return this.testn(f-1)?this.notn(f).iaddn(1).ineg():this.clone()},a.prototype.isNeg=function(){return this.negative!==0},a.prototype.neg=function(){return this.clone().ineg()},a.prototype.ineg=function(){return this.isZero()||(this.negative^=1),this},a.prototype.iuor=function(f){for(;this.length<f.length;)this.words[this.length++]=0;for(var d=0;d<f.length;d++)this.words[d]=this.words[d]|f.words[d];return this.strip()},a.prototype.ior=function(f){return t((this.negative|f.negative)==0),this.iuor(f)},a.prototype.or=function(f){return this.length>f.length?this.clone().ior(f):f.clone().ior(this)},a.prototype.uor=function(f){return this.length>f.length?this.clone().iuor(f):f.clone().iuor(this)},a.prototype.iuand=function(f){var d;this.length>f.length?d=f:d=this;for(var o=0;o<d.length;o++)this.words[o]=this.words[o]&f.words[o];return this.length=d.length,this.strip()},a.prototype.iand=function(f){return t((this.negative|f.negative)==0),this.iuand(f)},a.prototype.and=function(f){return this.length>f.length?this.clone().iand(f):f.clone().iand(this)},a.prototype.uand=function(f){return this.length>f.length?this.clone().iuand(f):f.clone().iuand(this)},a.prototype.iuxor=function(f){var d,o;this.length>f.length?(d=this,o=f):(d=f,o=this);for(var h=0;h<o.length;h++)this.words[h]=d.words[h]^o.words[h];if(this!==d)for(;h<d.length;h++)this.words[h]=d.words[h];return this.length=d.length,this.strip()},a.prototype.ixor=function(f){return t((this.negative|f.negative)==0),this.iuxor(f)},a.prototype.xor=function(f){return this.length>f.length?this.clone().ixor(f):f.clone().ixor(this)},a.prototype.uxor=function(f){return this.length>f.length?this.clone().iuxor(f):f.clone().iuxor(this)},a.prototype.inotn=function(f){t(typeof f=="number"&&f>=0);var d=Math.ceil(f/26)|0,o=f%26;this._expand(d),o>0&&d--;for(var h=0;h<d;h++)this.words[h]=~this.words[h]&67108863;return o>0&&(this.words[h]=~this.words[h]&67108863>>26-o),this.strip()},a.prototype.notn=function(f){return this.clone().inotn(f)},a.prototype.setn=function(f,d){t(typeof f=="number"&&f>=0);var o=f/26|0,h=f%26;return this._expand(o+1),d?this.words[o]=this.words[o]|1<<h:this.words[o]=this.words[o]&~(1<<h),this.strip()},a.prototype.iadd=function(f){var d;if(this.negative!==0&&f.negative===0)return this.negative=0,d=this.isub(f),this.negative^=1,this._normSign();if(this.negative===0&&f.negative!==0)return f.negative=0,d=this.isub(f),f.negative=1,d._normSign();var o,h;this.length>f.length?(o=this,h=f):(o=f,h=this);for(var y=0,A=0;A<h.length;A++)d=(o.words[A]|0)+(h.words[A]|0)+y,this.words[A]=d&67108863,y=d>>>26;for(;y!==0&&A<o.length;A++)d=(o.words[A]|0)+y,this.words[A]=d&67108863,y=d>>>26;if(this.length=o.length,y!==0)this.words[this.length]=y,this.length++;else if(o!==this)for(;A<o.length;A++)this.words[A]=o.words[A];return this},a.prototype.add=function(f){var d;return f.negative!==0&&this.negative===0?(f.negative=0,d=this.sub(f),f.negative^=1,d):f.negative===0&&this.negative!==0?(this.negative=0,d=f.sub(this),this.negative=1,d):this.length>f.length?this.clone().iadd(f):f.clone().iadd(this)},a.prototype.isub=function(f){if(f.negative!==0){f.negative=0;var d=this.iadd(f);return f.negative=1,d._normSign()}else if(this.negative!==0)return this.negative=0,this.iadd(f),this.negative=1,this._normSign();var o=this.cmp(f);if(o===0)return this.negative=0,this.length=1,this.words[0]=0,this;var h,y;o>0?(h=this,y=f):(h=f,y=this);for(var A=0,q=0;q<y.length;q++)d=(h.words[q]|0)-(y.words[q]|0)+A,A=d>>26,this.words[q]=d&67108863;for(;A!==0&&q<h.length;q++)d=(h.words[q]|0)+A,A=d>>26,this.words[q]=d&67108863;if(A===0&&q<h.length&&h!==this)for(;q<h.length;q++)this.words[q]=h.words[q];return this.length=Math.max(this.length,q),h!==this&&(this.negative=1),this.strip()},a.prototype.sub=function(f){return this.clone().isub(f)};function _(w,f,d){d.negative=f.negative^w.negative;var o=w.length+f.length|0;d.length=o,o=o-1|0;var h=w.words[0]|0,y=f.words[0]|0,A=h*y,q=A&67108863,m=A/67108864|0;d.words[0]=q;for(var i=1;i<o;i++){for(var b=m>>>26,P=m&67108863,R=Math.min(i,f.length-1),L=Math.max(0,i-w.length+1);L<=R;L++){var T=i-L|0;h=w.words[T]|0,y=f.words[L]|0,A=h*y+P,b+=A/67108864|0,P=A&67108863}d.words[i]=P|0,m=b|0}return m!==0?d.words[i]=m|0:d.length--,d.strip()}var S=function(f,d,o){var h=f.words,y=d.words,A=o.words,q=0,m,i,b,P=h[0]|0,R=P&8191,L=P>>>13,T=h[1]|0,K=T&8191,O=T>>>13,D0=h[2]|0,J=D0&8191,$=D0>>>13,de=h[3]|0,Y=de&8191,j=de>>>13,ge=h[4]|0,t0=ge&8191,n0=ge>>>13,ce=h[5]|0,d0=ce&8191,f0=ce>>>13,N0=h[6]|0,Z=N0&8191,G=N0>>>13,ye=h[7]|0,c0=ye&8191,Q=ye>>>13,se=h[8]|0,x0=se&8191,s0=se>>>13,We=h[9]|0,e0=We&8191,a0=We>>>13,Ve=y[0]|0,o0=Ve&8191,h0=Ve>>>13,$e=y[1]|0,p0=$e&8191,u0=$e>>>13,Qe=y[2]|0,l0=Qe&8191,m0=Qe>>>13,Te=y[3]|0,g0=Te&8191,y0=Te>>>13,er=y[4]|0,b0=er&8191,_0=er>>>13,rr=y[5]|0,v0=rr&8191,w0=rr>>>13,Oe=y[6]|0,X=Oe&8191,V=Oe>>>13,Ke=y[7]|0,M0=Ke&8191,A0=Ke>>>13,tf=y[8]|0,B0=tf&8191,q0=tf>>>13,ff=y[9]|0,z0=ff&8191,C0=ff>>>13;o.negative=f.negative^d.negative,o.length=19,m=Math.imul(R,o0),i=Math.imul(R,h0),i=i+Math.imul(L,o0)|0,b=Math.imul(L,h0);var tt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(tt>>>26)|0,tt&=67108863,m=Math.imul(K,o0),i=Math.imul(K,h0),i=i+Math.imul(O,o0)|0,b=Math.imul(O,h0),m=m+Math.imul(R,p0)|0,i=i+Math.imul(R,u0)|0,i=i+Math.imul(L,p0)|0,b=b+Math.imul(L,u0)|0;var ft=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(ft>>>26)|0,ft&=67108863,m=Math.imul(J,o0),i=Math.imul(J,h0),i=i+Math.imul($,o0)|0,b=Math.imul($,h0),m=m+Math.imul(K,p0)|0,i=i+Math.imul(K,u0)|0,i=i+Math.imul(O,p0)|0,b=b+Math.imul(O,u0)|0,m=m+Math.imul(R,l0)|0,i=i+Math.imul(R,m0)|0,i=i+Math.imul(L,l0)|0,b=b+Math.imul(L,m0)|0;var at=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(at>>>26)|0,at&=67108863,m=Math.imul(Y,o0),i=Math.imul(Y,h0),i=i+Math.imul(j,o0)|0,b=Math.imul(j,h0),m=m+Math.imul(J,p0)|0,i=i+Math.imul(J,u0)|0,i=i+Math.imul($,p0)|0,b=b+Math.imul($,u0)|0,m=m+Math.imul(K,l0)|0,i=i+Math.imul(K,m0)|0,i=i+Math.imul(O,l0)|0,b=b+Math.imul(O,m0)|0,m=m+Math.imul(R,g0)|0,i=i+Math.imul(R,y0)|0,i=i+Math.imul(L,g0)|0,b=b+Math.imul(L,y0)|0;var it=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(it>>>26)|0,it&=67108863,m=Math.imul(t0,o0),i=Math.imul(t0,h0),i=i+Math.imul(n0,o0)|0,b=Math.imul(n0,h0),m=m+Math.imul(Y,p0)|0,i=i+Math.imul(Y,u0)|0,i=i+Math.imul(j,p0)|0,b=b+Math.imul(j,u0)|0,m=m+Math.imul(J,l0)|0,i=i+Math.imul(J,m0)|0,i=i+Math.imul($,l0)|0,b=b+Math.imul($,m0)|0,m=m+Math.imul(K,g0)|0,i=i+Math.imul(K,y0)|0,i=i+Math.imul(O,g0)|0,b=b+Math.imul(O,y0)|0,m=m+Math.imul(R,b0)|0,i=i+Math.imul(R,_0)|0,i=i+Math.imul(L,b0)|0,b=b+Math.imul(L,_0)|0;var nt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(nt>>>26)|0,nt&=67108863,m=Math.imul(d0,o0),i=Math.imul(d0,h0),i=i+Math.imul(f0,o0)|0,b=Math.imul(f0,h0),m=m+Math.imul(t0,p0)|0,i=i+Math.imul(t0,u0)|0,i=i+Math.imul(n0,p0)|0,b=b+Math.imul(n0,u0)|0,m=m+Math.imul(Y,l0)|0,i=i+Math.imul(Y,m0)|0,i=i+Math.imul(j,l0)|0,b=b+Math.imul(j,m0)|0,m=m+Math.imul(J,g0)|0,i=i+Math.imul(J,y0)|0,i=i+Math.imul($,g0)|0,b=b+Math.imul($,y0)|0,m=m+Math.imul(K,b0)|0,i=i+Math.imul(K,_0)|0,i=i+Math.imul(O,b0)|0,b=b+Math.imul(O,_0)|0,m=m+Math.imul(R,v0)|0,i=i+Math.imul(R,w0)|0,i=i+Math.imul(L,v0)|0,b=b+Math.imul(L,w0)|0;var dt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(dt>>>26)|0,dt&=67108863,m=Math.imul(Z,o0),i=Math.imul(Z,h0),i=i+Math.imul(G,o0)|0,b=Math.imul(G,h0),m=m+Math.imul(d0,p0)|0,i=i+Math.imul(d0,u0)|0,i=i+Math.imul(f0,p0)|0,b=b+Math.imul(f0,u0)|0,m=m+Math.imul(t0,l0)|0,i=i+Math.imul(t0,m0)|0,i=i+Math.imul(n0,l0)|0,b=b+Math.imul(n0,m0)|0,m=m+Math.imul(Y,g0)|0,i=i+Math.imul(Y,y0)|0,i=i+Math.imul(j,g0)|0,b=b+Math.imul(j,y0)|0,m=m+Math.imul(J,b0)|0,i=i+Math.imul(J,_0)|0,i=i+Math.imul($,b0)|0,b=b+Math.imul($,_0)|0,m=m+Math.imul(K,v0)|0,i=i+Math.imul(K,w0)|0,i=i+Math.imul(O,v0)|0,b=b+Math.imul(O,w0)|0,m=m+Math.imul(R,X)|0,i=i+Math.imul(R,V)|0,i=i+Math.imul(L,X)|0,b=b+Math.imul(L,V)|0;var ct=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(ct>>>26)|0,ct&=67108863,m=Math.imul(c0,o0),i=Math.imul(c0,h0),i=i+Math.imul(Q,o0)|0,b=Math.imul(Q,h0),m=m+Math.imul(Z,p0)|0,i=i+Math.imul(Z,u0)|0,i=i+Math.imul(G,p0)|0,b=b+Math.imul(G,u0)|0,m=m+Math.imul(d0,l0)|0,i=i+Math.imul(d0,m0)|0,i=i+Math.imul(f0,l0)|0,b=b+Math.imul(f0,m0)|0,m=m+Math.imul(t0,g0)|0,i=i+Math.imul(t0,y0)|0,i=i+Math.imul(n0,g0)|0,b=b+Math.imul(n0,y0)|0,m=m+Math.imul(Y,b0)|0,i=i+Math.imul(Y,_0)|0,i=i+Math.imul(j,b0)|0,b=b+Math.imul(j,_0)|0,m=m+Math.imul(J,v0)|0,i=i+Math.imul(J,w0)|0,i=i+Math.imul($,v0)|0,b=b+Math.imul($,w0)|0,m=m+Math.imul(K,X)|0,i=i+Math.imul(K,V)|0,i=i+Math.imul(O,X)|0,b=b+Math.imul(O,V)|0,m=m+Math.imul(R,M0)|0,i=i+Math.imul(R,A0)|0,i=i+Math.imul(L,M0)|0,b=b+Math.imul(L,A0)|0;var st=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(st>>>26)|0,st&=67108863,m=Math.imul(x0,o0),i=Math.imul(x0,h0),i=i+Math.imul(s0,o0)|0,b=Math.imul(s0,h0),m=m+Math.imul(c0,p0)|0,i=i+Math.imul(c0,u0)|0,i=i+Math.imul(Q,p0)|0,b=b+Math.imul(Q,u0)|0,m=m+Math.imul(Z,l0)|0,i=i+Math.imul(Z,m0)|0,i=i+Math.imul(G,l0)|0,b=b+Math.imul(G,m0)|0,m=m+Math.imul(d0,g0)|0,i=i+Math.imul(d0,y0)|0,i=i+Math.imul(f0,g0)|0,b=b+Math.imul(f0,y0)|0,m=m+Math.imul(t0,b0)|0,i=i+Math.imul(t0,_0)|0,i=i+Math.imul(n0,b0)|0,b=b+Math.imul(n0,_0)|0,m=m+Math.imul(Y,v0)|0,i=i+Math.imul(Y,w0)|0,i=i+Math.imul(j,v0)|0,b=b+Math.imul(j,w0)|0,m=m+Math.imul(J,X)|0,i=i+Math.imul(J,V)|0,i=i+Math.imul($,X)|0,b=b+Math.imul($,V)|0,m=m+Math.imul(K,M0)|0,i=i+Math.imul(K,A0)|0,i=i+Math.imul(O,M0)|0,b=b+Math.imul(O,A0)|0,m=m+Math.imul(R,B0)|0,i=i+Math.imul(R,q0)|0,i=i+Math.imul(L,B0)|0,b=b+Math.imul(L,q0)|0;var ot=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(ot>>>26)|0,ot&=67108863,m=Math.imul(e0,o0),i=Math.imul(e0,h0),i=i+Math.imul(a0,o0)|0,b=Math.imul(a0,h0),m=m+Math.imul(x0,p0)|0,i=i+Math.imul(x0,u0)|0,i=i+Math.imul(s0,p0)|0,b=b+Math.imul(s0,u0)|0,m=m+Math.imul(c0,l0)|0,i=i+Math.imul(c0,m0)|0,i=i+Math.imul(Q,l0)|0,b=b+Math.imul(Q,m0)|0,m=m+Math.imul(Z,g0)|0,i=i+Math.imul(Z,y0)|0,i=i+Math.imul(G,g0)|0,b=b+Math.imul(G,y0)|0,m=m+Math.imul(d0,b0)|0,i=i+Math.imul(d0,_0)|0,i=i+Math.imul(f0,b0)|0,b=b+Math.imul(f0,_0)|0,m=m+Math.imul(t0,v0)|0,i=i+Math.imul(t0,w0)|0,i=i+Math.imul(n0,v0)|0,b=b+Math.imul(n0,w0)|0,m=m+Math.imul(Y,X)|0,i=i+Math.imul(Y,V)|0,i=i+Math.imul(j,X)|0,b=b+Math.imul(j,V)|0,m=m+Math.imul(J,M0)|0,i=i+Math.imul(J,A0)|0,i=i+Math.imul($,M0)|0,b=b+Math.imul($,A0)|0,m=m+Math.imul(K,B0)|0,i=i+Math.imul(K,q0)|0,i=i+Math.imul(O,B0)|0,b=b+Math.imul(O,q0)|0,m=m+Math.imul(R,z0)|0,i=i+Math.imul(R,C0)|0,i=i+Math.imul(L,z0)|0,b=b+Math.imul(L,C0)|0;var ht=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(ht>>>26)|0,ht&=67108863,m=Math.imul(e0,p0),i=Math.imul(e0,u0),i=i+Math.imul(a0,p0)|0,b=Math.imul(a0,u0),m=m+Math.imul(x0,l0)|0,i=i+Math.imul(x0,m0)|0,i=i+Math.imul(s0,l0)|0,b=b+Math.imul(s0,m0)|0,m=m+Math.imul(c0,g0)|0,i=i+Math.imul(c0,y0)|0,i=i+Math.imul(Q,g0)|0,b=b+Math.imul(Q,y0)|0,m=m+Math.imul(Z,b0)|0,i=i+Math.imul(Z,_0)|0,i=i+Math.imul(G,b0)|0,b=b+Math.imul(G,_0)|0,m=m+Math.imul(d0,v0)|0,i=i+Math.imul(d0,w0)|0,i=i+Math.imul(f0,v0)|0,b=b+Math.imul(f0,w0)|0,m=m+Math.imul(t0,X)|0,i=i+Math.imul(t0,V)|0,i=i+Math.imul(n0,X)|0,b=b+Math.imul(n0,V)|0,m=m+Math.imul(Y,M0)|0,i=i+Math.imul(Y,A0)|0,i=i+Math.imul(j,M0)|0,b=b+Math.imul(j,A0)|0,m=m+Math.imul(J,B0)|0,i=i+Math.imul(J,q0)|0,i=i+Math.imul($,B0)|0,b=b+Math.imul($,q0)|0,m=m+Math.imul(K,z0)|0,i=i+Math.imul(K,C0)|0,i=i+Math.imul(O,z0)|0,b=b+Math.imul(O,C0)|0;var ut=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(ut>>>26)|0,ut&=67108863,m=Math.imul(e0,l0),i=Math.imul(e0,m0),i=i+Math.imul(a0,l0)|0,b=Math.imul(a0,m0),m=m+Math.imul(x0,g0)|0,i=i+Math.imul(x0,y0)|0,i=i+Math.imul(s0,g0)|0,b=b+Math.imul(s0,y0)|0,m=m+Math.imul(c0,b0)|0,i=i+Math.imul(c0,_0)|0,i=i+Math.imul(Q,b0)|0,b=b+Math.imul(Q,_0)|0,m=m+Math.imul(Z,v0)|0,i=i+Math.imul(Z,w0)|0,i=i+Math.imul(G,v0)|0,b=b+Math.imul(G,w0)|0,m=m+Math.imul(d0,X)|0,i=i+Math.imul(d0,V)|0,i=i+Math.imul(f0,X)|0,b=b+Math.imul(f0,V)|0,m=m+Math.imul(t0,M0)|0,i=i+Math.imul(t0,A0)|0,i=i+Math.imul(n0,M0)|0,b=b+Math.imul(n0,A0)|0,m=m+Math.imul(Y,B0)|0,i=i+Math.imul(Y,q0)|0,i=i+Math.imul(j,B0)|0,b=b+Math.imul(j,q0)|0,m=m+Math.imul(J,z0)|0,i=i+Math.imul(J,C0)|0,i=i+Math.imul($,z0)|0,b=b+Math.imul($,C0)|0;var lt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(lt>>>26)|0,lt&=67108863,m=Math.imul(e0,g0),i=Math.imul(e0,y0),i=i+Math.imul(a0,g0)|0,b=Math.imul(a0,y0),m=m+Math.imul(x0,b0)|0,i=i+Math.imul(x0,_0)|0,i=i+Math.imul(s0,b0)|0,b=b+Math.imul(s0,_0)|0,m=m+Math.imul(c0,v0)|0,i=i+Math.imul(c0,w0)|0,i=i+Math.imul(Q,v0)|0,b=b+Math.imul(Q,w0)|0,m=m+Math.imul(Z,X)|0,i=i+Math.imul(Z,V)|0,i=i+Math.imul(G,X)|0,b=b+Math.imul(G,V)|0,m=m+Math.imul(d0,M0)|0,i=i+Math.imul(d0,A0)|0,i=i+Math.imul(f0,M0)|0,b=b+Math.imul(f0,A0)|0,m=m+Math.imul(t0,B0)|0,i=i+Math.imul(t0,q0)|0,i=i+Math.imul(n0,B0)|0,b=b+Math.imul(n0,q0)|0,m=m+Math.imul(Y,z0)|0,i=i+Math.imul(Y,C0)|0,i=i+Math.imul(j,z0)|0,b=b+Math.imul(j,C0)|0;var bt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(bt>>>26)|0,bt&=67108863,m=Math.imul(e0,b0),i=Math.imul(e0,_0),i=i+Math.imul(a0,b0)|0,b=Math.imul(a0,_0),m=m+Math.imul(x0,v0)|0,i=i+Math.imul(x0,w0)|0,i=i+Math.imul(s0,v0)|0,b=b+Math.imul(s0,w0)|0,m=m+Math.imul(c0,X)|0,i=i+Math.imul(c0,V)|0,i=i+Math.imul(Q,X)|0,b=b+Math.imul(Q,V)|0,m=m+Math.imul(Z,M0)|0,i=i+Math.imul(Z,A0)|0,i=i+Math.imul(G,M0)|0,b=b+Math.imul(G,A0)|0,m=m+Math.imul(d0,B0)|0,i=i+Math.imul(d0,q0)|0,i=i+Math.imul(f0,B0)|0,b=b+Math.imul(f0,q0)|0,m=m+Math.imul(t0,z0)|0,i=i+Math.imul(t0,C0)|0,i=i+Math.imul(n0,z0)|0,b=b+Math.imul(n0,C0)|0;var vt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(vt>>>26)|0,vt&=67108863,m=Math.imul(e0,v0),i=Math.imul(e0,w0),i=i+Math.imul(a0,v0)|0,b=Math.imul(a0,w0),m=m+Math.imul(x0,X)|0,i=i+Math.imul(x0,V)|0,i=i+Math.imul(s0,X)|0,b=b+Math.imul(s0,V)|0,m=m+Math.imul(c0,M0)|0,i=i+Math.imul(c0,A0)|0,i=i+Math.imul(Q,M0)|0,b=b+Math.imul(Q,A0)|0,m=m+Math.imul(Z,B0)|0,i=i+Math.imul(Z,q0)|0,i=i+Math.imul(G,B0)|0,b=b+Math.imul(G,q0)|0,m=m+Math.imul(d0,z0)|0,i=i+Math.imul(d0,C0)|0,i=i+Math.imul(f0,z0)|0,b=b+Math.imul(f0,C0)|0;var xt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(xt>>>26)|0,xt&=67108863,m=Math.imul(e0,X),i=Math.imul(e0,V),i=i+Math.imul(a0,X)|0,b=Math.imul(a0,V),m=m+Math.imul(x0,M0)|0,i=i+Math.imul(x0,A0)|0,i=i+Math.imul(s0,M0)|0,b=b+Math.imul(s0,A0)|0,m=m+Math.imul(c0,B0)|0,i=i+Math.imul(c0,q0)|0,i=i+Math.imul(Q,B0)|0,b=b+Math.imul(Q,q0)|0,m=m+Math.imul(Z,z0)|0,i=i+Math.imul(Z,C0)|0,i=i+Math.imul(G,z0)|0,b=b+Math.imul(G,C0)|0;var pt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(pt>>>26)|0,pt&=67108863,m=Math.imul(e0,M0),i=Math.imul(e0,A0),i=i+Math.imul(a0,M0)|0,b=Math.imul(a0,A0),m=m+Math.imul(x0,B0)|0,i=i+Math.imul(x0,q0)|0,i=i+Math.imul(s0,B0)|0,b=b+Math.imul(s0,q0)|0,m=m+Math.imul(c0,z0)|0,i=i+Math.imul(c0,C0)|0,i=i+Math.imul(Q,z0)|0,b=b+Math.imul(Q,C0)|0;var mt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(mt>>>26)|0,mt&=67108863,m=Math.imul(e0,B0),i=Math.imul(e0,q0),i=i+Math.imul(a0,B0)|0,b=Math.imul(a0,q0),m=m+Math.imul(x0,z0)|0,i=i+Math.imul(x0,C0)|0,i=i+Math.imul(s0,z0)|0,b=b+Math.imul(s0,C0)|0;var gt=(q+m|0)+((i&8191)<<13)|0;q=(b+(i>>>13)|0)+(gt>>>26)|0,gt&=67108863,m=Math.imul(e0,z0),i=Math.imul(e0,C0),i=i+Math.imul(a0,z0)|0,b=Math.imul(a0,C0);var yt=(q+m|0)+((i&8191)<<13)|0;return q=(b+(i>>>13)|0)+(yt>>>26)|0,yt&=67108863,A[0]=tt,A[1]=ft,A[2]=at,A[3]=it,A[4]=nt,A[5]=dt,A[6]=ct,A[7]=st,A[8]=ot,A[9]=ht,A[10]=ut,A[11]=lt,A[12]=bt,A[13]=vt,A[14]=xt,A[15]=pt,A[16]=mt,A[17]=gt,A[18]=yt,q!==0&&(A[19]=q,o.length++),o};Math.imul||(S=_);function z(w,f,d){d.negative=f.negative^w.negative,d.length=w.length+f.length;for(var o=0,h=0,y=0;y<d.length-1;y++){var A=h;h=0;for(var q=o&67108863,m=Math.min(y,f.length-1),i=Math.max(0,y-w.length+1);i<=m;i++){var b=y-i,P=w.words[b]|0,R=f.words[i]|0,L=P*R,T=L&67108863;A=A+(L/67108864|0)|0,T=T+q|0,q=T&67108863,A=A+(T>>>26)|0,h+=A>>>26,A&=67108863}d.words[y]=q,o=A,A=h}return o!==0?d.words[y]=o:d.length--,d.strip()}function C(w,f,d){var o=new M;return o.mulp(w,f,d)}a.prototype.mulTo=function(f,d){var o,h=this.length+f.length;return this.length===10&&f.length===10?o=S(this,f,d):h<63?o=_(this,f,d):h<1024?o=z(this,f,d):o=C(this,f,d),o};function M(w,f){this.x=w,this.y=f}M.prototype.makeRBT=function(f){for(var d=new Array(f),o=a.prototype._countBits(f)-1,h=0;h<f;h++)d[h]=this.revBin(h,o,f);return d},M.prototype.revBin=function(f,d,o){if(f===0||f===o-1)return f;for(var h=0,y=0;y<d;y++)h|=(f&1)<<d-y-1,f>>=1;return h},M.prototype.permute=function(f,d,o,h,y,A){for(var q=0;q<A;q++)h[q]=d[f[q]],y[q]=o[f[q]]},M.prototype.transform=function(f,d,o,h,y,A){this.permute(A,f,d,o,h,y);for(var q=1;q<y;q<<=1)for(var m=q<<1,i=Math.cos(2*Math.PI/m),b=Math.sin(2*Math.PI/m),P=0;P<y;P+=m)for(var R=i,L=b,T=0;T<q;T++){var K=o[P+T],O=h[P+T],D0=o[P+T+q],J=h[P+T+q],$=R*D0-L*J;J=R*J+L*D0,D0=$,o[P+T]=K+D0,h[P+T]=O+J,o[P+T+q]=K-D0,h[P+T+q]=O-J,T!==m&&($=i*R-b*L,L=i*L+b*R,R=$)}},M.prototype.guessLen13b=function(f,d){var o=Math.max(d,f)|1,h=o&1,y=0;for(o=o/2|0;o;o=o>>>1)y++;return 1<<y+1+h},M.prototype.conjugate=function(f,d,o){if(!(o<=1))for(var h=0;h<o/2;h++){var y=f[h];f[h]=f[o-h-1],f[o-h-1]=y,y=d[h],d[h]=-d[o-h-1],d[o-h-1]=-y}},M.prototype.normalize13b=function(f,d){for(var o=0,h=0;h<d/2;h++){var y=Math.round(f[2*h+1]/d)*8192+Math.round(f[2*h]/d)+o;f[h]=y&67108863,y<67108864?o=0:o=y/67108864|0}return f},M.prototype.convert13b=function(f,d,o,h){for(var y=0,A=0;A<d;A++)y=y+(f[A]|0),o[2*A]=y&8191,y=y>>>13,o[2*A+1]=y&8191,y=y>>>13;for(A=2*d;A<h;++A)o[A]=0;t(y===0),t((y&~8191)==0)},M.prototype.stub=function(f){for(var d=new Array(f),o=0;o<f;o++)d[o]=0;return d},M.prototype.mulp=function(f,d,o){var h=2*this.guessLen13b(f.length,d.length),y=this.makeRBT(h),A=this.stub(h),q=new Array(h),m=new Array(h),i=new Array(h),b=new Array(h),P=new Array(h),R=new Array(h),L=o.words;L.length=h,this.convert13b(f.words,f.length,q,h),this.convert13b(d.words,d.length,b,h),this.transform(q,A,m,i,h,y),this.transform(b,A,P,R,h,y);for(var T=0;T<h;T++){var K=m[T]*P[T]-i[T]*R[T];i[T]=m[T]*R[T]+i[T]*P[T],m[T]=K}return this.conjugate(m,i,h),this.transform(m,i,L,A,h,y),this.conjugate(L,A,h),this.normalize13b(L,h),o.negative=f.negative^d.negative,o.length=f.length+d.length,o.strip()},a.prototype.mul=function(f){var d=new a(null);return d.words=new Array(this.length+f.length),this.mulTo(f,d)},a.prototype.mulf=function(f){var d=new a(null);return d.words=new Array(this.length+f.length),C(this,f,d)},a.prototype.imul=function(f){return this.clone().mulTo(f,this)},a.prototype.imuln=function(f){t(typeof f=="number"),t(f<67108864);for(var d=0,o=0;o<this.length;o++){var h=(this.words[o]|0)*f,y=(h&67108863)+(d&67108863);d>>=26,d+=h/67108864|0,d+=y>>>26,this.words[o]=y&67108863}return d!==0&&(this.words[o]=d,this.length++),this},a.prototype.muln=function(f){return this.clone().imuln(f)},a.prototype.sqr=function(){return this.mul(this)},a.prototype.isqr=function(){return this.imul(this.clone())},a.prototype.pow=function(f){var d=x(f);if(d.length===0)return new a(1);for(var o=this,h=0;h<d.length&&d[h]===0;h++,o=o.sqr());if(++h<d.length)for(var y=o.sqr();h<d.length;h++,y=y.sqr())d[h]!==0&&(o=o.mul(y));return o},a.prototype.iushln=function(f){t(typeof f=="number"&&f>=0);var d=f%26,o=(f-d)/26,h=67108863>>>26-d<<26-d,y;if(d!==0){var A=0;for(y=0;y<this.length;y++){var q=this.words[y]&h,m=(this.words[y]|0)-q<<d;this.words[y]=m|A,A=q>>>26-d}A&&(this.words[y]=A,this.length++)}if(o!==0){for(y=this.length-1;y>=0;y--)this.words[y+o]=this.words[y];for(y=0;y<o;y++)this.words[y]=0;this.length+=o}return this.strip()},a.prototype.ishln=function(f){return t(this.negative===0),this.iushln(f)},a.prototype.iushrn=function(f,d,o){t(typeof f=="number"&&f>=0);var h;d?h=(d-d%26)/26:h=0;var y=f%26,A=Math.min((f-y)/26,this.length),q=67108863^67108863>>>y<<y,m=o;if(h-=A,h=Math.max(0,h),m){for(var i=0;i<A;i++)m.words[i]=this.words[i];m.length=A}if(A!==0)if(this.length>A)for(this.length-=A,i=0;i<this.length;i++)this.words[i]=this.words[i+A];else this.words[0]=0,this.length=1;var b=0;for(i=this.length-1;i>=0&&(b!==0||i>=h);i--){var P=this.words[i]|0;this.words[i]=b<<26-y|P>>>y,b=P&q}return m&&b!==0&&(m.words[m.length++]=b),this.length===0&&(this.words[0]=0,this.length=1),this.strip()},a.prototype.ishrn=function(f,d,o){return t(this.negative===0),this.iushrn(f,d,o)},a.prototype.shln=function(f){return this.clone().ishln(f)},a.prototype.ushln=function(f){return this.clone().iushln(f)},a.prototype.shrn=function(f){return this.clone().ishrn(f)},a.prototype.ushrn=function(f){return this.clone().iushrn(f)},a.prototype.testn=function(f){t(typeof f=="number"&&f>=0);var d=f%26,o=(f-d)/26,h=1<<d;if(this.length<=o)return!1;var y=this.words[o];return!!(y&h)},a.prototype.imaskn=function(f){t(typeof f=="number"&&f>=0);var d=f%26,o=(f-d)/26;if(t(this.negative===0,"imaskn works only with positive numbers"),this.length<=o)return this;if(d!==0&&o++,this.length=Math.min(o,this.length),d!==0){var h=67108863^67108863>>>d<<d;this.words[this.length-1]&=h}return this.strip()},a.prototype.maskn=function(f){return this.clone().imaskn(f)},a.prototype.iaddn=function(f){return t(typeof f=="number"),t(f<67108864),f<0?this.isubn(-f):this.negative!==0?this.length===1&&(this.words[0]|0)<f?(this.words[0]=f-(this.words[0]|0),this.negative=0,this):(this.negative=0,this.isubn(f),this.negative=1,this):this._iaddn(f)},a.prototype._iaddn=function(f){this.words[0]+=f;for(var d=0;d<this.length&&this.words[d]>=67108864;d++)this.words[d]-=67108864,d===this.length-1?this.words[d+1]=1:this.words[d+1]++;return this.length=Math.max(this.length,d+1),this},a.prototype.isubn=function(f){if(t(typeof f=="number"),t(f<67108864),f<0)return this.iaddn(-f);if(this.negative!==0)return this.negative=0,this.iaddn(f),this.negative=1,this;if(this.words[0]-=f,this.length===1&&this.words[0]<0)this.words[0]=-this.words[0],this.negative=1;else for(var d=0;d<this.length&&this.words[d]<0;d++)this.words[d]+=67108864,this.words[d+1]-=1;return this.strip()},a.prototype.addn=function(f){return this.clone().iaddn(f)},a.prototype.subn=function(f){return this.clone().isubn(f)},a.prototype.iabs=function(){return this.negative=0,this},a.prototype.abs=function(){return this.clone().iabs()},a.prototype._ishlnsubmul=function(f,d,o){var h=f.length+o,y;this._expand(h);var A,q=0;for(y=0;y<f.length;y++){A=(this.words[y+o]|0)+q;var m=(f.words[y]|0)*d;A-=m&67108863,q=(A>>26)-(m/67108864|0),this.words[y+o]=A&67108863}for(;y<this.length-o;y++)A=(this.words[y+o]|0)+q,q=A>>26,this.words[y+o]=A&67108863;if(q===0)return this.strip();for(t(q===-1),q=0,y=0;y<this.length;y++)A=-(this.words[y]|0)+q,q=A>>26,this.words[y]=A&67108863;return this.negative=1,this.strip()},a.prototype._wordDiv=function(f,d){var o=this.length-f.length,h=this.clone(),y=f,A=y.words[y.length-1]|0,q=this._countBits(A);o=26-q,o!==0&&(y=y.ushln(o),h.iushln(o),A=y.words[y.length-1]|0);var m=h.length-y.length,i;if(d!=="mod"){i=new a(null),i.length=m+1,i.words=new Array(i.length);for(var b=0;b<i.length;b++)i.words[b]=0}var P=h.clone()._ishlnsubmul(y,1,m);P.negative===0&&(h=P,i&&(i.words[m]=1));for(var R=m-1;R>=0;R--){var L=(h.words[y.length+R]|0)*67108864+(h.words[y.length+R-1]|0);for(L=Math.min(L/A|0,67108863),h._ishlnsubmul(y,L,R);h.negative!==0;)L--,h.negative=0,h._ishlnsubmul(y,1,R),h.isZero()||(h.negative^=1);i&&(i.words[R]=L)}return i&&i.strip(),h.strip(),d!=="div"&&o!==0&&h.iushrn(o),{div:i||null,mod:h}},a.prototype.divmod=function(f,d,o){if(t(!f.isZero()),this.isZero())return{div:new a(0),mod:new a(0)};var h,y,A;return this.negative!==0&&f.negative===0?(A=this.neg().divmod(f,d),d!=="mod"&&(h=A.div.neg()),d!=="div"&&(y=A.mod.neg(),o&&y.negative!==0&&y.iadd(f)),{div:h,mod:y}):this.negative===0&&f.negative!==0?(A=this.divmod(f.neg(),d),d!=="mod"&&(h=A.div.neg()),{div:h,mod:A.mod}):(this.negative&f.negative)!=0?(A=this.neg().divmod(f.neg(),d),d!=="div"&&(y=A.mod.neg(),o&&y.negative!==0&&y.isub(f)),{div:A.div,mod:y}):f.length>this.length||this.cmp(f)<0?{div:new a(0),mod:this}:f.length===1?d==="div"?{div:this.divn(f.words[0]),mod:null}:d==="mod"?{div:null,mod:new a(this.modn(f.words[0]))}:{div:this.divn(f.words[0]),mod:new a(this.modn(f.words[0]))}:this._wordDiv(f,d)},a.prototype.div=function(f){return this.divmod(f,"div",!1).div},a.prototype.mod=function(f){return this.divmod(f,"mod",!1).mod},a.prototype.umod=function(f){return this.divmod(f,"mod",!0).mod},a.prototype.divRound=function(f){var d=this.divmod(f);if(d.mod.isZero())return d.div;var o=d.div.negative!==0?d.mod.isub(f):d.mod,h=f.ushrn(1),y=f.andln(1),A=o.cmp(h);return A<0||y===1&&A===0?d.div:d.div.negative!==0?d.div.isubn(1):d.div.iaddn(1)},a.prototype.modn=function(f){t(f<=67108863);for(var d=(1<<26)%f,o=0,h=this.length-1;h>=0;h--)o=(d*o+(this.words[h]|0))%f;return o},a.prototype.idivn=function(f){t(f<=67108863);for(var d=0,o=this.length-1;o>=0;o--){var h=(this.words[o]|0)+d*67108864;this.words[o]=h/f|0,d=h%f}return this.strip()},a.prototype.divn=function(f){return this.clone().idivn(f)},a.prototype.egcd=function(f){t(f.negative===0),t(!f.isZero());var d=this,o=f.clone();d.negative!==0?d=d.umod(f):d=d.clone();for(var h=new a(1),y=new a(0),A=new a(0),q=new a(1),m=0;d.isEven()&&o.isEven();)d.iushrn(1),o.iushrn(1),++m;for(var i=o.clone(),b=d.clone();!d.isZero();){for(var P=0,R=1;(d.words[0]&R)==0&&P<26;++P,R<<=1);if(P>0)for(d.iushrn(P);P-- >0;)(h.isOdd()||y.isOdd())&&(h.iadd(i),y.isub(b)),h.iushrn(1),y.iushrn(1);for(var L=0,T=1;(o.words[0]&T)==0&&L<26;++L,T<<=1);if(L>0)for(o.iushrn(L);L-- >0;)(A.isOdd()||q.isOdd())&&(A.iadd(i),q.isub(b)),A.iushrn(1),q.iushrn(1);d.cmp(o)>=0?(d.isub(o),h.isub(A),y.isub(q)):(o.isub(d),A.isub(h),q.isub(y))}return{a:A,b:q,gcd:o.iushln(m)}},a.prototype._invmp=function(f){t(f.negative===0),t(!f.isZero());var d=this,o=f.clone();d.negative!==0?d=d.umod(f):d=d.clone();for(var h=new a(1),y=new a(0),A=o.clone();d.cmpn(1)>0&&o.cmpn(1)>0;){for(var q=0,m=1;(d.words[0]&m)==0&&q<26;++q,m<<=1);if(q>0)for(d.iushrn(q);q-- >0;)h.isOdd()&&h.iadd(A),h.iushrn(1);for(var i=0,b=1;(o.words[0]&b)==0&&i<26;++i,b<<=1);if(i>0)for(o.iushrn(i);i-- >0;)y.isOdd()&&y.iadd(A),y.iushrn(1);d.cmp(o)>=0?(d.isub(o),h.isub(y)):(o.isub(d),y.isub(h))}var P;return d.cmpn(1)===0?P=h:P=y,P.cmpn(0)<0&&P.iadd(f),P},a.prototype.gcd=function(f){if(this.isZero())return f.abs();if(f.isZero())return this.abs();var d=this.clone(),o=f.clone();d.negative=0,o.negative=0;for(var h=0;d.isEven()&&o.isEven();h++)d.iushrn(1),o.iushrn(1);do{for(;d.isEven();)d.iushrn(1);for(;o.isEven();)o.iushrn(1);var y=d.cmp(o);if(y<0){var A=d;d=o,o=A}else if(y===0||o.cmpn(1)===0)break;d.isub(o)}while(!0);return o.iushln(h)},a.prototype.invm=function(f){return this.egcd(f).a.umod(f)},a.prototype.isEven=function(){return(this.words[0]&1)==0},a.prototype.isOdd=function(){return(this.words[0]&1)==1},a.prototype.andln=function(f){return this.words[0]&f},a.prototype.bincn=function(f){t(typeof f=="number");var d=f%26,o=(f-d)/26,h=1<<d;if(this.length<=o)return this._expand(o+1),this.words[o]|=h,this;for(var y=h,A=o;y!==0&&A<this.length;A++){var q=this.words[A]|0;q+=y,y=q>>>26,q&=67108863,this.words[A]=q}return y!==0&&(this.words[A]=y,this.length++),this},a.prototype.isZero=function(){return this.length===1&&this.words[0]===0},a.prototype.cmpn=function(f){var d=f<0;if(this.negative!==0&&!d)return-1;if(this.negative===0&&d)return 1;this.strip();var o;if(this.length>1)o=1;else{d&&(f=-f),t(f<=67108863,"Number is too big");var h=this.words[0]|0;o=h===f?0:h<f?-1:1}return this.negative!==0?-o|0:o},a.prototype.cmp=function(f){if(this.negative!==0&&f.negative===0)return-1;if(this.negative===0&&f.negative!==0)return 1;var d=this.ucmp(f);return this.negative!==0?-d|0:d},a.prototype.ucmp=function(f){if(this.length>f.length)return 1;if(this.length<f.length)return-1;for(var d=0,o=this.length-1;o>=0;o--){var h=this.words[o]|0,y=f.words[o]|0;if(h!==y){h<y?d=-1:h>y&&(d=1);break}}return d},a.prototype.gtn=function(f){return this.cmpn(f)===1},a.prototype.gt=function(f){return this.cmp(f)===1},a.prototype.gten=function(f){return this.cmpn(f)>=0},a.prototype.gte=function(f){return this.cmp(f)>=0},a.prototype.ltn=function(f){return this.cmpn(f)===-1},a.prototype.lt=function(f){return this.cmp(f)===-1},a.prototype.lten=function(f){return this.cmpn(f)<=0},a.prototype.lte=function(f){return this.cmp(f)<=0},a.prototype.eqn=function(f){return this.cmpn(f)===0},a.prototype.eq=function(f){return this.cmp(f)===0},a.red=function(f){return new F(f)},a.prototype.toRed=function(f){return t(!this.red,"Already a number in reduction context"),t(this.negative===0,"red works only with positives"),f.convertTo(this)._forceRed(f)},a.prototype.fromRed=function(){return t(this.red,"fromRed works only with numbers in reduction context"),this.red.convertFrom(this)},a.prototype._forceRed=function(f){return this.red=f,this},a.prototype.forceRed=function(f){return t(!this.red,"Already a number in reduction context"),this._forceRed(f)},a.prototype.redAdd=function(f){return t(this.red,"redAdd works only with red numbers"),this.red.add(this,f)},a.prototype.redIAdd=function(f){return t(this.red,"redIAdd works only with red numbers"),this.red.iadd(this,f)},a.prototype.redSub=function(f){return t(this.red,"redSub works only with red numbers"),this.red.sub(this,f)},a.prototype.redISub=function(f){return t(this.red,"redISub works only with red numbers"),this.red.isub(this,f)},a.prototype.redShl=function(f){return t(this.red,"redShl works only with red numbers"),this.red.shl(this,f)},a.prototype.redMul=function(f){return t(this.red,"redMul works only with red numbers"),this.red._verify2(this,f),this.red.mul(this,f)},a.prototype.redIMul=function(f){return t(this.red,"redMul works only with red numbers"),this.red._verify2(this,f),this.red.imul(this,f)},a.prototype.redSqr=function(){return t(this.red,"redSqr works only with red numbers"),this.red._verify1(this),this.red.sqr(this)},a.prototype.redISqr=function(){return t(this.red,"redISqr works only with red numbers"),this.red._verify1(this),this.red.isqr(this)},a.prototype.redSqrt=function(){return t(this.red,"redSqrt works only with red numbers"),this.red._verify1(this),this.red.sqrt(this)},a.prototype.redInvm=function(){return t(this.red,"redInvm works only with red numbers"),this.red._verify1(this),this.red.invm(this)},a.prototype.redNeg=function(){return t(this.red,"redNeg works only with red numbers"),this.red._verify1(this),this.red.neg(this)},a.prototype.redPow=function(f){return t(this.red&&!f.red,"redPow(normalNum)"),this.red._verify1(this),this.red.pow(this,f)};var B={k256:null,p224:null,p192:null,p25519:null};function k(w,f){this.name=w,this.p=new a(f,16),this.n=this.p.bitLength(),this.k=new a(1).iushln(this.n).isub(this.p),this.tmp=this._tmp()}k.prototype._tmp=function(){var f=new a(null);return f.words=new Array(Math.ceil(this.n/13)),f},k.prototype.ireduce=function(f){var d=f,o;do this.split(d,this.tmp),d=this.imulK(d),d=d.iadd(this.tmp),o=d.bitLength();while(o>this.n);var h=o<this.n?-1:d.ucmp(this.p);return h===0?(d.words[0]=0,d.length=1):h>0?d.isub(this.p):d.strip!==void 0?d.strip():d._strip(),d},k.prototype.split=function(f,d){f.iushrn(this.n,0,d)},k.prototype.imulK=function(f){return f.imul(this.k)};function I(){k.call(this,"k256","ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe fffffc2f")}n(I,k),I.prototype.split=function(f,d){for(var o=4194303,h=Math.min(f.length,9),y=0;y<h;y++)d.words[y]=f.words[y];if(d.length=h,f.length<=9){f.words[0]=0,f.length=1;return}var A=f.words[9];for(d.words[d.length++]=A&o,y=10;y<f.length;y++){var q=f.words[y]|0;f.words[y-10]=(q&o)<<4|A>>>22,A=q}A>>>=22,f.words[y-10]=A,A===0&&f.length>10?f.length-=10:f.length-=9},I.prototype.imulK=function(f){f.words[f.length]=0,f.words[f.length+1]=0,f.length+=2;for(var d=0,o=0;o<f.length;o++){var h=f.words[o]|0;d+=h*977,f.words[o]=d&67108863,d=h*64+(d/67108864|0)}return f.words[f.length-1]===0&&(f.length--,f.words[f.length-1]===0&&f.length--),f};function E(){k.call(this,"p224","ffffffff ffffffff ffffffff ffffffff 00000000 00000000 00000001")}n(E,k);function H(){k.call(this,"p192","ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff")}n(H,k);function D(){k.call(this,"25519","7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed")}n(D,k),D.prototype.imulK=function(f){for(var d=0,o=0;o<f.length;o++){var h=(f.words[o]|0)*19+d,y=h&67108863;h>>>=26,f.words[o]=y,d=h}return d!==0&&(f.words[f.length++]=d),f},a._prime=function(f){if(B[f])return B[f];var d;if(f==="k256")d=new I;else if(f==="p224")d=new E;else if(f==="p192")d=new H;else if(f==="p25519")d=new D;else throw new Error("Unknown prime "+f);return B[f]=d,d};function F(w){if(typeof w=="string"){var f=a._prime(w);this.m=f.p,this.prime=f}else t(w.gtn(1),"modulus must be greater than 1"),this.m=w,this.prime=null}F.prototype._verify1=function(f){t(f.negative===0,"red works only with positives"),t(f.red,"red works only with red numbers")},F.prototype._verify2=function(f,d){t((f.negative|d.negative)==0,"red works only with positives"),t(f.red&&f.red===d.red,"red works only with red numbers")},F.prototype.imod=function(f){return this.prime?this.prime.ireduce(f)._forceRed(this):f.umod(this.m)._forceRed(this)},F.prototype.neg=function(f){return f.isZero()?f.clone():this.m.sub(f)._forceRed(this)},F.prototype.add=function(f,d){this._verify2(f,d);var o=f.add(d);return o.cmp(this.m)>=0&&o.isub(this.m),o._forceRed(this)},F.prototype.iadd=function(f,d){this._verify2(f,d);var o=f.iadd(d);return o.cmp(this.m)>=0&&o.isub(this.m),o},F.prototype.sub=function(f,d){this._verify2(f,d);var o=f.sub(d);return o.cmpn(0)<0&&o.iadd(this.m),o._forceRed(this)},F.prototype.isub=function(f,d){this._verify2(f,d);var o=f.isub(d);return o.cmpn(0)<0&&o.iadd(this.m),o},F.prototype.shl=function(f,d){return this._verify1(f),this.imod(f.ushln(d))},F.prototype.imul=function(f,d){return this._verify2(f,d),this.imod(f.imul(d))},F.prototype.mul=function(f,d){return this._verify2(f,d),this.imod(f.mul(d))},F.prototype.isqr=function(f){return this.imul(f,f.clone())},F.prototype.sqr=function(f){return this.mul(f,f)},F.prototype.sqrt=function(f){if(f.isZero())return f.clone();var d=this.m.andln(3);if(t(d%2==1),d===3){var o=this.m.add(new a(1)).iushrn(2);return this.pow(f,o)}for(var h=this.m.subn(1),y=0;!h.isZero()&&h.andln(1)===0;)y++,h.iushrn(1);t(!h.isZero());var A=new a(1).toRed(this),q=A.redNeg(),m=this.m.subn(1).iushrn(1),i=this.m.bitLength();for(i=new a(2*i*i).toRed(this);this.pow(i,m).cmp(q)!==0;)i.redIAdd(q);for(var b=this.pow(i,h),P=this.pow(f,h.addn(1).iushrn(1)),R=this.pow(f,h),L=y;R.cmp(A)!==0;){for(var T=R,K=0;T.cmp(A)!==0;K++)T=T.redSqr();t(K<L);var O=this.pow(b,new a(1).iushln(L-K-1));P=P.redMul(O),b=O.redSqr(),R=R.redMul(b),L=K}return P},F.prototype.invm=function(f){var d=f._invmp(this.m);return d.negative!==0?(d.negative=0,this.imod(d).redNeg()):this.imod(d)},F.prototype.pow=function(f,d){if(d.isZero())return new a(1).toRed(this);if(d.cmpn(1)===0)return f.clone();var o=4,h=new Array(1<<o);h[0]=new a(1).toRed(this),h[1]=f;for(var y=2;y<h.length;y++)h[y]=this.mul(h[y-1],f);var A=h[0],q=0,m=0,i=d.bitLength()%26;for(i===0&&(i=26),y=d.length-1;y>=0;y--){for(var b=d.words[y],P=i-1;P>=0;P--){var R=b>>P&1;if(A!==h[0]&&(A=this.sqr(A)),R===0&&q===0){m=0;continue}q<<=1,q|=R,m++,!(m!==o&&(y!==0||P!==0))&&(A=this.mul(A,h[q]),m=0,q=0)}i=26}return A},F.prototype.convertTo=function(f){var d=f.umod(this.m);return d===f?d.clone():d},F.prototype.convertFrom=function(f){var d=f.clone();return d.red=null,d},a.mont=function(f){return new N(f)};function N(w){F.call(this,w),this.shift=this.m.bitLength(),this.shift%26!=0&&(this.shift+=26-this.shift%26),this.r=new a(1).iushln(this.shift),this.r2=this.imod(this.r.sqr()),this.rinv=this.r._invmp(this.m),this.minv=this.rinv.mul(this.r).isubn(1).div(this.m),this.minv=this.minv.umod(this.r),this.minv=this.r.sub(this.minv)}n(N,F),N.prototype.convertTo=function(f){return this.imod(f.ushln(this.shift))},N.prototype.convertFrom=function(f){var d=this.imod(f.mul(this.rinv));return d.red=null,d},N.prototype.imul=function(f,d){if(f.isZero()||d.isZero())return f.words[0]=0,f.length=1,f;var o=f.imul(d),h=o.maskn(this.shift).mul(this.minv).imaskn(this.shift).mul(this.m),y=o.isub(h).iushrn(this.shift),A=y;return y.cmp(this.m)>=0?A=y.isub(this.m):y.cmpn(0)<0&&(A=y.iadd(this.m)),A._forceRed(this)},N.prototype.mul=function(f,d){if(f.isZero()||d.isZero())return new a(0)._forceRed(this);var o=f.mul(d),h=o.maskn(this.shift).mul(this.minv).imaskn(this.shift).mul(this.m),y=o.isub(h).iushrn(this.shift),A=y;return y.cmp(this.m)>=0?A=y.isub(this.m):y.cmpn(0)<0&&(A=y.iadd(this.m)),A._forceRed(this)},N.prototype.invm=function(f){var d=this.imod(f._invmp(this.m).mul(this.r2));return d._forceRed(this)}})(typeof Ct=="undefined"||Ct,Aa)});var ue=W((Mc,qa)=>{qa.exports=Ba;function Ba(r,e){if(!r)throw new Error(e||"Assertion failed")}Ba.equal=function(e,t,n){if(e!=t)throw new Error(n||"Assertion failed: "+e+" != "+t)}});var kt=W(ka=>{"use strict";var Wr=ka;function un(r,e){if(Array.isArray(r))return r.slice();if(!r)return[];var t=[];if(typeof r!="string"){for(var n=0;n<r.length;n++)t[n]=r[n]|0;return t}if(e==="hex"){r=r.replace(/[^a-z0-9]+/ig,""),r.length%2!=0&&(r="0"+r);for(var n=0;n<r.length;n+=2)t.push(parseInt(r[n]+r[n+1],16))}else for(var n=0;n<r.length;n++){var a=r.charCodeAt(n),c=a>>8,v=a&255;c?t.push(c,v):t.push(v)}return t}Wr.toArray=un;function za(r){return r.length===1?"0"+r:r}Wr.zero2=za;function Ca(r){for(var e="",t=0;t<r.length;t++)e+=za(r[t].toString(16));return e}Wr.toHex=Ca;Wr.encode=function(e,t){return t==="hex"?Ca(e):e}});var T0=W(Ia=>{"use strict";var j0=Ia,ln=Y0(),bn=ue(),Tr=kt();j0.assert=bn;j0.toArray=Tr.toArray;j0.zero2=Tr.zero2;j0.toHex=Tr.toHex;j0.encode=Tr.encode;function vn(r,e,t){var n=new Array(Math.max(r.bitLength(),t)+1);n.fill(0);for(var a=1<<e+1,c=r.clone(),v=0;v<n.length;v++){var s,l=c.andln(a-1);c.isOdd()?(l>(a>>1)-1?s=(a>>1)-l:s=l,c.isubn(s)):s=0,n[v]=s,c.iushrn(1)}return n}j0.getNAF=vn;function xn(r,e){var t=[[],[]];r=r.clone(),e=e.clone();for(var n=0,a=0,c;r.cmpn(-n)>0||e.cmpn(-a)>0;){var v=r.andln(3)+n&3,s=e.andln(3)+a&3;v===3&&(v=-1),s===3&&(s=-1);var l;(v&1)==0?l=0:(c=r.andln(7)+n&7,(c===3||c===5)&&s===2?l=-v:l=v),t[0].push(l);var g;(s&1)==0?g=0:(c=e.andln(7)+a&7,(c===3||c===5)&&v===2?g=-s:g=s),t[1].push(g),2*n===l+1&&(n=1-n),2*a===g+1&&(a=1-a),r.iushrn(1),e.iushrn(1)}return t}j0.getJSF=xn;function pn(r,e,t){var n="_"+e;r.prototype[e]=function(){return this[n]!==void 0?this[n]:this[n]=t.call(this)}}j0.cachedProperty=pn;function mn(r){return typeof r=="string"?j0.toArray(r,"hex"):r}j0.parseBytes=mn;function gn(r){return new ln(r,"hex","le")}j0.intFromLE=gn});var Ht=W((Bc,Pt)=>{var It;Pt.exports=function(e){return It||(It=new le(null)),It.generate(e)};function le(r){this.rand=r}Pt.exports.Rand=le;le.prototype.generate=function(e){return this._rand(e)};le.prototype._rand=function(e){if(this.rand.getBytes)return this.rand.getBytes(e);for(var t=new Uint8Array(e),n=0;n<t.length;n++)t[n]=this.rand.getByte();return t};if(typeof self=="object")self.crypto&&self.crypto.getRandomValues?le.prototype._rand=function(e){var t=new Uint8Array(e);return self.crypto.getRandomValues(t),t}:self.msCrypto&&self.msCrypto.getRandomValues?le.prototype._rand=function(e){var t=new Uint8Array(e);return self.msCrypto.getRandomValues(t),t}:typeof window=="object"&&(le.prototype._rand=function(){throw new Error("Not implemented yet")});else try{if(Rt=Mt(),typeof Rt.randomBytes!="function")throw new Error("Not supported");le.prototype._rand=function(e){return Rt.randomBytes(e)}}catch(r){}var Rt});var Xe=W((qc,Ra)=>{"use strict";var Me=Y0(),je=T0(),Or=je.getNAF,yn=je.getJSF,Kr=je.assert;function be(r,e){this.type=r,this.p=new Me(e.p,16),this.red=e.prime?Me.red(e.prime):Me.mont(this.p),this.zero=new Me(0).toRed(this.red),this.one=new Me(1).toRed(this.red),this.two=new Me(2).toRed(this.red),this.n=e.n&&new Me(e.n,16),this.g=e.g&&this.pointFromJSON(e.g,e.gRed),this._wnafT1=new Array(4),this._wnafT2=new Array(4),this._wnafT3=new Array(4),this._wnafT4=new Array(4),this._bitLength=this.n?this.n.bitLength():0;var t=this.n&&this.p.div(this.n);!t||t.cmpn(100)>0?this.redN=null:(this._maxwellTrick=!0,this.redN=this.n.toRed(this.red))}Ra.exports=be;be.prototype.point=function(){throw new Error("Not implemented")};be.prototype.validate=function(){throw new Error("Not implemented")};be.prototype._fixedNafMul=function(e,t){Kr(e.precomputed);var n=e._getDoubles(),a=Or(t,1,this._bitLength),c=(1<<n.step+1)-(n.step%2==0?2:1);c/=3;var v=[],s,l;for(s=0;s<a.length;s+=n.step){l=0;for(var g=s+n.step-1;g>=s;g--)l=(l<<1)+a[g];v.push(l)}for(var u=this.jpoint(null,null,null),p=this.jpoint(null,null,null),x=c;x>0;x--){for(s=0;s<v.length;s++)l=v[s],l===x?p=p.mixedAdd(n.points[s]):l===-x&&(p=p.mixedAdd(n.points[s].neg()));u=u.add(p)}return u.toP()};be.prototype._wnafMul=function(e,t){var n=4,a=e._getNAFPoints(n);n=a.wnd;for(var c=a.points,v=Or(t,n,this._bitLength),s=this.jpoint(null,null,null),l=v.length-1;l>=0;l--){for(var g=0;l>=0&&v[l]===0;l--)g++;if(l>=0&&g++,s=s.dblp(g),l<0)break;var u=v[l];Kr(u!==0),e.type==="affine"?u>0?s=s.mixedAdd(c[u-1>>1]):s=s.mixedAdd(c[-u-1>>1].neg()):u>0?s=s.add(c[u-1>>1]):s=s.add(c[-u-1>>1].neg())}return e.type==="affine"?s.toP():s};be.prototype._wnafMulAdd=function(e,t,n,a,c){var v=this._wnafT1,s=this._wnafT2,l=this._wnafT3,g=0,u,p,x;for(u=0;u<a;u++){x=t[u];var _=x._getNAFPoints(e);v[u]=_.wnd,s[u]=_.points}for(u=a-1;u>=1;u-=2){var S=u-1,z=u;if(v[S]!==1||v[z]!==1){l[S]=Or(n[S],v[S],this._bitLength),l[z]=Or(n[z],v[z],this._bitLength),g=Math.max(l[S].length,g),g=Math.max(l[z].length,g);continue}var C=[t[S],null,null,t[z]];t[S].y.cmp(t[z].y)===0?(C[1]=t[S].add(t[z]),C[2]=t[S].toJ().mixedAdd(t[z].neg())):t[S].y.cmp(t[z].y.redNeg())===0?(C[1]=t[S].toJ().mixedAdd(t[z]),C[2]=t[S].add(t[z].neg())):(C[1]=t[S].toJ().mixedAdd(t[z]),C[2]=t[S].toJ().mixedAdd(t[z].neg()));var M=[-3,-1,-5,-7,0,7,5,1,3],B=yn(n[S],n[z]);for(g=Math.max(B[0].length,g),l[S]=new Array(g),l[z]=new Array(g),p=0;p<g;p++){var k=B[0][p]|0,I=B[1][p]|0;l[S][p]=M[(k+1)*3+(I+1)],l[z][p]=0,s[S]=C}}var E=this.jpoint(null,null,null),H=this._wnafT4;for(u=g;u>=0;u--){for(var D=0;u>=0;){var F=!0;for(p=0;p<a;p++)H[p]=l[p][u]|0,H[p]!==0&&(F=!1);if(!F)break;D++,u--}if(u>=0&&D++,E=E.dblp(D),u<0)break;for(p=0;p<a;p++){var N=H[p];N!==0&&(N>0?x=s[p][N-1>>1]:N<0&&(x=s[p][-N-1>>1].neg()),x.type==="affine"?E=E.mixedAdd(x):E=E.add(x))}}for(u=0;u<a;u++)s[u]=null;return c?E:E.toP()};function O0(r,e){this.curve=r,this.type=e,this.precomputed=null}be.BasePoint=O0;O0.prototype.eq=function(){throw new Error("Not implemented")};O0.prototype.validate=function(){return this.curve.validate(this)};be.prototype.decodePoint=function(e,t){e=je.toArray(e,t);var n=this.p.byteLength();if((e[0]===4||e[0]===6||e[0]===7)&&e.length-1==2*n){e[0]===6?Kr(e[e.length-1]%2==0):e[0]===7&&Kr(e[e.length-1]%2==1);var a=this.point(e.slice(1,1+n),e.slice(1+n,1+2*n));return a}else if((e[0]===2||e[0]===3)&&e.length-1===n)return this.pointFromX(e.slice(1,1+n),e[0]===3);throw new Error("Unknown point format")};O0.prototype.encodeCompressed=function(e){return this.encode(e,!0)};O0.prototype._encode=function(e){var t=this.curve.p.byteLength(),n=this.getX().toArray("be",t);return e?[this.getY().isEven()?2:3].concat(n):[4].concat(n,this.getY().toArray("be",t))};O0.prototype.encode=function(e,t){return je.encode(this._encode(t),e)};O0.prototype.precompute=function(e){if(this.precomputed)return this;var t={doubles:null,naf:null,beta:null};return t.naf=this._getNAFPoints(8),t.doubles=this._getDoubles(4,e),t.beta=this._getBeta(),this.precomputed=t,this};O0.prototype._hasDoubles=function(e){if(!this.precomputed)return!1;var t=this.precomputed.doubles;return t?t.points.length>=Math.ceil((e.bitLength()+1)/t.step):!1};O0.prototype._getDoubles=function(e,t){if(this.precomputed&&this.precomputed.doubles)return this.precomputed.doubles;for(var n=[this],a=this,c=0;c<t;c+=e){for(var v=0;v<e;v++)a=a.dbl();n.push(a)}return{step:e,points:n}};O0.prototype._getNAFPoints=function(e){if(this.precomputed&&this.precomputed.naf)return this.precomputed.naf;for(var t=[this],n=(1<<e)-1,a=n===1?null:this.dbl(),c=1;c<n;c++)t[c]=t[c-1].add(a);return{wnd:e,points:t}};O0.prototype._getBeta=function(){return null};O0.prototype.dblp=function(e){for(var t=this,n=0;n<e;n++)t=t.dbl();return t}});var Je=W((zc,Et)=>{typeof Object.create=="function"?Et.exports=function(e,t){t&&(e.super_=t,e.prototype=Object.create(t.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}))}:Et.exports=function(e,t){if(t){e.super_=t;var n=function(){};n.prototype=t.prototype,e.prototype=new n,e.prototype.constructor=e}}});var Ha=W((Cc,Pa)=>{"use strict";var _n=T0(),S0=Y0(),Ft=Je(),Ce=Xe(),wn=_n.assert;function K0(r){Ce.call(this,"short",r),this.a=new S0(r.a,16).toRed(this.red),this.b=new S0(r.b,16).toRed(this.red),this.tinv=this.two.redInvm(),this.zeroA=this.a.fromRed().cmpn(0)===0,this.threeA=this.a.fromRed().sub(this.p).cmpn(-3)===0,this.endo=this._getEndomorphism(r),this._endoWnafT1=new Array(4),this._endoWnafT2=new Array(4)}Ft(K0,Ce);Pa.exports=K0;K0.prototype._getEndomorphism=function(e){if(!(!this.zeroA||!this.g||!this.n||this.p.modn(3)!==1)){var t,n;if(e.beta)t=new S0(e.beta,16).toRed(this.red);else{var a=this._getEndoRoots(this.p);t=a[0].cmp(a[1])<0?a[0]:a[1],t=t.toRed(this.red)}if(e.lambda)n=new S0(e.lambda,16);else{var c=this._getEndoRoots(this.n);this.g.mul(c[0]).x.cmp(this.g.x.redMul(t))===0?n=c[0]:(n=c[1],wn(this.g.mul(n).x.cmp(this.g.x.redMul(t))===0))}var v;return e.basis?v=e.basis.map(function(s){return{a:new S0(s.a,16),b:new S0(s.b,16)}}):v=this._getEndoBasis(n),{beta:t,lambda:n,basis:v}}};K0.prototype._getEndoRoots=function(e){var t=e===this.p?this.red:S0.mont(e),n=new S0(2).toRed(t).redInvm(),a=n.redNeg(),c=new S0(3).toRed(t).redNeg().redSqrt().redMul(n),v=a.redAdd(c).fromRed(),s=a.redSub(c).fromRed();return[v,s]};K0.prototype._getEndoBasis=function(e){for(var t=this.n.ushrn(Math.floor(this.n.bitLength()/2)),n=e,a=this.n.clone(),c=new S0(1),v=new S0(0),s=new S0(0),l=new S0(1),g,u,p,x,_,S,z,C=0,M,B;n.cmpn(0)!==0;){var k=a.div(n);M=a.sub(k.mul(n)),B=s.sub(k.mul(c));var I=l.sub(k.mul(v));if(!p&&M.cmp(t)<0)g=z.neg(),u=c,p=M.neg(),x=B;else if(p&&++C==2)break;z=M,a=n,n=M,s=c,c=B,l=v,v=I}_=M.neg(),S=B;var E=p.sqr().add(x.sqr()),H=_.sqr().add(S.sqr());return H.cmp(E)>=0&&(_=g,S=u),p.negative&&(p=p.neg(),x=x.neg()),_.negative&&(_=_.neg(),S=S.neg()),[{a:p,b:x},{a:_,b:S}]};K0.prototype._endoSplit=function(e){var t=this.endo.basis,n=t[0],a=t[1],c=a.b.mul(e).divRound(this.n),v=n.b.neg().mul(e).divRound(this.n),s=c.mul(n.a),l=v.mul(a.a),g=c.mul(n.b),u=v.mul(a.b),p=e.sub(s).sub(l),x=g.add(u).neg();return{k1:p,k2:x}};K0.prototype.pointFromX=function(e,t){e=new S0(e,16),e.red||(e=e.toRed(this.red));var n=e.redSqr().redMul(e).redIAdd(e.redMul(this.a)).redIAdd(this.b),a=n.redSqrt();if(a.redSqr().redSub(n).cmp(this.zero)!==0)throw new Error("invalid point");var c=a.fromRed().isOdd();return(t&&!c||!t&&c)&&(a=a.redNeg()),this.point(e,a)};K0.prototype.validate=function(e){if(e.inf)return!0;var t=e.x,n=e.y,a=this.a.redMul(t),c=t.redSqr().redMul(t).redIAdd(a).redIAdd(this.b);return n.redSqr().redISub(c).cmpn(0)===0};K0.prototype._endoWnafMulAdd=function(e,t,n){for(var a=this._endoWnafT1,c=this._endoWnafT2,v=0;v<e.length;v++){var s=this._endoSplit(t[v]),l=e[v],g=l._getBeta();s.k1.negative&&(s.k1.ineg(),l=l.neg(!0)),s.k2.negative&&(s.k2.ineg(),g=g.neg(!0)),a[v*2]=l,a[v*2+1]=g,c[v*2]=s.k1,c[v*2+1]=s.k2}for(var u=this._wnafMulAdd(1,a,c,v*2,n),p=0;p<v*2;p++)a[p]=null,c[p]=null;return u};function I0(r,e,t,n){Ce.BasePoint.call(this,r,"affine"),e===null&&t===null?(this.x=null,this.y=null,this.inf=!0):(this.x=new S0(e,16),this.y=new S0(t,16),n&&(this.x.forceRed(this.curve.red),this.y.forceRed(this.curve.red)),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.inf=!1)}Ft(I0,Ce.BasePoint);K0.prototype.point=function(e,t,n){return new I0(this,e,t,n)};K0.prototype.pointFromJSON=function(e,t){return I0.fromJSON(this,e,t)};I0.prototype._getBeta=function(){if(!!this.curve.endo){var e=this.precomputed;if(e&&e.beta)return e.beta;var t=this.curve.point(this.x.redMul(this.curve.endo.beta),this.y);if(e){var n=this.curve,a=function(c){return n.point(c.x.redMul(n.endo.beta),c.y)};e.beta=t,t.precomputed={beta:null,naf:e.naf&&{wnd:e.naf.wnd,points:e.naf.points.map(a)},doubles:e.doubles&&{step:e.doubles.step,points:e.doubles.points.map(a)}}}return t}};I0.prototype.toJSON=function(){return this.precomputed?[this.x,this.y,this.precomputed&&{doubles:this.precomputed.doubles&&{step:this.precomputed.doubles.step,points:this.precomputed.doubles.points.slice(1)},naf:this.precomputed.naf&&{wnd:this.precomputed.naf.wnd,points:this.precomputed.naf.points.slice(1)}}]:[this.x,this.y]};I0.fromJSON=function(e,t,n){typeof t=="string"&&(t=JSON.parse(t));var a=e.point(t[0],t[1],n);if(!t[2])return a;function c(s){return e.point(s[0],s[1],n)}var v=t[2];return a.precomputed={beta:null,doubles:v.doubles&&{step:v.doubles.step,points:[a].concat(v.doubles.points.map(c))},naf:v.naf&&{wnd:v.naf.wnd,points:[a].concat(v.naf.points.map(c))}},a};I0.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" y: "+this.y.fromRed().toString(16,2)+">"};I0.prototype.isInfinity=function(){return this.inf};I0.prototype.add=function(e){if(this.inf)return e;if(e.inf)return this;if(this.eq(e))return this.dbl();if(this.neg().eq(e))return this.curve.point(null,null);if(this.x.cmp(e.x)===0)return this.curve.point(null,null);var t=this.y.redSub(e.y);t.cmpn(0)!==0&&(t=t.redMul(this.x.redSub(e.x).redInvm()));var n=t.redSqr().redISub(this.x).redISub(e.x),a=t.redMul(this.x.redSub(n)).redISub(this.y);return this.curve.point(n,a)};I0.prototype.dbl=function(){if(this.inf)return this;var e=this.y.redAdd(this.y);if(e.cmpn(0)===0)return this.curve.point(null,null);var t=this.curve.a,n=this.x.redSqr(),a=e.redInvm(),c=n.redAdd(n).redIAdd(n).redIAdd(t).redMul(a),v=c.redSqr().redISub(this.x.redAdd(this.x)),s=c.redMul(this.x.redSub(v)).redISub(this.y);return this.curve.point(v,s)};I0.prototype.getX=function(){return this.x.fromRed()};I0.prototype.getY=function(){return this.y.fromRed()};I0.prototype.mul=function(e){return e=new S0(e,16),this.isInfinity()?this:this._hasDoubles(e)?this.curve._fixedNafMul(this,e):this.curve.endo?this.curve._endoWnafMulAdd([this],[e]):this.curve._wnafMul(this,e)};I0.prototype.mulAdd=function(e,t,n){var a=[this,t],c=[e,n];return this.curve.endo?this.curve._endoWnafMulAdd(a,c):this.curve._wnafMulAdd(1,a,c,2)};I0.prototype.jmulAdd=function(e,t,n){var a=[this,t],c=[e,n];return this.curve.endo?this.curve._endoWnafMulAdd(a,c,!0):this.curve._wnafMulAdd(1,a,c,2,!0)};I0.prototype.eq=function(e){return this===e||this.inf===e.inf&&(this.inf||this.x.cmp(e.x)===0&&this.y.cmp(e.y)===0)};I0.prototype.neg=function(e){if(this.inf)return this;var t=this.curve.point(this.x,this.y.redNeg());if(e&&this.precomputed){var n=this.precomputed,a=function(c){return c.neg()};t.precomputed={naf:n.naf&&{wnd:n.naf.wnd,points:n.naf.points.map(a)},doubles:n.doubles&&{step:n.doubles.step,points:n.doubles.points.map(a)}}}return t};I0.prototype.toJ=function(){if(this.inf)return this.curve.jpoint(null,null,null);var e=this.curve.jpoint(this.x,this.y,this.curve.one);return e};function H0(r,e,t,n){Ce.BasePoint.call(this,r,"jacobian"),e===null&&t===null&&n===null?(this.x=this.curve.one,this.y=this.curve.one,this.z=new S0(0)):(this.x=new S0(e,16),this.y=new S0(t,16),this.z=new S0(n,16)),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)),this.zOne=this.z===this.curve.one}Ft(H0,Ce.BasePoint);K0.prototype.jpoint=function(e,t,n){return new H0(this,e,t,n)};H0.prototype.toP=function(){if(this.isInfinity())return this.curve.point(null,null);var e=this.z.redInvm(),t=e.redSqr(),n=this.x.redMul(t),a=this.y.redMul(t).redMul(e);return this.curve.point(n,a)};H0.prototype.neg=function(){return this.curve.jpoint(this.x,this.y.redNeg(),this.z)};H0.prototype.add=function(e){if(this.isInfinity())return e;if(e.isInfinity())return this;var t=e.z.redSqr(),n=this.z.redSqr(),a=this.x.redMul(t),c=e.x.redMul(n),v=this.y.redMul(t.redMul(e.z)),s=e.y.redMul(n.redMul(this.z)),l=a.redSub(c),g=v.redSub(s);if(l.cmpn(0)===0)return g.cmpn(0)!==0?this.curve.jpoint(null,null,null):this.dbl();var u=l.redSqr(),p=u.redMul(l),x=a.redMul(u),_=g.redSqr().redIAdd(p).redISub(x).redISub(x),S=g.redMul(x.redISub(_)).redISub(v.redMul(p)),z=this.z.redMul(e.z).redMul(l);return this.curve.jpoint(_,S,z)};H0.prototype.mixedAdd=function(e){if(this.isInfinity())return e.toJ();if(e.isInfinity())return this;var t=this.z.redSqr(),n=this.x,a=e.x.redMul(t),c=this.y,v=e.y.redMul(t).redMul(this.z),s=n.redSub(a),l=c.redSub(v);if(s.cmpn(0)===0)return l.cmpn(0)!==0?this.curve.jpoint(null,null,null):this.dbl();var g=s.redSqr(),u=g.redMul(s),p=n.redMul(g),x=l.redSqr().redIAdd(u).redISub(p).redISub(p),_=l.redMul(p.redISub(x)).redISub(c.redMul(u)),S=this.z.redMul(s);return this.curve.jpoint(x,_,S)};H0.prototype.dblp=function(e){if(e===0)return this;if(this.isInfinity())return this;if(!e)return this.dbl();var t;if(this.curve.zeroA||this.curve.threeA){var n=this;for(t=0;t<e;t++)n=n.dbl();return n}var a=this.curve.a,c=this.curve.tinv,v=this.x,s=this.y,l=this.z,g=l.redSqr().redSqr(),u=s.redAdd(s);for(t=0;t<e;t++){var p=v.redSqr(),x=u.redSqr(),_=x.redSqr(),S=p.redAdd(p).redIAdd(p).redIAdd(a.redMul(g)),z=v.redMul(x),C=S.redSqr().redISub(z.redAdd(z)),M=z.redISub(C),B=S.redMul(M);B=B.redIAdd(B).redISub(_);var k=u.redMul(l);t+1<e&&(g=g.redMul(_)),v=C,l=k,u=B}return this.curve.jpoint(v,u.redMul(c),l)};H0.prototype.dbl=function(){return this.isInfinity()?this:this.curve.zeroA?this._zeroDbl():this.curve.threeA?this._threeDbl():this._dbl()};H0.prototype._zeroDbl=function(){var e,t,n;if(this.zOne){var a=this.x.redSqr(),c=this.y.redSqr(),v=c.redSqr(),s=this.x.redAdd(c).redSqr().redISub(a).redISub(v);s=s.redIAdd(s);var l=a.redAdd(a).redIAdd(a),g=l.redSqr().redISub(s).redISub(s),u=v.redIAdd(v);u=u.redIAdd(u),u=u.redIAdd(u),e=g,t=l.redMul(s.redISub(g)).redISub(u),n=this.y.redAdd(this.y)}else{var p=this.x.redSqr(),x=this.y.redSqr(),_=x.redSqr(),S=this.x.redAdd(x).redSqr().redISub(p).redISub(_);S=S.redIAdd(S);var z=p.redAdd(p).redIAdd(p),C=z.redSqr(),M=_.redIAdd(_);M=M.redIAdd(M),M=M.redIAdd(M),e=C.redISub(S).redISub(S),t=z.redMul(S.redISub(e)).redISub(M),n=this.y.redMul(this.z),n=n.redIAdd(n)}return this.curve.jpoint(e,t,n)};H0.prototype._threeDbl=function(){var e,t,n;if(this.zOne){var a=this.x.redSqr(),c=this.y.redSqr(),v=c.redSqr(),s=this.x.redAdd(c).redSqr().redISub(a).redISub(v);s=s.redIAdd(s);var l=a.redAdd(a).redIAdd(a).redIAdd(this.curve.a),g=l.redSqr().redISub(s).redISub(s);e=g;var u=v.redIAdd(v);u=u.redIAdd(u),u=u.redIAdd(u),t=l.redMul(s.redISub(g)).redISub(u),n=this.y.redAdd(this.y)}else{var p=this.z.redSqr(),x=this.y.redSqr(),_=this.x.redMul(x),S=this.x.redSub(p).redMul(this.x.redAdd(p));S=S.redAdd(S).redIAdd(S);var z=_.redIAdd(_);z=z.redIAdd(z);var C=z.redAdd(z);e=S.redSqr().redISub(C),n=this.y.redAdd(this.z).redSqr().redISub(x).redISub(p);var M=x.redSqr();M=M.redIAdd(M),M=M.redIAdd(M),M=M.redIAdd(M),t=S.redMul(z.redISub(e)).redISub(M)}return this.curve.jpoint(e,t,n)};H0.prototype._dbl=function(){var e=this.curve.a,t=this.x,n=this.y,a=this.z,c=a.redSqr().redSqr(),v=t.redSqr(),s=n.redSqr(),l=v.redAdd(v).redIAdd(v).redIAdd(e.redMul(c)),g=t.redAdd(t);g=g.redIAdd(g);var u=g.redMul(s),p=l.redSqr().redISub(u.redAdd(u)),x=u.redISub(p),_=s.redSqr();_=_.redIAdd(_),_=_.redIAdd(_),_=_.redIAdd(_);var S=l.redMul(x).redISub(_),z=n.redAdd(n).redMul(a);return this.curve.jpoint(p,S,z)};H0.prototype.trpl=function(){if(!this.curve.zeroA)return this.dbl().add(this);var e=this.x.redSqr(),t=this.y.redSqr(),n=this.z.redSqr(),a=t.redSqr(),c=e.redAdd(e).redIAdd(e),v=c.redSqr(),s=this.x.redAdd(t).redSqr().redISub(e).redISub(a);s=s.redIAdd(s),s=s.redAdd(s).redIAdd(s),s=s.redISub(v);var l=s.redSqr(),g=a.redIAdd(a);g=g.redIAdd(g),g=g.redIAdd(g),g=g.redIAdd(g);var u=c.redIAdd(s).redSqr().redISub(v).redISub(l).redISub(g),p=t.redMul(u);p=p.redIAdd(p),p=p.redIAdd(p);var x=this.x.redMul(l).redISub(p);x=x.redIAdd(x),x=x.redIAdd(x);var _=this.y.redMul(u.redMul(g.redISub(u)).redISub(s.redMul(l)));_=_.redIAdd(_),_=_.redIAdd(_),_=_.redIAdd(_);var S=this.z.redAdd(s).redSqr().redISub(n).redISub(l);return this.curve.jpoint(x,_,S)};H0.prototype.mul=function(e,t){return e=new S0(e,t),this.curve._wnafMul(this,e)};H0.prototype.eq=function(e){if(e.type==="affine")return this.eq(e.toJ());if(this===e)return!0;var t=this.z.redSqr(),n=e.z.redSqr();if(this.x.redMul(n).redISub(e.x.redMul(t)).cmpn(0)!==0)return!1;var a=t.redMul(this.z),c=n.redMul(e.z);return this.y.redMul(c).redISub(e.y.redMul(a)).cmpn(0)===0};H0.prototype.eqXToP=function(e){var t=this.z.redSqr(),n=e.toRed(this.curve.red).redMul(t);if(this.x.cmp(n)===0)return!0;for(var a=e.clone(),c=this.curve.redN.redMul(t);;){if(a.iadd(this.curve.n),a.cmp(this.curve.p)>=0)return!1;if(n.redIAdd(c),this.x.cmp(n)===0)return!0}};H0.prototype.inspect=function(){return this.isInfinity()?"<EC JPoint Infinity>":"<EC JPoint x: "+this.x.toString(16,2)+" y: "+this.y.toString(16,2)+" z: "+this.z.toString(16,2)+">"};H0.prototype.isInfinity=function(){return this.z.cmpn(0)===0}});var Da=W((kc,Fa)=>{"use strict";var ke=Y0(),Ea=Je(),Ur=Xe(),Mn=T0();function Ie(r){Ur.call(this,"mont",r),this.a=new ke(r.a,16).toRed(this.red),this.b=new ke(r.b,16).toRed(this.red),this.i4=new ke(4).toRed(this.red).redInvm(),this.two=new ke(2).toRed(this.red),this.a24=this.i4.redMul(this.a.redAdd(this.two))}Ea(Ie,Ur);Fa.exports=Ie;Ie.prototype.validate=function(e){var t=e.normalize().x,n=t.redSqr(),a=n.redMul(t).redAdd(n.redMul(this.a)).redAdd(t),c=a.redSqrt();return c.redSqr().cmp(a)===0};function R0(r,e,t){Ur.BasePoint.call(this,r,"projective"),e===null&&t===null?(this.x=this.curve.one,this.z=this.curve.zero):(this.x=new ke(e,16),this.z=new ke(t,16),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)))}Ea(R0,Ur.BasePoint);Ie.prototype.decodePoint=function(e,t){return this.point(Mn.toArray(e,t),1)};Ie.prototype.point=function(e,t){return new R0(this,e,t)};Ie.prototype.pointFromJSON=function(e){return R0.fromJSON(this,e)};R0.prototype.precompute=function(){};R0.prototype._encode=function(){return this.getX().toArray("be",this.curve.p.byteLength())};R0.fromJSON=function(e,t){return new R0(e,t[0],t[1]||e.one)};R0.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" z: "+this.z.fromRed().toString(16,2)+">"};R0.prototype.isInfinity=function(){return this.z.cmpn(0)===0};R0.prototype.dbl=function(){var e=this.x.redAdd(this.z),t=e.redSqr(),n=this.x.redSub(this.z),a=n.redSqr(),c=t.redSub(a),v=t.redMul(a),s=c.redMul(a.redAdd(this.curve.a24.redMul(c)));return this.curve.point(v,s)};R0.prototype.add=function(){throw new Error("Not supported on Montgomery curve")};R0.prototype.diffAdd=function(e,t){var n=this.x.redAdd(this.z),a=this.x.redSub(this.z),c=e.x.redAdd(e.z),v=e.x.redSub(e.z),s=v.redMul(n),l=c.redMul(a),g=t.z.redMul(s.redAdd(l).redSqr()),u=t.x.redMul(s.redISub(l).redSqr());return this.curve.point(g,u)};R0.prototype.mul=function(e){for(var t=e.clone(),n=this,a=this.curve.point(null,null),c=this,v=[];t.cmpn(0)!==0;t.iushrn(1))v.push(t.andln(1));for(var s=v.length-1;s>=0;s--)v[s]===0?(n=n.diffAdd(a,c),a=a.dbl()):(a=n.diffAdd(a,c),n=n.dbl());return a};R0.prototype.mulAdd=function(){throw new Error("Not supported on Montgomery curve")};R0.prototype.jumlAdd=function(){throw new Error("Not supported on Montgomery curve")};R0.prototype.eq=function(e){return this.getX().cmp(e.getX())===0};R0.prototype.normalize=function(){return this.x=this.x.redMul(this.z.redInvm()),this.z=this.curve.one,this};R0.prototype.getX=function(){return this.normalize(),this.x.fromRed()}});var Wa=W((Ic,La)=>{"use strict";var Sn=T0(),fe=Y0(),Na=Je(),jr=Xe(),An=Sn.assert;function G0(r){this.twisted=(r.a|0)!=1,this.mOneA=this.twisted&&(r.a|0)==-1,this.extended=this.mOneA,jr.call(this,"edwards",r),this.a=new fe(r.a,16).umod(this.red.m),this.a=this.a.toRed(this.red),this.c=new fe(r.c,16).toRed(this.red),this.c2=this.c.redSqr(),this.d=new fe(r.d,16).toRed(this.red),this.dd=this.d.redAdd(this.d),An(!this.twisted||this.c.fromRed().cmpn(1)===0),this.oneC=(r.c|0)==1}Na(G0,jr);La.exports=G0;G0.prototype._mulA=function(e){return this.mOneA?e.redNeg():this.a.redMul(e)};G0.prototype._mulC=function(e){return this.oneC?e:this.c.redMul(e)};G0.prototype.jpoint=function(e,t,n,a){return this.point(e,t,n,a)};G0.prototype.pointFromX=function(e,t){e=new fe(e,16),e.red||(e=e.toRed(this.red));var n=e.redSqr(),a=this.c2.redSub(this.a.redMul(n)),c=this.one.redSub(this.c2.redMul(this.d).redMul(n)),v=a.redMul(c.redInvm()),s=v.redSqrt();if(s.redSqr().redSub(v).cmp(this.zero)!==0)throw new Error("invalid point");var l=s.fromRed().isOdd();return(t&&!l||!t&&l)&&(s=s.redNeg()),this.point(e,s)};G0.prototype.pointFromY=function(e,t){e=new fe(e,16),e.red||(e=e.toRed(this.red));var n=e.redSqr(),a=n.redSub(this.c2),c=n.redMul(this.d).redMul(this.c2).redSub(this.a),v=a.redMul(c.redInvm());if(v.cmp(this.zero)===0){if(t)throw new Error("invalid point");return this.point(this.zero,e)}var s=v.redSqrt();if(s.redSqr().redSub(v).cmp(this.zero)!==0)throw new Error("invalid point");return s.fromRed().isOdd()!==t&&(s=s.redNeg()),this.point(s,e)};G0.prototype.validate=function(e){if(e.isInfinity())return!0;e.normalize();var t=e.x.redSqr(),n=e.y.redSqr(),a=t.redMul(this.a).redAdd(n),c=this.c2.redMul(this.one.redAdd(this.d.redMul(t).redMul(n)));return a.cmp(c)===0};function i0(r,e,t,n,a){jr.BasePoint.call(this,r,"projective"),e===null&&t===null&&n===null?(this.x=this.curve.zero,this.y=this.curve.one,this.z=this.curve.one,this.t=this.curve.zero,this.zOne=!0):(this.x=new fe(e,16),this.y=new fe(t,16),this.z=n?new fe(n,16):this.curve.one,this.t=a&&new fe(a,16),this.x.red||(this.x=this.x.toRed(this.curve.red)),this.y.red||(this.y=this.y.toRed(this.curve.red)),this.z.red||(this.z=this.z.toRed(this.curve.red)),this.t&&!this.t.red&&(this.t=this.t.toRed(this.curve.red)),this.zOne=this.z===this.curve.one,this.curve.extended&&!this.t&&(this.t=this.x.redMul(this.y),this.zOne||(this.t=this.t.redMul(this.z.redInvm()))))}Na(i0,jr.BasePoint);G0.prototype.pointFromJSON=function(e){return i0.fromJSON(this,e)};G0.prototype.point=function(e,t,n,a){return new i0(this,e,t,n,a)};i0.fromJSON=function(e,t){return new i0(e,t[0],t[1],t[2])};i0.prototype.inspect=function(){return this.isInfinity()?"<EC Point Infinity>":"<EC Point x: "+this.x.fromRed().toString(16,2)+" y: "+this.y.fromRed().toString(16,2)+" z: "+this.z.fromRed().toString(16,2)+">"};i0.prototype.isInfinity=function(){return this.x.cmpn(0)===0&&(this.y.cmp(this.z)===0||this.zOne&&this.y.cmp(this.curve.c)===0)};i0.prototype._extDbl=function(){var e=this.x.redSqr(),t=this.y.redSqr(),n=this.z.redSqr();n=n.redIAdd(n);var a=this.curve._mulA(e),c=this.x.redAdd(this.y).redSqr().redISub(e).redISub(t),v=a.redAdd(t),s=v.redSub(n),l=a.redSub(t),g=c.redMul(s),u=v.redMul(l),p=c.redMul(l),x=s.redMul(v);return this.curve.point(g,u,x,p)};i0.prototype._projDbl=function(){var e=this.x.redAdd(this.y).redSqr(),t=this.x.redSqr(),n=this.y.redSqr(),a,c,v,s,l,g;if(this.curve.twisted){s=this.curve._mulA(t);var u=s.redAdd(n);this.zOne?(a=e.redSub(t).redSub(n).redMul(u.redSub(this.curve.two)),c=u.redMul(s.redSub(n)),v=u.redSqr().redSub(u).redSub(u)):(l=this.z.redSqr(),g=u.redSub(l).redISub(l),a=e.redSub(t).redISub(n).redMul(g),c=u.redMul(s.redSub(n)),v=u.redMul(g))}else s=t.redAdd(n),l=this.curve._mulC(this.z).redSqr(),g=s.redSub(l).redSub(l),a=this.curve._mulC(e.redISub(s)).redMul(g),c=this.curve._mulC(s).redMul(t.redISub(n)),v=s.redMul(g);return this.curve.point(a,c,v)};i0.prototype.dbl=function(){return this.isInfinity()?this:this.curve.extended?this._extDbl():this._projDbl()};i0.prototype._extAdd=function(e){var t=this.y.redSub(this.x).redMul(e.y.redSub(e.x)),n=this.y.redAdd(this.x).redMul(e.y.redAdd(e.x)),a=this.t.redMul(this.curve.dd).redMul(e.t),c=this.z.redMul(e.z.redAdd(e.z)),v=n.redSub(t),s=c.redSub(a),l=c.redAdd(a),g=n.redAdd(t),u=v.redMul(s),p=l.redMul(g),x=v.redMul(g),_=s.redMul(l);return this.curve.point(u,p,_,x)};i0.prototype._projAdd=function(e){var t=this.z.redMul(e.z),n=t.redSqr(),a=this.x.redMul(e.x),c=this.y.redMul(e.y),v=this.curve.d.redMul(a).redMul(c),s=n.redSub(v),l=n.redAdd(v),g=this.x.redAdd(this.y).redMul(e.x.redAdd(e.y)).redISub(a).redISub(c),u=t.redMul(s).redMul(g),p,x;return this.curve.twisted?(p=t.redMul(l).redMul(c.redSub(this.curve._mulA(a))),x=s.redMul(l)):(p=t.redMul(l).redMul(c.redSub(a)),x=this.curve._mulC(s).redMul(l)),this.curve.point(u,p,x)};i0.prototype.add=function(e){return this.isInfinity()?e:e.isInfinity()?this:this.curve.extended?this._extAdd(e):this._projAdd(e)};i0.prototype.mul=function(e){return this._hasDoubles(e)?this.curve._fixedNafMul(this,e):this.curve._wnafMul(this,e)};i0.prototype.mulAdd=function(e,t,n){return this.curve._wnafMulAdd(1,[this,t],[e,n],2,!1)};i0.prototype.jmulAdd=function(e,t,n){return this.curve._wnafMulAdd(1,[this,t],[e,n],2,!0)};i0.prototype.normalize=function(){if(this.zOne)return this;var e=this.z.redInvm();return this.x=this.x.redMul(e),this.y=this.y.redMul(e),this.t&&(this.t=this.t.redMul(e)),this.z=this.curve.one,this.zOne=!0,this};i0.prototype.neg=function(){return this.curve.point(this.x.redNeg(),this.y,this.z,this.t&&this.t.redNeg())};i0.prototype.getX=function(){return this.normalize(),this.x.fromRed()};i0.prototype.getY=function(){return this.normalize(),this.y.fromRed()};i0.prototype.eq=function(e){return this===e||this.getX().cmp(e.getX())===0&&this.getY().cmp(e.getY())===0};i0.prototype.eqXToP=function(e){var t=e.toRed(this.curve.red).redMul(this.z);if(this.x.cmp(t)===0)return!0;for(var n=e.clone(),a=this.curve.redN.redMul(this.z);;){if(n.iadd(this.curve.n),n.cmp(this.curve.p)>=0)return!1;if(t.redIAdd(a),this.x.cmp(t)===0)return!0}};i0.prototype.toP=i0.prototype.normalize;i0.prototype.mixedAdd=i0.prototype.add});var Dt=W(Ta=>{"use strict";var Xr=Ta;Xr.base=Xe();Xr.short=Ha();Xr.mont=Da();Xr.edwards=Wa()});var X0=W(r0=>{"use strict";var Bn=ue(),qn=Je();r0.inherits=qn;function zn(r,e){return(r.charCodeAt(e)&64512)!=55296||e<0||e+1>=r.length?!1:(r.charCodeAt(e+1)&64512)==56320}function Cn(r,e){if(Array.isArray(r))return r.slice();if(!r)return[];var t=[];if(typeof r=="string")if(e){if(e==="hex")for(r=r.replace(/[^a-z0-9]+/ig,""),r.length%2!=0&&(r="0"+r),a=0;a<r.length;a+=2)t.push(parseInt(r[a]+r[a+1],16))}else for(var n=0,a=0;a<r.length;a++){var c=r.charCodeAt(a);c<128?t[n++]=c:c<2048?(t[n++]=c>>6|192,t[n++]=c&63|128):zn(r,a)?(c=65536+((c&1023)<<10)+(r.charCodeAt(++a)&1023),t[n++]=c>>18|240,t[n++]=c>>12&63|128,t[n++]=c>>6&63|128,t[n++]=c&63|128):(t[n++]=c>>12|224,t[n++]=c>>6&63|128,t[n++]=c&63|128)}else for(a=0;a<r.length;a++)t[a]=r[a]|0;return t}r0.toArray=Cn;function kn(r){for(var e="",t=0;t<r.length;t++)e+=Ka(r[t].toString(16));return e}r0.toHex=kn;function Oa(r){var e=r>>>24|r>>>8&65280|r<<8&16711680|(r&255)<<24;return e>>>0}r0.htonl=Oa;function In(r,e){for(var t="",n=0;n<r.length;n++){var a=r[n];e==="little"&&(a=Oa(a)),t+=Ua(a.toString(16))}return t}r0.toHex32=In;function Ka(r){return r.length===1?"0"+r:r}r0.zero2=Ka;function Ua(r){return r.length===7?"0"+r:r.length===6?"00"+r:r.length===5?"000"+r:r.length===4?"0000"+r:r.length===3?"00000"+r:r.length===2?"000000"+r:r.length===1?"0000000"+r:r}r0.zero8=Ua;function Rn(r,e,t,n){var a=t-e;Bn(a%4==0);for(var c=new Array(a/4),v=0,s=e;v<c.length;v++,s+=4){var l;n==="big"?l=r[s]<<24|r[s+1]<<16|r[s+2]<<8|r[s+3]:l=r[s+3]<<24|r[s+2]<<16|r[s+1]<<8|r[s],c[v]=l>>>0}return c}r0.join32=Rn;function Pn(r,e){for(var t=new Array(r.length*4),n=0,a=0;n<r.length;n++,a+=4){var c=r[n];e==="big"?(t[a]=c>>>24,t[a+1]=c>>>16&255,t[a+2]=c>>>8&255,t[a+3]=c&255):(t[a+3]=c>>>24,t[a+2]=c>>>16&255,t[a+1]=c>>>8&255,t[a]=c&255)}return t}r0.split32=Pn;function Hn(r,e){return r>>>e|r<<32-e}r0.rotr32=Hn;function En(r,e){return r<<e|r>>>32-e}r0.rotl32=En;function Fn(r,e){return r+e>>>0}r0.sum32=Fn;function Dn(r,e,t){return r+e+t>>>0}r0.sum32_3=Dn;function Nn(r,e,t,n){return r+e+t+n>>>0}r0.sum32_4=Nn;function Ln(r,e,t,n,a){return r+e+t+n+a>>>0}r0.sum32_5=Ln;function Wn(r,e,t,n){var a=r[e],c=r[e+1],v=n+c>>>0,s=(v<n?1:0)+t+a;r[e]=s>>>0,r[e+1]=v}r0.sum64=Wn;function Tn(r,e,t,n){var a=e+n>>>0,c=(a<e?1:0)+r+t;return c>>>0}r0.sum64_hi=Tn;function On(r,e,t,n){var a=e+n;return a>>>0}r0.sum64_lo=On;function Kn(r,e,t,n,a,c,v,s){var l=0,g=e;g=g+n>>>0,l+=g<e?1:0,g=g+c>>>0,l+=g<c?1:0,g=g+s>>>0,l+=g<s?1:0;var u=r+t+a+v+l;return u>>>0}r0.sum64_4_hi=Kn;function Un(r,e,t,n,a,c,v,s){var l=e+n+c+s;return l>>>0}r0.sum64_4_lo=Un;function jn(r,e,t,n,a,c,v,s,l,g){var u=0,p=e;p=p+n>>>0,u+=p<e?1:0,p=p+c>>>0,u+=p<c?1:0,p=p+s>>>0,u+=p<s?1:0,p=p+g>>>0,u+=p<g?1:0;var x=r+t+a+v+l+u;return x>>>0}r0.sum64_5_hi=jn;function Xn(r,e,t,n,a,c,v,s,l,g){var u=e+n+c+s+g;return u>>>0}r0.sum64_5_lo=Xn;function Jn(r,e,t){var n=e<<32-t|r>>>t;return n>>>0}r0.rotr64_hi=Jn;function Zn(r,e,t){var n=r<<32-t|e>>>t;return n>>>0}r0.rotr64_lo=Zn;function Yn(r,e,t){return r>>>t}r0.shr64_hi=Yn;function Gn(r,e,t){var n=r<<32-t|e>>>t;return n>>>0}r0.shr64_lo=Gn});var Re=W(Xa=>{"use strict";var ja=X0(),Vn=ue();function Jr(){this.pending=null,this.pendingTotal=0,this.blockSize=this.constructor.blockSize,this.outSize=this.constructor.outSize,this.hmacStrength=this.constructor.hmacStrength,this.padLength=this.constructor.padLength/8,this.endian="big",this._delta8=this.blockSize/8,this._delta32=this.blockSize/32}Xa.BlockHash=Jr;Jr.prototype.update=function(e,t){if(e=ja.toArray(e,t),this.pending?this.pending=this.pending.concat(e):this.pending=e,this.pendingTotal+=e.length,this.pending.length>=this._delta8){e=this.pending;var n=e.length%this._delta8;this.pending=e.slice(e.length-n,e.length),this.pending.length===0&&(this.pending=null),e=ja.join32(e,0,e.length-n,this.endian);for(var a=0;a<e.length;a+=this._delta32)this._update(e,a,a+this._delta32)}return this};Jr.prototype.digest=function(e){return this.update(this._pad()),Vn(this.pending===null),this._digest(e)};Jr.prototype._pad=function(){var e=this.pendingTotal,t=this._delta8,n=t-(e+this.padLength)%t,a=new Array(n+this.padLength);a[0]=128;for(var c=1;c<n;c++)a[c]=0;if(e<<=3,this.endian==="big"){for(var v=8;v<this.padLength;v++)a[c++]=0;a[c++]=0,a[c++]=0,a[c++]=0,a[c++]=0,a[c++]=e>>>24&255,a[c++]=e>>>16&255,a[c++]=e>>>8&255,a[c++]=e&255}else for(a[c++]=e&255,a[c++]=e>>>8&255,a[c++]=e>>>16&255,a[c++]=e>>>24&255,a[c++]=0,a[c++]=0,a[c++]=0,a[c++]=0,v=8;v<this.padLength;v++)a[c++]=0;return a}});var Nt=W(ae=>{"use strict";var $n=X0(),V0=$n.rotr32;function Qn(r,e,t,n){if(r===0)return Ja(e,t,n);if(r===1||r===3)return Ya(e,t,n);if(r===2)return Za(e,t,n)}ae.ft_1=Qn;function Ja(r,e,t){return r&e^~r&t}ae.ch32=Ja;function Za(r,e,t){return r&e^r&t^e&t}ae.maj32=Za;function Ya(r,e,t){return r^e^t}ae.p32=Ya;function ed(r){return V0(r,2)^V0(r,13)^V0(r,22)}ae.s0_256=ed;function rd(r){return V0(r,6)^V0(r,11)^V0(r,25)}ae.s1_256=rd;function td(r){return V0(r,7)^V0(r,18)^r>>>3}ae.g0_256=td;function fd(r){return V0(r,17)^V0(r,19)^r>>>10}ae.g1_256=fd});var $a=W((Fc,Va)=>{"use strict";var Pe=X0(),ad=Re(),id=Nt(),Lt=Pe.rotl32,Ze=Pe.sum32,nd=Pe.sum32_5,dd=id.ft_1,Ga=ad.BlockHash,cd=[1518500249,1859775393,2400959708,3395469782];function $0(){if(!(this instanceof $0))return new $0;Ga.call(this),this.h=[1732584193,4023233417,2562383102,271733878,3285377520],this.W=new Array(80)}Pe.inherits($0,Ga);Va.exports=$0;$0.blockSize=512;$0.outSize=160;$0.hmacStrength=80;$0.padLength=64;$0.prototype._update=function(e,t){for(var n=this.W,a=0;a<16;a++)n[a]=e[t+a];for(;a<n.length;a++)n[a]=Lt(n[a-3]^n[a-8]^n[a-14]^n[a-16],1);var c=this.h[0],v=this.h[1],s=this.h[2],l=this.h[3],g=this.h[4];for(a=0;a<n.length;a++){var u=~~(a/20),p=nd(Lt(c,5),dd(u,v,s,l),g,n[a],cd[u]);g=l,l=s,s=Lt(v,30),v=c,c=p}this.h[0]=Ze(this.h[0],c),this.h[1]=Ze(this.h[1],v),this.h[2]=Ze(this.h[2],s),this.h[3]=Ze(this.h[3],l),this.h[4]=Ze(this.h[4],g)};$0.prototype._digest=function(e){return e==="hex"?Pe.toHex32(this.h,"big"):Pe.split32(this.h,"big")}});var Wt=W((Dc,ei)=>{"use strict";var He=X0(),sd=Re(),Ee=Nt(),od=ue(),J0=He.sum32,hd=He.sum32_4,ud=He.sum32_5,ld=Ee.ch32,bd=Ee.maj32,vd=Ee.s0_256,xd=Ee.s1_256,pd=Ee.g0_256,md=Ee.g1_256,Qa=sd.BlockHash,gd=[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298];function Q0(){if(!(this instanceof Q0))return new Q0;Qa.call(this),this.h=[1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225],this.k=gd,this.W=new Array(64)}He.inherits(Q0,Qa);ei.exports=Q0;Q0.blockSize=512;Q0.outSize=256;Q0.hmacStrength=192;Q0.padLength=64;Q0.prototype._update=function(e,t){for(var n=this.W,a=0;a<16;a++)n[a]=e[t+a];for(;a<n.length;a++)n[a]=hd(md(n[a-2]),n[a-7],pd(n[a-15]),n[a-16]);var c=this.h[0],v=this.h[1],s=this.h[2],l=this.h[3],g=this.h[4],u=this.h[5],p=this.h[6],x=this.h[7];for(od(this.k.length===n.length),a=0;a<n.length;a++){var _=ud(x,xd(g),ld(g,u,p),this.k[a],n[a]),S=J0(vd(c),bd(c,v,s));x=p,p=u,u=g,g=J0(l,_),l=s,s=v,v=c,c=J0(_,S)}this.h[0]=J0(this.h[0],c),this.h[1]=J0(this.h[1],v),this.h[2]=J0(this.h[2],s),this.h[3]=J0(this.h[3],l),this.h[4]=J0(this.h[4],g),this.h[5]=J0(this.h[5],u),this.h[6]=J0(this.h[6],p),this.h[7]=J0(this.h[7],x)};Q0.prototype._digest=function(e){return e==="hex"?He.toHex32(this.h,"big"):He.split32(this.h,"big")}});var fi=W((Nc,ti)=>{"use strict";var Tt=X0(),ri=Wt();function ie(){if(!(this instanceof ie))return new ie;ri.call(this),this.h=[3238371032,914150663,812702999,4144912697,4290775857,1750603025,1694076839,3204075428]}Tt.inherits(ie,ri);ti.exports=ie;ie.blockSize=512;ie.outSize=224;ie.hmacStrength=192;ie.padLength=64;ie.prototype._digest=function(e){return e==="hex"?Tt.toHex32(this.h.slice(0,7),"big"):Tt.split32(this.h.slice(0,7),"big")}});var Ut=W((Lc,di)=>{"use strict";var L0=X0(),yd=Re(),_d=ue(),ee=L0.rotr64_hi,re=L0.rotr64_lo,ai=L0.shr64_hi,ii=L0.shr64_lo,ve=L0.sum64,Ot=L0.sum64_hi,Kt=L0.sum64_lo,wd=L0.sum64_4_hi,Md=L0.sum64_4_lo,Sd=L0.sum64_5_hi,Ad=L0.sum64_5_lo,ni=yd.BlockHash,Bd=[1116352408,3609767458,1899447441,602891725,3049323471,3964484399,3921009573,2173295548,961987163,4081628472,1508970993,3053834265,2453635748,2937671579,2870763221,3664609560,3624381080,2734883394,310598401,1164996542,607225278,1323610764,1426881987,3590304994,1925078388,4068182383,2162078206,991336113,2614888103,633803317,3248222580,3479774868,3835390401,2666613458,4022224774,944711139,264347078,2341262773,604807628,2007800933,770255983,1495990901,1249150122,1856431235,1555081692,3175218132,1996064986,2198950837,2554220882,3999719339,2821834349,766784016,2952996808,2566594879,3210313671,3203337956,3336571891,1034457026,3584528711,2466948901,113926993,3758326383,338241895,168717936,666307205,1188179964,773529912,1546045734,1294757372,1522805485,1396182291,2643833823,1695183700,2343527390,1986661051,1014477480,2177026350,1206759142,2456956037,344077627,2730485921,1290863460,2820302411,3158454273,3259730800,3505952657,3345764771,106217008,3516065817,3606008344,3600352804,1432725776,4094571909,1467031594,275423344,851169720,430227734,3100823752,506948616,1363258195,659060556,3750685593,883997877,3785050280,958139571,3318307427,1322822218,3812723403,1537002063,2003034995,1747873779,3602036899,1955562222,1575990012,2024104815,1125592928,2227730452,2716904306,2361852424,442776044,2428436474,593698344,2756734187,3733110249,3204031479,2999351573,3329325298,3815920427,3391569614,3928383900,3515267271,566280711,3940187606,3454069534,4118630271,4000239992,116418474,1914138554,174292421,2731055270,289380356,3203993006,460393269,320620315,685471733,587496836,852142971,1086792851,1017036298,365543100,1126000580,2618297676,1288033470,3409855158,1501505948,4234509866,1607167915,987167468,1816402316,1246189591];function Z0(){if(!(this instanceof Z0))return new Z0;ni.call(this),this.h=[1779033703,4089235720,3144134277,2227873595,1013904242,4271175723,2773480762,1595750129,1359893119,2917565137,2600822924,725511199,528734635,4215389547,1541459225,327033209],this.k=Bd,this.W=new Array(160)}L0.inherits(Z0,ni);di.exports=Z0;Z0.blockSize=1024;Z0.outSize=512;Z0.hmacStrength=192;Z0.padLength=128;Z0.prototype._prepareBlock=function(e,t){for(var n=this.W,a=0;a<32;a++)n[a]=e[t+a];for(;a<n.length;a+=2){var c=Dd(n[a-4],n[a-3]),v=Nd(n[a-4],n[a-3]),s=n[a-14],l=n[a-13],g=Ed(n[a-30],n[a-29]),u=Fd(n[a-30],n[a-29]),p=n[a-32],x=n[a-31];n[a]=wd(c,v,s,l,g,u,p,x),n[a+1]=Md(c,v,s,l,g,u,p,x)}};Z0.prototype._update=function(e,t){this._prepareBlock(e,t);var n=this.W,a=this.h[0],c=this.h[1],v=this.h[2],s=this.h[3],l=this.h[4],g=this.h[5],u=this.h[6],p=this.h[7],x=this.h[8],_=this.h[9],S=this.h[10],z=this.h[11],C=this.h[12],M=this.h[13],B=this.h[14],k=this.h[15];_d(this.k.length===n.length);for(var I=0;I<n.length;I+=2){var E=B,H=k,D=Pd(x,_),F=Hd(x,_),N=qd(x,_,S,z,C,M),w=zd(x,_,S,z,C,M),f=this.k[I],d=this.k[I+1],o=n[I],h=n[I+1],y=Sd(E,H,D,F,N,w,f,d,o,h),A=Ad(E,H,D,F,N,w,f,d,o,h);E=Id(a,c),H=Rd(a,c),D=Cd(a,c,v,s,l,g),F=kd(a,c,v,s,l,g);var q=Ot(E,H,D,F),m=Kt(E,H,D,F);B=C,k=M,C=S,M=z,S=x,z=_,x=Ot(u,p,y,A),_=Kt(p,p,y,A),u=l,p=g,l=v,g=s,v=a,s=c,a=Ot(y,A,q,m),c=Kt(y,A,q,m)}ve(this.h,0,a,c),ve(this.h,2,v,s),ve(this.h,4,l,g),ve(this.h,6,u,p),ve(this.h,8,x,_),ve(this.h,10,S,z),ve(this.h,12,C,M),ve(this.h,14,B,k)};Z0.prototype._digest=function(e){return e==="hex"?L0.toHex32(this.h,"big"):L0.split32(this.h,"big")};function qd(r,e,t,n,a){var c=r&t^~r&a;return c<0&&(c+=4294967296),c}function zd(r,e,t,n,a,c){var v=e&n^~e&c;return v<0&&(v+=4294967296),v}function Cd(r,e,t,n,a){var c=r&t^r&a^t&a;return c<0&&(c+=4294967296),c}function kd(r,e,t,n,a,c){var v=e&n^e&c^n&c;return v<0&&(v+=4294967296),v}function Id(r,e){var t=ee(r,e,28),n=ee(e,r,2),a=ee(e,r,7),c=t^n^a;return c<0&&(c+=4294967296),c}function Rd(r,e){var t=re(r,e,28),n=re(e,r,2),a=re(e,r,7),c=t^n^a;return c<0&&(c+=4294967296),c}function Pd(r,e){var t=ee(r,e,14),n=ee(r,e,18),a=ee(e,r,9),c=t^n^a;return c<0&&(c+=4294967296),c}function Hd(r,e){var t=re(r,e,14),n=re(r,e,18),a=re(e,r,9),c=t^n^a;return c<0&&(c+=4294967296),c}function Ed(r,e){var t=ee(r,e,1),n=ee(r,e,8),a=ai(r,e,7),c=t^n^a;return c<0&&(c+=4294967296),c}function Fd(r,e){var t=re(r,e,1),n=re(r,e,8),a=ii(r,e,7),c=t^n^a;return c<0&&(c+=4294967296),c}function Dd(r,e){var t=ee(r,e,19),n=ee(e,r,29),a=ai(r,e,6),c=t^n^a;return c<0&&(c+=4294967296),c}function Nd(r,e){var t=re(r,e,19),n=re(e,r,29),a=ii(r,e,6),c=t^n^a;return c<0&&(c+=4294967296),c}});var oi=W((Wc,si)=>{"use strict";var jt=X0(),ci=Ut();function ne(){if(!(this instanceof ne))return new ne;ci.call(this),this.h=[3418070365,3238371032,1654270250,914150663,2438529370,812702999,355462360,4144912697,1731405415,4290775857,2394180231,1750603025,3675008525,1694076839,1203062813,3204075428]}jt.inherits(ne,ci);si.exports=ne;ne.blockSize=1024;ne.outSize=384;ne.hmacStrength=192;ne.padLength=128;ne.prototype._digest=function(e){return e==="hex"?jt.toHex32(this.h.slice(0,12),"big"):jt.split32(this.h.slice(0,12),"big")}});var hi=W(Fe=>{"use strict";Fe.sha1=$a();Fe.sha224=fi();Fe.sha256=Wt();Fe.sha384=oi();Fe.sha512=Ut()});var pi=W(xi=>{"use strict";var Se=X0(),Ld=Re(),Zr=Se.rotl32,ui=Se.sum32,Ye=Se.sum32_3,li=Se.sum32_4,bi=Ld.BlockHash;function te(){if(!(this instanceof te))return new te;bi.call(this),this.h=[1732584193,4023233417,2562383102,271733878,3285377520],this.endian="little"}Se.inherits(te,bi);xi.ripemd160=te;te.blockSize=512;te.outSize=160;te.hmacStrength=192;te.padLength=64;te.prototype._update=function(e,t){for(var n=this.h[0],a=this.h[1],c=this.h[2],v=this.h[3],s=this.h[4],l=n,g=a,u=c,p=v,x=s,_=0;_<80;_++){var S=ui(Zr(li(n,vi(_,a,c,v),e[Od[_]+t],Wd(_)),Ud[_]),s);n=s,s=v,v=Zr(c,10),c=a,a=S,S=ui(Zr(li(l,vi(79-_,g,u,p),e[Kd[_]+t],Td(_)),jd[_]),x),l=x,x=p,p=Zr(u,10),u=g,g=S}S=Ye(this.h[1],c,p),this.h[1]=Ye(this.h[2],v,x),this.h[2]=Ye(this.h[3],s,l),this.h[3]=Ye(this.h[4],n,g),this.h[4]=Ye(this.h[0],a,u),this.h[0]=S};te.prototype._digest=function(e){return e==="hex"?Se.toHex32(this.h,"little"):Se.split32(this.h,"little")};function vi(r,e,t,n){return r<=15?e^t^n:r<=31?e&t|~e&n:r<=47?(e|~t)^n:r<=63?e&n|t&~n:e^(t|~n)}function Wd(r){return r<=15?0:r<=31?1518500249:r<=47?1859775393:r<=63?2400959708:2840853838}function Td(r){return r<=15?1352829926:r<=31?1548603684:r<=47?1836072691:r<=63?2053994217:0}var Od=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13],Kd=[5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11],Ud=[11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6],jd=[8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11]});var gi=W((Kc,mi)=>{"use strict";var Xd=X0(),Jd=ue();function De(r,e,t){if(!(this instanceof De))return new De(r,e,t);this.Hash=r,this.blockSize=r.blockSize/8,this.outSize=r.outSize/8,this.inner=null,this.outer=null,this._init(Xd.toArray(e,t))}mi.exports=De;De.prototype._init=function(e){e.length>this.blockSize&&(e=new this.Hash().update(e).digest()),Jd(e.length<=this.blockSize);for(var t=e.length;t<this.blockSize;t++)e.push(0);for(t=0;t<e.length;t++)e[t]^=54;for(this.inner=new this.Hash().update(e),t=0;t<e.length;t++)e[t]^=106;this.outer=new this.Hash().update(e)};De.prototype.update=function(e,t){return this.inner.update(e,t),this};De.prototype.digest=function(e){return this.outer.update(this.inner.digest()),this.outer.digest(e)}});var Yr=W(yi=>{var E0=yi;E0.utils=X0();E0.common=Re();E0.sha=hi();E0.ripemd=pi();E0.hmac=gi();E0.sha1=E0.sha.sha1;E0.sha256=E0.sha.sha256;E0.sha224=E0.sha.sha224;E0.sha384=E0.sha.sha384;E0.sha512=E0.sha.sha512;E0.ripemd160=E0.ripemd.ripemd160});var wi=W((jc,_i)=>{_i.exports={doubles:{step:4,points:[["e60fce93b59e9ec53011aabc21c23e97b2a31369b87a5ae9c44ee89e2a6dec0a","f7e3507399e595929db99f34f57937101296891e44d23f0be1f32cce69616821"],["8282263212c609d9ea2a6e3e172de238d8c39cabd5ac1ca10646e23fd5f51508","11f8a8098557dfe45e8256e830b60ace62d613ac2f7b17bed31b6eaff6e26caf"],["175e159f728b865a72f99cc6c6fc846de0b93833fd2222ed73fce5b551e5b739","d3506e0d9e3c79eba4ef97a51ff71f5eacb5955add24345c6efa6ffee9fed695"],["363d90d447b00c9c99ceac05b6262ee053441c7e55552ffe526bad8f83ff4640","4e273adfc732221953b445397f3363145b9a89008199ecb62003c7f3bee9de9"],["8b4b5f165df3c2be8c6244b5b745638843e4a781a15bcd1b69f79a55dffdf80c","4aad0a6f68d308b4b3fbd7813ab0da04f9e336546162ee56b3eff0c65fd4fd36"],["723cbaa6e5db996d6bf771c00bd548c7b700dbffa6c0e77bcb6115925232fcda","96e867b5595cc498a921137488824d6e2660a0653779494801dc069d9eb39f5f"],["eebfa4d493bebf98ba5feec812c2d3b50947961237a919839a533eca0e7dd7fa","5d9a8ca3970ef0f269ee7edaf178089d9ae4cdc3a711f712ddfd4fdae1de8999"],["100f44da696e71672791d0a09b7bde459f1215a29b3c03bfefd7835b39a48db0","cdd9e13192a00b772ec8f3300c090666b7ff4a18ff5195ac0fbd5cd62bc65a09"],["e1031be262c7ed1b1dc9227a4a04c017a77f8d4464f3b3852c8acde6e534fd2d","9d7061928940405e6bb6a4176597535af292dd419e1ced79a44f18f29456a00d"],["feea6cae46d55b530ac2839f143bd7ec5cf8b266a41d6af52d5e688d9094696d","e57c6b6c97dce1bab06e4e12bf3ecd5c981c8957cc41442d3155debf18090088"],["da67a91d91049cdcb367be4be6ffca3cfeed657d808583de33fa978bc1ec6cb1","9bacaa35481642bc41f463f7ec9780e5dec7adc508f740a17e9ea8e27a68be1d"],["53904faa0b334cdda6e000935ef22151ec08d0f7bb11069f57545ccc1a37b7c0","5bc087d0bc80106d88c9eccac20d3c1c13999981e14434699dcb096b022771c8"],["8e7bcd0bd35983a7719cca7764ca906779b53a043a9b8bcaeff959f43ad86047","10b7770b2a3da4b3940310420ca9514579e88e2e47fd68b3ea10047e8460372a"],["385eed34c1cdff21e6d0818689b81bde71a7f4f18397e6690a841e1599c43862","283bebc3e8ea23f56701de19e9ebf4576b304eec2086dc8cc0458fe5542e5453"],["6f9d9b803ecf191637c73a4413dfa180fddf84a5947fbc9c606ed86c3fac3a7","7c80c68e603059ba69b8e2a30e45c4d47ea4dd2f5c281002d86890603a842160"],["3322d401243c4e2582a2147c104d6ecbf774d163db0f5e5313b7e0e742d0e6bd","56e70797e9664ef5bfb019bc4ddaf9b72805f63ea2873af624f3a2e96c28b2a0"],["85672c7d2de0b7da2bd1770d89665868741b3f9af7643397721d74d28134ab83","7c481b9b5b43b2eb6374049bfa62c2e5e77f17fcc5298f44c8e3094f790313a6"],["948bf809b1988a46b06c9f1919413b10f9226c60f668832ffd959af60c82a0a","53a562856dcb6646dc6b74c5d1c3418c6d4dff08c97cd2bed4cb7f88d8c8e589"],["6260ce7f461801c34f067ce0f02873a8f1b0e44dfc69752accecd819f38fd8e8","bc2da82b6fa5b571a7f09049776a1ef7ecd292238051c198c1a84e95b2b4ae17"],["e5037de0afc1d8d43d8348414bbf4103043ec8f575bfdc432953cc8d2037fa2d","4571534baa94d3b5f9f98d09fb990bddbd5f5b03ec481f10e0e5dc841d755bda"],["e06372b0f4a207adf5ea905e8f1771b4e7e8dbd1c6a6c5b725866a0ae4fce725","7a908974bce18cfe12a27bb2ad5a488cd7484a7787104870b27034f94eee31dd"],["213c7a715cd5d45358d0bbf9dc0ce02204b10bdde2a3f58540ad6908d0559754","4b6dad0b5ae462507013ad06245ba190bb4850f5f36a7eeddff2c27534b458f2"],["4e7c272a7af4b34e8dbb9352a5419a87e2838c70adc62cddf0cc3a3b08fbd53c","17749c766c9d0b18e16fd09f6def681b530b9614bff7dd33e0b3941817dcaae6"],["fea74e3dbe778b1b10f238ad61686aa5c76e3db2be43057632427e2840fb27b6","6e0568db9b0b13297cf674deccb6af93126b596b973f7b77701d3db7f23cb96f"],["76e64113f677cf0e10a2570d599968d31544e179b760432952c02a4417bdde39","c90ddf8dee4e95cf577066d70681f0d35e2a33d2b56d2032b4b1752d1901ac01"],["c738c56b03b2abe1e8281baa743f8f9a8f7cc643df26cbee3ab150242bcbb891","893fb578951ad2537f718f2eacbfbbbb82314eef7880cfe917e735d9699a84c3"],["d895626548b65b81e264c7637c972877d1d72e5f3a925014372e9f6588f6c14b","febfaa38f2bc7eae728ec60818c340eb03428d632bb067e179363ed75d7d991f"],["b8da94032a957518eb0f6433571e8761ceffc73693e84edd49150a564f676e03","2804dfa44805a1e4d7c99cc9762808b092cc584d95ff3b511488e4e74efdf6e7"],["e80fea14441fb33a7d8adab9475d7fab2019effb5156a792f1a11778e3c0df5d","eed1de7f638e00771e89768ca3ca94472d155e80af322ea9fcb4291b6ac9ec78"],["a301697bdfcd704313ba48e51d567543f2a182031efd6915ddc07bbcc4e16070","7370f91cfb67e4f5081809fa25d40f9b1735dbf7c0a11a130c0d1a041e177ea1"],["90ad85b389d6b936463f9d0512678de208cc330b11307fffab7ac63e3fb04ed4","e507a3620a38261affdcbd9427222b839aefabe1582894d991d4d48cb6ef150"],["8f68b9d2f63b5f339239c1ad981f162ee88c5678723ea3351b7b444c9ec4c0da","662a9f2dba063986de1d90c2b6be215dbbea2cfe95510bfdf23cbf79501fff82"],["e4f3fb0176af85d65ff99ff9198c36091f48e86503681e3e6686fd5053231e11","1e63633ad0ef4f1c1661a6d0ea02b7286cc7e74ec951d1c9822c38576feb73bc"],["8c00fa9b18ebf331eb961537a45a4266c7034f2f0d4e1d0716fb6eae20eae29e","efa47267fea521a1a9dc343a3736c974c2fadafa81e36c54e7d2a4c66702414b"],["e7a26ce69dd4829f3e10cec0a9e98ed3143d084f308b92c0997fddfc60cb3e41","2a758e300fa7984b471b006a1aafbb18d0a6b2c0420e83e20e8a9421cf2cfd51"],["b6459e0ee3662ec8d23540c223bcbdc571cbcb967d79424f3cf29eb3de6b80ef","67c876d06f3e06de1dadf16e5661db3c4b3ae6d48e35b2ff30bf0b61a71ba45"],["d68a80c8280bb840793234aa118f06231d6f1fc67e73c5a5deda0f5b496943e8","db8ba9fff4b586d00c4b1f9177b0e28b5b0e7b8f7845295a294c84266b133120"],["324aed7df65c804252dc0270907a30b09612aeb973449cea4095980fc28d3d5d","648a365774b61f2ff130c0c35aec1f4f19213b0c7e332843967224af96ab7c84"],["4df9c14919cde61f6d51dfdbe5fee5dceec4143ba8d1ca888e8bd373fd054c96","35ec51092d8728050974c23a1d85d4b5d506cdc288490192ebac06cad10d5d"],["9c3919a84a474870faed8a9c1cc66021523489054d7f0308cbfc99c8ac1f98cd","ddb84f0f4a4ddd57584f044bf260e641905326f76c64c8e6be7e5e03d4fc599d"],["6057170b1dd12fdf8de05f281d8e06bb91e1493a8b91d4cc5a21382120a959e5","9a1af0b26a6a4807add9a2daf71df262465152bc3ee24c65e899be932385a2a8"],["a576df8e23a08411421439a4518da31880cef0fba7d4df12b1a6973eecb94266","40a6bf20e76640b2c92b97afe58cd82c432e10a7f514d9f3ee8be11ae1b28ec8"],["7778a78c28dec3e30a05fe9629de8c38bb30d1f5cf9a3a208f763889be58ad71","34626d9ab5a5b22ff7098e12f2ff580087b38411ff24ac563b513fc1fd9f43ac"],["928955ee637a84463729fd30e7afd2ed5f96274e5ad7e5cb09eda9c06d903ac","c25621003d3f42a827b78a13093a95eeac3d26efa8a8d83fc5180e935bcd091f"],["85d0fef3ec6db109399064f3a0e3b2855645b4a907ad354527aae75163d82751","1f03648413a38c0be29d496e582cf5663e8751e96877331582c237a24eb1f962"],["ff2b0dce97eece97c1c9b6041798b85dfdfb6d8882da20308f5404824526087e","493d13fef524ba188af4c4dc54d07936c7b7ed6fb90e2ceb2c951e01f0c29907"],["827fbbe4b1e880ea9ed2b2e6301b212b57f1ee148cd6dd28780e5e2cf856e241","c60f9c923c727b0b71bef2c67d1d12687ff7a63186903166d605b68baec293ec"],["eaa649f21f51bdbae7be4ae34ce6e5217a58fdce7f47f9aa7f3b58fa2120e2b3","be3279ed5bbbb03ac69a80f89879aa5a01a6b965f13f7e59d47a5305ba5ad93d"],["e4a42d43c5cf169d9391df6decf42ee541b6d8f0c9a137401e23632dda34d24f","4d9f92e716d1c73526fc99ccfb8ad34ce886eedfa8d8e4f13a7f7131deba9414"],["1ec80fef360cbdd954160fadab352b6b92b53576a88fea4947173b9d4300bf19","aeefe93756b5340d2f3a4958a7abbf5e0146e77f6295a07b671cdc1cc107cefd"],["146a778c04670c2f91b00af4680dfa8bce3490717d58ba889ddb5928366642be","b318e0ec3354028add669827f9d4b2870aaa971d2f7e5ed1d0b297483d83efd0"],["fa50c0f61d22e5f07e3acebb1aa07b128d0012209a28b9776d76a8793180eef9","6b84c6922397eba9b72cd2872281a68a5e683293a57a213b38cd8d7d3f4f2811"],["da1d61d0ca721a11b1a5bf6b7d88e8421a288ab5d5bba5220e53d32b5f067ec2","8157f55a7c99306c79c0766161c91e2966a73899d279b48a655fba0f1ad836f1"],["a8e282ff0c9706907215ff98e8fd416615311de0446f1e062a73b0610d064e13","7f97355b8db81c09abfb7f3c5b2515888b679a3e50dd6bd6cef7c73111f4cc0c"],["174a53b9c9a285872d39e56e6913cab15d59b1fa512508c022f382de8319497c","ccc9dc37abfc9c1657b4155f2c47f9e6646b3a1d8cb9854383da13ac079afa73"],["959396981943785c3d3e57edf5018cdbe039e730e4918b3d884fdff09475b7ba","2e7e552888c331dd8ba0386a4b9cd6849c653f64c8709385e9b8abf87524f2fd"],["d2a63a50ae401e56d645a1153b109a8fcca0a43d561fba2dbb51340c9d82b151","e82d86fb6443fcb7565aee58b2948220a70f750af484ca52d4142174dcf89405"],["64587e2335471eb890ee7896d7cfdc866bacbdbd3839317b3436f9b45617e073","d99fcdd5bf6902e2ae96dd6447c299a185b90a39133aeab358299e5e9faf6589"],["8481bde0e4e4d885b3a546d3e549de042f0aa6cea250e7fd358d6c86dd45e458","38ee7b8cba5404dd84a25bf39cecb2ca900a79c42b262e556d64b1b59779057e"],["13464a57a78102aa62b6979ae817f4637ffcfed3c4b1ce30bcd6303f6caf666b","69be159004614580ef7e433453ccb0ca48f300a81d0942e13f495a907f6ecc27"],["bc4a9df5b713fe2e9aef430bcc1dc97a0cd9ccede2f28588cada3a0d2d83f366","d3a81ca6e785c06383937adf4b798caa6e8a9fbfa547b16d758d666581f33c1"],["8c28a97bf8298bc0d23d8c749452a32e694b65e30a9472a3954ab30fe5324caa","40a30463a3305193378fedf31f7cc0eb7ae784f0451cb9459e71dc73cbef9482"],["8ea9666139527a8c1dd94ce4f071fd23c8b350c5a4bb33748c4ba111faccae0","620efabbc8ee2782e24e7c0cfb95c5d735b783be9cf0f8e955af34a30e62b945"],["dd3625faef5ba06074669716bbd3788d89bdde815959968092f76cc4eb9a9787","7a188fa3520e30d461da2501045731ca941461982883395937f68d00c644a573"],["f710d79d9eb962297e4f6232b40e8f7feb2bc63814614d692c12de752408221e","ea98e67232d3b3295d3b535532115ccac8612c721851617526ae47a9c77bfc82"]]},naf:{wnd:7,points:[["f9308a019258c31049344f85f89d5229b531c845836f99b08601f113bce036f9","388f7b0f632de8140fe337e62a37f3566500a99934c2231b6cb9fd7584b8e672"],["2f8bde4d1a07209355b4a7250a5c5128e88b84bddc619ab7cba8d569b240efe4","d8ac222636e5e3d6d4dba9dda6c9c426f788271bab0d6840dca87d3aa6ac62d6"],["5cbdf0646e5db4eaa398f365f2ea7a0e3d419b7e0330e39ce92bddedcac4f9bc","6aebca40ba255960a3178d6d861a54dba813d0b813fde7b5a5082628087264da"],["acd484e2f0c7f65309ad178a9f559abde09796974c57e714c35f110dfc27ccbe","cc338921b0a7d9fd64380971763b61e9add888a4375f8e0f05cc262ac64f9c37"],["774ae7f858a9411e5ef4246b70c65aac5649980be5c17891bbec17895da008cb","d984a032eb6b5e190243dd56d7b7b365372db1e2dff9d6a8301d74c9c953c61b"],["f28773c2d975288bc7d1d205c3748651b075fbc6610e58cddeeddf8f19405aa8","ab0902e8d880a89758212eb65cdaf473a1a06da521fa91f29b5cb52db03ed81"],["d7924d4f7d43ea965a465ae3095ff41131e5946f3c85f79e44adbcf8e27e080e","581e2872a86c72a683842ec228cc6defea40af2bd896d3a5c504dc9ff6a26b58"],["defdea4cdb677750a420fee807eacf21eb9898ae79b9768766e4faa04a2d4a34","4211ab0694635168e997b0ead2a93daeced1f4a04a95c0f6cfb199f69e56eb77"],["2b4ea0a797a443d293ef5cff444f4979f06acfebd7e86d277475656138385b6c","85e89bc037945d93b343083b5a1c86131a01f60c50269763b570c854e5c09b7a"],["352bbf4a4cdd12564f93fa332ce333301d9ad40271f8107181340aef25be59d5","321eb4075348f534d59c18259dda3e1f4a1b3b2e71b1039c67bd3d8bcf81998c"],["2fa2104d6b38d11b0230010559879124e42ab8dfeff5ff29dc9cdadd4ecacc3f","2de1068295dd865b64569335bd5dd80181d70ecfc882648423ba76b532b7d67"],["9248279b09b4d68dab21a9b066edda83263c3d84e09572e269ca0cd7f5453714","73016f7bf234aade5d1aa71bdea2b1ff3fc0de2a887912ffe54a32ce97cb3402"],["daed4f2be3a8bf278e70132fb0beb7522f570e144bf615c07e996d443dee8729","a69dce4a7d6c98e8d4a1aca87ef8d7003f83c230f3afa726ab40e52290be1c55"],["c44d12c7065d812e8acf28d7cbb19f9011ecd9e9fdf281b0e6a3b5e87d22e7db","2119a460ce326cdc76c45926c982fdac0e106e861edf61c5a039063f0e0e6482"],["6a245bf6dc698504c89a20cfded60853152b695336c28063b61c65cbd269e6b4","e022cf42c2bd4a708b3f5126f16a24ad8b33ba48d0423b6efd5e6348100d8a82"],["1697ffa6fd9de627c077e3d2fe541084ce13300b0bec1146f95ae57f0d0bd6a5","b9c398f186806f5d27561506e4557433a2cf15009e498ae7adee9d63d01b2396"],["605bdb019981718b986d0f07e834cb0d9deb8360ffb7f61df982345ef27a7479","2972d2de4f8d20681a78d93ec96fe23c26bfae84fb14db43b01e1e9056b8c49"],["62d14dab4150bf497402fdc45a215e10dcb01c354959b10cfe31c7e9d87ff33d","80fc06bd8cc5b01098088a1950eed0db01aa132967ab472235f5642483b25eaf"],["80c60ad0040f27dade5b4b06c408e56b2c50e9f56b9b8b425e555c2f86308b6f","1c38303f1cc5c30f26e66bad7fe72f70a65eed4cbe7024eb1aa01f56430bd57a"],["7a9375ad6167ad54aa74c6348cc54d344cc5dc9487d847049d5eabb0fa03c8fb","d0e3fa9eca8726909559e0d79269046bdc59ea10c70ce2b02d499ec224dc7f7"],["d528ecd9b696b54c907a9ed045447a79bb408ec39b68df504bb51f459bc3ffc9","eecf41253136e5f99966f21881fd656ebc4345405c520dbc063465b521409933"],["49370a4b5f43412ea25f514e8ecdad05266115e4a7ecb1387231808f8b45963","758f3f41afd6ed428b3081b0512fd62a54c3f3afbb5b6764b653052a12949c9a"],["77f230936ee88cbbd73df930d64702ef881d811e0e1498e2f1c13eb1fc345d74","958ef42a7886b6400a08266e9ba1b37896c95330d97077cbbe8eb3c7671c60d6"],["f2dac991cc4ce4b9ea44887e5c7c0bce58c80074ab9d4dbaeb28531b7739f530","e0dedc9b3b2f8dad4da1f32dec2531df9eb5fbeb0598e4fd1a117dba703a3c37"],["463b3d9f662621fb1b4be8fbbe2520125a216cdfc9dae3debcba4850c690d45b","5ed430d78c296c3543114306dd8622d7c622e27c970a1de31cb377b01af7307e"],["f16f804244e46e2a09232d4aff3b59976b98fac14328a2d1a32496b49998f247","cedabd9b82203f7e13d206fcdf4e33d92a6c53c26e5cce26d6579962c4e31df6"],["caf754272dc84563b0352b7a14311af55d245315ace27c65369e15f7151d41d1","cb474660ef35f5f2a41b643fa5e460575f4fa9b7962232a5c32f908318a04476"],["2600ca4b282cb986f85d0f1709979d8b44a09c07cb86d7c124497bc86f082120","4119b88753c15bd6a693b03fcddbb45d5ac6be74ab5f0ef44b0be9475a7e4b40"],["7635ca72d7e8432c338ec53cd12220bc01c48685e24f7dc8c602a7746998e435","91b649609489d613d1d5e590f78e6d74ecfc061d57048bad9e76f302c5b9c61"],["754e3239f325570cdbbf4a87deee8a66b7f2b33479d468fbc1a50743bf56cc18","673fb86e5bda30fb3cd0ed304ea49a023ee33d0197a695d0c5d98093c536683"],["e3e6bd1071a1e96aff57859c82d570f0330800661d1c952f9fe2694691d9b9e8","59c9e0bba394e76f40c0aa58379a3cb6a5a2283993e90c4167002af4920e37f5"],["186b483d056a033826ae73d88f732985c4ccb1f32ba35f4b4cc47fdcf04aa6eb","3b952d32c67cf77e2e17446e204180ab21fb8090895138b4a4a797f86e80888b"],["df9d70a6b9876ce544c98561f4be4f725442e6d2b737d9c91a8321724ce0963f","55eb2dafd84d6ccd5f862b785dc39d4ab157222720ef9da217b8c45cf2ba2417"],["5edd5cc23c51e87a497ca815d5dce0f8ab52554f849ed8995de64c5f34ce7143","efae9c8dbc14130661e8cec030c89ad0c13c66c0d17a2905cdc706ab7399a868"],["290798c2b6476830da12fe02287e9e777aa3fba1c355b17a722d362f84614fba","e38da76dcd440621988d00bcf79af25d5b29c094db2a23146d003afd41943e7a"],["af3c423a95d9f5b3054754efa150ac39cd29552fe360257362dfdecef4053b45","f98a3fd831eb2b749a93b0e6f35cfb40c8cd5aa667a15581bc2feded498fd9c6"],["766dbb24d134e745cccaa28c99bf274906bb66b26dcf98df8d2fed50d884249a","744b1152eacbe5e38dcc887980da38b897584a65fa06cedd2c924f97cbac5996"],["59dbf46f8c94759ba21277c33784f41645f7b44f6c596a58ce92e666191abe3e","c534ad44175fbc300f4ea6ce648309a042ce739a7919798cd85e216c4a307f6e"],["f13ada95103c4537305e691e74e9a4a8dd647e711a95e73cb62dc6018cfd87b8","e13817b44ee14de663bf4bc808341f326949e21a6a75c2570778419bdaf5733d"],["7754b4fa0e8aced06d4167a2c59cca4cda1869c06ebadfb6488550015a88522c","30e93e864e669d82224b967c3020b8fa8d1e4e350b6cbcc537a48b57841163a2"],["948dcadf5990e048aa3874d46abef9d701858f95de8041d2a6828c99e2262519","e491a42537f6e597d5d28a3224b1bc25df9154efbd2ef1d2cbba2cae5347d57e"],["7962414450c76c1689c7b48f8202ec37fb224cf5ac0bfa1570328a8a3d7c77ab","100b610ec4ffb4760d5c1fc133ef6f6b12507a051f04ac5760afa5b29db83437"],["3514087834964b54b15b160644d915485a16977225b8847bb0dd085137ec47ca","ef0afbb2056205448e1652c48e8127fc6039e77c15c2378b7e7d15a0de293311"],["d3cc30ad6b483e4bc79ce2c9dd8bc54993e947eb8df787b442943d3f7b527eaf","8b378a22d827278d89c5e9be8f9508ae3c2ad46290358630afb34db04eede0a4"],["1624d84780732860ce1c78fcbfefe08b2b29823db913f6493975ba0ff4847610","68651cf9b6da903e0914448c6cd9d4ca896878f5282be4c8cc06e2a404078575"],["733ce80da955a8a26902c95633e62a985192474b5af207da6df7b4fd5fc61cd4","f5435a2bd2badf7d485a4d8b8db9fcce3e1ef8e0201e4578c54673bc1dc5ea1d"],["15d9441254945064cf1a1c33bbd3b49f8966c5092171e699ef258dfab81c045c","d56eb30b69463e7234f5137b73b84177434800bacebfc685fc37bbe9efe4070d"],["a1d0fcf2ec9de675b612136e5ce70d271c21417c9d2b8aaaac138599d0717940","edd77f50bcb5a3cab2e90737309667f2641462a54070f3d519212d39c197a629"],["e22fbe15c0af8ccc5780c0735f84dbe9a790badee8245c06c7ca37331cb36980","a855babad5cd60c88b430a69f53a1a7a38289154964799be43d06d77d31da06"],["311091dd9860e8e20ee13473c1155f5f69635e394704eaa74009452246cfa9b3","66db656f87d1f04fffd1f04788c06830871ec5a64feee685bd80f0b1286d8374"],["34c1fd04d301be89b31c0442d3e6ac24883928b45a9340781867d4232ec2dbdf","9414685e97b1b5954bd46f730174136d57f1ceeb487443dc5321857ba73abee"],["f219ea5d6b54701c1c14de5b557eb42a8d13f3abbcd08affcc2a5e6b049b8d63","4cb95957e83d40b0f73af4544cccf6b1f4b08d3c07b27fb8d8c2962a400766d1"],["d7b8740f74a8fbaab1f683db8f45de26543a5490bca627087236912469a0b448","fa77968128d9c92ee1010f337ad4717eff15db5ed3c049b3411e0315eaa4593b"],["32d31c222f8f6f0ef86f7c98d3a3335ead5bcd32abdd94289fe4d3091aa824bf","5f3032f5892156e39ccd3d7915b9e1da2e6dac9e6f26e961118d14b8462e1661"],["7461f371914ab32671045a155d9831ea8793d77cd59592c4340f86cbc18347b5","8ec0ba238b96bec0cbdddcae0aa442542eee1ff50c986ea6b39847b3cc092ff6"],["ee079adb1df1860074356a25aa38206a6d716b2c3e67453d287698bad7b2b2d6","8dc2412aafe3be5c4c5f37e0ecc5f9f6a446989af04c4e25ebaac479ec1c8c1e"],["16ec93e447ec83f0467b18302ee620f7e65de331874c9dc72bfd8616ba9da6b5","5e4631150e62fb40d0e8c2a7ca5804a39d58186a50e497139626778e25b0674d"],["eaa5f980c245f6f038978290afa70b6bd8855897f98b6aa485b96065d537bd99","f65f5d3e292c2e0819a528391c994624d784869d7e6ea67fb18041024edc07dc"],["78c9407544ac132692ee1910a02439958ae04877151342ea96c4b6b35a49f51","f3e0319169eb9b85d5404795539a5e68fa1fbd583c064d2462b675f194a3ddb4"],["494f4be219a1a77016dcd838431aea0001cdc8ae7a6fc688726578d9702857a5","42242a969283a5f339ba7f075e36ba2af925ce30d767ed6e55f4b031880d562c"],["a598a8030da6d86c6bc7f2f5144ea549d28211ea58faa70ebf4c1e665c1fe9b5","204b5d6f84822c307e4b4a7140737aec23fc63b65b35f86a10026dbd2d864e6b"],["c41916365abb2b5d09192f5f2dbeafec208f020f12570a184dbadc3e58595997","4f14351d0087efa49d245b328984989d5caf9450f34bfc0ed16e96b58fa9913"],["841d6063a586fa475a724604da03bc5b92a2e0d2e0a36acfe4c73a5514742881","73867f59c0659e81904f9a1c7543698e62562d6744c169ce7a36de01a8d6154"],["5e95bb399a6971d376026947f89bde2f282b33810928be4ded112ac4d70e20d5","39f23f366809085beebfc71181313775a99c9aed7d8ba38b161384c746012865"],["36e4641a53948fd476c39f8a99fd974e5ec07564b5315d8bf99471bca0ef2f66","d2424b1b1abe4eb8164227b085c9aa9456ea13493fd563e06fd51cf5694c78fc"],["336581ea7bfbbb290c191a2f507a41cf5643842170e914faeab27c2c579f726","ead12168595fe1be99252129b6e56b3391f7ab1410cd1e0ef3dcdcabd2fda224"],["8ab89816dadfd6b6a1f2634fcf00ec8403781025ed6890c4849742706bd43ede","6fdcef09f2f6d0a044e654aef624136f503d459c3e89845858a47a9129cdd24e"],["1e33f1a746c9c5778133344d9299fcaa20b0938e8acff2544bb40284b8c5fb94","60660257dd11b3aa9c8ed618d24edff2306d320f1d03010e33a7d2057f3b3b6"],["85b7c1dcb3cec1b7ee7f30ded79dd20a0ed1f4cc18cbcfcfa410361fd8f08f31","3d98a9cdd026dd43f39048f25a8847f4fcafad1895d7a633c6fed3c35e999511"],["29df9fbd8d9e46509275f4b125d6d45d7fbe9a3b878a7af872a2800661ac5f51","b4c4fe99c775a606e2d8862179139ffda61dc861c019e55cd2876eb2a27d84b"],["a0b1cae06b0a847a3fea6e671aaf8adfdfe58ca2f768105c8082b2e449fce252","ae434102edde0958ec4b19d917a6a28e6b72da1834aff0e650f049503a296cf2"],["4e8ceafb9b3e9a136dc7ff67e840295b499dfb3b2133e4ba113f2e4c0e121e5","cf2174118c8b6d7a4b48f6d534ce5c79422c086a63460502b827ce62a326683c"],["d24a44e047e19b6f5afb81c7ca2f69080a5076689a010919f42725c2b789a33b","6fb8d5591b466f8fc63db50f1c0f1c69013f996887b8244d2cdec417afea8fa3"],["ea01606a7a6c9cdd249fdfcfacb99584001edd28abbab77b5104e98e8e3b35d4","322af4908c7312b0cfbfe369f7a7b3cdb7d4494bc2823700cfd652188a3ea98d"],["af8addbf2b661c8a6c6328655eb96651252007d8c5ea31be4ad196de8ce2131f","6749e67c029b85f52a034eafd096836b2520818680e26ac8f3dfbcdb71749700"],["e3ae1974566ca06cc516d47e0fb165a674a3dabcfca15e722f0e3450f45889","2aeabe7e4531510116217f07bf4d07300de97e4874f81f533420a72eeb0bd6a4"],["591ee355313d99721cf6993ffed1e3e301993ff3ed258802075ea8ced397e246","b0ea558a113c30bea60fc4775460c7901ff0b053d25ca2bdeee98f1a4be5d196"],["11396d55fda54c49f19aa97318d8da61fa8584e47b084945077cf03255b52984","998c74a8cd45ac01289d5833a7beb4744ff536b01b257be4c5767bea93ea57a4"],["3c5d2a1ba39c5a1790000738c9e0c40b8dcdfd5468754b6405540157e017aa7a","b2284279995a34e2f9d4de7396fc18b80f9b8b9fdd270f6661f79ca4c81bd257"],["cc8704b8a60a0defa3a99a7299f2e9c3fbc395afb04ac078425ef8a1793cc030","bdd46039feed17881d1e0862db347f8cf395b74fc4bcdc4e940b74e3ac1f1b13"],["c533e4f7ea8555aacd9777ac5cad29b97dd4defccc53ee7ea204119b2889b197","6f0a256bc5efdf429a2fb6242f1a43a2d9b925bb4a4b3a26bb8e0f45eb596096"],["c14f8f2ccb27d6f109f6d08d03cc96a69ba8c34eec07bbcf566d48e33da6593","c359d6923bb398f7fd4473e16fe1c28475b740dd098075e6c0e8649113dc3a38"],["a6cbc3046bc6a450bac24789fa17115a4c9739ed75f8f21ce441f72e0b90e6ef","21ae7f4680e889bb130619e2c0f95a360ceb573c70603139862afd617fa9b9f"],["347d6d9a02c48927ebfb86c1359b1caf130a3c0267d11ce6344b39f99d43cc38","60ea7f61a353524d1c987f6ecec92f086d565ab687870cb12689ff1e31c74448"],["da6545d2181db8d983f7dcb375ef5866d47c67b1bf31c8cf855ef7437b72656a","49b96715ab6878a79e78f07ce5680c5d6673051b4935bd897fea824b77dc208a"],["c40747cc9d012cb1a13b8148309c6de7ec25d6945d657146b9d5994b8feb1111","5ca560753be2a12fc6de6caf2cb489565db936156b9514e1bb5e83037e0fa2d4"],["4e42c8ec82c99798ccf3a610be870e78338c7f713348bd34c8203ef4037f3502","7571d74ee5e0fb92a7a8b33a07783341a5492144cc54bcc40a94473693606437"],["3775ab7089bc6af823aba2e1af70b236d251cadb0c86743287522a1b3b0dedea","be52d107bcfa09d8bcb9736a828cfa7fac8db17bf7a76a2c42ad961409018cf7"],["cee31cbf7e34ec379d94fb814d3d775ad954595d1314ba8846959e3e82f74e26","8fd64a14c06b589c26b947ae2bcf6bfa0149ef0be14ed4d80f448a01c43b1c6d"],["b4f9eaea09b6917619f6ea6a4eb5464efddb58fd45b1ebefcdc1a01d08b47986","39e5c9925b5a54b07433a4f18c61726f8bb131c012ca542eb24a8ac07200682a"],["d4263dfc3d2df923a0179a48966d30ce84e2515afc3dccc1b77907792ebcc60e","62dfaf07a0f78feb30e30d6295853ce189e127760ad6cf7fae164e122a208d54"],["48457524820fa65a4f8d35eb6930857c0032acc0a4a2de422233eeda897612c4","25a748ab367979d98733c38a1fa1c2e7dc6cc07db2d60a9ae7a76aaa49bd0f77"],["dfeeef1881101f2cb11644f3a2afdfc2045e19919152923f367a1767c11cceda","ecfb7056cf1de042f9420bab396793c0c390bde74b4bbdff16a83ae09a9a7517"],["6d7ef6b17543f8373c573f44e1f389835d89bcbc6062ced36c82df83b8fae859","cd450ec335438986dfefa10c57fea9bcc521a0959b2d80bbf74b190dca712d10"],["e75605d59102a5a2684500d3b991f2e3f3c88b93225547035af25af66e04541f","f5c54754a8f71ee540b9b48728473e314f729ac5308b06938360990e2bfad125"],["eb98660f4c4dfaa06a2be453d5020bc99a0c2e60abe388457dd43fefb1ed620c","6cb9a8876d9cb8520609af3add26cd20a0a7cd8a9411131ce85f44100099223e"],["13e87b027d8514d35939f2e6892b19922154596941888336dc3563e3b8dba942","fef5a3c68059a6dec5d624114bf1e91aac2b9da568d6abeb2570d55646b8adf1"],["ee163026e9fd6fe017c38f06a5be6fc125424b371ce2708e7bf4491691e5764a","1acb250f255dd61c43d94ccc670d0f58f49ae3fa15b96623e5430da0ad6c62b2"],["b268f5ef9ad51e4d78de3a750c2dc89b1e626d43505867999932e5db33af3d80","5f310d4b3c99b9ebb19f77d41c1dee018cf0d34fd4191614003e945a1216e423"],["ff07f3118a9df035e9fad85eb6c7bfe42b02f01ca99ceea3bf7ffdba93c4750d","438136d603e858a3a5c440c38eccbaddc1d2942114e2eddd4740d098ced1f0d8"],["8d8b9855c7c052a34146fd20ffb658bea4b9f69e0d825ebec16e8c3ce2b526a1","cdb559eedc2d79f926baf44fb84ea4d44bcf50fee51d7ceb30e2e7f463036758"],["52db0b5384dfbf05bfa9d472d7ae26dfe4b851ceca91b1eba54263180da32b63","c3b997d050ee5d423ebaf66a6db9f57b3180c902875679de924b69d84a7b375"],["e62f9490d3d51da6395efd24e80919cc7d0f29c3f3fa48c6fff543becbd43352","6d89ad7ba4876b0b22c2ca280c682862f342c8591f1daf5170e07bfd9ccafa7d"],["7f30ea2476b399b4957509c88f77d0191afa2ff5cb7b14fd6d8e7d65aaab1193","ca5ef7d4b231c94c3b15389a5f6311e9daff7bb67b103e9880ef4bff637acaec"],["5098ff1e1d9f14fb46a210fada6c903fef0fb7b4a1dd1d9ac60a0361800b7a00","9731141d81fc8f8084d37c6e7542006b3ee1b40d60dfe5362a5b132fd17ddc0"],["32b78c7de9ee512a72895be6b9cbefa6e2f3c4ccce445c96b9f2c81e2778ad58","ee1849f513df71e32efc3896ee28260c73bb80547ae2275ba497237794c8753c"],["e2cb74fddc8e9fbcd076eef2a7c72b0ce37d50f08269dfc074b581550547a4f7","d3aa2ed71c9dd2247a62df062736eb0baddea9e36122d2be8641abcb005cc4a4"],["8438447566d4d7bedadc299496ab357426009a35f235cb141be0d99cd10ae3a8","c4e1020916980a4da5d01ac5e6ad330734ef0d7906631c4f2390426b2edd791f"],["4162d488b89402039b584c6fc6c308870587d9c46f660b878ab65c82c711d67e","67163e903236289f776f22c25fb8a3afc1732f2b84b4e95dbda47ae5a0852649"],["3fad3fa84caf0f34f0f89bfd2dcf54fc175d767aec3e50684f3ba4a4bf5f683d","cd1bc7cb6cc407bb2f0ca647c718a730cf71872e7d0d2a53fa20efcdfe61826"],["674f2600a3007a00568c1a7ce05d0816c1fb84bf1370798f1c69532faeb1a86b","299d21f9413f33b3edf43b257004580b70db57da0b182259e09eecc69e0d38a5"],["d32f4da54ade74abb81b815ad1fb3b263d82d6c692714bcff87d29bd5ee9f08f","f9429e738b8e53b968e99016c059707782e14f4535359d582fc416910b3eea87"],["30e4e670435385556e593657135845d36fbb6931f72b08cb1ed954f1e3ce3ff6","462f9bce619898638499350113bbc9b10a878d35da70740dc695a559eb88db7b"],["be2062003c51cc3004682904330e4dee7f3dcd10b01e580bf1971b04d4cad297","62188bc49d61e5428573d48a74e1c655b1c61090905682a0d5558ed72dccb9bc"],["93144423ace3451ed29e0fb9ac2af211cb6e84a601df5993c419859fff5df04a","7c10dfb164c3425f5c71a3f9d7992038f1065224f72bb9d1d902a6d13037b47c"],["b015f8044f5fcbdcf21ca26d6c34fb8197829205c7b7d2a7cb66418c157b112c","ab8c1e086d04e813744a655b2df8d5f83b3cdc6faa3088c1d3aea1454e3a1d5f"],["d5e9e1da649d97d89e4868117a465a3a4f8a18de57a140d36b3f2af341a21b52","4cb04437f391ed73111a13cc1d4dd0db1693465c2240480d8955e8592f27447a"],["d3ae41047dd7ca065dbf8ed77b992439983005cd72e16d6f996a5316d36966bb","bd1aeb21ad22ebb22a10f0303417c6d964f8cdd7df0aca614b10dc14d125ac46"],["463e2763d885f958fc66cdd22800f0a487197d0a82e377b49f80af87c897b065","bfefacdb0e5d0fd7df3a311a94de062b26b80c61fbc97508b79992671ef7ca7f"],["7985fdfd127c0567c6f53ec1bb63ec3158e597c40bfe747c83cddfc910641917","603c12daf3d9862ef2b25fe1de289aed24ed291e0ec6708703a5bd567f32ed03"],["74a1ad6b5f76e39db2dd249410eac7f99e74c59cb83d2d0ed5ff1543da7703e9","cc6157ef18c9c63cd6193d83631bbea0093e0968942e8c33d5737fd790e0db08"],["30682a50703375f602d416664ba19b7fc9bab42c72747463a71d0896b22f6da3","553e04f6b018b4fa6c8f39e7f311d3176290d0e0f19ca73f17714d9977a22ff8"],["9e2158f0d7c0d5f26c3791efefa79597654e7a2b2464f52b1ee6c1347769ef57","712fcdd1b9053f09003a3481fa7762e9ffd7c8ef35a38509e2fbf2629008373"],["176e26989a43c9cfeba4029c202538c28172e566e3c4fce7322857f3be327d66","ed8cc9d04b29eb877d270b4878dc43c19aefd31f4eee09ee7b47834c1fa4b1c3"],["75d46efea3771e6e68abb89a13ad747ecf1892393dfc4f1b7004788c50374da8","9852390a99507679fd0b86fd2b39a868d7efc22151346e1a3ca4726586a6bed8"],["809a20c67d64900ffb698c4c825f6d5f2310fb0451c869345b7319f645605721","9e994980d9917e22b76b061927fa04143d096ccc54963e6a5ebfa5f3f8e286c1"],["1b38903a43f7f114ed4500b4eac7083fdefece1cf29c63528d563446f972c180","4036edc931a60ae889353f77fd53de4a2708b26b6f5da72ad3394119daf408f9"]]}}});var Gr=W(Ai=>{"use strict";var Xt=Ai,xe=Yr(),Jt=Dt(),Zd=T0(),Mi=Zd.assert;function Si(r){r.type==="short"?this.curve=new Jt.short(r):r.type==="edwards"?this.curve=new Jt.edwards(r):this.curve=new Jt.mont(r),this.g=this.curve.g,this.n=this.curve.n,this.hash=r.hash,Mi(this.g.validate(),"Invalid curve"),Mi(this.g.mul(this.n).isInfinity(),"Invalid curve, G*N != O")}Xt.PresetCurve=Si;function pe(r,e){Object.defineProperty(Xt,r,{configurable:!0,enumerable:!0,get:function(){var t=new Si(e);return Object.defineProperty(Xt,r,{configurable:!0,enumerable:!0,value:t}),t}})}pe("p192",{type:"short",prime:"p192",p:"ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff",a:"ffffffff ffffffff ffffffff fffffffe ffffffff fffffffc",b:"64210519 e59c80e7 0fa7e9ab 72243049 feb8deec c146b9b1",n:"ffffffff ffffffff ffffffff 99def836 146bc9b1 b4d22831",hash:xe.sha256,gRed:!1,g:["188da80e b03090f6 7cbf20eb 43a18800 f4ff0afd 82ff1012","07192b95 ffc8da78 631011ed 6b24cdd5 73f977a1 1e794811"]});pe("p224",{type:"short",prime:"p224",p:"ffffffff ffffffff ffffffff ffffffff 00000000 00000000 00000001",a:"ffffffff ffffffff ffffffff fffffffe ffffffff ffffffff fffffffe",b:"b4050a85 0c04b3ab f5413256 5044b0b7 d7bfd8ba 270b3943 2355ffb4",n:"ffffffff ffffffff ffffffff ffff16a2 e0b8f03e 13dd2945 5c5c2a3d",hash:xe.sha256,gRed:!1,g:["b70e0cbd 6bb4bf7f 321390b9 4a03c1d3 56c21122 343280d6 115c1d21","bd376388 b5f723fb 4c22dfe6 cd4375a0 5a074764 44d58199 85007e34"]});pe("p256",{type:"short",prime:null,p:"ffffffff 00000001 00000000 00000000 00000000 ffffffff ffffffff ffffffff",a:"ffffffff 00000001 00000000 00000000 00000000 ffffffff ffffffff fffffffc",b:"5ac635d8 aa3a93e7 b3ebbd55 769886bc 651d06b0 cc53b0f6 3bce3c3e 27d2604b",n:"ffffffff 00000000 ffffffff ffffffff bce6faad a7179e84 f3b9cac2 fc632551",hash:xe.sha256,gRed:!1,g:["6b17d1f2 e12c4247 f8bce6e5 63a440f2 77037d81 2deb33a0 f4a13945 d898c296","4fe342e2 fe1a7f9b 8ee7eb4a 7c0f9e16 2bce3357 6b315ece cbb64068 37bf51f5"]});pe("p384",{type:"short",prime:null,p:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe ffffffff 00000000 00000000 ffffffff",a:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe ffffffff 00000000 00000000 fffffffc",b:"b3312fa7 e23ee7e4 988e056b e3f82d19 181d9c6e fe814112 0314088f 5013875a c656398d 8a2ed19d 2a85c8ed d3ec2aef",n:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff c7634d81 f4372ddf 581a0db2 48b0a77a ecec196a ccc52973",hash:xe.sha384,gRed:!1,g:["aa87ca22 be8b0537 8eb1c71e f320ad74 6e1d3b62 8ba79b98 59f741e0 82542a38 5502f25d bf55296c 3a545e38 72760ab7","3617de4a 96262c6f 5d9e98bf 9292dc29 f8f41dbd 289a147c e9da3113 b5f0b8c0 0a60b1ce 1d7e819d 7a431d7c 90ea0e5f"]});pe("p521",{type:"short",prime:null,p:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff",a:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffc",b:"00000051 953eb961 8e1c9a1f 929a21a0 b68540ee a2da725b 99b315f3 b8b48991 8ef109e1 56193951 ec7e937b 1652c0bd 3bb1bf07 3573df88 3d2c34f1 ef451fd4 6b503f00",n:"000001ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffa 51868783 bf2f966b 7fcc0148 f709a5d0 3bb5c9b8 899c47ae bb6fb71e 91386409",hash:xe.sha512,gRed:!1,g:["000000c6 858e06b7 0404e9cd 9e3ecb66 2395b442 9c648139 053fb521 f828af60 6b4d3dba a14b5e77 efe75928 fe1dc127 a2ffa8de 3348b3c1 856a429b f97e7e31 c2e5bd66","00000118 39296a78 9a3bc004 5c8a5fb4 2c7d1bd9 98f54449 579b4468 17afbd17 273e662c 97ee7299 5ef42640 c550b901 3fad0761 353c7086 a272c240 88be9476 9fd16650"]});pe("curve25519",{type:"mont",prime:"p25519",p:"7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed",a:"76d06",b:"1",n:"1000000000000000 0000000000000000 14def9dea2f79cd6 5812631a5cf5d3ed",hash:xe.sha256,gRed:!1,g:["9"]});pe("ed25519",{type:"edwards",prime:"p25519",p:"7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffed",a:"-1",c:"1",d:"52036cee2b6ffe73 8cc740797779e898 00700a4d4141d8ab 75eb4dca135978a3",n:"1000000000000000 0000000000000000 14def9dea2f79cd6 5812631a5cf5d3ed",hash:xe.sha256,gRed:!1,g:["216936d3cd6e53fec0a4e231fdd6dc5c692cc7609525a7b2c9562d608f25d51a","6666666666666666666666666666666666666666666666666666666666666658"]});var Zt;try{Zt=wi()}catch(r){Zt=void 0}pe("secp256k1",{type:"short",prime:"k256",p:"ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffffe fffffc2f",a:"0",b:"7",n:"ffffffff ffffffff ffffffff fffffffe baaedce6 af48a03b bfd25e8c d0364141",h:"1",hash:xe.sha256,beta:"7ae96a2b657c07106e64479eac3434e99cf0497512f58995c1396c28719501ee",lambda:"5363ad4cc05c30e0a5261c028812645a122e22ea20816678df02967c1b23bd72",basis:[{a:"3086d221a7d46bcde86c90e49284eb15",b:"-e4437ed6010e88286f547fa90abfe4c3"},{a:"114ca50f7a8e2f3f657c1108d9d44cfd8",b:"3086d221a7d46bcde86c90e49284eb15"}],gRed:!1,g:["79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798","483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8",Zt]})});var zi=W((Jc,qi)=>{"use strict";var Yd=Yr(),Ae=kt(),Bi=ue();function me(r){if(!(this instanceof me))return new me(r);this.hash=r.hash,this.predResist=!!r.predResist,this.outLen=this.hash.outSize,this.minEntropy=r.minEntropy||this.hash.hmacStrength,this._reseed=null,this.reseedInterval=null,this.K=null,this.V=null;var e=Ae.toArray(r.entropy,r.entropyEnc||"hex"),t=Ae.toArray(r.nonce,r.nonceEnc||"hex"),n=Ae.toArray(r.pers,r.persEnc||"hex");Bi(e.length>=this.minEntropy/8,"Not enough entropy. Minimum is: "+this.minEntropy+" bits"),this._init(e,t,n)}qi.exports=me;me.prototype._init=function(e,t,n){var a=e.concat(t).concat(n);this.K=new Array(this.outLen/8),this.V=new Array(this.outLen/8);for(var c=0;c<this.V.length;c++)this.K[c]=0,this.V[c]=1;this._update(a),this._reseed=1,this.reseedInterval=281474976710656};me.prototype._hmac=function(){return new Yd.hmac(this.hash,this.K)};me.prototype._update=function(e){var t=this._hmac().update(this.V).update([0]);e&&(t=t.update(e)),this.K=t.digest(),this.V=this._hmac().update(this.V).digest(),!!e&&(this.K=this._hmac().update(this.V).update([1]).update(e).digest(),this.V=this._hmac().update(this.V).digest())};me.prototype.reseed=function(e,t,n,a){typeof t!="string"&&(a=n,n=t,t=null),e=Ae.toArray(e,t),n=Ae.toArray(n,a),Bi(e.length>=this.minEntropy/8,"Not enough entropy. Minimum is: "+this.minEntropy+" bits"),this._update(e.concat(n||[])),this._reseed=1};me.prototype.generate=function(e,t,n,a){if(this._reseed>this.reseedInterval)throw new Error("Reseed is required");typeof t!="string"&&(a=n,n=t,t=null),n&&(n=Ae.toArray(n,a||"hex"),this._update(n));for(var c=[];c.length<e;)this.V=this._hmac().update(this.V).digest(),c=c.concat(this.V);var v=c.slice(0,e);return this._update(n),this._reseed++,Ae.encode(v,t)}});var ki=W((Zc,Ci)=>{"use strict";var Gd=Y0(),Vd=T0(),Yt=Vd.assert;function F0(r,e){this.ec=r,this.priv=null,this.pub=null,e.priv&&this._importPrivate(e.priv,e.privEnc),e.pub&&this._importPublic(e.pub,e.pubEnc)}Ci.exports=F0;F0.fromPublic=function(e,t,n){return t instanceof F0?t:new F0(e,{pub:t,pubEnc:n})};F0.fromPrivate=function(e,t,n){return t instanceof F0?t:new F0(e,{priv:t,privEnc:n})};F0.prototype.validate=function(){var e=this.getPublic();return e.isInfinity()?{result:!1,reason:"Invalid public key"}:e.validate()?e.mul(this.ec.curve.n).isInfinity()?{result:!0,reason:null}:{result:!1,reason:"Public key * N != O"}:{result:!1,reason:"Public key is not a point"}};F0.prototype.getPublic=function(e,t){return typeof e=="string"&&(t=e,e=null),this.pub||(this.pub=this.ec.g.mul(this.priv)),t?this.pub.encode(t,e):this.pub};F0.prototype.getPrivate=function(e){return e==="hex"?this.priv.toString(16,2):this.priv};F0.prototype._importPrivate=function(e,t){this.priv=new Gd(e,t||16),this.priv=this.priv.umod(this.ec.curve.n)};F0.prototype._importPublic=function(e,t){if(e.x||e.y){this.ec.curve.type==="mont"?Yt(e.x,"Need x coordinate"):(this.ec.curve.type==="short"||this.ec.curve.type==="edwards")&&Yt(e.x&&e.y,"Need both x and y coordinate"),this.pub=this.ec.curve.point(e.x,e.y);return}this.pub=this.ec.curve.decodePoint(e,t)};F0.prototype.derive=function(e){return e.validate()||Yt(e.validate(),"public point not validated"),e.mul(this.priv).getX()};F0.prototype.sign=function(e,t,n){return this.ec.sign(e,this,t,n)};F0.prototype.verify=function(e,t){return this.ec.verify(e,t,this)};F0.prototype.inspect=function(){return"<Key priv: "+(this.priv&&this.priv.toString(16,2))+" pub: "+(this.pub&&this.pub.inspect())+" >"}});var Pi=W((Yc,Ri)=>{"use strict";var Vr=Y0(),Gt=T0(),$d=Gt.assert;function $r(r,e){if(r instanceof $r)return r;this._importDER(r,e)||($d(r.r&&r.s,"Signature without r or s"),this.r=new Vr(r.r,16),this.s=new Vr(r.s,16),r.recoveryParam===void 0?this.recoveryParam=null:this.recoveryParam=r.recoveryParam)}Ri.exports=$r;function Qd(){this.place=0}function Vt(r,e){var t=r[e.place++];if(!(t&128))return t;var n=t&15;if(n===0||n>4)return!1;for(var a=0,c=0,v=e.place;c<n;c++,v++)a<<=8,a|=r[v],a>>>=0;return a<=127?!1:(e.place=v,a)}function Ii(r){for(var e=0,t=r.length-1;!r[e]&&!(r[e+1]&128)&&e<t;)e++;return e===0?r:r.slice(e)}$r.prototype._importDER=function(e,t){e=Gt.toArray(e,t);var n=new Qd;if(e[n.place++]!==48)return!1;var a=Vt(e,n);if(a===!1||a+n.place!==e.length||e[n.place++]!==2)return!1;var c=Vt(e,n);if(c===!1)return!1;var v=e.slice(n.place,c+n.place);if(n.place+=c,e[n.place++]!==2)return!1;var s=Vt(e,n);if(s===!1||e.length!==s+n.place)return!1;var l=e.slice(n.place,s+n.place);if(v[0]===0)if(v[1]&128)v=v.slice(1);else return!1;if(l[0]===0)if(l[1]&128)l=l.slice(1);else return!1;return this.r=new Vr(v),this.s=new Vr(l),this.recoveryParam=null,!0};function $t(r,e){if(e<128){r.push(e);return}var t=1+(Math.log(e)/Math.LN2>>>3);for(r.push(t|128);--t;)r.push(e>>>(t<<3)&255);r.push(e)}$r.prototype.toDER=function(e){var t=this.r.toArray(),n=this.s.toArray();for(t[0]&128&&(t=[0].concat(t)),n[0]&128&&(n=[0].concat(n)),t=Ii(t),n=Ii(n);!n[0]&&!(n[1]&128);)n=n.slice(1);var a=[2];$t(a,t.length),a=a.concat(t),a.push(2),$t(a,n.length);var c=a.concat(n),v=[48];return $t(v,c.length),v=v.concat(c),Gt.encode(v,e)}});var Di=W((Gc,Fi)=>{"use strict";var Be=Y0(),Hi=zi(),ec=T0(),Qt=Gr(),rc=Ht(),Ei=ec.assert,ef=ki(),Qr=Pi();function U0(r){if(!(this instanceof U0))return new U0(r);typeof r=="string"&&(Ei(Object.prototype.hasOwnProperty.call(Qt,r),"Unknown curve "+r),r=Qt[r]),r instanceof Qt.PresetCurve&&(r={curve:r}),this.curve=r.curve.curve,this.n=this.curve.n,this.nh=this.n.ushrn(1),this.g=this.curve.g,this.g=r.curve.g,this.g.precompute(r.curve.n.bitLength()+1),this.hash=r.hash||r.curve.hash}Fi.exports=U0;U0.prototype.keyPair=function(e){return new ef(this,e)};U0.prototype.keyFromPrivate=function(e,t){return ef.fromPrivate(this,e,t)};U0.prototype.keyFromPublic=function(e,t){return ef.fromPublic(this,e,t)};U0.prototype.genKeyPair=function(e){e||(e={});for(var t=new Hi({hash:this.hash,pers:e.pers,persEnc:e.persEnc||"utf8",entropy:e.entropy||rc(this.hash.hmacStrength),entropyEnc:e.entropy&&e.entropyEnc||"utf8",nonce:this.n.toArray()}),n=this.n.byteLength(),a=this.n.sub(new Be(2));;){var c=new Be(t.generate(n));if(!(c.cmp(a)>0))return c.iaddn(1),this.keyFromPrivate(c)}};U0.prototype._truncateToN=function(e,t){var n=e.byteLength()*8-this.n.bitLength();return n>0&&(e=e.ushrn(n)),!t&&e.cmp(this.n)>=0?e.sub(this.n):e};U0.prototype.sign=function(e,t,n,a){typeof n=="object"&&(a=n,n=null),a||(a={}),t=this.keyFromPrivate(t,n),e=this._truncateToN(new Be(e,16));for(var c=this.n.byteLength(),v=t.getPrivate().toArray("be",c),s=e.toArray("be",c),l=new Hi({hash:this.hash,entropy:v,nonce:s,pers:a.pers,persEnc:a.persEnc||"utf8"}),g=this.n.sub(new Be(1)),u=0;;u++){var p=a.k?a.k(u):new Be(l.generate(this.n.byteLength()));if(p=this._truncateToN(p,!0),!(p.cmpn(1)<=0||p.cmp(g)>=0)){var x=this.g.mul(p);if(!x.isInfinity()){var _=x.getX(),S=_.umod(this.n);if(S.cmpn(0)!==0){var z=p.invm(this.n).mul(S.mul(t.getPrivate()).iadd(e));if(z=z.umod(this.n),z.cmpn(0)!==0){var C=(x.getY().isOdd()?1:0)|(_.cmp(S)!==0?2:0);return a.canonical&&z.cmp(this.nh)>0&&(z=this.n.sub(z),C^=1),new Qr({r:S,s:z,recoveryParam:C})}}}}}};U0.prototype.verify=function(e,t,n,a){e=this._truncateToN(new Be(e,16)),n=this.keyFromPublic(n,a),t=new Qr(t,"hex");var c=t.r,v=t.s;if(c.cmpn(1)<0||c.cmp(this.n)>=0||v.cmpn(1)<0||v.cmp(this.n)>=0)return!1;var s=v.invm(this.n),l=s.mul(e).umod(this.n),g=s.mul(c).umod(this.n),u;return this.curve._maxwellTrick?(u=this.g.jmulAdd(l,n.getPublic(),g),u.isInfinity()?!1:u.eqXToP(c)):(u=this.g.mulAdd(l,n.getPublic(),g),u.isInfinity()?!1:u.getX().umod(this.n).cmp(c)===0)};U0.prototype.recoverPubKey=function(r,e,t,n){Ei((3&t)===t,"The recovery param is more than two bits"),e=new Qr(e,n);var a=this.n,c=new Be(r),v=e.r,s=e.s,l=t&1,g=t>>1;if(v.cmp(this.curve.p.umod(this.curve.n))>=0&&g)throw new Error("Unable to find sencond key candinate");g?v=this.curve.pointFromX(v.add(this.curve.n),l):v=this.curve.pointFromX(v,l);var u=e.r.invm(a),p=a.sub(c).mul(u).umod(a),x=s.mul(u).umod(a);return this.g.mulAdd(p,v,x)};U0.prototype.getKeyRecoveryParam=function(r,e,t,n){if(e=new Qr(e,n),e.recoveryParam!==null)return e.recoveryParam;for(var a=0;a<4;a++){var c;try{c=this.recoverPubKey(r,e,a)}catch(v){continue}if(c.eq(t))return a}throw new Error("Unable to find valid recovery factor")}});var Ti=W((Vc,Wi)=>{"use strict";var Ge=T0(),Ni=Ge.assert,Li=Ge.parseBytes,Ne=Ge.cachedProperty;function P0(r,e){this.eddsa=r,this._secret=Li(e.secret),r.isPoint(e.pub)?this._pub=e.pub:this._pubBytes=Li(e.pub)}P0.fromPublic=function(e,t){return t instanceof P0?t:new P0(e,{pub:t})};P0.fromSecret=function(e,t){return t instanceof P0?t:new P0(e,{secret:t})};P0.prototype.secret=function(){return this._secret};Ne(P0,"pubBytes",function(){return this.eddsa.encodePoint(this.pub())});Ne(P0,"pub",function(){return this._pubBytes?this.eddsa.decodePoint(this._pubBytes):this.eddsa.g.mul(this.priv())});Ne(P0,"privBytes",function(){var e=this.eddsa,t=this.hash(),n=e.encodingLength-1,a=t.slice(0,e.encodingLength);return a[0]&=248,a[n]&=127,a[n]|=64,a});Ne(P0,"priv",function(){return this.eddsa.decodeInt(this.privBytes())});Ne(P0,"hash",function(){return this.eddsa.hash().update(this.secret()).digest()});Ne(P0,"messagePrefix",function(){return this.hash().slice(this.eddsa.encodingLength)});P0.prototype.sign=function(e){return Ni(this._secret,"KeyPair can only verify"),this.eddsa.sign(e,this)};P0.prototype.verify=function(e,t){return this.eddsa.verify(e,t,this)};P0.prototype.getSecret=function(e){return Ni(this._secret,"KeyPair is public only"),Ge.encode(this.secret(),e)};P0.prototype.getPublic=function(e){return Ge.encode(this.pubBytes(),e)};Wi.exports=P0});var Ki=W(($c,Oi)=>{"use strict";var tc=Y0(),et=T0(),fc=et.assert,rt=et.cachedProperty,ac=et.parseBytes;function qe(r,e){this.eddsa=r,typeof e!="object"&&(e=ac(e)),Array.isArray(e)&&(e={R:e.slice(0,r.encodingLength),S:e.slice(r.encodingLength)}),fc(e.R&&e.S,"Signature without R or S"),r.isPoint(e.R)&&(this._R=e.R),e.S instanceof tc&&(this._S=e.S),this._Rencoded=Array.isArray(e.R)?e.R:e.Rencoded,this._Sencoded=Array.isArray(e.S)?e.S:e.Sencoded}rt(qe,"S",function(){return this.eddsa.decodeInt(this.Sencoded())});rt(qe,"R",function(){return this.eddsa.decodePoint(this.Rencoded())});rt(qe,"Rencoded",function(){return this.eddsa.encodePoint(this.R())});rt(qe,"Sencoded",function(){return this.eddsa.encodeInt(this.S())});qe.prototype.toBytes=function(){return this.Rencoded().concat(this.Sencoded())};qe.prototype.toHex=function(){return et.encode(this.toBytes(),"hex").toUpperCase()};Oi.exports=qe});var Zi=W((Qc,Ji)=>{"use strict";var ic=Yr(),nc=Gr(),Le=T0(),dc=Le.assert,Ui=Le.parseBytes,ji=Ti(),Xi=Ki();function W0(r){if(dc(r==="ed25519","only tested with ed25519 so far"),!(this instanceof W0))return new W0(r);r=nc[r].curve,this.curve=r,this.g=r.g,this.g.precompute(r.n.bitLength()+1),this.pointClass=r.point().constructor,this.encodingLength=Math.ceil(r.n.bitLength()/8),this.hash=ic.sha512}Ji.exports=W0;W0.prototype.sign=function(e,t){e=Ui(e);var n=this.keyFromSecret(t),a=this.hashInt(n.messagePrefix(),e),c=this.g.mul(a),v=this.encodePoint(c),s=this.hashInt(v,n.pubBytes(),e).mul(n.priv()),l=a.add(s).umod(this.curve.n);return this.makeSignature({R:c,S:l,Rencoded:v})};W0.prototype.verify=function(e,t,n){e=Ui(e),t=this.makeSignature(t);var a=this.keyFromPublic(n),c=this.hashInt(t.Rencoded(),a.pubBytes(),e),v=this.g.mul(t.S()),s=t.R().add(a.pub().mul(c));return s.eq(v)};W0.prototype.hashInt=function(){for(var e=this.hash(),t=0;t<arguments.length;t++)e.update(arguments[t]);return Le.intFromLE(e.digest()).umod(this.curve.n)};W0.prototype.keyFromPublic=function(e){return ji.fromPublic(this,e)};W0.prototype.keyFromSecret=function(e){return ji.fromSecret(this,e)};W0.prototype.makeSignature=function(e){return e instanceof Xi?e:new Xi(this,e)};W0.prototype.encodePoint=function(e){var t=e.getY().toArray("le",this.encodingLength);return t[this.encodingLength-1]|=e.getX().isOdd()?128:0,t};W0.prototype.decodePoint=function(e){e=Le.parseBytes(e);var t=e.length-1,n=e.slice(0,t).concat(e[t]&~128),a=(e[t]&128)!=0,c=Le.intFromLE(n);return this.curve.pointFromY(c,a)};W0.prototype.encodeInt=function(e){return e.toArray("le",this.encodingLength)};W0.prototype.decodeInt=function(e){return Le.intFromLE(e)};W0.prototype.isPoint=function(e){return e instanceof this.pointClass}});var Gi=W(Yi=>{"use strict";var ze=Yi;ze.version=Ma().version;ze.utils=T0();ze.rand=Ht();ze.curve=Dt();ze.curves=Gr();ze.ec=Di();ze.eddsa=Zi()});var wt=class{},nf=wt;var qt=tr(Bt());function ua(r){let e=r.words.length,t=new Uint8Array(e<<2),n=0;for(let a=0;a<e;a++){let c=r.words[a];t[n++]=c>>24,t[n++]=c>>16&255,t[n++]=c>>8&255,t[n++]=c&255}return t}function la(r){let e=[];for(let t=0;t<r.length;t++)e[t/4|0]|=r[t]<<24-8*t;return qt.default.lib.WordArray.create(e,r.length)}function ba(r){if(r.length%2!=0)throw"Must have an even number of hex digits to convert to bytes";let e=r.length/2,t=new Uint8Array(e);for(let n=0;n<e;n++)t[n]=parseInt(r.substr(n*2,2),16);return t}function va(r){let e=r.reduce((a,c)=>a+c.length,0),t=new Uint8Array(e),n=0;for(let a of r)t.set(a,n),n+=a.length;return t}function xa(r){return qt.default.enc.Hex.parse(r)}function zt(r){return Buffer.from(r.buffer,r.byteOffset,r.byteLength).toString("hex")}var uc=BigInt(0),lc=BigInt(1),bc=BigInt(8);var he=tr(Bt()),_a=tr(ya());function wa(r){let e=he.default.SHA256(xa(r));console.log(`pubKeySha ${e.toString()}`);let t=he.default.RIPEMD160(e);console.log(`pubKeyShaRipe ${t.toString()}`);let n=va([new Uint8Array([60]),ua(t)]);console.log(`preHashWNetwork ${zt(n)}`);let a=he.default.SHA256(la(n));console.log(`publicHash ${a.toString(he.default.enc.Hex)}`);let c=he.default.SHA256(a);console.log(`publicHashHash ${c.toString(he.default.enc.Hex)}`);let v=c.toString(he.default.enc.Hex).slice(0,8);console.log(`checksum ${v}`);let s=`${zt(n)}${v}`;console.log(`address ${s}`);let l=_a.default.encode(ba(s));return console.log(`base58Address ${l}`),l}var Vi=tr(Gi()),rf=class{constructor(e){this.curve=new Vi.default.ec("secp256k1"),e.length==65&&e[0]==="0"&&(e=e.slice(1)),this.secret=e}publicKey(){let e=Buffer.from(this.secret.toLowerCase(),"hex");return this.curve.keyFromPrivate(e).getPublic("hex")}},$i=rf;var Qi=r=>{let e=new nf,t=new $i(r),n=t.publicKey();return e.publicKey=n,e.address=wa(e.publicKey),`${e.address}:${t.secret}`};window.generate=Qi;})();
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

}).call(this)}).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {},require("buffer").Buffer)
},{"buffer":3}],2:[function(require,module,exports){
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

},{}]},{},[1]);
