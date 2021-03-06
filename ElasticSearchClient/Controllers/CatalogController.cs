﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElasticSearchClient.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ElasticSearchClient.Controllers
{
    public class CatalogController : Controller
    {
        private readonly ElasticSearchFactory _esFactory;

        public CatalogController()
        {
            _esFactory = new ElasticSearchFactory();
        }

        // GET: Catalog
        public async Task<ActionResult> Index()
        {
            return View(await DoSearchAsync());
        }

        private async Task<List<Catalog>> DoSearchAsync(string name = "")
        {
            var response = await (_esFactory.ElasticSearchClient().SearchAsync<Catalog>(s => s
                                    .Index("catalogs")
                                    .Size(50)
                                    .Query(q => q
                                        .Match(m => m
                                            .Field(f => f.Name)
                                            .Query(name)
                                        )
                                    )
                                ));

            return response.Hits.Select(s => s.Source).ToList();
        }

        public ActionResult Create()
        {
            return View();
        }

        // POST: Catalog/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Catalog catalog)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    catalog.Id = Guid.NewGuid().ToString();

                    var response = _esFactory.ElasticSearchClient().Index<Catalog>(catalog, i => i
                                           .Index("catalogs")
                                           .Id(catalog.Id)
                                           .Refresh(Elasticsearch.Net.Refresh.True));

                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View(catalog);
                }
            }

            return View(catalog);
        }

        // GET: Catalog/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            return View(await GetByIdAsync(id));
        }

        private async Task<Catalog> GetByIdAsync(string id)
        {
            return (await _esFactory.ElasticSearchClient().GetAsync<Catalog>(id, i =>
                            i.Index("catalogs"))).Source;

        }

        // POST: Catalog/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, Catalog catalog)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var response = await _esFactory.ElasticSearchClient().UpdateAsync<Catalog>(catalog, i => i
                                           .Index("catalogs")
                                           .Refresh(Elasticsearch.Net.Refresh.True));

                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View(catalog);
                }
            }

            return View(catalog);
        }

        // GET: Catalog/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            return View(await GetByIdAsync(id));
        }

        // POST: Catalog/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(string id, Catalog catalog)
        {
            try
            {
                var response = await _esFactory.ElasticSearchClient().DeleteAsync<Catalog>(id, i => i
                                .Index("catalogs")
                                .Refresh(Elasticsearch.Net.Refresh.True));

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View(catalog);
            }
        }
    }
}