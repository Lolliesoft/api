<html>
<head>
    <script type="text/javascript" src="/button/flattr.js"></script>
    <script type="text/javascript">
        document.domain = 'flattr.com';

        function flattrClick(id, href) {

            var options = {
                onSuccess: function(buffer) {

                    var btn = window.parent.$(buffer);
                    var link = btn.find('a.flattr');
                    link.click(function() { openSubscribeOverlay(id); return false; });

                    window.parent.$('#flattr-'+ id).replaceWith(btn);
                },
                onFailure: function(status, data) {
                    data = window.parent.jQuery.parseJSON(data);

                    if (data.type == 'redirect') {
                        window.parent.location = data.url;
                        return;
                    }

                    if (data.type == 'reload') {
                        window.parent.location.reload();
                        return;
                    }

                    window.parent.Flattr.Dialog.show(data);
                }
            };

            if (!Ajax.request(href, options)) {
                var sPos, buttonKey = '';
                sPos = href.lastIndexOf('/');
                if (sPos != -1) {
                    buttonKey = '?'+ href.substring( sPos + 1 );
                }

                window.parent.location = 'https://flattr.com/login'+ buttonKey;
            }
        }

        function openSubscribeOverlay(id) {

            window.parent.Flattr.Subscribe.openOverlay(id);
        }
        
        function init() {
            window.parent.$('.flattr-button').each(function() {
                var id   = this.id.split('-')[1]; // This is the id of the scorebutton.. not the thing ID. We need the thing ID in subscribe.
                
                var link = window.parent.$(window.parent.$(this).find('a.flattr'));
                var href = link.attr('href');

                if (link.hasClass('flattr-ajax')) {
                    link.click(function() { flattrClick(id, href); return false; });
                } else if (link.hasClass('flattr-ed')) {
                    link.click(function() { openSubscribeOverlay(id); return false; });
                }
                
            });         
        }
        
        init();
    </script>
</head>
</html>
