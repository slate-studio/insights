module InsightsHelper
  def ga_charts_include_tag
    # Load Google Embed API
    # To embed Google Analytics charts
    # Embed API can not be loaded via Google API Loader.
    script = """(function(w,d,s,g,js,fs){
  g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(f){this.q.push(f);}};
  js=d.createElement(s);fs=d.getElementsByTagName(s)[0];
  js.src='https://apis.google.com/js/platform.js';
  fs.parentNode.insertBefore(js,fs);js.onload=function(){g.load('analytics');};
}(window,document,'script'));"""

    ga_access_token = GoogleService.new.access_token
    ga_table_id = Rails.application.secrets.ga_table_id

    callback_script = """window.GA_TABLE_ID = '#{ga_table_id}';
gapi.analytics.ready(function(){
  gapi.analytics.auth.authorize({
    'serverAuth': {'access_token': '#{ga_access_token}'}
  });
  startCharacter();
});"""

    [
      javascript_tag(script),
      javascript_tag(callback_script)
    ].join("\n").html_safe
  end
end
