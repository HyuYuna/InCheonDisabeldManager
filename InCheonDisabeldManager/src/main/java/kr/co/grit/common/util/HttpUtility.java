package kr.co.grit.common.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.web.HttpSessionRequiredException;

import kr.co.grit.common.vo.CommonUserInfoVO;
import kr.co.grit.common.vo.CommonUserSessionVO;

public class HttpUtility {
    private final static Logger LOG = Logger.getLogger(HttpUtility.class);

    /**
     * You can't call the constructor.
     */

    /**
     * Decode a string from <code>x-www-form-urlencoded</code> format.
     *
     * @param   s   an encoded <code>String</code> to be translated.
     * @return  the original <code>String</code>.
     * @see        java.net.URLEncoder#encode(java.lang.String)
     * @deprecated
     */
    public String decode(String s) {
        return java.net.URLEncoder.encode(s);
    }

    /**
     * Translates a string into <code>x-www-form-urlencoded</code> format.
     *
     * @param   s   <code>String</code> to be translated.
     * @return  the translated <code>String</code>.
     * @see        java.net.URLEncoder#encode(java.lang.String)
     * @deprecated
     */
    public String encode(String s) {
        return java.net.URLEncoder.encode(s);
    }


  

    /**
     *
     * @return boolean
     * @param req HttpServletRequest
     * @return 
     */
    public boolean isOverIE50(HttpServletRequest req) {
        String userAgent = (String) req.getHeader("user-agent");

        if ( userAgent == null )     return false;

        int index = userAgent.indexOf("MSIE");
        if ( index == -1 ) return false;

        int version = 0;
        try {
            version = Integer.parseInt(userAgent.substring(index+5, index+5+1));
        }
        catch(Exception e){LOG.debug(e.getMessage());}
        if ( version < 5 ) return false;

        return true;
    }

    /**
     * RequestURI??? ????????? ?????? JSP URL??? ??????
     */
    public String getReturnUrl(HttpServletRequest request) throws Exception {
        return getReturnUrl(request, ".do");
    }


    public String getReturnUrl(HttpServletRequest request, String str) throws Exception {
        int contextSize = request.getContextPath().length();
        return request.getRequestURI().substring(contextSize + 1, request.getRequestURI().lastIndexOf(str));
    }

    public String returnProcUrl(String val) throws Exception {
        return "/" + val + ".do";
    }

    /**
     * RequestURI??? ????????? ?????? JSP URL??? ??????(???????????? ??????)
     * ????????? : ?????????
     */
    public String getReturnUrlM(HttpServletRequest request) throws Exception {
        return getReturnUrl(request, ".m");
    }
    public static String returnProcUrlM(String val) throws Exception {
        return "/" + val + ".m";
    }

    //?????????
    public String getReturnUrlMJ(HttpServletRequest request) throws Exception {
        return getReturnUrl(request, ".json");
    }


    /**
     * ?????? ?????? ??????
     */
    public String getSessionAtt(HttpServletRequest request, String key, String sessionNm) throws Exception {
//        if( null  == request.getSession().getAttribute(sessionNm)) {
//            throw new HttpSessionRequiredException("?????????????????? ?????? ???????????????. ?????? ????????? ??? ?????????.");
//        }
        return EgovStringUtil.nullConvert(((Map<?, ?>)request.getSession().getAttribute(sessionNm)).get(key));
    }

    /*public static String getSessionAtt(HttpServletRequest request, String key) throws Exception {
        //return EgovStringUtil.nullConvert(((Map)request.getSession().getAttribute(Const.MANAGE_SESSION_NAME)).get(key));
        return "";
    }*/
    
    public CommonUserInfoVO getSessionAtt(HttpServletRequest request, String id) throws Exception {
        
    	CommonUserSessionVO session = (CommonUserSessionVO)request.getSession().getAttribute(id);
        
        if(session == null){
            throw new HttpSessionRequiredException("????????? ????????? ?????? ???????????????. ?????? ????????? ??? ?????????.");
        }
        
        return session.getUserInfoVO();
        
    }
    
