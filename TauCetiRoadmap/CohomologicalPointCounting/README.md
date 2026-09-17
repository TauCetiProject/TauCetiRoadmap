# Cohomological comparison and point counting

This is a connected family of roadmaps for the cohomological passage between complex topology and arithmetic geometry over finite fields. Each child directory is a self-contained roadmap: its `README.md` is the definitive specification, and its `Suggested.lean` gives nonexhaustive target signatures once the relevant types can be stated honestly.

The family builds the formal pipeline

\[
\text{complex topology}
\longleftrightarrow
\text{étale cohomology}
\longleftrightarrow
\text{cohomology of geometric fibres}
\xrightarrow{\operatorname{Frob}}
\text{traces}
\longrightarrow
\text{point counts and }L\text{-functions}.
\]

Its two principal summit theorems are:

1. **Artin comparison**, including compact support, between finite-coefficient étale cohomology of a finite-type complex scheme and the corresponding topological cohomology of its analytification;
2. **Grothendieck--Lefschetz**, for constructible finite-Tor-dimension coefficient complexes on separated finite-type schemes over finite fields, together with the cohomological determinant formula for zeta and sheaf \(L\)-functions.

The family is deliberately not organized around a particular application. Its output is intended to be ordinary reusable infrastructure for arithmetic geometry, topology of complex algebraic varieties, trace functions, families of varieties, monodromy, moduli problems, exponential and character sums, and cohomological point counting.

Suggested family directory:

```text
TauCetiRoadmap/CohomologicalPointCounting/
```

The family-level page owns the common conventions, dependency graph, combined endpoint, and boundaries. It owns no Lean declarations and therefore has no parent `Suggested.lean`.

## The roadmaps

* [Frobenius morphisms and finite-field points](FrobeniusGeometry/) develops absolute and relative Frobenius, arithmetic and geometric Frobenius, fixed-point descriptions of rational points, and topological invariance of the small étale site.
* [Constructible étale coefficients](ConstructibleEtale/) develops finite locally constant and constructible module sheaves, the finite étale Galois category with the étale fundamental group and étale paths, constructible finite-Tor-dimension complexes, Tate twists, and finite-coefficient étale cohomology.
* [Étale base change and finiteness](EtaleBaseChange/) develops morphisms of étale topoi, derived direct image, proper and smooth base change, finiteness, constructibility, local acyclicity, fibrewise variation, and Künneth for ordinary étale cohomology.
* [Compactly supported étale cohomology](CompactSupport/) develops Nagata compactification, extension by zero, \(Rf_!\), compactification independence, localization, base change, and \(R\Gamma_c\).
* [Complex analytification and Artin comparison](ComplexComparison/) develops analytification of finite-type complex schemes, the topology needed for comparison, Riemann existence, comparison with topological sheaf and singular cohomology, and Artin comparison with compact support.
* [Classical and pro-étale \(\ell\)-adic realization](EllAdicRealization/) develops compatible finite-level systems, derived inverse limits, comparison with Mathlib's pro-étale \(\mathbf Z_\ell\)-cohomology, finite generation, \(\mathbf Q_\ell\)-realization, Frobenius actions, and \(\ell\)-adic comparison.
* [Grothendieck--Lefschetz and cohomological \(L\)-functions](TraceFormula/) develops traces of perfect complexes, local and global Frobenius traces, the trace formula for every finite extension of the base field, and cohomological rationality of zeta and sheaf \(L\)-functions.

## The combined endpoint

The middle comparison in the pipeline is not a canonical identification between an arbitrary complex variety and an unrelated variety over a finite field. The input is a common family and an explicit transport datum.

Let

\[
f:\mathcal X\longrightarrow S
\]

be a separated finite-type morphism over a connected arithmetic base. Let \(K\) be a constructible finite-Tor-dimension coefficient complex on \(\mathcal X\), let \(\bar\eta:\operatorname{Spec}\mathbf C\to S\) be a complex geometric point, and let \(\bar s:\operatorname{Spec}\overline{\mathbf F}_q\to S\) be a geometric point over \(\mathbf F_q\). Suppose \(R^if_!K\) is lisse on a connected locally closed stratum containing both points. A chosen étale path between the points gives transport

\[
(R^if_!K)_{\bar\eta}
\xrightarrow{\sim}
(R^if_!K)_{\bar s}.
\]

Base change identifies these stalks with compactly supported cohomology of the corresponding geometric fibres. Artin comparison on the complex fibre gives

\[
H^i_{c,\mathrm{sing}}
  (\mathcal X_{\bar\eta}(\mathbf C),K^{\mathrm{an}}_{\bar\eta})
\xrightarrow{\sim}
H^i_{c,\acute et}(\mathcal X_{\bar\eta},K_{\bar\eta}),
\]

