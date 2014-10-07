<h3 class="page-header"><strong>公告</strong></h3>
<div class="bs-docs-section">
    <h5 id="tools-bootlint"><strong>2014-10-10</strong></h5>
    <p>在自然科学中，物理学较早地阐述互动的概念，以解释物体或系统之间的作用和影响，说明能量守衡定律。在社会科学中，社会学在19世纪即应用互动的概念来解释社会学的现象，并形成了具有丰富理论内容的“社会互动论”的学说。在今天，伴随着现代化、社会化程度的提高，人们的交往范围、交往手段都发生了深刻的变化，人际之间、事物之间、系统之间的相互影响无论在广度和深度上，都进入了新的层次，因此互动关系的研究更引起了社会多方面的关注，互动关系的研究、互动概念的使用涉及到了越来越多的领域，在互联网上以“互动”为关键词稍加搜索，即可查到相关的条目达10万条之多，“互动机制”概念的使用也具有较高的频率。</p>
</div>

<script>
$(function(){
    $('#login').click(function(){
        $.ajax({
            type: 'POST',
            url: "{:U('Index/login')}",
            data: {username:$('#username').val(), password:$('#pwd').val()},
            dataType: 'json',
            success: function(data) {
                result = data;
                if( 1 != result['status']) {
                    $('#notice').removeClass('alert-success').addClass("alert-danger");
                    $('#notice').html(result['info']);
                    $('#notice').show();
                }else {
                    $('#notice').removeClass('alert-danger').addClass("alert-success");
                    $('#notice').html(result['info']);
                    $('#notice').show();
                    location.href=result['url'];
                }
            }
        });
    });

    $('#SignupModal').on('hidden.bs.modal', function (e) {
        $('#notice').hide();
    });
});
</script>