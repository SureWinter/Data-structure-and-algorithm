//
//  main.m
//  拉丁方阵
//
//  Created by wangshuo on 16/4/18.
//  Copyright © 2016年 wangshuo. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct node
{
    int index;
    struct node *next;
}*list;

int lineCount; //输入行数
list first = NULL; //第一个节点

list q;
list p = NULL;

list createCycleList()
{
    
    for (int i =1 ; i<=lineCount; i++) {
        
        if (i == 1) {
            first = p = (struct node *)malloc(sizeof(struct node));
            p->index = i;
        }
        
        else
        {
            q = (struct node*)malloc(sizeof(struct node));
            q->index = i;
            p->next = q;
            p = q;
        }
    }
    p->next = first; // 让最后一个节点指向第一个节点
    printf("\n");
    return first;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        printf("请输入阵列行数:\n");

        scanf("%d",&lineCount);
        list cycleList = createCycleList();
        if (lineCount<=0) {
            printf("lineCount ERROR");
        }else
        {
            //创建循环列表

            int lineIndex;//记录到当前第几行
            
            for (lineIndex = 1; lineIndex<=lineCount; lineIndex++) { //行数循环
                //开始新的一行  结束节点endNode 置空  节点handelList指针指向第一个节点
                list endNode = NULL;
                list handelList = cycleList;

                //开始循环打印第i行的节点
                while (1) {
                    //当指针移动到要开始打印的节点，打印当前节点 并将节点的存为结束节点
                    if (handelList->index == lineIndex) {
                        printf("%d ",handelList->index);
                        endNode = handelList;
                    }
                    else{
                        //如果endNode为空，说明还没开始打印，只有endNode有值 才打印当前节点
                        if (endNode) {
                            printf("%d ",handelList->index);
                        }
                        //如果下一个节点 就是结束节点 说明该行列表结束打印
                        if (handelList->next == endNode) {
                            printf("\n");
                            break;
                        }
                    }
                    //将指针移动到下一个节点
                    list temp = handelList->next;
                    handelList = temp;
                    
                }
            }
        }
        //删除所有节点
        list p = cycleList;
        if (p == NULL)  //链表为空无需处理
            return 0;
        while(p->next != NULL)   //删除链表非首结点元素
        {
            list q = p->next;
            p->next = p->next->next;
            free(q);
        }
        free(p);                             //删除链表首结点元素
        cycleList = NULL;
    }

    return 0;
}