while the finite-field fibre carries geometric or arithmetic Frobenius according to the pinned convention. Grothendieck--Lefschetz gives, for every \(r\ge 1\),

\[
\sum_{x\in \mathcal X_s(\mathbf F_{q^r})}
L(\operatorname{Frob}_{q^r,x},K_{\bar x})
=
L(\operatorname{Frob}_{q}^{r},
  R\Gamma_c(\mathcal X_{\bar s},K)).
\]

For the constant \(\mathbf Q_\ell\)-sheaf this becomes

\[
\#\mathcal X_s(\mathbf F_{q^r})
=
\sum_i(-1)^i
\operatorname{Tr}
  (\operatorname{Frob}_{q}^{r}
   \mid H^i_c(\mathcal X_{\bar s},\mathbf Q_\ell)).
\]

The path-dependent transport between fibres is part of the monodromy representation. The roadmaps must not suppress this dependence by asserting a canonical equivalence of fibre cohomology groups.

The arithmetic model \(\mathcal X\to S\), the geometric points, the stratum, and the path are inputs. A general spreading-out theorem producing such a model from every complex scheme is not a hidden dependency of this family.

## Family-wide conventions

### Coefficients

Finite-level results use a finite commutative coefficient ring \(\Lambda\) annihilated by an integer \(N\) invertible on the base. The standard tower is

\[
\Lambda_n=\mathbf Z/\ell^n\mathbf Z,
\qquad \ell\ne\operatorname{char}(k).
\]

The finite-level theory is primary. \(\mathbf Z_\ell\) and \(\mathbf Q_\ell\) enter only in `EllAdicRealization`, after compatible systems and derived inverse limits have been built.

Do not silently specialize every coefficient object to a constant sheaf. Lisse and constructible coefficients, Tate twists, and finite group actions are part of the basic API.

### Geometric hypotheses

The roadmaps pin their hypotheses rather than using phrases such as “reasonable scheme.” The common framework is:

* Noetherian schemes for the global finite-stratification constructibility theory, with affine-local statements on locally Noetherian schemes;
* finite-type schemes over \(\mathbf C\) for Artin comparison;
* separated finite-type schemes over \(\mathbf F_q\) for Grothendieck--Lefschetz;
* separated finite-type morphisms between Noetherian schemes for Nagata compactification and \(Rf_!\);
* proper, smooth, or universally locally acyclic hypotheses exactly where the corresponding base-change or lissity theorem uses them.

Each theorem should be stated at its mathematically standard generality, even when a worked example uses a smooth variety.

### Derived coefficient category

The reusable finite-level category is

\[
D^b_{\mathrm{ctf}}(X,\Lambda),
\]

meaning bounded complexes of étale \(\Lambda\)-module sheaves with constructible cohomology and finite Tor dimension. `ConstructibleEtale` owns the definition and ordinary API. Other roadmaps consume it rather than defining theorem-specific substitutes.

### Frobenius

The following are distinct declarations and must never share an ambiguous unqualified name:

\[
F_X,
\qquad F_{X/S},
\qquad \operatorname{Frob}^{\mathrm{arith}}_q,
\qquad \operatorname{Frob}^{\mathrm{geom}}_q.
\]

Arithmetic Frobenius acts on \(\overline{\mathbf F}_q\) by \(x\mapsto x^q\); geometric Frobenius is its inverse. The scheme Frobenius and the induced Galois action on cohomology are related by explicit lemmas. Every trace theorem states which convention acts.

### Traces

For finite coefficient rings, the primary object is the trace of an endomorphism of a perfect complex. An alternating sum of ordinary traces on cohomology groups is a corollary under hypotheses making those traces well defined. This avoids assuming that finite-coefficient cohomology modules are projective.

For \(\mathbf Q_\ell\)-coefficients, compactly supported cohomology is finite-dimensional and the usual alternating trace formula is available.

### Functoriality and equivariance

Naturality, base change, cup products, Künneth maps, open--closed localization, finite group actions, and compatibility with all powers \(q^r\) are ordinary API requirements. They are not application-specific additions.

### Namespace and code placement

Roadmap namespaces use

```text
TauCetiRoadmap.CohomologicalPointCounting.<Child>
```

The intended code lives principally under

```text
TauCeti/AlgebraicGeometry/Frobenius/
TauCeti/AlgebraicGeometry/EtaleCohomology/
TauCeti/AlgebraicGeometry/Analytification/
TauCeti/AlgebraicGeometry/Comparison/
TauCeti/AlgebraicGeometry/TraceFormula/
TauCeti/AlgebraicTopology/SheafCohomology/
```

