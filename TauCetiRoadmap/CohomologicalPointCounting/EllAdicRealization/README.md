# Roadmap: classical and pro-étale \(\ell\)-adic realization

This roadmap passes from finite \(\mathbf Z/\ell^n\mathbf Z\)-coefficients to constructible \(\mathbf Z_\ell\)- and \(\mathbf Q_\ell\)-coefficients and compares the classical inverse-system construction with Mathlib's existing pro-étale continuous \(\mathbf Z_\ell\)-sheaf. It supplies the finite generation, smallness, compact support, Galois action, Frobenius action, and comparison results consumed by the trace-formula roadmap.

The mathematical progression is

\[
\text{compatible finite-level systems}
\longrightarrow
R\varprojlim
\longrightarrow
\text{constructible }\mathbf Z_\ell\text{-complexes}
\longrightarrow
\text{pro-étale comparison}
\longrightarrow
\mathbf Q_\ell\text{-realization}
\longrightarrow
\text{finite-dimensional Galois/Frobenius representations}.
\]

Suggested code home:

```text
TauCeti/AlgebraicGeometry/EtaleCohomology/EllAdic/
```

Suggested Lean namespaces:

```text
TauCeti.AlgebraicGeometry.EtaleCohomology
TauCeti.AlgebraicGeometry.ProEtaleCohomology
```

Direct roadmap dependencies:

```text
CohomologicalPointCounting/FrobeniusGeometry
CohomologicalPointCounting/ConstructibleEtale
CohomologicalPointCounting/EtaleBaseChange
CohomologicalPointCounting/CompactSupport
CohomologicalPointCounting/ComplexComparison
```

The finite-field and compact-support parts depend on the first four. The \(\ell\)-adic Artin-comparison layer also consumes `ComplexComparison`.

The Markdown roadmap is the definitive specification. `Suggested.lean` is nonexhaustive.

## Primary references and source-to-layer map

