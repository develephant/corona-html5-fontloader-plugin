//-----------------------------------------------------------------------------
// HTML5 Custom Fonts Plugin
//-----------------------------------------------------------------------------
window.fonts_js = 
{
  load: function(fonts_tbl, debug) {
    var debug = debug;

    var families = [];

    var fontface = document.createElement('style');

    Object.keys(fonts_tbl).map((family) => {
      families.push("'"+family+"'");
      fontface.appendChild(
        document.createTextNode(
          "@font-face { font-family: '" + family + "'; src: url('" + fonts_tbl[family] + "'); }"
        )
      );
    });

    document.head.appendChild(fontface);

    var webfont_js = document.createElement('script');
    webfont_js.setAttribute('src', 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js')
    document.head.appendChild(webfont_js)

    var plugin = this;

    webfont_js.onload = function() {
      WebFontConfig = ({
        custom: {
          families: [families.join()]
        },
        loading: function() {
          plugin.dispatchEvent({name: 'loading'})
        },
        active: function() {
          plugin.dispatchEvent({name: 'ready'})
        },
        inactive: function() {
          plugin.dispatchEvent({name: 'failed'})
        },
        fontactive: function(familyName) {
          plugin.dispatchEvent({name: 'loaded', data: { family: familyName}})
        },
        fontinactive: function(familyName) {
          plugin.dispatchEvent({name: 'error', data: { family: familyName}})
        },
        classes: false
      })
      WebFont.load(WebFontConfig);
    }
  }
}