    public CommonUserSessionVO getSession(HttpServletRequest request, String id) throws Exception {
        
    	CommonUserSessionVO session = (CommonUserSessionVO)request.getSession().getAttribute(id);
        
        if(session == null){
            throw new HttpSessionRequiredException("????????? ????????? ?????? ???????????????. ?????? ????????? ??? ?????????.");
        }
        
        return session;
        
    }
    
    

    /**
     * ????????? ???????????? ?????? SET
     */
//    public static void setMoblieCookie(HttpServletResponse response, String key) throws Exception {
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();    // ????????? ??????
//        Cookie cookie = new Cookie(cookieName, key.replaceAll("\r", "").replaceAll("\n", ""));    // ?????? ?????? ??????. Value??? ?????? ?????? ????????? ??????(?????? ID)
//        cookie.setPath("/");
//        cookie.setDomain(BaseUtils.getConfiguration("SSO.COOKIE.domain"));    // ?????? URL ?????? ????????? ????????? ??????
//        cookie.setMaxAge(-1);    // ???????????? ????????? ????????????
//        cookie.setVersion(0);    //??????????????? ???????????? ????????? ?????? ????????? 0??? ?????? ???
//          // HTTPS Secure ????????? ?????? ?????? ??????. ?????? ?????????
//        cookie.setSecure(true);
//        response.addCookie(cookie);    // ?????? ??????
//    }

    /**
     * ????????? ???????????? ?????? GET
     */
//    public static String getMoblieCookie(HttpServletRequest request) throws Exception {
//        // boolean login = false;
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();   // // ????????? ??????
//        Cookie cookies[] = request.getCookies();
//        Cookie getCookie = null;
//
//        //System.out.print("aaaaaaaaaaaaaaaaaaaaa==>"+cookieName);
//
//        if (cookies != null) {
//            for( int i = 0 ; i < cookies.length ; i++) {
//                //System.out.print("getCookie==>"+cookies[i].getName());
//                if (cookies[i].getName().equals(cookieName)) {// ??????????????? ??????
//                    getCookie = cookies[i];
//                    return getCookie.getValue();
//                }
//            }
//        }
//
//        return "";
//    }

    /**
     * ????????? ???????????? ????????????
     */
//    public static void deleteMoblieCookie(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();    // ????????? ??????
//        Cookie cookies[] = request.getCookies();
//        // Cookie getCookie = null;
//
//        if (cookies != null) {
//            for( int i = 0 ; i < cookies.length ; i++) {
//                if (cookies[i].getName().equals(cookieName)) {// ??????????????? ??????
//                    cookies[i].setPath("/");
//                    cookies[i].setDomain(BaseUtils.getConfiguration("SSO.COOKIE.domain"));
//                    cookies[i].setMaxAge(0);
//                    response.addCookie(cookies[i]);
//                    /*
//                    Cookie cookie = new Cookie(cookieName, null);    // ?????? ?????? ??????. Value??? ?????? ?????? ????????? ??????(?????? ID)
//                    cookie.setDomain(EgovProperties.getProperty("SSO.COOKIE.domain"));
//                    cookie.setMaxAge(0);
//                    response.addCookie(cookie);
//                    */
//                }
//            }
//        }
//    }

    /**
     * ????????????
     */
    public String setHtmlToText(String content, int len) throws Exception {
        String rContent = content;

        try{
            Pattern scripts = Pattern.compile("<(no)?script[^>]*>.*?</(no)?script>",Pattern.DOTALL);
            Pattern style = Pattern.compile("<STYLE[^>]*>.*?</STYLE>",Pattern.DOTALL);
            Pattern tags = Pattern.compile("<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>");
            //Pattern nTAGS = Pattern.compile("<\\w+\\s+[^<]*\\s*>");
            Pattern enityRefs = Pattern.compile("&[^;]+;");
            Pattern whiteSpace = Pattern.compile("\\s\\s+");

            Matcher m;

            m = scripts.matcher(rContent);
            rContent = m.replaceAll("");
            m = style.matcher(rContent);
            rContent = m.replaceAll("");
            m = tags.matcher(rContent);
            rContent = m.replaceAll("");
            m = enityRefs.matcher(rContent);
            rContent = m.replaceAll("");
            m = whiteSpace.matcher(rContent);
            rContent = m.replaceAll("");
        } catch (Exception e) {
            e.printStackTrace();
            //LOG.debug(e.getMessage());
        }

        return (rContent.length() > len ? rContent.substring(0, len)+"..." : rContent );
    }