* B. Bhatt and P. Scholze, *The pro-étale topology for schemes*.
* The Stacks Project, Chapter 61, [Pro-étale Cohomology](https://stacks.math.columbia.edu/tag/0965), especially §§61.19--61.30.
* The Stacks Project, §61.30, [proper base change](https://stacks.math.columbia.edu/tag/09C8), emphasizing the strategy of using the pro-étale site for limit issues and finite étale theory for geometric theorems.
* The Stacks Project, Chapter 64, §§64.18--64.20, \(\ell\)-adic sheaves and cohomological \(L\)-functions.
* SGA 4½ and J. S. Milne, *Étale Cohomology*, for classical \(\ell\)-adic cohomology.

| Roadmap material | Main source |
|---|---|
| Étale/pro-étale comparison | Stacks, §§61.19, 61.27--61.30; Bhatt--Scholze |
| Derived completion and inverse limits | Stacks, §§61.20--61.21 |
| Constructible adic sheaves | Stacks, §§61.27--61.29 |
| Proper base change for adic coefficients | Stacks, §61.30 |
| Classical finite-level construction | SGA 4½; Milne |
| Adic trace/L-functions interface | Stacks, §§64.18--64.20 |

## Standing conventions

### Prime and base

Fix a prime \(\ell\). On schemes in positive characteristic \(p\), assume \(\ell\ne p\). More generally, assume \(\ell\) is invertible on the scheme wherever constructibility, finiteness, base change, or comparison uses that hypothesis.

### Finite-level tower

Write

\[
\Lambda_n=\mathbf Z/\ell^n\mathbf Z,
\qquad n\ge1.
\]

A constructible \(\mathbf Z_\ell\)-coefficient object is represented by a normalized compatible system \((K_n)_{n\ge1}\) with transition equivalences

\[
K_{n+1}\otimes^L_{\Lambda_{n+1}}\Lambda_n
\simeq K_n.
\]

Use a structured tower carrying coherence. A bare function \(n\mapsto K_n\) plus unrelated existential compatibility statements is not an adequate object.

### Classical and pro-étale theories

Keep distinct names for:

* the classical derived inverse-limit realization on the small étale site;
* the pro-étale continuous \(\mathbf Z_\ell\)-coefficient object;
* their comparison equivalence;
* the underlying degreewise cohomology groups.

Do not redefine Mathlib's `Scheme.ellAdicSheaf` or `Scheme.EllAdicCohomology`. Extend and compare them.

### \(\mathbf Q_\ell\)-coefficients

Construct \(\mathbf Q_\ell\)-cohomology by derived or cohomological scalar extension from the finite generated \(\mathbf Z_\ell\)-realization, proving compatibility. Do not introduce \(\mathbf Q_\ell\)-cohomology as an unrelated primitive.

### Galois continuity

For a scheme over a field \(k\) with chosen separable closure, the geometric cohomology groups carry continuous actions of \(\operatorname{Gal}(k^{\mathrm{sep}}/k)\). The target category must remember topology/continuity, not merely a group homomorphism into automorphisms of an abstract vector space.

## What Mathlib and Tau Ceti already have: consume

Consume:

* `PadicInt` and the corresponding \(\ell\)-adic field, topological-ring, module, and completeness infrastructure;
* inverse systems, limits, exact sequences, homological complexes, derived categories, and derived-limit/spectral-sequence infrastructure already present;
* the small and pro-étale sites;
* `AlgebraicGeometry.Scheme.ellAdicSheaf`, the pro-étale sheaf \(U\mapsto C(U,\mathbf Z_\ell)\);
* `AlgebraicGeometry.Scheme.EllAdicCohomology`, the pro-étale cohomology declaration using that coefficient sheaf;
* Mathlib's Grothendieck-abelian sheaf categories on the pro-étale site;
* `ConstructibleEtale` for \(D^b_{\mathrm{ctf}}(X,\Lambda_n)\), Tate twists, and finite-level coefficient change;
* `EtaleBaseChange` and `CompactSupport` for finite-level base change and \(Rf_!\);
* `FrobeniusGeometry` for the Frobenius convention bridge;
* `ComplexComparison` for finite-level Artin comparison.

Mathlib's documented pro-étale \(\ell\)-adic cohomology groups live one universe above the desired small coefficient category. This roadmap proves comparison with the classical finite-level construction and derives the required smallness theorem.

Mathlib pull request [#41730](https://github.com/leanprover-community/mathlib4/pull/41730), concerning the inclusion of the small étale site into the pro-étale site, is a design coordination point. Follow its interface where applicable and implement an aligned Tau Ceti version when the required declaration is absent.

## What is missing: build here

The missing reusable library consists of:

1. coherent inverse systems of finite-level constructible coefficient complexes;
2. Mittag--Leffler, derived inverse-limit, and derived-completion results in the needed categories;
3. normalized constructible adic systems;
4. classical \(\mathbf Z_\ell\)-cohomology and compact support;
5. the inclusion/comparison functor from the small étale to the pro-étale site;
6. comparison of finite torsion sheaves on the two sites;
7. comparison of classical compatible systems with the pro-étale continuous \(\mathbf Z_\ell\)-sheaf;
8. smallness of Mathlib's existing `EllAdicCohomology` under finite-type hypotheses;
9. finite generation and boundedness over \(\mathbf Z_\ell\);
10. \(\mathbf Q_\ell\)-realization and finite dimensionality;
11. Galois and Frobenius actions as continuous representations;
12. Tate twists and coefficient change at the adic level;
13. compact support, proper/smooth base change, and Künneth for adic coefficients;
14. \(\ell\)-adic Artin comparison.

## The build, in layers

### Layer 0: inverse systems and derived limits

Develop the generic category-theoretic infrastructure needed for towers indexed by \(\mathbf N_{\ge1}^{\mathrm{op}}\). Reuse Mathlib limits and derived categories; place genuinely generic results outside algebraic geometry.

Build:

* structured inverse systems with transition maps;
* inverse limit and derived inverse limit;
* the Milnor exact sequence and the \(R^1\varprojlim\) obstruction in the available framework;
* Mittag--Leffler systems and vanishing of \(R^1\varprojlim\);
* for towers of modules and degreewise towers of complexes used here, surjective transition maps imply the Mittag--Leffler condition and vanishing of the first derived inverse limit;
* compatibility with finite products, tensor products under completeness hypotheses, and group actions;
* derived \(\ell\)-adic completion
  \[
  K^\wedge_\ell\simeq R\varprojlim_n(K\otimes^L\mathbf Z/\ell^n);
  \]
* criteria for a derived-complete object to be recovered from its reductions.

Prove all universe and smallness statements required to form these limits in the sheaf categories used below.

### Layer 1: normalized constructible adic systems

Define a constructible adic system on \(X\) as data

\[
K_n\in D^b_{\mathrm{ctf}}(X,\Lambda_n)
\]

with coherent reduction equivalences

\[
K_{n+1}\otimes^L_{\Lambda_{n+1}}\Lambda_n\simeq K_n.
\]

Build:

* morphisms and equivalences of systems;
* shifts, cones, truncations, and distinguished triangles;
* tensor products of systems with uniform cohomological bounds and uniform finite Tor amplitudes, and internal Hom when the first argument is uniformly perfect;
* pullback;
* finite group actions;
* Tate twists \(K(r)\);
* constant system \((\Lambda_n)_n\);
* lisse systems of fixed finite rank;
* normalization and the full subcategory of normalized systems;
* reduction functors to every finite level;
* conservativity of all reductions under derived completeness.

Define the bounded constructible adic category by requiring integers \(a\le b\) and \(c\le d\), independent of \(n\), such that every \(K_n\) has cohomology only in \([a,b]\) and Tor amplitude contained in \([c,d]\). The bounds are part of the membership predicate, not extra data stored in each object.

### Layer 2: classical \(\mathbf Z_\ell\)-realization

For a normalized bounded constructible system \(K=(K_n)\), define its classical \(\mathbf Z_\ell\)-realization as the derived inverse limit in the étale sheaf category. Define global and compactly supported cohomology by applying the corresponding derived global-section functor to this realization. Prove the canonical comparisons with the derived inverse limits of finite-level global-section complexes using the uniform bounds and Mittag--Leffler criteria of Layer 0.

The realization \(K_{\mathbf Z_\ell}\) is the primitive object, and cohomology of the realization is the definition. The comparisons

\[
R\Gamma_{\acute et}(X,K_{\mathbf Z_\ell})
\simeq R\varprojlim_nR\Gamma_{\acute et}(X,K_n)
\]

and, with \(R\Gamma_c\) consumed from `CompactSupport`,

\[
R\Gamma_{c,\acute et}(X,K_{\mathbf Z_\ell})
\simeq R\varprojlim_nR\Gamma_{c,\acute et}(X,K_n)
\]

are theorems of this layer, not definitions.

Build:

* reduction modulo \(\ell^n\);
* long exact/Milnor sequences;
* functoriality;
* coefficient change;
* cup products and tensor compatibility;
* finite group actions;
* compatibility with proper direct image and \(Rf_!\) under the finite-level base-change/finiteness hypotheses.

### Layer 3: the étale-to-pro-étale comparison morphism

Construct the inclusion of the small étale site into the small pro-étale site and the induced morphism of topoi. Prove its identity/composition and universe properties.

For every finite torsion constructible sheaf \(\mathcal F\) on \(X_{\acute et}\), prove that pullback to the pro-étale site preserves stalks, lissity, constructibility, and cohomology:

\[
R\Gamma_{\acute et}(X,\mathcal F)
\simeq
R\Gamma_{\mathrm{pro\acute et}}(X,\nu^*\mathcal F).
\]

Establish the compact-support form using finite-level \(Rf_!\). Prove compatibility with direct image, pullback, tensor products, Tate twists, and geometric points.

### Layer 4: comparison of coefficient sheaves

On the pro-étale site, compare:

1. the derived inverse limit of the pulled-back constant sheaves \(\mathbf Z/\ell^n\mathbf Z\);
2. the derived-complete constant \(\mathbf Z_\ell\)-sheaf;
3. Mathlib's `Scheme.ellAdicSheaf`, defined by continuous maps to \(\mathbf Z_\ell\).

For locally Noetherian schemes and the bounded constructible systems fixed above, construct canonical maps and prove the equivalences. In particular, prove that reduction of `ellAdicSheaf` modulo \(\ell^n\) agrees with the constant \(\mathbf Z/\ell^n\mathbf Z\)-sheaf.

Extend this comparison from the constant system to finite-rank lisse normalized systems and the constructible systems in the pinned category.

### Layer 5: classical/pro-étale cohomology comparison

The hypotheses of this layer are those of Layer 4: locally Noetherian schemes and the bounded constructible systems fixed above. For the constant coefficient object, prove

\[
R\Gamma_{\acute et}(X,\mathbf Z_\ell)
\simeq
R\Gamma_{\mathrm{pro\acute et}}(X,\texttt{ellAdicSheaf}).
\]

For a normalized constructible adic system \(K\), prove the corresponding comparison with its pro-étale realization.

Build:

* degreewise cohomology equivalences;
* compact-support comparison;
* proper/smooth base-change compatibility;
* cup-product and Künneth compatibility;
* Galois and finite group equivariance;
* reduction compatibility for every \(n\).

This is the principal comparison summit. It should be a natural equivalence of derived functors, not merely an abstract isomorphism of degreewise groups.

### Layer 6: smallness, finite generation, and boundedness

Let \(X\) be separated finite type over a separably closed field and let \(K\) be a constructible normalized adic system of finite Tor amplitude. Use finite-level finiteness and derived-limit control to prove:

* the pro-étale cohomology objects lie in the expected small universe;
* \(H^i(X,K_{\mathbf Z_\ell})\) and \(H^i_c(X,K_{\mathbf Z_\ell})\) are finitely generated \(\mathbf Z_\ell\)-modules;
* cohomology vanishes outside a finite range;
* for the separated finite-type schemes and finite-Tor-amplitude constructible systems in this layer, the derived global and compactly supported complexes are perfect over \(\mathbf Z_\ell\);
* canonical equivalences \(R\Gamma(X,K_{\mathbf Z_\ell})\otimes^L\Lambda_n\simeq R\Gamma(X,K_n)\) and \(R\Gamma_c(X,K_{\mathbf Z_\ell})\otimes^L\Lambda_n\simeq R\Gamma_c(X,K_n)\).

Specialize the smallness result to Mathlib's `Scheme.EllAdicCohomology`, resolving the universe issue documented in Mathlib.

### Layer 7: \(\mathbf Q_\ell\)-realization

Define

\[
R\Gamma_c(X,K_{\mathbf Q_\ell})
=
R\Gamma_c(X,K_{\mathbf Z_\ell})
\otimes^L_{\mathbf Z_\ell}\mathbf Q_\ell
\]

and degreewise \(\mathbf Q_\ell\)-cohomology. Prove finite dimensionality and compatibility with taking cohomology, using perfectness/flatness.

Build:

* scalar extension functor;
* independence of the chosen integral lattice for lisse \(\mathbf Q_\ell\)-sheaves when two lattices define the same rational object;
* tensor products, duals, Tate twists, and internal Hom;
* characteristic polynomials, traces, and determinants of endomorphisms;
* compact-support Künneth.

Do not define an unrestricted category of all \(\mathbf Q_\ell\)-sheaves. The target is the rationalization of the bounded constructible adic category.

### Layer 8: continuous Galois and Frobenius actions

For \(X/k\), base change to a separable closure \(\bar k\). Construct the continuous action of

\[
G_k=\operatorname{Gal}(\bar k/k)
\]

on \(R\Gamma(X_{\bar k},K)\), \(R\Gamma_c(X_{\bar k},K)\), and their cohomology modules.

Build:

* continuity at finite level and in the inverse limit;
* functoriality in \(X\) and \(K\);
* compatibility with exact triangles, tensor products, Tate twists, and group actions;
* restriction along field extensions;
* conjugacy-independence under change of separable closure;
* arithmetic and geometric Frobenius actions for finite fields;
* the explicit inverse/convention bridge from `FrobeniusGeometry`;
* continuity and finite dimensionality of the resulting \(\mathbf Q_\ell\)-representations.

Prove the pinned Tate-twist convention: geometric Frobenius acts on \(\mathbf Q_\ell(1)\) by \(q^{-1}\), with the arithmetic-Frobenius formulation given explicitly.

### Layer 9: adic base change and compact support

Pass the finite-level theorems through the compatible system and derived limit. Prove the standard \(\mathbf Z_\ell\)- and \(\mathbf Q_\ell\)-forms of:

* proper base change;
* smooth base change;
* \(Rf_!\)-base change;
* constructibility/lissity of higher direct images in the pinned setting;
* projection formula;
* ordinary and compact-support Künneth.

State every result as a comparison theorem derived from the finite-level theory. Do not reprove geometric base change directly on the pro-étale site when finite-level comparison and derived completeness suffice.

### Layer 10: \(\ell\)-adic Artin comparison

For finite-type \(X/\mathbf C\), pass the finite-level Artin comparison equivalences through derived inverse limit and rationalization. `ComplexComparison` is finite-level only, so the topological side of the adic theory is built here: define the topological realization \(K^{\mathrm{an}}_{\mathbf Z_\ell}=R\varprojlim_nK^{\mathrm{an}}_n\) of the analytified finite-level system and its \(\mathbf Q_\ell\)-scalar extension, with the same normalized-system and derived-limit API as the étale side. These constructions are targets of this layer. Prove

\[
R\Gamma_{\acute et}(X,K_{\mathbf Z_\ell})
\simeq
R\Gamma(X^{\mathrm{an}},K^{\mathrm{an}}_{\mathbf Z_\ell})
\]

and the compact-support form, together with their \(\mathbf Q_\ell\)-realizations.

For constant coefficients, deduce

\[
H^i_{\acute et}(X,\mathbf Q_\ell)
\cong
H^i_{\mathrm{sing}}(X(\mathbf C),\mathbf Q_\ell),
\]

where the right side is the singular cohomology of `ComplexComparison`, with \(\mathbf Z_\ell\) and \(\mathbf Q_\ell\) coefficients obtained by the derived inverse limit and scalar extension constructed above.

Prove naturality, products, cup products, group actions, and compatibility with integral lattices.

**Summit:** Mathlib's pro-étale \(\ell\)-adic cohomology is naturally identified with the classical finite-level construction in the finite-type constructible setting, is small and finitely generated, and produces finite-dimensional continuous \(\mathbf Q_\ell\)-representations with Frobenius.

## Worked examples and acceptance criteria

1. For a geometric point, classical and pro-étale \(\mathbf Z_\ell\)-cohomology agree and higher cohomology vanishes.
2. Reduction of the pro-étale continuous \(\mathbf Z_\ell\)-sheaf modulo \(\ell^n\) is the constant finite sheaf.
3. \(\mathbf Z_\ell(1)\) is the inverse limit of \(\mu_{\ell^n}\), and the Frobenius convention is verified.
4. Proper base change for \(\mathbf P^1\) agrees at finite, integral adic, and rational adic levels.
5. The \(\mathbf Q_\ell\)-cohomology of a finite étale scheme carries the expected permutation representation of Frobenius.
6. Artin comparison for \(\mathbf G_m\) agrees with the finite-level comparison after reduction.
7. The existing `Scheme.EllAdicCohomology` is shown to be small in the stated finite-type case.

A layer is not complete if it supplies only degreewise abstract groups. Module structures, topology/continuity, reduction, naturality, compact support, and actions are required.

## Design notes for Lean

### Put generic derived-limit lemmas in generic namespaces

Mittag--Leffler and derived-completion results are not algebraic-geometry-specific. They should live under `TauCeti/CategoryTheory/` or `TauCeti/Algebra/Homology/` as appropriate.

### Compare; do not replace

Mathlib's pro-étale `ellAdicSheaf` and `EllAdicCohomology` are consumed. New classical constructions should be connected by canonical equivalences and then used to enrich the existing objects with smallness and finiteness theorems.

### Keep integral lattices visible

Trace and determinant results over \(\mathbf Q_\ell\) depend on finite-dimensionality, while integral reduction and continuity depend on a \(\mathbf Z_\ell\)-lattice. Preserve both layers in the API.

### Avoid naive inverse limits of cohomology groups

The primary construction is derived. Degreewise inverse-limit formulas are corollaries under Mittag--Leffler/vanishing hypotheses.

## Scope boundaries

The following are not targets of this roadmap:

* coefficients with \(\ell\) noninvertible on the base;
* \(p\)-adic Hodge theory;
* crystalline, rigid, or prismatic cohomology;
* arbitrary condensed or solid coefficient categories;
* unbounded constructible adic categories beyond the bounded ctf setting;
* weights, purity, or Weil II;
* Grothendieck--Lefschetz itself, owned by `TraceFormula`.

## Completion criterion

This roadmap is complete when:

* normalized compatible systems and their derived category are usable;
* derived inverse-limit and derived-completion infrastructure supports the finite-level tower;
* the small étale/pro-étale comparison is proved for finite constructible coefficients;
* Mathlib's continuous pro-étale \(\mathbf Z_\ell\)-sheaf is compared with the inverse limit of finite constants;
* classical and pro-étale cohomology, including compact support, are naturally equivalent;
* smallness, boundedness, finite generation, and perfectness are proved under the pinned finite-type hypotheses;
* \(\mathbf Q_\ell\)-cohomology is finite-dimensional and carries continuous Galois/Frobenius actions;
* adic base change, Künneth, Tate twists, and Artin comparison are available;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
