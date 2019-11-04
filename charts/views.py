from django.shortcuts import render
from .models import Assets

def stats_list(request):
    assets = Assets.objects.order_by('month')
    return render(request, 'charts/stats_list.html', {'assets': assets})

def filterbydate(request,date_start,date_end):
    output  = Assets.objects.filter(month__range=[date_start,date_end])
    context = {'assets': assets}
    return render(output, 'charts/filtred_stats_list.html',context)




