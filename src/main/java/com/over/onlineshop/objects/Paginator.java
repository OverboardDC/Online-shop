package com.over.onlineshop.objects;

import java.util.ArrayList;
import java.util.List;

public class Paginator {


    private List pages;

    public List getPages(Long totalRows, int productsOnPage, int page) {
        List<Integer> pages = new ArrayList<>();
        int coefficient;
        if (totalRows.intValue() != productsOnPage) {
            coefficient = 2;

        } else {
            coefficient = 1;
        }
        for (int i = 1; i < (totalRows.intValue() / productsOnPage) + coefficient; i++) {
            if (pages.size() < 6) {
                pages.add(i);
            }
        }
        int coefficient2;
        if (totalRows.intValue() % 2 == 0 || productsOnPage % 2 != 0) {
            coefficient2 = 5;
        } else {
            coefficient2 = 4;
        }

        for (int i = 1; i < (totalRows.intValue() / productsOnPage) - coefficient2; i++) {
            if (page > pages.get(2) && pages.size() > 5) {
                pages.add(pages.get(5) + 1);
                pages.remove(0);
            }
        }
        return pages;
    }
}