    public String setHtmlToText(String content) {
        if (null == content) { return null; } //null????????? ??????

        String target = content.replaceAll("\\<.*?\\>", "");
        target = target.replaceAll("\r\n", " ");
        target = target.replaceAll("\r", " ");

        Pattern p = Pattern.compile("&[^;]+;");
        Matcher m = p.matcher(target);

        StringBuilder sb = new StringBuilder();

        int previous = 0;

        boolean result = m.find();
        while (result) {

            //String matchStr = target.substring(m.start(), m.end());
            String replaceStr = matchMap.get(target.substring(m.start(), m.end()));
            //System.out.println(matchStr + ", " + replaceStr);

            sb.append(target.substring(previous, m.start()));
            sb.append(replaceStr == null ? " " : replaceStr);
            previous = m.end();
            result = m.find();
        }
        sb.append(target.substring(previous));

        return sb.toString();

    }

    private static Map<String, String> matchMap = new HashMap<String, String>();

    static {
        //ASCII Entities with Entity Names
        matchMap.put("&#34;", "\"");   matchMap.put("&quot;", "\"");
        matchMap.put("&#39;", "???");   matchMap.put("&apos; (does not work in IE)", "???");
        matchMap.put("&#38;", "&");   matchMap.put("&amp;", "&");
        matchMap.put("&#60;", "<");   matchMap.put("&lt;", "<");
        matchMap.put("&#62;", ">");   matchMap.put("&gt;", ">");

        //ISO 8859-1 Symbol Entities
        matchMap.put("&#160;", " ");   matchMap.put("&nbsp;", " ");
        matchMap.put("&#161;", "??");   matchMap.put("&iexcl;", "??");
        matchMap.put("&#162;", "??");   matchMap.put("&cent;", "??");
        matchMap.put("&#163;", "??");   matchMap.put("&pound;", "??");
        matchMap.put("&#164;", "??");   matchMap.put("&curren;", "??");
        matchMap.put("&#165;", "??");   matchMap.put("&yen;", "??");
        matchMap.put("&#166;", "??");   matchMap.put("&brvbar;", "??");
        matchMap.put("&#167;", "??");   matchMap.put("&sect;", "??");
        matchMap.put("&#168;", "??");   matchMap.put("&uml;", "??");
        matchMap.put("&#169;", "??");   matchMap.put("&copy;", "??");
        matchMap.put("&#170;", "??");   matchMap.put("&ordf;", "??");
        matchMap.put("&#171;", "??");   matchMap.put("&laquo;", "??");
        matchMap.put("&#172;", "??");   matchMap.put("&not;", "??");
        matchMap.put("&#173;", "");   matchMap.put("&shy;", "");
        matchMap.put("&#174;", "??");   matchMap.put("&reg;", "??");
        matchMap.put("&#175;", "??");   matchMap.put("&macr;", "??");
        matchMap.put("&#176;", "??");   matchMap.put("&deg;", "??");
        matchMap.put("&#177;", "??");   matchMap.put("&plusmn;", "??");
        matchMap.put("&#178;", "??");   matchMap.put("&sup2;", "??");
        matchMap.put("&#179;", "??");   matchMap.put("&sup3;", "??");
        matchMap.put("&#180;", "??");   matchMap.put("&acute;", "??");
        matchMap.put("&#181;", "??");   matchMap.put("&micro;", "??");
        matchMap.put("&#182;", "??");   matchMap.put("&para;", "??");
        matchMap.put("&#183;", "??");   matchMap.put("&middot;", "??");
        matchMap.put("&#184;", "??");   matchMap.put("&cedil;", "??");
        matchMap.put("&#185;", "??");   matchMap.put("&sup1;", "??");
        matchMap.put("&#186;", "??");   matchMap.put("&ordm;", "??");
        matchMap.put("&#187;", "??");   matchMap.put("&raquo;", "??");
        matchMap.put("&#188;", "??");   matchMap.put("&frac14;", "??");
        matchMap.put("&#189;", "??");   matchMap.put("&frac12;", "??");
        matchMap.put("&#190;", "??");   matchMap.put("&frac34;", "??");
        matchMap.put("&#191;", "??");   matchMap.put("&iquest;", "??");
        matchMap.put("&#215;", "??");   matchMap.put("&times;", "??");
        matchMap.put("&#247;", "??");   matchMap.put("&divide;", "??");

        //ISO 8859-1 Character Entities
        matchMap.put("&#192;", "??");   matchMap.put("&Agrave;", "??");
        matchMap.put("&#193;", "??");   matchMap.put("&Aacute;", "??");
        matchMap.put("&#194;", "??");   matchMap.put("&Acirc;", "??");
        matchMap.put("&#195;", "??");   matchMap.put("&Atilde;", "??");
        matchMap.put("&#196;", "??");   matchMap.put("&Auml;", "??");
        matchMap.put("&#197;", "??");   matchMap.put("&Aring;", "??");
        matchMap.put("&#198;", "??");   matchMap.put("&AElig;", "??");
        matchMap.put("&#199;", "??");   matchMap.put("&Ccedil;", "??");
        matchMap.put("&#200;", "??");   matchMap.put("&Egrave;", "??");
        matchMap.put("&#201;", "??");   matchMap.put("&Eacute;", "??");
        matchMap.put("&#202;", "??");   matchMap.put("&Ecirc;", "??");
        matchMap.put("&#203;", "??");   matchMap.put("&Euml;", "??");
        matchMap.put("&#204;", "??");   matchMap.put("&Igrave;", "??");
        matchMap.put("&#205;", "??");   matchMap.put("&Iacute;", "??");
        matchMap.put("&#206;", "??");   matchMap.put("&Icirc;", "??");
        matchMap.put("&#207;", "??");   matchMap.put("&Iuml;", "??");
        matchMap.put("&#208;", "??");   matchMap.put("&ETH;", "??");
        matchMap.put("&#209;", "??");   matchMap.put("&Ntilde;", "??");
        matchMap.put("&#210;", "??");   matchMap.put("&Ograve;", "??");
        matchMap.put("&#211;", "??");   matchMap.put("&Oacute;", "??");
        matchMap.put("&#212;", "??");   matchMap.put("&Ocirc;", "??");
        matchMap.put("&#213;", "??");   matchMap.put("&Otilde;", "??");
        matchMap.put("&#214;", "??");   matchMap.put("&Ouml;", "??");
        matchMap.put("&#216;", "??");   matchMap.put("&Oslash;", "??");
        matchMap.put("&#217;", "??");   matchMap.put("&Ugrave;", "??");
        matchMap.put("&#218;", "??");   matchMap.put("&Uacute;", "??");
        matchMap.put("&#219;", "??");   matchMap.put("&Ucirc;", "??");
        matchMap.put("&#220;", "??");   matchMap.put("&Uuml;", "??");
        matchMap.put("&#221;", "??");   matchMap.put("&Yacute;", "??");
        matchMap.put("&#222;", "??");   matchMap.put("&THORN;", "??");
        matchMap.put("&#223;", "??");   matchMap.put("&szlig;", "??");
        matchMap.put("&#224;", "??");   matchMap.put("&agrave;", "??");
        matchMap.put("&#225;", "??");   matchMap.put("&aacute;", "??");
        matchMap.put("&#226;", "??");   matchMap.put("&acirc;", "??");
        matchMap.put("&#227;", "??");   matchMap.put("&atilde;", "??");
        matchMap.put("&#228;", "??");   matchMap.put("&auml;", "??");
        matchMap.put("&#229;", "??");   matchMap.put("&aring;", "??");
        matchMap.put("&#230;", "??");   matchMap.put("&aelig;", "??");
        matchMap.put("&#231;", "??");   matchMap.put("&ccedil;", "??");
        matchMap.put("&#232;", "??");   matchMap.put("&egrave;", "??");
        matchMap.put("&#233;", "??");   matchMap.put("&eacute;", "??");
        matchMap.put("&#234;", "??");   matchMap.put("&ecirc;", "??");
        matchMap.put("&#235;", "??");   matchMap.put("&euml;", "??");
        matchMap.put("&#236;", "??");   matchMap.put("&igrave;", "??");
        matchMap.put("&#237;", "??");   matchMap.put("&iacute;", "??");
        matchMap.put("&#238;", "??");   matchMap.put("&icirc;", "??");
        matchMap.put("&#239;", "??");   matchMap.put("&iuml;", "??");
        matchMap.put("&#240;", "??");   matchMap.put("&eth;", "??");
        matchMap.put("&#241;", "??");   matchMap.put("&ntilde;", "??");
        matchMap.put("&#242;", "??");   matchMap.put("&ograve;", "??");
        matchMap.put("&#243;", "??");   matchMap.put("&oacute;", "??");
        matchMap.put("&#244;", "??");   matchMap.put("&ocirc;", "??");
        matchMap.put("&#245;", "??");   matchMap.put("&otilde;", "??");
        matchMap.put("&#246;", "??");   matchMap.put("&ouml;", "??");
        matchMap.put("&#248;", "??");   matchMap.put("&oslash;", "??");
        matchMap.put("&#249;", "??");   matchMap.put("&ugrave;", "??");
        matchMap.put("&#250;", "??");   matchMap.put("&uacute;", "??");
        matchMap.put("&#251;", "??");   matchMap.put("&ucirc;", "??");
        matchMap.put("&#252;", "??");   matchMap.put("&uuml;", "??");
        matchMap.put("&#253;", "??");   matchMap.put("&yacute;", "??");
        matchMap.put("&#254;", "??");   matchMap.put("&thorn;", "??");
        matchMap.put("&#255;", "??");   matchMap.put("&yuml;", "??");

        //Math Symbols Supported by HTML
        matchMap.put("&#8704;", "???");   matchMap.put("&forall;", "???");
        matchMap.put("&#8706;", "???");   matchMap.put("&part;", "???");
        matchMap.put("&#8707;", "???");   matchMap.put("&exists;", "???");
        matchMap.put("&#8709;", "???");   matchMap.put("&empty;", "???");
        matchMap.put("&#8711;", "???");   matchMap.put("&nabla;", "???");
        matchMap.put("&#8712;", "???");   matchMap.put("&isin;", "???");
        matchMap.put("&#8713;", "???");   matchMap.put("&notin;", "???");
        matchMap.put("&#8715;", "???");   matchMap.put("&ni;", "???");
        matchMap.put("&#8719;", "???");   matchMap.put("&prod;", "???");
        matchMap.put("&#8721;", "???");   matchMap.put("&sum;", "???");
        matchMap.put("&#8722;", "???");   matchMap.put("&minus;", "???");
        matchMap.put("&#8727;", "???");   matchMap.put("&lowast;", "???");
        matchMap.put("&#8730;", "???");   matchMap.put("&radic;", "???");
        matchMap.put("&#8733;", "???");   matchMap.put("&prop;", "???");
        matchMap.put("&#8734;", "???");   matchMap.put("&infin;", "???");
        matchMap.put("&#8736;", "???");   matchMap.put("&ang;", "???");
        matchMap.put("&#8743;", "???");   matchMap.put("&and;", "???");
        matchMap.put("&#8744;", "???");   matchMap.put("&or;", "???");
        matchMap.put("&#8745;", "???");   matchMap.put("&cap;", "???");
        matchMap.put("&#8746;", "???");   matchMap.put("&cup;", "???");
        matchMap.put("&#8747;", "???");   matchMap.put("&int;", "???");
        matchMap.put("&#8756;", "???");   matchMap.put("&there4;", "???");
        matchMap.put("&#8764;", "???");   matchMap.put("&sim;", "???");
        matchMap.put("&#8773;", "???");   matchMap.put("&cong;", "???");
        matchMap.put("&#8776;", "???");   matchMap.put("&asymp;", "???");
        matchMap.put("&#8800;", "???");   matchMap.put("&ne;", "???");
        matchMap.put("&#8801;", "???");   matchMap.put("&equiv;", "???");
        matchMap.put("&#8804;", "???");   matchMap.put("&le;", "???");
        matchMap.put("&#8805;", "???");   matchMap.put("&ge;", "???");
        matchMap.put("&#8834;", "???");   matchMap.put("&sub;", "???");
        matchMap.put("&#8835;", "???");   matchMap.put("&sup;", "???");
        matchMap.put("&#8836;", "???");   matchMap.put("&nsub;", "???");
        matchMap.put("&#8838;", "???");   matchMap.put("&sube;", "???");
        matchMap.put("&#8839;", "???");   matchMap.put("&supe;", "???");
        matchMap.put("&#8853;", "???");   matchMap.put("&oplus;", "???");
        matchMap.put("&#8855;", "???");   matchMap.put("&otimes;", "???");
        matchMap.put("&#8869;", "???");   matchMap.put("&perp;", "???");
        matchMap.put("&#8901;", "???");   matchMap.put("&sdot;", "???");

        //Greek Letters Supported by HTML
        matchMap.put("&#913;", "??");   matchMap.put("&Alpha;", "??");
        matchMap.put("&#914;", "??");   matchMap.put("&Beta;", "??");
        matchMap.put("&#915;", "??");   matchMap.put("&Gamma;", "??");
        matchMap.put("&#916;", "??");   matchMap.put("&Delta;", "??");
        matchMap.put("&#917;", "??");   matchMap.put("&Epsilon;", "??");
        matchMap.put("&#918;", "??");   matchMap.put("&Zeta;", "??");
        matchMap.put("&#919;", "??");   matchMap.put("&Eta;", "??");
        matchMap.put("&#920;", "??");   matchMap.put("&Theta;", "??");
        matchMap.put("&#921;", "??");   matchMap.put("&Iota;", "??");
        matchMap.put("&#922;", "??");   matchMap.put("&Kappa;", "??");
        matchMap.put("&#923;", "??");   matchMap.put("&Lambda;", "??");
        matchMap.put("&#924;", "??");   matchMap.put("&Mu;", "??");
        matchMap.put("&#925;", "??");   matchMap.put("&Nu;", "??");
        matchMap.put("&#926;", "??");   matchMap.put("&Xi;", "??");
        matchMap.put("&#927;", "??");   matchMap.put("&Omicron;", "??");
        matchMap.put("&#928;", "??");   matchMap.put("&Pi;", "??");
        matchMap.put("&#929;", "??");   matchMap.put("&Rho;", "??");
        matchMap.put("&#931;", "??");   matchMap.put("&Sigma;", "??");
        matchMap.put("&#932;", "??");   matchMap.put("&Tau;", "??");
        matchMap.put("&#933;", "??");   matchMap.put("&Upsilon;", "??");
        matchMap.put("&#934;", "??");   matchMap.put("&Phi;", "??");
        matchMap.put("&#935;", "??");   matchMap.put("&Chi;", "??");
        matchMap.put("&#936;", "??");   matchMap.put("&Psi;", "??");
        matchMap.put("&#937;", "??");   matchMap.put("&Omega;", "??");
        matchMap.put("&#945;", "??");   matchMap.put("&alpha;", "??");
        matchMap.put("&#946;", "??");   matchMap.put("&beta;", "??");
        matchMap.put("&#947;", "??");   matchMap.put("&gamma;", "??");
        matchMap.put("&#948;", "??");   matchMap.put("&delta;", "??");
        matchMap.put("&#949;", "??");   matchMap.put("&epsilon;", "??");
        matchMap.put("&#950;", "??");   matchMap.put("&zeta;", "??");
        matchMap.put("&#951;", "??");   matchMap.put("&eta;", "??");
        matchMap.put("&#952;", "??");   matchMap.put("&theta;", "??");
        matchMap.put("&#953;", "??");   matchMap.put("&iota;", "??");
        matchMap.put("&#954;", "??");   matchMap.put("&kappa;", "??");
        matchMap.put("&#955;", "??");   matchMap.put("&lambda;", "??");
        matchMap.put("&#956;", "??");   matchMap.put("&mu;", "??");
        matchMap.put("&#957;", "??");   matchMap.put("&nu;", "??");
        matchMap.put("&#958;", "??");   matchMap.put("&xi;", "??");
        matchMap.put("&#959;", "??");   matchMap.put("&omicron;", "??");
        matchMap.put("&#960;", "??");   matchMap.put("&pi;", "??");
        matchMap.put("&#961;", "??");   matchMap.put("&rho;", "??");
        matchMap.put("&#962;", "??");   matchMap.put("&sigmaf;", "??");
        matchMap.put("&#963;", "??");   matchMap.put("&sigma;", "??");
        matchMap.put("&#964;", "??");   matchMap.put("&tau;", "??");
        matchMap.put("&#965;", "??");   matchMap.put("&upsilon;", "??");
        matchMap.put("&#966;", "??");   matchMap.put("&phi;", "??");
        matchMap.put("&#967;", "??");   matchMap.put("&chi;", "??");
        matchMap.put("&#968;", "??");   matchMap.put("&psi;", "??");
        matchMap.put("&#969;", "??");   matchMap.put("&omega;", "??");
        matchMap.put("&#977;", "??");   matchMap.put("&thetasym;", "??");
        matchMap.put("&#978;", "??");   matchMap.put("&upsih;", "??");
        matchMap.put("&#982;", "??");   matchMap.put("&piv;", "??");
        //Some Other Entities Supported by HTML
        matchMap.put("&#338;", "??");   matchMap.put("&OElig;", "??");
        matchMap.put("&#339;", "??");   matchMap.put("&oelig;", "??");
        matchMap.put("&#352;", "??");   matchMap.put("&Scaron;", "??");
        matchMap.put("&#353;", "??");   matchMap.put("&scaron;", "??");
        matchMap.put("&#376;", "??");   matchMap.put("&Yuml;", "??");
        matchMap.put("&#402;", "??");   matchMap.put("&fnof;", "??");
        matchMap.put("&#710;", "??");   matchMap.put("&circ;", "??");
        matchMap.put("&#732;", "??");   matchMap.put("&tilde;", "??");
        matchMap.put("&#8194;", "???");   matchMap.put("&ensp;", "???");
        matchMap.put("&#8195;", "???");   matchMap.put("&emsp;", "???");
        matchMap.put("&#8201;", "???");   matchMap.put("&thinsp;", "???");
        matchMap.put("&#8204;", "???");   matchMap.put("&zwnj;", "???");
        matchMap.put("&#8205;", "???");   matchMap.put("&zwj;", "???");
        matchMap.put("&#8206;", "???");   matchMap.put("&lrm;", "???");
        matchMap.put("&#8207;", "???");   matchMap.put("&rlm;", "???");
        matchMap.put("&#8211;", "???");   matchMap.put("&ndash;", "???");
        matchMap.put("&#8212;", "???");   matchMap.put("&mdash;", "???");
        matchMap.put("&#8216;", "???");   matchMap.put("&lsquo;", "???");
        matchMap.put("&#8217;", "???");   matchMap.put("&rsquo;", "???");
        matchMap.put("&#8218;", "???");   matchMap.put("&sbquo;", "???");
        matchMap.put("&#8220;", "???");   matchMap.put("&ldquo;", "???");
        matchMap.put("&#8221;", "???");   matchMap.put("&rdquo;", "???");
        matchMap.put("&#8222;", "???");   matchMap.put("&bdquo;", "???");
        matchMap.put("&#8224;", "???");   matchMap.put("&dagger;", "???");
        matchMap.put("&#8225;", "???");   matchMap.put("&Dagger;", "???");
        matchMap.put("&#8226;", "???");   matchMap.put("&bull;", "???");
        matchMap.put("&#8230;", "???");   matchMap.put("&hellip;", "???");
        matchMap.put("&#8240;", "???");   matchMap.put("&permil;", "???");
        matchMap.put("&#8242;", "???");   matchMap.put("&prime;", "???");
        matchMap.put("&#8243;", "???");   matchMap.put("&Prime;", "???");
        matchMap.put("&#8249;", "???");   matchMap.put("&lsaquo;", "???");
        matchMap.put("&#8250;", "???");   matchMap.put("&rsaquo;", "???");
        matchMap.put("&#8254;", "???");   matchMap.put("&oline;", "???");
        matchMap.put("&#8364;", "???");   matchMap.put("&euro;", "???");
        matchMap.put("&#8482;", "???");   matchMap.put("&trade;", "???");
        matchMap.put("&#8592;", "???");   matchMap.put("&larr;", "???");
        matchMap.put("&#8593;", "???");   matchMap.put("&uarr;", "???");
        matchMap.put("&#8594;", "???");   matchMap.put("&rarr;", "???");
        matchMap.put("&#8595;", "???");   matchMap.put("&darr;", "???");
        matchMap.put("&#8596;", "???");   matchMap.put("&harr;", "???");
        matchMap.put("&#8629;", "???");   matchMap.put("&crarr;", "???");
        matchMap.put("&#8968;", "???");   matchMap.put("&lceil;", "???");
        matchMap.put("&#8969;", "???");   matchMap.put("&rceil;", "???");
        matchMap.put("&#8970;", "???");   matchMap.put("&lfloor;", "???");
        matchMap.put("&#8971;", "???");   matchMap.put("&rfloor;", "???");
        matchMap.put("&#9674;", "???");   matchMap.put("&loz;", "???");
        matchMap.put("&#9824;", "???");   matchMap.put("&spades;", "???");
        matchMap.put("&#9827;", "???");   matchMap.put("&clubs;", "???");
        matchMap.put("&#9829;", "???");   matchMap.put("&hearts;", "???");
        matchMap.put("&#9830;", "???");   matchMap.put("&diams;", "???");

        matchMap.put("&#44;", ",");        matchMap.put("&#47;", "/");

    }
    
    /**
     * URL???????????? ??????
     * 
     * @param urlPath
     * @return 
     * @return true:???????????? URL, false:???????????? ?????? URL
     */
    public boolean isUrlExist(String urlPath){
        boolean isExist = false;
        URL url = null;
        HttpURLConnection conn = null;
        String urlpath = urlPath;
        
        if( "".equals( EgovStringUtil.nullConvert(urlpath) ) || "9999".equals( EgovStringUtil.nullConvert(urlpath) ) ){
            isExist = false;
        } else {

            try {
                
                if( !urlpath.startsWith("http://") && !urlpath.startsWith("https://") ){
                	urlpath = "http://" + urlpath;
                } 
                
                if( urlpath.startsWith("https://") ){
                	urlpath = urlPath.replace("https://", "http://");
                }
                
                url = new URL( urlpath );
                
                conn = (HttpURLConnection) url.openConnection();
                conn.connect();
                
                if( conn.getResponseCode() == 200 ){
                    isExist = true;
                } else {
                    isExist = false;
                }
                
            } catch (MalformedURLException e) {
                isExist = false;
            } catch (IOException e) {
                isExist = false;
            } finally {
                conn.disconnect();
            }
        }
        
        return isExist;
    }

}