Generic categorical traces, derived-limit results, or topological sheaf-cohomology lemmas belong in the corresponding generic Tau Ceti namespace rather than under algebraic geometry.

## What Mathlib already has: consume

Re-check Mathlib and open pull requests before implementation, but the family begins from substantial existing infrastructure.

* **Schemes and morphism properties:** schemes, fibre products, affine and projective space, finite type, finite presentation, étale, smooth, proper, separated, finite, open and closed immersions, and stability under base change and composition.
* **Étale sites:** the big and small étale sites and the small affine étale site. The small affine site is essentially small and its sheaf category is equivalent to that of the usual small étale site.
* **Points and stalks:** geometric points of the étale site and a conservative family of points.
* **Sheaf categories:** sheaves with abelian and module values, Grothendieck abelian instances, enough injectives, and generic sheaf cohomology.
* **Derived categories:** homological complexes, derived categories, derived functor infrastructure, spectral sequences, Ext, tensor products, and triangulated-category machinery.
* **Pro-étale foundations:** the big and small pro-étale sites and Mathlib's continuous \(\mathbf Z_\ell\)-valued coefficient sheaf.
* **Existing \(\ell\)-adic endpoint:** `AlgebraicGeometry.Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology`. This construction does not supply the classical finite-level comparison or the finite-type smallness theorem; both are targets of `EllAdicRealization`.
* **Topology:** sheaves on topological spaces, stalkwise exactness, singular chains and singular homology, covering spaces, fundamental groupoids, and the material specified by the Tau Ceti `UniversalCovers` roadmap.
* **Linear algebra:** traces and determinants of endomorphisms of finite free and finite-dimensional modules, formal power series, and rational functions.

