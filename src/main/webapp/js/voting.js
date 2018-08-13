$(function () {
    $(".owl-carousel").owlCarousel({
        mouseDrag: false,
        touchDrag: true,
        navContainerClass: "carousel-controls",
        navElement: "a",
        navClass: ["prev","next"],
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        dots: false,
        loop: true,
        margin: 30,
        autoplay: true,
        autoplayTimeout: 4000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2,
                slideBy: 2
            },
            971: {
                items: 3,
                slideBy: 3
            }
        }
    });
    var i = 2;
    var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
    $(".submit").click(function () {
        $("#voteloader").show();
        var html = document.getElementById("PageVoteTemplate").innerHTML;
        $.getJSON("/Ajax/PageVote?PageIndex=" + i + "", null, function (data) {
            for (var n = 0; n < data.length; n++) {
                var source = html.replace(reg, function (node, key) {
                    var $voteitemlisthtml = "";
                    var $votecontenthtml = "";
                    var $content = data[n].Content;
                    if (data[n].VoteItemList.length > 0) {
                        for (var j = 0; j < 2; j++) {
                            $voteitemlisthtml += '<p class="auto-hidden"><i class="fa fa-circle-o"></i>&nbsp;' + htmlEscape(data[n].VoteItemList[j].ItemName) + '</p>';
                        };
                        if (data[n].VoteItemList.length > 2) {
                            $voteitemlisthtml += '<p>......</p>';
                        };
                        if ($($content).find("img").attr("src") != undefined || data[n].VoteItemList[0].Pic != "") {
                            $votecontenthtml += '<div class="entry-thumbnail">';
                            $votecontenthtml += '<a href="/Vote/' + data[n].Id + '" target="_blank">';
                            if ($($content).find("img").attr("src") != undefined) {
                                $votecontenthtml += '<img src="' + $($content).find("img").attr("src") + '" alt="' + htmlEscape(data[n].VoteName) + '" />';
                            }
                            else {
                                $votecontenthtml += '<img src="' + data[n].VoteItemList[0].Pic + '" alt="' + htmlEscape(data[n].VoteItemList[0].ItemName) + '" />';
                            }
                            $votecontenthtml += '</a>';
                            $votecontenthtml += '<div class="entry-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i>';
                            if (data[n].SortId == 2) {
                                $votecontenthtml += '<i class="fa fa-picture-o fa-stack-1x fa-inverse"></i>';
                            }
                            else if (data[n].SortId == 3) {
                                $votecontenthtml += '<i class="fa fa-play-circle-o fa-stack-1x fa-inverse"></i>';
                            }
                            else {
                                $votecontenthtml += '<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>';
                            }
                            $votecontenthtml += '</span></div>';
                            $votecontenthtml += '</div>';
                        }
                    }
                    $content = $content.replace(/<\s?img[^>]*>/gi, "");
                    $votecontenthtml += '<div class="entry-content content-margin clearfix"><p>' + StrLeft(RemoveHtml($content), 200) + '</p>' + $voteitemlisthtml + '</div>';
                    return {
                        'HeadFace': data[n].Members.HeadFace,
                        'VoteName': StrLeft(htmlEscape(data[n].VoteName), 50),
                        'Id': data[n].Id,
                        'TimeLeft': data[n].TimeLeft,
                        'ClickNumber': data[n].ClickNumber,
                        'LoveName': htmlEscape(data[n].Members.LoveName),
                        'CommentListNum': data[n].TotleComment,
                        'Content': $votecontenthtml
                    }[key];
                });
                $("#newvote").append(source);
            };
            $("#voteloader").hide();
            i += 1;
        });
        if (i > 9) {
            $('#loadmore').hide();
        }
    });
    $(".bulletin").slideDown(600);
    setTimeout("$('.bulletin').slideUp(600)", 10000);
});

function htmlEscape(str) {
    return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
}

function htmlUnescape(value) {
    return String(value)
        .replace(/&quot;/g, '"')
        .replace(/&#39;/g, "'")
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>')
        .replace(/&amp;/g, '&');
}

function StrLeft(content, maxwidth) {
    if (content.length * 2 <= maxwidth) {
        return content;
    }
    var strlen = 0;
    var str = "";
    for (var i = 0; i < content.length; i++) {
        str = str + content.charAt(i);
        if (content.charCodeAt(i) > 128) {
            strlen = strlen + 2;
            if (strlen >= maxwidth) {
                return str.substring(0, str.length - 1) + "...";
            }
        } else {
            strlen = strlen + 1;
            if (strlen >= maxwidth) {
                return str.substring(0, str.length - 2) + "...";
            }
        }
    }
    return str;
}

function RemoveHtml(str) {
    return str.replace(/<[^>]+>/g, "");
}