from django.shortcuts import render
from .models import Assets

def stats_list(request):
    assets = Assets.objects.order_by('month')
    return render(request, 'charts/stats_list.html', {'assets': assets})

def filterbydate(request,date_start,date_end):
    output  = Assets.objects.filter(month__range=[date_start,date_end])
    context = {'assets': assets}
    return render(output, 'charts/filtred_stats_list.html',context)



'''
Select m2.regionname,m2.indicatorname, round(CAST( m2.a2Value as float) / 
m1.a1Value,2)
from(
select r.name as regionname , ina.name as indicatorname, sum(a.value) as 
a1Value
from Region as "r"
left join city_region as "cr" on r.region_id = cr.region_id
left join Office as "o" on cr.city_id = o.city_id
left join Assets as "a" on o.office_id = a.office_id
left join Indicators as "i" on a.indicator_id = i.indicator_id
left join IndicatorNames as "ina" on i.indicator_name_id =              
ina.indicator__name_id
where a.month between '01-01-2019' and '31-01-2019'
group by r.name, ina.name
) m1 join (
select r.name as regionname , ina.name as indicatorname, sum(a.value) as 
a2Value
from Region as "r"
left join city_region as "cr" on r.region_id = cr.region_id
left join Office as "o" on cr.city_id = o.city_id
left join Assets as "a" on o.office_id = a.office_id
left join Indicators as "i" on a.indicator_id = i.indicator_id
left join IndicatorNames as "ina" on i.indicator_name_id =  
ina.indicator__name_id
where a.month between '01-02-2019' and '27-02-2019'
group by r.name, ina.name) m2 on m1.regionname = m2.regionname and m1.indicatorname = m2.indicatorname
'''