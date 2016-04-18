//
//  main.m
//  dateStructCC
//
//  Created by wangshuo on 16/4/15.
//  Copyright © 2016年 wangshuo. All rights reserved.
//

#import <Foundation/Foundation.h>


struct node
{
    int no; //代表编号结点的数据
    int code;//代表密码结点的数据
    struct node *next;//代表后一个结点的地址
};


void findtheone()
{
    int m,n,i,j;
    struct node *p = NULL;//
    struct node *q;//
    struct node *first = NULL;//第一个节点
    printf("请输入m的初始值 m:");
    scanf("%d",&m);
    printf("请输入人数 n:");
    scanf("%d",&n);
    for(i=1;i<=n;i++) //初始化循环链表
    {
        if(i==1)  //第一个节点
        {
            first=p=(struct node*)malloc(sizeof(struct node));
            if(p==0)
                return;
        }
        else
        {
            q=(struct node*)malloc(sizeof(struct node));
            if(q==0)
                return;
            p->next=q;
            p=q;
        }
        printf("请输入第%d个人的密码: ",i);
        scanf("%d",&p->code);
        p->no=i;
    }
/*******      初始化完毕 开始删除节点      *******/
    
    p->next=first; //让表尾指向表头形成循环链表
    p=first;
    printf("出列顺序为: ");
    for (j=1;j<=n;j++)
    {
        for(i=1;i<m;i++,p=p->next);
        m=p->code;
        printf("%d",p->no);
        p->no=p->next->no;
        p->code=p->next->code;
        q=p->next;
        p->next=p->next->next;
        free(q);
    }
    return;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        findtheone();
    }
    return 0;
}

