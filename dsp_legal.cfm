<head>
<script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{
  if (theForm.terms.checked == false)
  {
    alert("Please READ & AGREE to the \"Terms and Conditions\".");
    theForm.terms.focus();
    return (false);
  }
  return (true);
}
//--></script>
</head>
<cfparam name="url.remind" default=0>
<table width="800" border="0" cellspacing="1" cellpadding="3">
  <tr>
    <td  align="left" colspan="2"><a href="#" onClick="history.go(-1)" class="tinylink2">Back</a></td>
  </tr>
  <cfif url.remind eq 1>
    <tr>
      <td  align="center" colspan="2" bgcolor="EDEAD6"><font color="red">***</font> Please accept the terms below in order to proceed. <font color="red">***</font></td>
    </tr>
  </cfif>
  <form action="index.cfm?fa=personal_questions" name="FrontPage_Form1" onsubmit="return FrontPage_Form1_Validator(this)" method="post">
    <tr>
      <td  align="left" valign="bottom"> 
      PLEASE READ THESE TERMS OF USE CAREFULLY BEFORE USING THIS WEBSITE.
        <br /><br />
        Last updated September 28, 2012<br />
         <br /><br />
        Chambers Bros. Entertainment, LLC. ("JSM," "we," "our" or "us"), provides the JumpStartMarketer.Com World Wide Web Site (the "Site," located at http://www.JumpStartMarketer.Com), together with the advertising and content on the Site and any related services (collectively, the "Services"), subject to your compliance with the terms and conditions set forth in this agreement ("Agreement"). By using the Site or the Services, you agree to be bound by these terms and conditions, our Privacy Policy, and any other agreement you are required to enter into with JSM in conjunction with your participation in the Site. If you do not agree to these terms and conditions, please do not use the Site or the Services. This Agreement is made between JSM and you, as a registered member or visitor ("you"). The words "you" or "your" shall also mean heirs, executors, administrators, successors and legal representatives. We reserve the right at any time to impose or change any fees or charges for use of the Site or Services, change the Site or the Services, including eliminating or discontinuing any content on or feature of any Site or change the terms of this Agreement. Any changes we make will be effective immediately on notice, which we may give by posting the revised Agreement on the Site. Your use of the Services after such notice will be deemed acceptance of such changes.
        While using the Site and/or Services, you agree to comply with all applicable laws, rules and regulations. We have no obligation to monitor the Site or any materials that you transmit to the Site (including, without limitation, any submission or other material) and we expressly reserve the right to remove any materials from the Site at any time for any reason without notice. You acknowledge and agree that we have the right to monitor the Site and the materials you transmit, from time to time, and to disclose any information (including your personally identifiable information) to any third party in order to operate the Site properly; to protect JSM, the Site, the Services, our sponsors, partners, affiliates, and our members and visitors; and to comply with any legal obligations, regulations, or governmental requests. JSM may condition your right to participate on the Site or in the Services on your furnishing to JSM and keeping updated at all times such personal identifying information as JSM may require.
        You may only have one active account on the Site at any given time and only you may use your designated account to access the Site (i.e., no member may have multiple accounts on the Site).
         <br /><br />
        RULES OF CONDUCT<br />
        While using the Site or the Services, you agree not to:
        Restrict or inhibit any other visitor or member from using the Site or the Services;
        Post or communicate any of visitor or member's real world information (name, address, account name, etc.) through the Site or the Services;
        Transmit any content or information that is unlawful, harmful, threatening, abusive, harassing, defamatory, libelous, vulgar, obscene, hateful, fraudulent or otherwise objectionable content, or infringes on our or any third party's intellectual property or other rights;
        Transmit any information, software, or other material that contains a virus, worm, time bomb or other harmful or disruptive component;
        Post or transmit chain letters or pyramid marketing schemes;
        Post or transmit unsolicited advertising, promotional materials, or other forms of solicitation;
        Modify, adapt, sublicense, translate, sell, reverse engineer, decompile or disassemble any portion of the Site, the Services, or the software underlying either of them, or modify any materials downloaded from the Site;
        Collect, harvest or disclose information about other Site visitors or members without their consent;
        Do any act which interferes with or slows the operation of the Site or the Services;
        Use any application or other device or process to retrieve, index or reproduce or circumvent the navigational structure or presentation of the Site, the Services or their contents; or
        Use the Site or Services for any unlawful purpose.
         <br /><br />
        PROPRIETARY RIGHTS<br />
        The Site and the Services are owned and operated by JSM and others pursuant to contractual arrangements. You acknowledge and agree that all content and materials available on the Site and in the Services are protected by copyrights, trademarks, service marks, patents, trade secrets, or other proprietary rights and laws. You agree not to sell, license, rent, modify, distribute, copy, reproduce, upload, post, transmit, publicly display, publicly perform, publish, adapt, edit, or create derivative works from such materials or content from the Site or the Services in any way. Modification or use of any materials contained on the Site or in the Services is a violation of JSM's copyright and other proprietary rights, and is strictly prohibited. You acknowledge that you do not acquire any ownership rights by using the Site or the Services. The following trademarks: JumpStart Marketer, and all associated logos, graphics, images and domain names, including, without limitation, JumpStartMarketer.com are the trade names, trademarks, service marks, logos, and/or domain names of JSM. You agree that you will not challenge the respective ownership rights of JSM or any third party in or to the JSM Marks or any third party marks, and that you will not register or attempt to register any trademark, service mark, logo, and/or domain name that is identical or confusingly similar to any of the JSM Marks or third party marks contained on the Site or in the Services.
         <br /><br />
        PRIVACY POLICY<br />
        We require you to read our Privacy Policy, which (in addition to this Agreement and any other agreement by which you may be bound) sets out how we collect and use any information you submit to JSM or through the Site or the Services. You must be at least 18 years old to register to use this Site or the Services.
         <br /><br />
        INTERNATIONAL USE<br />
        Unless otherwise specified, the materials on the Site and in the Services are presented solely for the purpose of promoting the business, information, and community resources and services available in, and other uses in, the United States of America. We control and operate the Site and the Services from within the United States. We make no representation that materials on the Site or the Services are appropriate or available for use in locations outside the United States, and accessing them from territories where their contents are illegal is prohibited. Those who choose to access the Site from other locations do so on their own initiative and are responsible for compliance with local laws.
         <br /><br />
        SUSPENSION AND TERMINATION<br />
        JSM reserves the right, in its sole discretion, to suspend or terminate your access to all or part of the Site or the Services, at any time, with or without notice.
         <br /><br />
        DISCLAIMERS<br />
        YOU EXPRESSLY AGREE THAT USE OF THE SITE AND THE SERVICES ARE AT YOUR SOLE RISK. THE SITE AND THE SERVICES ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS. 
        JSM MAKES NO WARRANTY THAT THE SITE OR THE SERVICES WILL MEET YOUR SYSTEM'S REQUIREMENTS, OR THAT THE SITE OR THE SERVICES (OR THE SERVERS THAT MAKE THEM AVAILABLE) WILL BE UNINTERRUPTED, TIMELY, SECURE, ERROR FREE OR FREE OF HARMFUL COMPONENTS; NOR DOES JSM MAKE ANY WARRANTY AS TO THE RESULTS THAT MAY BE OBTAINED FROM THE USE OF THE SITE OR THE SERVICES OR AS TO THE ACCURACY OR RELIABILITY OF ANY INFORMATION OBTAINED THROUGH THE SITE OR THE SERVICES OR THAT DEFECTS IN THE SITE OR THE SERVICES WILL BE CORRECTED.
        JSM EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. YOU UNDERSTAND AND AGREE THAT ANY MATERIAL AND/OR DATA DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF THE SITE OR THE SERVICES IS DONE AT YOUR OWN DISCRETION AND RISK AND THAT YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM OR LOSS OF DATA THAT RESULTS FROM THE DOWNLOAD OF SUCH MATERIAL AND/OR DATA.
        WITHOUT LIMITING THE GENERALITY OF THE FOREGOING, JSM DISCLAIMS ANY WARRANTY THAT ANY BUSINESS, PRODUCT, SERVICE, OR OTHER CONTENT ON THE SITE OR IN THE SERVICES IS APPROPRIATE FOR ANY PARTICULAR AUDIENCE OR READER, OR THAT SUCH MATERIAL IS FREE OF OFFENSIVE, INDECENT, OBSCENE, DEFAMATORY OR OTHER POTENTIALLY INAPPROPRIATE ELEMENTS. YOU ACKNOWLEDGE THAT WE DO NOT AND CANNOT REVIEW AND MONITOR CONTENT ON THE SITE OR IN THE SERVICES, AND YOU HEREBY AGREE THAT WE SHALL HAVE NO LIABILITY FOR ANY DAMAGES OR COSTS THAT MAY ARISE FROM OUR PUBLICATION OR YOUR VIEWING OR READING OF, EXPOSURE TO, OR ACCESS TO ANY BUSINESS, PRODUCT, SERVICE OR OTHER CONTENT ON THE SITE OR THE SERVICES.
        THE SITE AND SERVICES MAY CONTAIN LINKS TO THIRD-PARTY SITES. THOSE THIRD-PARTY SITES ARE NOT UNDER THE CONTROL OF JSM AND JSM IS NOT RESPONSIBLE FOR THE CONTENT ON ANY LINKED SITE. IF YOU ACCESS A THIRD-PARTY SITE FROM OUR SITE, THEN YOU DO SO AT YOUR OWN RISK. THE INCLUSION OF THE LINK DOES NOT IMPLY THAT WE ENDORSE OR ACCEPT ANY RESPONSIBILITY FOR THE CONTENT ON THOSE THIRD-PARTY SITES.
        JSM MAKES NO WARRANTY REGARDING ANY GOODS OR SERVICES PURCHASED OR OBTAINED THROUGH THE SITE OR THE SERVICES OR ANY TRANSACTIONS ENTERED INTO THROUGH THE SERVICE OR BY WAY OF THE SERVICES. NO ADVICE OR INFORMATION, WHETHER ORAL OR WRITTEN, OBTAINED BY YOU FROM JSM OR THROUGH THE SITE OR THE SERVICES SHALL CREATE ANY WARRANTY NOT EXPRESSLY MADE HEREIN.
        SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF CERTAIN WARRANTIES, SO SOME OF THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.
         <br /><br />
        LIMITATION OF LIABILITY<br />
        UNDER NO CIRCUMSTANCES SHALL JSM, ITS LICENSEES, SUCCESSORS, ASSIGNS, RELATED OR AFFILIATED ENTITIES, ADVERTISERS, SPONSORS, PROVIDERS, CONTRACTORS, CONSULTANTS OR PROFESSIONAL ADVISORS OR THE PARENT, SUBSIDIARY OR AFFILIATED COMPANIES OF EACH OF THEM AND ANY OF ITS OR THEIR EMPLOYEES, OFFICERS, DIRECTORS, MEMBERS, SHAREHOLDERS, REPRESENTATIVES OR AGENTS (THE "JSM PARTIES") BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES THAT RESULT FROM THE USE OF, OR INABILITY TO USE, THE SITE OR THE SERVICES. THIS LIMITATION APPLIES WHETHER THE ALLEGED LIABILITY IS BASED ON CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY, OR ANY OTHER BASIS, EVEN IF JSM HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. TO THE EXTENT SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, THE JSM PARTIES' LIABILITY IN SUCH JURISDICTIONS SHALL BE LIMITED TO THE EXTENT REQUIRED BY LAW.
         <br /><br />
        INDEMNIFICATION<br />
        You shall be fully responsible for any violation of this Agreement or of any other agreement between you and JSM (including, but not limited to, the Privacy Policy, and any other agreement). You agree to defend, indemnify, and hold harmless the JSM Parties from all liabilities, claims, and expenses, including attorneys' fees that arise from your use or misuse of the Site or the Services. JSM reserves the right to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will cooperate fully with JSM in asserting any available defenses.
         <br /><br />
        GOVERNING LAW<br />
        This Agreement, the Privacy Policy and any other agreement between you and JSM shall be governed by and construed in accordance with the laws of the State of California, United States of America, excluding its conflicts of law rules. In the event of any dispute arising out of or in connection with your use of the Site or the Services, such dispute shall be submitted to arbitration in the County of Los Angeles, State of California, United States of America in accordance with the rules and regulations of the American Arbitration Association then in effect (as amended herein), provided that said arbitration shall be heard before a single arbitrator, selected pursuant to such rules and regulations, and shall be conducted on an expedited basis and in confidence. Each party hereby waives any and all rights and benefits which it might otherwise have or be entitled to under United States federal law or the laws of the State of California, United States of America or any other state or country to litigate any such dispute in court, it being the intention of the parties to arbitrate, according to the provisions of this Agreement, all such disputes. The arbitrator's decision shall be controlled by the terms and conditions of this Agreement and any other agreements you may enter into with JSM, and shall be final and binding, and shall provide for each party to bear its own costs of arbitration and attorneys' fees. Each party expressly waives any right to a jury. Judgment upon the award of the arbitrator may be entered or enforced in any court of competent jurisdiction. If either party shall fail to appear at the hearing on the date designated in accordance with the rules of the American Arbitration Association, or shall otherwise fail to participate in the arbitration proceeding, the arbitrator is hereby empowered to proceed ex parte. In the event of any dispute concerning this Agreement or any other agreement between you and JSM, your sole and exclusive remedy shall be to seek damages pursuant to an arbitration authorized herein, and in no event will you be entitled to seek rescission, or injunctive or other equitable relief. If you do not agree to these requirements (or any other provision herein), do not use the Site or the Services.
         <br /><br />
        SEVERABILITY AND INTEGRATION<br />
        This Agreement, together with any agreement referred to herein (including the Privacy Policy) and any other agreement between you and JSM, constitutes the entire agreement between you and JSM with respect to the Site and the Services and supersedes all prior or contemporaneous communications and proposals (whether oral, written, or electronic) between you and JSM with respect to the Site and the Services. If any part of this Agreement is held invalid or unenforceable, that portion shall be construed in a manner consistent with applicable law to reflect, as nearly as possible, the original intentions of the parties, and the remaining portions shall remain in full force and effect.
         <br /><br />
        MISCELLANEOUS<br />
        This Agreement is not assignable or otherwise transferable by you, and any such transfer, assignment or sublicense shall be null and void. No agency, partnership, joint venture or employment relationship between you and JSM is intended or created by this Agreement. No waiver by either party of any breach or default hereunder shall be deemed to be a waiver of any preceding or subsequent breach or default. Any heading, caption or paragraph title contained in this Agreement is inserted only as a matter of convenience and in no way defines or explains any paragraph or provision hereof. Any notifications or other communications that we undertake to send to you hereunder will be deemed conclusively given if sent to the email address submitted as part of your registration with JSM. If such email address does not function, JSM will have no obligation to send you notifications or other communications by other means, notwithstanding that other contact information for you may be available to us. Your electronic consent to this Agreement (or to any other agreement between you and JSM), whether by clicking "I AGREE" or similar buttons provided in conjunction with any such agreement, your submission of any agreement with your initials and/or name entered into a box provided for that purpose together with the agreement, and/or your registration to use the Site or the Services governed by this Agreement, shall constitute your electronic signature and, according to the provisions of federal law (including, without limitation, copyright law), shall be of the same effect as if you had signed such agreement manually. Your access and use of the Site or the Services also constitutes your acceptance of this Agreement. Upon our request, you agree to sign a non-electronic version of this Agreement. A printed version of this Agreement and/or of any notice given in electronic form shall be admissible in judicial, administrative, or arbitration proceedings based upon or relating to this Agreement to the same extent and subject to the same conditions as other business documents and records originally generated and maintained in printed form. 
 <br /><br />        
        <font color="green">I accept the above terms and conditions</font>

<input type="checkbox" name="terms" value="yes"></td>
    </tr>
    <tr>
      <td align="center"><input type="submit" value="  Continue  "></td>
    </tr>
  </form>
</table>