Coordinate with Mathlib pull request [#34626, “analytification of schemes (affine case)”](https://github.com/leanprover-community/mathlib4/pull/34626) and pull request [#41730, “small étale to pro-étale”](https://github.com/leanprover-community/mathlib4/pull/41730). Follow their design. Where a required declaration is absent, build the same mathematical interface locally in Tau Ceti so replacement by a Mathlib import requires deletion rather than redesign.

## What is missing: build in this family

The main missing connective tissue is:

1. scheme-level Frobenius and its finite-field point API;
2. constructible finite-coefficient étale sheaves and the bounded constructible finite-Tor-dimension derived category;
3. morphisms of small étale topoi and derived direct image at the required level;
4. proper and smooth base change, constructibility, finiteness, and fibrewise lissity;
5. Nagata compactification, extension by zero, \(Rf_!\), and compact support;
6. topological analytification for arbitrary finite-type complex schemes, including singular schemes;
7. the local topology, triangulation/finite-homotopy-type results, and Riemann existence needed for Artin comparison;
8. topological sheaf cohomology, singular cohomology with local coefficients, and compact supports;
9. compatible finite-level \(\ell\)-adic systems and comparison with pro-étale cohomology;
10. perfect-complex traces and the full Frobenius trace formalism;
11. Grothendieck--Lefschetz for constructible coefficients;
12. cohomological zeta and sheaf \(L\)-functions.

Every item appears as an explicit target in one child roadmap. No child may assume one of these items merely because it is classical mathematics.

## Dependency and parallelization graph

```text
FrobeniusGeometry <--- ConstructibleEtale (convention-bridge layer only)
FrobeniusGeometry -------------------------------+
                                                  |
ConstructibleEtale ---> EtaleBaseChange ---> CompactSupport
       |                    |                     |
       |                    +---------------------+--> ComplexComparison
       |                                                  |
       +--------------------------------------------------+
                                                          |
FrobeniusGeometry ----------------------------------------+
ConstructibleEtale / EtaleBaseChange / CompactSupport ----+--> EllAdicRealization
ComplexComparison ----------------------------------------+
                                                          |
FrobeniusGeometry / ConstructibleEtale /                   |
EtaleBaseChange / CompactSupport --------------------------+--> TraceFormula
ComplexComparison -----------------------------------------+
EllAdicRealization ----------------------------------------+
JacobianChallenge -----------------------------------------+
```

`FrobeniusGeometry` and `ConstructibleEtale` are independent initial work lanes, except that the final convention-bridge layer of `FrobeniusGeometry` consumes the cohomology functoriality of `ConstructibleEtale`. `EtaleBaseChange` consumes the coefficient category. `CompactSupport` consumes proper base change. The analytification and topological layers of `ComplexComparison` can develop in parallel with the finite-field branch, while its derived and compact-support summits consume the earlier étale roadmaps. `EllAdicRealization` is downstream of the finite-level theory and finite-level Artin comparison. The finite-coefficient theorem in `TraceFormula` does not depend on `ComplexComparison` or \(\ell\)-adic realization. `ComplexComparison` supplies independent cohomology computations used to verify the conventions on projective and affine space; `EllAdicRealization` supplies the \(\mathbf Q_\ell\) and cohomological \(L\)-function endpoints. The smooth-projective-curve base case consumes the Jacobian and abelian-variety infrastructure specified by `JacobianChallenge`.

There is no circular dependency.

## Worked-example spine

The examples are acceptance tests for conventions and interoperability, not decorative corollaries.

1. **Finite fields:** \(\operatorname{Spec}\mathbf F_{q^m}\), Frobenius orbits, and \(\mathbf F_{q^r}\)-points.
2. **Finite étale schemes:** permutation sheaves, nontrivial finite local systems, and local trace functions.
3. **Affine space:**
   \[
   \#\mathbf A^n(\mathbf F_{q^r})=q^{nr}.
   \]
4. **The multiplicative group:**
   \[
   \#\mathbf G_m(\mathbf F_{q^r})=q^r-1,
   \]
   obtained from open--closed localization and compact support.
5. **Projective space:**
   \[
   \#\mathbf P^n(\mathbf F_{q^r})
   =1+q^r+\cdots+q^{nr},
   \]
   fixing Tate-twist and Frobenius conventions.
6. **Complex comparison:** \(\mathbf A^1(\mathbf C)\), \(\mathbf G_m(\mathbf C)\), \(\mathbf P^1(\mathbf C)\), and finite étale covers.
7. **A smooth projective curve:**
   \[
   Z(C,t)
   =
   \frac{\det(1-tF\mid H^1)}{(1-t)(1-qt)}.
   \]

The curve example proves the cohomological factorization and rationality. It does not include a bound on the roots of the numerator.

## Scope boundaries

The following do not belong to this family:

* Deligne's theory of weights, purity, mixedness, and Weil II;
* bounds on Frobenius eigenvalues;
* a complete six-operations formalism;
* \(f^!\), Verdier duality, nearby cycles, and vanishing cycles;
* perverse sheaves and the decomposition theorem;
* Fourier--Deligne transforms;
* algebraic stacks and stacky trace formulas;
* comparison with de Rham or crystalline cohomology;
* \(p\)-adic Hodge theory;
* motives;
* a general construction of arithmetic models by spreading out;
* class field theory.

**Roadmap-for-a-roadmap, not work to attempt here:** a successor `WeightsAndPurity` roadmap should develop the part of Deligne's theory required to turn exact trace identities into bounds such as

\[
\left|
\operatorname{Tr}(\operatorname{Frob}_q^r\mid H^i_c)
\right|
\le
\dim H^i_c\,q^{ri/2}
\]

for pure objects and the corresponding mixed estimates. Contributors implementing this family should not begin that successor material under these specifications.

## Family-level completion criterion

This family is complete when:

* every child roadmap is complete according to its own `README.md`;
* the finite-level Artin comparison theorem and its compact-support form are available for the specified constructible coefficient complexes;
* proper/smooth and \(Rf_!\)-base change provide a precise path-dependent comparison of fibres in a supplied arithmetic family;
* classical and pro-étale \(\ell\)-adic cohomology are compared and the resulting compactly supported \(\mathbf Q_\ell\)-cohomology groups are finite-dimensional;
* Grothendieck--Lefschetz is proved for all powers of Frobenius and constructible finite-Tor-dimension coefficients;
* the constant-sheaf point-count formula and cohomological determinant formulas for zeta and sheaf \(L\)-functions are proved;
* the worked-example spine passes using the shared APIs rather than example-specific definitions;
* no child contains `sorry` in the Tau Ceti code repository, and the resulting declarations have ordinary functorial, equivalence-invariance, base-change, and simp APIs.

At completion, Tau Ceti should support the following standard workflow without rebuilding foundational interfaces: take a supplied family over an arithmetic base, identify the topology of a complex fibre, transport the resulting cohomological information to a good finite-field fibre under explicit hypotheses and chosen monodromy data, form Frobenius traces, and obtain exact point-count or trace-function identities.

## Primary references

The child roadmaps give precise source-to-layer maps. The common references are:

* The Stacks Project, Chapters 59 **Étale Cohomology**, 61 **Pro-étale Cohomology**, 63 **More Étale Cohomology**, and 64 **The Trace Formula**.
* A. Grothendieck et al., *Séminaire de Géométrie Algébrique du Bois Marie 4* (SGA 4), and P. Deligne, *Cohomologie étale* (SGA 4½).
* J. S. Milne, *Étale Cohomology* and the accompanying course notes.
* B. Bhatt and P. Scholze, *The pro-étale topology for schemes*.
* M. Artin, the comparison and Riemann-existence results for complex algebraic varieties as presented in SGA 4, Exposé XII and Exposé XVI.
