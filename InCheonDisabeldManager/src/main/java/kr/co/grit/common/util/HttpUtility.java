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
     * RequestURI를 이용해 해당 JSP URL을 추출
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
     * RequestURI를 이용해 해당 JSP URL을 추출(모바일용 추가)
     * 작성자 : 최정우
     */
    public String getReturnUrlM(HttpServletRequest request) throws Exception {
        return getReturnUrl(request, ".m");
    }
    public static String returnProcUrlM(String val) throws Exception {
        return "/" + val + ".m";
    }

    //더보기
    public String getReturnUrlMJ(HttpServletRequest request) throws Exception {
        return getReturnUrl(request, ".json");
    }


    /**
     * 세션 개체 호출
     */
    public String getSessionAtt(HttpServletRequest request, String key, String sessionNm) throws Exception {
//        if( null  == request.getSession().getAttribute(sessionNm)) {
//            throw new HttpSessionRequiredException("로그인세션이 종료 되었습니다. 다시 로그인 해 주세요.");
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
            throw new HttpSessionRequiredException("로그인 세션이 종료 되었습니다. 다시 로그인 해 주세요.");
        }
        
        return session.getUserInfoVO();
        
    }
    
    public CommonUserSessionVO getSession(HttpServletRequest request, String id) throws Exception {
        
    	CommonUserSessionVO session = (CommonUserSessionVO)request.getSession().getAttribute(id);
        
        if(session == null){
            throw new HttpSessionRequiredException("로그인 세션이 종료 되었습니다. 다시 로그인 해 주세요.");
        }
        
        return session;
        
    }
    
    

    /**
     * 모바일 전자정부 쿠키 SET
     */
//    public static void setMoblieCookie(HttpServletResponse response, String key) throws Exception {
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();    // 쿠키명 설정
//        Cookie cookie = new Cookie(cookieName, key.replaceAll("\r", "").replaceAll("\n", ""));    // 쿠키 생성 한다. Value에 어떤 값을 넣을지 미정(현재 ID)
//        cookie.setPath("/");
//        cookie.setDomain(BaseUtils.getConfiguration("SSO.COOKIE.domain"));    // 임시 URL 차후 도메인 확정시 변경
//        cookie.setMaxAge(-1);    // 브라우저 종료시 쿠키삭제
//        cookie.setVersion(0);    //브라우저의 호완성을 최대로 하기 위해서 0로 설정 함
//          // HTTPS Secure 반드시 처리 해야 한다. 쿠키 암호화
//        cookie.setSecure(true);
//        response.addCookie(cookie);    // 쿠키 저장
//    }

    /**
     * 모바일 전자정부 쿠키 GET
     */
//    public static String getMoblieCookie(HttpServletRequest request) throws Exception {
//        // boolean login = false;
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();   // // 쿠키명 설정
//        Cookie cookies[] = request.getCookies();
//        Cookie getCookie = null;
//
//        //System.out.print("aaaaaaaaaaaaaaaaaaaaa==>"+cookieName);
//
//        if (cookies != null) {
//            for( int i = 0 ; i < cookies.length ; i++) {
//                //System.out.print("getCookie==>"+cookies[i].getName());
//                if (cookies[i].getName().equals(cookieName)) {// 쿠키명으로 검색
//                    getCookie = cookies[i];
//                    return getCookie.getValue();
//                }
//            }
//        }
//
//        return "";
//    }

    /**
     * 모바일 전자정부 쿠키삭제
     */
