<!doctype html>
<!--[if IE 8]> <html lang="en-US" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en-US" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en-US" class="no-js">
<!--<![endif]-->
<head>
    {%- set url = url(), theme = session.get('identity-theme') -%}

    {%- if noindex is defined and noindex is true -%}
        {%- include "include/noindex-meta.volt" -%}
    {%- else -%}
        {%- include "include/meta.volt" -%}
    {%- endif -%}

    {%- include "include/icons.volt" -%}

    {%- if (not(config.analytics is empty)) -%}
        {%- include "include/analytics.volt" -%}
    {%- endif -%}

    {#- CSS resources from jsdelivr cannot be combined due to Bootstrap icons -#}
    {{- stylesheet_link("//cdn.jsdelivr.net/bootstrap/3.3.7/css/bootstrap.min.css", false) -}}
    {{- stylesheet_link("//cdn.jsdelivr.net/prettify/0.1/prettify.css", false) -}}

    {%- if theme == 'L' -%}
        {{- stylesheet_link("css/theme-white.css?v=" ~ forum_version(), true) -}}
    {%- else -%}
        {{- stylesheet_link("css/theme.css?v=" ~ forum_version(), true) -}}
    {%- endif -%}

    {{- stylesheet_link("css/editor.css?v=" ~ forum_version(), true) -}}
    {{- stylesheet_link("css/fonts.css?v=" ~ forum_version(), true) -}}
    {{- stylesheet_link("css/octicons.css?v=" ~ forum_version(), true) -}}
    {{- stylesheet_link("css/diff.css?v=" ~ forum_version(), true) -}}
    {{- stylesheet_link("css/style.css?v=" ~ forum_version(), true) -}}

    {#- reCaptcha -#}
    {%- if recaptcha.isEnabled() -%}
        {{- recaptcha.getJs() -}}
    {%- endif -%}

    <title>{{ get_title(false) ~ ' - ' ~ config.site.name }}</title>
</head>
<body class="with-top-navbar">
    {{ content() }}
    <script type="text/javascript" src="//cdn.jsdelivr.net/g/jquery@2.2.4,bootstrap@3.3.7,prettify@0.1(prettify.js+lang-css.js+lang-sql.js+lang-yaml.js)"></script>
    {{ javascript_include("js/editor.js?v=" ~ forum_version()) }}
    {{ javascript_include("js/forum.js?v=" ~ forum_version()) }}

    <script type="text/javascript">Forum.initializeView('{{ url() }}');</script>
</body>
</html>
