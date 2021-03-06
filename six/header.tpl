<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title> -->
    <title>天行VPN官网</title>
    <meta name="keywords" content="天行VPN,天行,官网,天行PRO">
    <meta name="description" content="天行PRO网络加速器，相比第一代天行VPN，安全性更高，稳定性更强，速度更快。多平台兼容，扫二维码自动设置，无需手动配置。提供美国、日本、香港等多条线路。给您科学上网新体验！">
    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body>

  <div class="alert alert-warning alert-top-warning">
    近期受相关政策影响，大量VPN产品已无法使用。为保证天行Pro产品能够正常使用，本站开通账户需客服人工审核开通，账户开通会有延迟，给您带来的不便，本站深表歉意。如遇问题请<a href="/submitticket.php?step=2&deptid=1">提交工单</a>，我们会第一时间为您解决。 —— 天行Pro客服中心。
  </div>
  <header>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar-collapse" aria-expanded="false">
                <span class="sr-only">显示导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
              天行VPN <sup>Pro</sup>
              <!-- <img src="{$WEB_ROOT}/templates/{$template}/images/logo.png" alt="天行VPN"> -->
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="header-navbar-collapse">
          <ul class="nav navbar-nav">
              <li class="{if $templatefile eq 'homepage'}active{/if}"><a href="/">首页</a></li>
              <li class="{if $templatefile eq 'products'}active{/if}"><a rel="nofollow" href="/cart.php">购买服务</a></li>
              <li class=""><a href="/help">使用帮助</a></li>
              <li class="{if $templatefile eq 'supportticketsubmit-steptwo'}active{/if}"><a rel="nofollow" href="/submitticket.php?step=2&deptid=1">联系我们</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right nav-links">
            {if $languagechangeenabled && count($locales) > 1}
              <li>
                <a href="javascript:;" class="quick-nav" data-toggle="popover" id="languageChooser"><i class="fa fa-language"></i> {$LANG.chooselanguage} <span class="caret"></span></a>
                <div id="languageChooserContent" class="hidden">
                    <ul>
                        {foreach from=$locales item=locale}
                            <li><a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
                        {/foreach}
                    </ul>
                </div>
              </li>
            {/if}
            <!-- Login/Account Notifications -->
            {if $loggedin}
              <li>
                <a href="javascript:;" class="quick-nav" data-toggle="popover" id="accountNotifications" data-placement="bottom" title="{lang key="notifications"}"><i class="fa fa-info"></i> {$LANG.notifications} ({$clientAlerts|count})</a>
                <div id="accountNotificationsContent" class="hidden">
                    {foreach $clientAlerts as $alert}
                        <div class="clientalert text-{$alert->getSeverity()}">{$alert->getMessage()}{if $alert->getLinkText()} <a href="{$alert->getLink()}" class="btn btn-xs btn-{$alert->getSeverity()}">{$alert->getLinkText()}</a>{/if}</div>
                    {foreachelse}
                        <div class="clientalert text-success"><i class="fa fa-check-square-o"></i> {$LANG.notificationsnone}</div>
                    {/foreach}
                </div>
              </li>
            {else}
              <li>
                <a href="javascript:;" class="quick-nav" data-toggle="popover" id="loginOrRegister" data-placement="bottom"><i class="fa fa-user"></i> {$LANG.login}</a>
                <div id="loginOrRegisterContent" class="hidden">
                    <form class="login-form" action="{if $systemsslurl}{$systemsslurl}{else}{$systemurl}{/if}dologin.php" method="post" role="form">
                        <div class="form-group">
                            <input type="email" name="username" class="form-control" placeholder="{$LANG.clientareaemail}" required />
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" name="password" class="form-control" placeholder="{$LANG.loginpassword}" autocomplete="off" required />
                                <span class="input-group-btn">
                                    <input type="submit" class="btn btn-primary" value="{$LANG.login}" />
                                </span>
                            </div>
                        </div>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="rememberme" /> {$LANG.loginrememberme} &bull; <a href="{$WEB_ROOT}/pwreset.php">{$LANG.forgotpw}</a>
                        </label>
                    </form>
                    {if $condlinks.allowClientRegistration}
                        <hr />
                        {$LANG.newcustomersignup|sprintf2:"<a href=\"$WEB_ROOT/register.php\">":"</a>"}
                    {/if}
                </div>
              </li>
            {/if}
            {if $loggedin}
            <li>
              {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
              <!-- 用户 end -->
            </li>
            {/if}
            <li>
              <!-- Shopping Cart -->
              <a href="{$WEB_ROOT}/cart.php?a=view" class="quick-nav"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">{$LANG.viewcart} (</span><span id="cartItemCount">{$cartitemcount}</span><span class="hidden-xs">)</span></a>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>

{$headeroutput}

{if $templatefile eq 'clientareadetails' || $templatefile eq 'clientareahome' || $templatefile eq 'clientareaproducts' || $templatefile eq 'clientareainvoices' || $templatefile eq 'clientareaquotes' || $templatefile eq 'masspay' || $templatefile eq 'supportticketslist' || $templatefile eq 'viewticket' || $templatefile eq 'announcements' || $templatefile eq 'knowledgebase' || $templatefile eq 'downloads' || $templatefile eq 'serverstatus' || $templatefile eq 'supportticketsubmit-steptwo' || $templatefile eq 'clientareacontacts' || $templatefile eq 'clientareachangepw' || $templatefile eq 'clientareaemails'}
<section id="main-menu">

    <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
              </ul>
            </div>
        </div>
    </nav>

</section>
{/if}