//    public static void deleteMoblieCookie(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String cookieName = BaseUtils.getConfiguration("SSO.COOKIE.name").trim();    // 쿠키명 설정
//        Cookie cookies[] = request.getCookies();
//        // Cookie getCookie = null;
//
//        if (cookies != null) {
//            for( int i = 0 ; i < cookies.length ; i++) {
//                if (cookies[i].getName().equals(cookieName)) {// 쿠키명으로 검색
//                    cookies[i].setPath("/");
//                    cookies[i].setDomain(BaseUtils.getConfiguration("SSO.COOKIE.domain"));
//                    cookies[i].setMaxAge(0);
//                    response.addCookie(cookies[i]);
//                    /*
//                    Cookie cookie = new Cookie(cookieName, null);    // 쿠키 생성 한다. Value에 어떤 값을 넣을지 미정(현재 ID)
//                    cookie.setDomain(EgovProperties.getProperty("SSO.COOKIE.domain"));
//                    cookie.setMaxAge(0);
//                    response.addCookie(cookie);
//                    */
//                }
//            }
//        }
//    }

    /**
     * 태그제거
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
        if (null == content) { return null; } //null일경우 리턴

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
        matchMap.put("&#39;", "’");   matchMap.put("&apos; (does not work in IE)", "’");
        matchMap.put("&#38;", "&");   matchMap.put("&amp;", "&");
        matchMap.put("&#60;", "<");   matchMap.put("&lt;", "<");
        matchMap.put("&#62;", ">");   matchMap.put("&gt;", ">");

        //ISO 8859-1 Symbol Entities
        matchMap.put("&#160;", " ");   matchMap.put("&nbsp;", " ");
        matchMap.put("&#161;", "¡");   matchMap.put("&iexcl;", "¡");
        matchMap.put("&#162;", "¢");   matchMap.put("&cent;", "¢");
        matchMap.put("&#163;", "£");   matchMap.put("&pound;", "£");
        matchMap.put("&#164;", "¤");   matchMap.put("&curren;", "¤");
        matchMap.put("&#165;", "¥");   matchMap.put("&yen;", "¥");
        matchMap.put("&#166;", "¦");   matchMap.put("&brvbar;", "¦");
        matchMap.put("&#167;", "§");   matchMap.put("&sect;", "§");
        matchMap.put("&#168;", "¨");   matchMap.put("&uml;", "¨");
        matchMap.put("&#169;", "©");   matchMap.put("&copy;", "©");
        matchMap.put("&#170;", "ª");   matchMap.put("&ordf;", "ª");
        matchMap.put("&#171;", "«");   matchMap.put("&laquo;", "«");
        matchMap.put("&#172;", "¬");   matchMap.put("&not;", "¬");
        matchMap.put("&#173;", "");   matchMap.put("&shy;", "");
        matchMap.put("&#174;", "®");   matchMap.put("&reg;", "®");
        matchMap.put("&#175;", "¯");   matchMap.put("&macr;", "¯");
        matchMap.put("&#176;", "°");   matchMap.put("&deg;", "°");
        matchMap.put("&#177;", "±");   matchMap.put("&plusmn;", "±");
        matchMap.put("&#178;", "²");   matchMap.put("&sup2;", "²");
        matchMap.put("&#179;", "³");   matchMap.put("&sup3;", "³");
        matchMap.put("&#180;", "´");   matchMap.put("&acute;", "´");
        matchMap.put("&#181;", "µ");   matchMap.put("&micro;", "µ");
        matchMap.put("&#182;", "¶");   matchMap.put("&para;", "¶");
        matchMap.put("&#183;", "·");   matchMap.put("&middot;", "·");
        matchMap.put("&#184;", "¸");   matchMap.put("&cedil;", "¸");
        matchMap.put("&#185;", "¹");   matchMap.put("&sup1;", "¹");
        matchMap.put("&#186;", "º");   matchMap.put("&ordm;", "º");
        matchMap.put("&#187;", "»");   matchMap.put("&raquo;", "»");
        matchMap.put("&#188;", "¼");   matchMap.put("&frac14;", "¼");
        matchMap.put("&#189;", "½");   matchMap.put("&frac12;", "½");
        matchMap.put("&#190;", "¾");   matchMap.put("&frac34;", "¾");
        matchMap.put("&#191;", "¿");   matchMap.put("&iquest;", "¿");
        matchMap.put("&#215;", "×");   matchMap.put("&times;", "×");
        matchMap.put("&#247;", "÷");   matchMap.put("&divide;", "÷");

        //ISO 8859-1 Character Entities
        matchMap.put("&#192;", "À");   matchMap.put("&Agrave;", "À");
        matchMap.put("&#193;", "Á");   matchMap.put("&Aacute;", "Á");
        matchMap.put("&#194;", "Â");   matchMap.put("&Acirc;", "Â");
        matchMap.put("&#195;", "Ã");   matchMap.put("&Atilde;", "Ã");
        matchMap.put("&#196;", "Ä");   matchMap.put("&Auml;", "Ä");
        matchMap.put("&#197;", "Å");   matchMap.put("&Aring;", "Å");
        matchMap.put("&#198;", "Æ");   matchMap.put("&AElig;", "Æ");
        matchMap.put("&#199;", "Ç");   matchMap.put("&Ccedil;", "Ç");
        matchMap.put("&#200;", "È");   matchMap.put("&Egrave;", "È");
        matchMap.put("&#201;", "É");   matchMap.put("&Eacute;", "É");
        matchMap.put("&#202;", "Ê");   matchMap.put("&Ecirc;", "Ê");
        matchMap.put("&#203;", "Ë");   matchMap.put("&Euml;", "Ë");
        matchMap.put("&#204;", "Ì");   matchMap.put("&Igrave;", "Ì");
        matchMap.put("&#205;", "Í");   matchMap.put("&Iacute;", "Í");
        matchMap.put("&#206;", "Î");   matchMap.put("&Icirc;", "Î");
        matchMap.put("&#207;", "Ï");   matchMap.put("&Iuml;", "Ï");
        matchMap.put("&#208;", "Ð");   matchMap.put("&ETH;", "Ð");
        matchMap.put("&#209;", "Ñ");   matchMap.put("&Ntilde;", "Ñ");
        matchMap.put("&#210;", "Ò");   matchMap.put("&Ograve;", "Ò");
        matchMap.put("&#211;", "Ó");   matchMap.put("&Oacute;", "Ó");
        matchMap.put("&#212;", "Ô");   matchMap.put("&Ocirc;", "Ô");
        matchMap.put("&#213;", "Õ");   matchMap.put("&Otilde;", "Õ");
        matchMap.put("&#214;", "Ö");   matchMap.put("&Ouml;", "Ö");
        matchMap.put("&#216;", "Ø");   matchMap.put("&Oslash;", "Ø");
        matchMap.put("&#217;", "Ù");   matchMap.put("&Ugrave;", "Ù");
        matchMap.put("&#218;", "Ú");   matchMap.put("&Uacute;", "Ú");
        matchMap.put("&#219;", "Û");   matchMap.put("&Ucirc;", "Û");
        matchMap.put("&#220;", "Ü");   matchMap.put("&Uuml;", "Ü");
        matchMap.put("&#221;", "Ý");   matchMap.put("&Yacute;", "Ý");
        matchMap.put("&#222;", "Þ");   matchMap.put("&THORN;", "Þ");
        matchMap.put("&#223;", "ß");   matchMap.put("&szlig;", "ß");
        matchMap.put("&#224;", "à");   matchMap.put("&agrave;", "à");
        matchMap.put("&#225;", "á");   matchMap.put("&aacute;", "á");
        matchMap.put("&#226;", "â");   matchMap.put("&acirc;", "â");
        matchMap.put("&#227;", "ã");   matchMap.put("&atilde;", "ã");
        matchMap.put("&#228;", "ä");   matchMap.put("&auml;", "ä");
        matchMap.put("&#229;", "å");   matchMap.put("&aring;", "å");
        matchMap.put("&#230;", "æ");   matchMap.put("&aelig;", "æ");
        matchMap.put("&#231;", "ç");   matchMap.put("&ccedil;", "ç");
        matchMap.put("&#232;", "è");   matchMap.put("&egrave;", "è");
        matchMap.put("&#233;", "é");   matchMap.put("&eacute;", "é");
        matchMap.put("&#234;", "ê");   matchMap.put("&ecirc;", "ê");
        matchMap.put("&#235;", "ë");   matchMap.put("&euml;", "ë");
        matchMap.put("&#236;", "ì");   matchMap.put("&igrave;", "ì");
        matchMap.put("&#237;", "í");   matchMap.put("&iacute;", "í");
        matchMap.put("&#238;", "î");   matchMap.put("&icirc;", "î");
        matchMap.put("&#239;", "ï");   matchMap.put("&iuml;", "ï");
        matchMap.put("&#240;", "ð");   matchMap.put("&eth;", "ð");
        matchMap.put("&#241;", "ñ");   matchMap.put("&ntilde;", "ñ");
        matchMap.put("&#242;", "ò");   matchMap.put("&ograve;", "ò");
        matchMap.put("&#243;", "ó");   matchMap.put("&oacute;", "ó");
        matchMap.put("&#244;", "ô");   matchMap.put("&ocirc;", "ô");
        matchMap.put("&#245;", "õ");   matchMap.put("&otilde;", "õ");
        matchMap.put("&#246;", "ö");   matchMap.put("&ouml;", "ö");
        matchMap.put("&#248;", "ø");   matchMap.put("&oslash;", "ø");
        matchMap.put("&#249;", "ù");   matchMap.put("&ugrave;", "ù");
        matchMap.put("&#250;", "ú");   matchMap.put("&uacute;", "ú");
        matchMap.put("&#251;", "û");   matchMap.put("&ucirc;", "û");
        matchMap.put("&#252;", "ü");   matchMap.put("&uuml;", "ü");
        matchMap.put("&#253;", "ý");   matchMap.put("&yacute;", "ý");
        matchMap.put("&#254;", "þ");   matchMap.put("&thorn;", "þ");
        matchMap.put("&#255;", "ÿ");   matchMap.put("&yuml;", "ÿ");

        //Math Symbols Supported by HTML
        matchMap.put("&#8704;", "∀");   matchMap.put("&forall;", "∀");
        matchMap.put("&#8706;", "∂");   matchMap.put("&part;", "∂");
        matchMap.put("&#8707;", "∃");   matchMap.put("&exists;", "∃");
        matchMap.put("&#8709;", "∅");   matchMap.put("&empty;", "∅");
        matchMap.put("&#8711;", "∇");   matchMap.put("&nabla;", "∇");
        matchMap.put("&#8712;", "∈");   matchMap.put("&isin;", "∈");
        matchMap.put("&#8713;", "∉");   matchMap.put("&notin;", "∉");
        matchMap.put("&#8715;", "∋");   matchMap.put("&ni;", "∋");
        matchMap.put("&#8719;", "∏");   matchMap.put("&prod;", "∏");
        matchMap.put("&#8721;", "∑");   matchMap.put("&sum;", "∑");
        matchMap.put("&#8722;", "−");   matchMap.put("&minus;", "−");
        matchMap.put("&#8727;", "∗");   matchMap.put("&lowast;", "∗");
        matchMap.put("&#8730;", "√");   matchMap.put("&radic;", "√");
        matchMap.put("&#8733;", "∝");   matchMap.put("&prop;", "∝");
        matchMap.put("&#8734;", "∞");   matchMap.put("&infin;", "∞");
        matchMap.put("&#8736;", "∠");   matchMap.put("&ang;", "∠");
        matchMap.put("&#8743;", "∧");   matchMap.put("&and;", "∧");
        matchMap.put("&#8744;", "∨");   matchMap.put("&or;", "∨");
        matchMap.put("&#8745;", "∩");   matchMap.put("&cap;", "∩");
        matchMap.put("&#8746;", "∪");   matchMap.put("&cup;", "∪");
        matchMap.put("&#8747;", "∫");   matchMap.put("&int;", "∫");
        matchMap.put("&#8756;", "∴");   matchMap.put("&there4;", "∴");
        matchMap.put("&#8764;", "∼");   matchMap.put("&sim;", "∼");
        matchMap.put("&#8773;", "≅");   matchMap.put("&cong;", "≅");
        matchMap.put("&#8776;", "≈");   matchMap.put("&asymp;", "≈");
        matchMap.put("&#8800;", "≠");   matchMap.put("&ne;", "≠");
        matchMap.put("&#8801;", "≡");   matchMap.put("&equiv;", "≡");
        matchMap.put("&#8804;", "≤");   matchMap.put("&le;", "≤");
        matchMap.put("&#8805;", "≥");   matchMap.put("&ge;", "≥");
        matchMap.put("&#8834;", "⊂");   matchMap.put("&sub;", "⊂");
        matchMap.put("&#8835;", "⊃");   matchMap.put("&sup;", "⊃");
        matchMap.put("&#8836;", "⊄");   matchMap.put("&nsub;", "⊄");
        matchMap.put("&#8838;", "⊆");   matchMap.put("&sube;", "⊆");
        matchMap.put("&#8839;", "⊇");   matchMap.put("&supe;", "⊇");
        matchMap.put("&#8853;", "⊕");   matchMap.put("&oplus;", "⊕");
        matchMap.put("&#8855;", "⊗");   matchMap.put("&otimes;", "⊗");
        matchMap.put("&#8869;", "⊥");   matchMap.put("&perp;", "⊥");
        matchMap.put("&#8901;", "⋅");   matchMap.put("&sdot;", "⋅");

        //Greek Letters Supported by HTML
        matchMap.put("&#913;", "Α");   matchMap.put("&Alpha;", "Α");
        matchMap.put("&#914;", "Β");   matchMap.put("&Beta;", "Β");
        matchMap.put("&#915;", "Γ");   matchMap.put("&Gamma;", "Γ");
        matchMap.put("&#916;", "Δ");   matchMap.put("&Delta;", "Δ");
        matchMap.put("&#917;", "Ε");   matchMap.put("&Epsilon;", "Ε");
        matchMap.put("&#918;", "Ζ");   matchMap.put("&Zeta;", "Ζ");
        matchMap.put("&#919;", "Η");   matchMap.put("&Eta;", "Η");
        matchMap.put("&#920;", "Θ");   matchMap.put("&Theta;", "Θ");
        matchMap.put("&#921;", "Ι");   matchMap.put("&Iota;", "Ι");
        matchMap.put("&#922;", "Κ");   matchMap.put("&Kappa;", "Κ");
        matchMap.put("&#923;", "Λ");   matchMap.put("&Lambda;", "Λ");
        matchMap.put("&#924;", "Μ");   matchMap.put("&Mu;", "Μ");
        matchMap.put("&#925;", "Ν");   matchMap.put("&Nu;", "Ν");
        matchMap.put("&#926;", "Ξ");   matchMap.put("&Xi;", "Ξ");
        matchMap.put("&#927;", "Ο");   matchMap.put("&Omicron;", "Ο");
        matchMap.put("&#928;", "Π");   matchMap.put("&Pi;", "Π");
        matchMap.put("&#929;", "Ρ");   matchMap.put("&Rho;", "Ρ");
        matchMap.put("&#931;", "Σ");   matchMap.put("&Sigma;", "Σ");
        matchMap.put("&#932;", "Τ");   matchMap.put("&Tau;", "Τ");
        matchMap.put("&#933;", "Υ");   matchMap.put("&Upsilon;", "Υ");
        matchMap.put("&#934;", "Φ");   matchMap.put("&Phi;", "Φ");
        matchMap.put("&#935;", "Χ");   matchMap.put("&Chi;", "Χ");
        matchMap.put("&#936;", "Ψ");   matchMap.put("&Psi;", "Ψ");
        matchMap.put("&#937;", "Ω");   matchMap.put("&Omega;", "Ω");
        matchMap.put("&#945;", "α");   matchMap.put("&alpha;", "α");
        matchMap.put("&#946;", "β");   matchMap.put("&beta;", "β");
        matchMap.put("&#947;", "γ");   matchMap.put("&gamma;", "γ");
        matchMap.put("&#948;", "δ");   matchMap.put("&delta;", "δ");
        matchMap.put("&#949;", "ε");   matchMap.put("&epsilon;", "ε");
        matchMap.put("&#950;", "ζ");   matchMap.put("&zeta;", "ζ");
        matchMap.put("&#951;", "η");   matchMap.put("&eta;", "η");
        matchMap.put("&#952;", "θ");   matchMap.put("&theta;", "θ");
        matchMap.put("&#953;", "ι");   matchMap.put("&iota;", "ι");
        matchMap.put("&#954;", "κ");   matchMap.put("&kappa;", "κ");
        matchMap.put("&#955;", "λ");   matchMap.put("&lambda;", "λ");
        matchMap.put("&#956;", "μ");   matchMap.put("&mu;", "μ");
        matchMap.put("&#957;", "ν");   matchMap.put("&nu;", "ν");
        matchMap.put("&#958;", "ξ");   matchMap.put("&xi;", "ξ");
        matchMap.put("&#959;", "ο");   matchMap.put("&omicron;", "ο");
        matchMap.put("&#960;", "π");   matchMap.put("&pi;", "π");
        matchMap.put("&#961;", "ρ");   matchMap.put("&rho;", "ρ");
        matchMap.put("&#962;", "ς");   matchMap.put("&sigmaf;", "ς");
        matchMap.put("&#963;", "σ");   matchMap.put("&sigma;", "σ");
        matchMap.put("&#964;", "τ");   matchMap.put("&tau;", "τ");
        matchMap.put("&#965;", "υ");   matchMap.put("&upsilon;", "υ");
        matchMap.put("&#966;", "φ");   matchMap.put("&phi;", "φ");
        matchMap.put("&#967;", "χ");   matchMap.put("&chi;", "χ");
        matchMap.put("&#968;", "ψ");   matchMap.put("&psi;", "ψ");
        matchMap.put("&#969;", "ω");   matchMap.put("&omega;", "ω");
        matchMap.put("&#977;", "ϑ");   matchMap.put("&thetasym;", "ϑ");
        matchMap.put("&#978;", "ϒ");   matchMap.put("&upsih;", "ϒ");
        matchMap.put("&#982;", "ϖ");   matchMap.put("&piv;", "ϖ");
        //Some Other Entities Supported by HTML
        matchMap.put("&#338;", "Œ");   matchMap.put("&OElig;", "Œ");
        matchMap.put("&#339;", "œ");   matchMap.put("&oelig;", "œ");
        matchMap.put("&#352;", "Š");   matchMap.put("&Scaron;", "Š");
        matchMap.put("&#353;", "š");   matchMap.put("&scaron;", "š");
        matchMap.put("&#376;", "Ÿ");   matchMap.put("&Yuml;", "Ÿ");
        matchMap.put("&#402;", "ƒ");   matchMap.put("&fnof;", "ƒ");
        matchMap.put("&#710;", "ˆ");   matchMap.put("&circ;", "ˆ");
        matchMap.put("&#732;", "˜");   matchMap.put("&tilde;", "˜");
        matchMap.put("&#8194;", " ");   matchMap.put("&ensp;", " ");
        matchMap.put("&#8195;", " ");   matchMap.put("&emsp;", " ");
        matchMap.put("&#8201;", " ");   matchMap.put("&thinsp;", " ");
        matchMap.put("&#8204;", "‌");   matchMap.put("&zwnj;", "‌");
        matchMap.put("&#8205;", "‍");   matchMap.put("&zwj;", "‍");
        matchMap.put("&#8206;", "‎");   matchMap.put("&lrm;", "‎");
        matchMap.put("&#8207;", "‏");   matchMap.put("&rlm;", "‏");
        matchMap.put("&#8211;", "–");   matchMap.put("&ndash;", "–");
        matchMap.put("&#8212;", "—");   matchMap.put("&mdash;", "—");
        matchMap.put("&#8216;", "‘");   matchMap.put("&lsquo;", "‘");
        matchMap.put("&#8217;", "’");   matchMap.put("&rsquo;", "’");
        matchMap.put("&#8218;", "‚");   matchMap.put("&sbquo;", "‚");
        matchMap.put("&#8220;", "“");   matchMap.put("&ldquo;", "“");
        matchMap.put("&#8221;", "”");   matchMap.put("&rdquo;", "”");
        matchMap.put("&#8222;", "„");   matchMap.put("&bdquo;", "„");
        matchMap.put("&#8224;", "†");   matchMap.put("&dagger;", "†");
        matchMap.put("&#8225;", "‡");   matchMap.put("&Dagger;", "‡");
        matchMap.put("&#8226;", "•");   matchMap.put("&bull;", "•");
        matchMap.put("&#8230;", "…");   matchMap.put("&hellip;", "…");
        matchMap.put("&#8240;", "‰");   matchMap.put("&permil;", "‰");
        matchMap.put("&#8242;", "′");   matchMap.put("&prime;", "′");
        matchMap.put("&#8243;", "″");   matchMap.put("&Prime;", "″");
        matchMap.put("&#8249;", "‹");   matchMap.put("&lsaquo;", "‹");
        matchMap.put("&#8250;", "›");   matchMap.put("&rsaquo;", "›");
        matchMap.put("&#8254;", "‾");   matchMap.put("&oline;", "‾");
        matchMap.put("&#8364;", "€");   matchMap.put("&euro;", "€");
        matchMap.put("&#8482;", "™");   matchMap.put("&trade;", "™");
        matchMap.put("&#8592;", "←");   matchMap.put("&larr;", "←");
        matchMap.put("&#8593;", "↑");   matchMap.put("&uarr;", "↑");
        matchMap.put("&#8594;", "→");   matchMap.put("&rarr;", "→");
        matchMap.put("&#8595;", "↓");   matchMap.put("&darr;", "↓");
        matchMap.put("&#8596;", "↔");   matchMap.put("&harr;", "↔");
        matchMap.put("&#8629;", "↵");   matchMap.put("&crarr;", "↵");
        matchMap.put("&#8968;", "⌈");   matchMap.put("&lceil;", "⌈");
        matchMap.put("&#8969;", "⌉");   matchMap.put("&rceil;", "⌉");
        matchMap.put("&#8970;", "⌊");   matchMap.put("&lfloor;", "⌊");
        matchMap.put("&#8971;", "⌋");   matchMap.put("&rfloor;", "⌋");
        matchMap.put("&#9674;", "◊");   matchMap.put("&loz;", "◊");
        matchMap.put("&#9824;", "♠");   matchMap.put("&spades;", "♠");
        matchMap.put("&#9827;", "♣");   matchMap.put("&clubs;", "♣");
        matchMap.put("&#9829;", "♥");   matchMap.put("&hearts;", "♥");
        matchMap.put("&#9830;", "♦");   matchMap.put("&diams;", "♦");

        matchMap.put("&#44;", ",");        matchMap.put("&#47;", "/");

    }
    
    /**
     * URL존재여부 체크
     * 
     * @param urlPath
     * @return 
     * @return true:존재하는 URL, false:존재하지 않는 URL
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