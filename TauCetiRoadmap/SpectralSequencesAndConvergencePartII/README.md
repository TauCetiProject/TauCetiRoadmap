# Roadmap: spectral sequences and convergence, part II — the standard constructions and their products

**Summary.** SpectralSequencesAndConvergence builds, over an arbitrary abelian category, the
language in which a spectral sequence converges: limit pages, convergence structures in a set of
total degrees, morphisms of converging sequences, the comparison theorem, the classical
spectral sequence of a decreasingly filtered complex with its convergence theorems, and the
spectral sequence of an exact couple. It constructs no particular spectral sequence beyond these,
and it has no products. This Part II constructs the standard spectral sequences of homological
algebra inside that language and proves that they converge: the two spectral sequences of a double
complex for the direct-sum and the product totalisation, with the half-plane convergence theorems,
the comparison of totals and the acyclic assembly lemma; horseshoe and Cartan–Eilenberg
resolutions, the right derived functors of Mathlib's bounded-below derived category compared with
the classical ones, and the two hypercohomology spectral sequences of an additive functor, with
their hyperhomology and contravariant duals; the composition theorem for right derived
functors and the composite-functor spectral sequence of a complex; the balancing of Tor, the
universal-coefficient, Künneth and change-of-rings spectral sequences over rings; pairings of exact
couples, filtered complexes and double complexes with the Leibniz rule on every page; and the
Bockstein spectral sequence of a torsion-free complex with its higher Bocksteins, limit page and
convergence.

## Scope and ownership

This roadmap owns:

- the product totalisation of a double complex, the column and row filtrations of both
  totalisations, the two spectral sequences of a double complex as spectral sequences of filtered
  complexes, their first and second pages in any abelian category, their convergence for finitely
  many terms on each antidiagonal and in the half-plane cases, the comparison of totals and the
  acyclic assembly lemma;
- the horseshoe lemma for injective resolutions and its relative form, the right derived functors
  `RⁿF` of Mathlib's `CategoryTheory.Functor.rightDerivedFunctorPlus` with their comparison to
  `CategoryTheory.Functor.rightDerived`, Leray's acyclicity lemma, Cartan–Eilenberg resolutions
  with their existence and the lifting of chain maps, the two hypercohomology spectral sequences
  with their independence of the resolution and their naturality, and the hyper-left-derived
  functors and hyperhomology spectral sequences obtained through opposite categories;
- the canonical transformation `R(G ∘ F) ⟶ RG ∘ RF` on `D⁺` with Grothendieck's criterion for it
  to be an isomorphism, the composite-functor spectral sequence of a complex, its low-degree
  exact sequences and its naturality in the functors, and the right exact and mixed-variance
  composites;
- the balancing of Tor in a monoidal abelian category, the universal-coefficient spectral sequences
  for Tor and Ext, the Künneth spectral sequence over a commutative ring, and the change-of-rings
  spectral sequences;
- Massey's conditions for a pairing of exact couples, pairings of filtered complexes and of double
  complexes, and the Leibniz rule and convergence of the induced pairings on pages;
- the Bockstein exact couple of a complex of `f`-torsion-free modules, its pages, higher
  Bocksteins, higher universal-coefficient sequences, limit page and convergence.

It leaves to named owners:

- **SpectralSequencesAndConvergence**, the roadmap this Part II extends. It stops at the general
  language of convergence and builds no particular spectral sequence beyond those of a filtered
  complex, of a spectral object and of an exact couple, and no products. It owns Mathlib's carrier
  as used there, cycle and boundary towers and limit pages (§§1.2–1.4), bidegree assignments and
  boundedness (§§2.1–2.2), filtered objects and convergence structures (§§3.1–3.3), finite
  filtrations, the comparison theorem and the vanishing, two-column, two-row, edge-morphism and
  five-term consequences (§§3.4–3.6), spectral objects indexed by `EInt` and their convergence
  (Layer 4), the classical spectral sequence of a decreasingly filtered complex and its convergence
  (§§5.1–5.4), exact couples, their towers and the couple of a filtered complex (§§6.1–6.3), lim,
  lim¹, replete abelian categories and the complete convergence theorem (§§7.1, 7.2, 7.4, 7.5).
  Every spectral sequence of this roadmap is one of its filtered-complex or exact-couple spectral
  sequences and carries one of its convergence structures; no convergence theory is restated. Each
  of its sections used here is listed under *Exact supplier contracts* with the statement and
  hypotheses used; the classical indexing of its §5.1 is read directly on Tau Ceti's construction
  (Conventions).
- **GrothendieckEulerForms, §3.5**: comparison maps and the projective horseshoe lemma for
  projective resolutions in an exact category with enough projectives, implemented in Tau Ceti for
  finite resolutions (`TauCeti.ExactStructure.FiniteResolution.horseshoe`). For objects of an
  abelian category with enough projectives, the projective form of 2.1(a) is its case of the exact
  structure `TauCeti.ExactStructure.abelian`; 2.1 states the injective form with prescribed outer
  resolutions and no supply of injectives, the form for complexes and the relative form.
- **DerivedModuleAlgebra, §S.1**: the first-quadrant double complex with its second page, abutment
  filtration, stabilisation bound, edge morphisms, five-term and extended sequences, exact-rows
  comparison and homological form. Layer 1 states the second page and convergence for an arbitrary
  double complex whose totalisation exists; on first-quadrant double complexes, read in §S.1's
  convention of anticommuting differentials through `d′ = d₁`, `d″ = (−1)^p d₂` (1.2), it is §S.1's
  statement (the comparison 1.3(a′), which identifies the two sequences with their edge morphisms),
  and the edge morphisms and low-degree sequences of double complexes are not restated.
- **DerivedModuleAlgebra, §0.2**: the derived tensor product on `D(R)` for a commutative ring `R`,
  computed by `Tot(P ⊗ L)` when `P` is a bounded-above complex of flat modules. Layer 4 consumes it
  as the abutment of the universal-coefficient and Künneth spectral sequences.
- **ArithmeticGaloisDuality, §D7.1**, target *Derived composite spectral sequence*: the
  composite-functor spectral sequence `E₂^{a,b} = R^aH(R^bF(X)) ⇒ R^{a+b}(H ∘ F)(X)` of an object
  `X`, with finite filtrations and edge maps the canonical maps. Layer 3 states the sequence of a
  complex in `D⁺` for an additive first functor, of which §D7.1's is the case of an object and a
  left exact first functor (§D7.1 builds on DerivedModuleAlgebra §S.1's spectral sequence,
  identified with Layer 1's by 1.3(a′)), and adds the composition theorem, the low-degree sequences,
  naturality in the functors and the right exact and mixed-variance forms.
- **ArithmeticStatisticsPartVIII, §5.16** (*Tor spectral sequences over graded algebras*): the
  bigraded `Tor` of graded modules over a nonnegatively graded, possibly noncommutative algebra over
  a field, its balance, and its universal-coefficient and change-of-rings sequences, on its own
  graded carrier. Layer 4 states the ungraded Tor forms over commutative rings, on Mathlib's
  `CategoryTheory.Tor`; the two spectral sequences of a double complex of graded modules that
  §5.16 uses are those of Layer 1 in that abelian category.
- **Mathlib** (at the pin): `CategoryTheory.Abelian.Ext` is computed both from a projective
  resolution of the first variable and from an injective resolution of the second, so the
  balancing of Ext is a Check of Layer 4, not a target.
- **Tau Ceti** (at the pin): the row- and column-filtration spectral sequences of a first-quadrant
  homological bicomplex with their first pages and convergence, the quasi-isomorphism of totals
  induced by a quasi-isomorphism on rows and the exact-augmentation form, the comparison theorem for
  filtered cochain complexes with finite filtrations and its degreewise form for exhaustive
  filtrations of complexes of modules
  (`CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`,
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`), the horseshoe of
  finite projective resolutions of the outer terms of a conflation in an exact category (in an
  abelian category, the finite case of the projective form of 2.1(a) for objects), the Künneth short
  exact sequence for `ℕ`-indexed chain complexes `K`, `L` of modules over a commutative ring whose
  cycles `Z_q(L)` and quotients `L_q/Z_q(L)` are projective, with no condition on `K`
  (`HomologicalComplex.homologyKunnethShortComplex_shortExact`), the universal coefficient sequence
  for cohomology, K-flat complexes, `Tor₁` and the vanishing of `Tor_{≥2}` from a projective
  presentation of length one of the second variable
  (`CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel`,
  `CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`), and the Bocksteins of continuous
  cohomology of a compact group with trivial cyclic coefficients (`TauCeti.cyclicBockstein`). These
  are instances of Layers 1, 2, 4 and 6 and are consumed as they stand.
- **KhovanovHomology, §K5**: for bounded complexes of finitely generated free `ℤ`-modules and an
  abelian group `M`, the universal-coefficient short exact sequences for `C ⊗ M` and for
  `Hom(C, M)`, the Künneth short exact sequence of two such complexes, and the comparison of
  `CategoryTheory.Tor'` with `CategoryTheory.Tor` through a two-term free presentation of the first
  variable. Over `ℤ` these are the two-column sequences of 4.2(a), 4.2(c) and 4.3 and the case of
  4.1 for a first variable with a free resolution of length one; they stay with their owner and are
  compared in Checks of 4.1–4.3.
- **AlgebraicTopology, §5.1** (the Künneth spectral sequence of singular chains),
  **DGFloer, Layer 1 item 2** (the multiplicative Serre spectral sequence),
  **SchemeAndStackFoundations, §§2.2, 2.7, 2.15** (`leray_spectral_sequence`,
  `cech_to_cohomology`, `localToGlobal`, `hochschildSerre_galois_covering`) and
  **SchemeKTheoryOperations, §6.7** (the hyperhomology spectral sequence of a group acting on a
  chain complex): instances of Layers 2–5 that stay with their owners and are compared in Checks.

The spectral sequences of fibrations (Serre, Eilenberg–Moore), the Adams and Atiyah–Hirzebruch
spectral sequences, the coniveau and descent spectral sequences, the spectral sequences of group
extensions, graded Tor over graded algebras and Tor of one-sided modules over noncommutative rings
are not part of this roadmap. Neither are the
uniqueness of Cartan–Eilenberg resolutions up to homotopy of double complexes (no statement here
needs it: Layer 2 obtains the independence of the hypercohomology spectral sequences from the
existence of lifts), Grothendieck's comparison of the composite-functor sequences of a commuting
square of functors with resolving functors, Douady's products of spectral systems (douady1959 line
143–166, §II A), products on the hypercohomology and composite-functor spectral sequences, the
extension of the hypercohomology sequences to unbounded complexes for functors of finite injective
dimension, and the resolutions of unbounded complexes with exact kernel or cokernel complexes
(stacks-012K Lemmas 26.2 and 26.3).

## Conventions

- **Categories.** `𝒜`, `ℬ`, `𝒞` are abelian categories. Every further hypothesis is stated at the
  target that uses it. For derived functors, `𝒜` (and `ℬ` for composites) has enough injectives,
  and every category involved has a derived category in Mathlib's sense (`HasDerivedCategory`). The
  half-plane statements use the classes of SpectralSequencesAndConvergence: exact sequential
  colimits (`HasColimitsOfShape ℕ`, `HasExactColimitsOfShape ℕ`, its §5.4) for the direct-sum
  totalisation, whose terms are assumed to exist (Mathlib's `HomologicalComplex₂.HasTotal`; they do
  when the category has countable coproducts, `HasCountableCoproducts`), and the class of its
  §7.4 for the product totalisation: countable products and coproducts, exact sequential colimits,
  and repleteness (Tau Ceti's `TauCeti.IsReplete`: projections of limits of towers of epimorphisms
  are epimorphisms), which gives exact countable products (`CountableAB4Star`, by Tau Ceti's
  instance `TauCeti.IsReplete.countableAB4Star`) and, by its §7.2, `lim¹ = 0` for towers of
  epimorphisms. `ModuleCat R` belongs to both classes; module categories are `ModuleCat.{u} R`
  with `R : Type u`, where Mathlib's `AB5` instance lives and where repleteness is
  SpectralSequencesAndConvergence §7.2's theorem for module categories.
- **Indexing.** Cohomological throughout, as in SpectralSequencesAndConvergence: `E_r^{p,q}` with
  `p` the filtration degree, `p + q` the total degree and `d_r` of bidegree `(r, 1 − r)`;
  filtrations are decreasing. The spectral sequence of a decreasingly filtered complex `(K, F)` is
  Tau Ceti's `CochainComplex.spectralSequence (CochainComplex.filtrationFunctor G _)` for the
  increasing filtration `G_t = F^{−t}`, read in the classical indexing of
  SpectralSequencesAndConvergence §5.1: the classical term `E_r^{p,q}` is page `r + 1` at the native
  position `(2p + q + 1, −p − 1)`, with the classical bidegree assignment of
  SpectralSequencesAndConvergence §2.1. Taking `i₁ = −p − 1` and `i₂ = −p`,
  `CochainComplex.spectralSequenceFirstPageXIsoCokernel` gives `E_1^{p,q} ≅ H^{p+q}(gr^p K)`;
  `CochainComplex.spectralSequence_first_page_d_eq` identifies `d_1 : E_1^{p,q} → E_1^{p+1,q}` with
  the connecting morphism of `0 → gr^{p+1} K → F^p K / F^{p+2} K → gr^p K → 0`; and a filtered
  morphism induces a morphism of spectral sequences through `CochainComplex.filtrationFunctorMap`,
  `CochainComplex.spectralObjectMap` and
  `CategoryTheory.Abelian.SpectralObject.spectralSequenceMap`. *Witness:* for the stupid filtration
  of `ℤ →(×2) ℤ` in degrees `0, 1`, `E_1^{0,0} = E_1^{1,0} = ℤ` sit at native `(1, −1)` and
  `(3, −2)` on page `2`, and `d_1` is multiplication by `+2`. Homological sequences have pages of
  the homological shapes `ComplexShape.up' (−r, r − 1)` on `ℤ × ℤ`, written `E^r_{p,q}` with `d^r`
  of bidegree `(−r, r − 1)`, and carry the bidegree assignment `(p, q) ↦ (−p, −p − q)` with `e = 0`
  in the sense of SpectralSequencesAndConvergence §2.1 (a page-`r` relation lowers `p` by `r`, so it
  raises `−p` by `r`, and raises `−p − q` by `1`).
- **Convergence.** The convergence structures are those of SpectralSequencesAndConvergence §3.2,
  whose isomorphisms `β : E_∞ ≅ gr H` are data. When the spectral sequence of a filtered complex
  `(K, F)` (or one obtained from it by a stated reindexing) is said to converge, weakly, plainly or
  strongly, to `H^*(K)` with the induced filtration, the convergence is *through the canonical
  presentation* of SpectralSequencesAndConvergence §5.2: both of its maps are isomorphisms, and
  each `β` is their composite. Under SpectralSequencesAndConvergence §§5.3 and 5.4 this is how
  the convergence there arises (its §5.2 and the comparison of its §4.3), and for its §7.5 it is
  shown in 1.3(c). The canonical presentation is natural in filtered morphisms (1.2), which is what
  makes a filtered morphism of complexes a morphism of converging structures in the sense of
  SpectralSequencesAndConvergence §3.3. Every convergence asserted below is of this kind (6.2
  states its canonical comparison in the terms of its exact couple); an abstract `β` is never meant.
  *Witness:* the last Check of 1.2, where an abstract `β` exists and the canonical presentation is
  not invertible.
- **Double complexes.** A double complex is a Mathlib
  `HomologicalComplex₂ 𝒜 (ComplexShape.up ℤ) (ComplexShape.up ℤ)`: a complex (in `p`) of cochain
  complexes (in `q`). Write `K^{p,q}` for its terms, `d₁ : K^{p,q} → K^{p+1,q}` (horizontal) and
  `d₂ : K^{p,q} → K^{p,q+1}` (vertical); the two commute. The column `K^{p,•}` is the cochain
  complex `(K^{p,q}, d₂)_q` and the row `K^{•,q}` is `(K^{p,q}, d₁)_p`. The total differential on
  `K^{p,q}` is `d₁ + (−1)^p d₂` (Mathlib's `TotalComplexShape (up ℤ) (up ℤ) (up ℤ)`, with `ε₁ = 1`
  and `ε₂(p, q) = (−1)^p`; the same convention as stacks-012K line 2154–2164 and grothendieck1957
  line 1266–1268). `K.flip` has `K.flip^{q,p} = K^{p,q}`, and `HomologicalComplex₂.totalFlipIso`
  multiplies the summand `K^{p,q}` by `(−1)^{pq}`. *Witness:* in the unit square
  `K^{0,0} = K^{1,0} = K^{0,1} = K^{1,1} = ℤ` with every map the identity, the total differential
  sends `1 ∈ K^{0,0}` to `(1, 1) ∈ K^{1,0} ⊕ K^{0,1}`, and sends `K^{1,0}` and `K^{0,1}` to
  `K^{1,1}` by `−1` and `+1`; the square of the total differential vanishes, while the unsigned sum
  `d₁ + d₂` squares to `2 ≠ 0`.
- **Iterated cohomology.** `H_II^q(K)` is the complex (in `p`) of vertical cohomologies
  `H^q(K^{p,•})` with differential induced by `d₁`, and `H_I^p H_II^q(K)` its cohomology. `H_I^q(K)`
  is the complex (in `p`) of horizontal cohomologies, which is `H_II^q(K.flip)`, and
  `H_II^p H_I^q(K)` its cohomology.
- **Shifts, singles, connecting morphisms.** Mathlib's shift `K⟦n⟧` has terms `K^{m+n}` and
  differential multiplied by `(−1)^n`. `A[0]` is `A` placed in degree `0`. Connecting morphisms are
  Mathlib's, with no additional sign, as in SpectralSequencesAndConvergence.
- **Derived functors.** `RF` is
  `F.rightDerivedFunctorPlus : DerivedCategory.Plus 𝒜 ⥤ DerivedCategory.Plus ℬ`, and `RⁿF(X)` is the
  `n`th cohomology `DerivedCategory.Plus.homologyFunctor ℬ n` of `RF(X)`; for an object `A`,
  `RⁿF(A)` means `RⁿF` of `DerivedCategory.Plus.singleFunctor 𝒜 0` applied to `A`. An object `B` is
  *right acyclic* for `F`, or `F`-acyclic, when `RⁱF(B) = 0` for every integer `i > 0`
  (`IsRightAcyclic`); for a left exact `F` this is Stacks's notion (stacks-05QI line 2925–2935,
  Lemma 16.4, tag 015C), and it is a hypothesis only of statements about left exact functors (Checks
  use it for `− ⊗ ℤ/2` to show why).
- **Opposite categories.** A bounded-above cochain complex `K` of `𝒜` corresponds under Mathlib's
  `CochainComplex.opEquivalence` to the bounded-below complex `K°` of `𝒜ᵒᵖ` with
  `(K°)^n = op K^{−n}`. Right exact functors, left derived functors, projective resolutions and
  contravariant functors are treated by applying the right exact or contravariant functor's opposite
  to `K°`. *Witness:* for `K = (ℤ →(×2) ℤ)` in cohomological degrees `−1, 0`, `K°` sits in degrees
  `0, 1`, and its cohomology `H^1(K°) = op H^{−1}(K) = 0`, `H^0(K°) = op H^0(K) = op ℤ/2`.
- **Tor and Ext.** `Tor` and `Tor'` are Mathlib's `CategoryTheory.Tor` (left derived in the
  second variable) and `CategoryTheory.Tor'` (in the first). Statements with Tor over a ring take
  `R` commutative, Mathlib's monoidal structure on `ModuleCat R` requiring it; statements with Ext
  hold for any ring. In cohomological indexing a Tor term `Tor_k` sits at filtration degree
  `p = −k`. *Witness:* for `R = ℤ`, the universal-coefficient sequence of 4.2 for `K = ℤ/2[0]` and
  `M = ℤ/2` has `E₂^{0,0} = ℤ/2 ⊗ ℤ/2` and `E₂^{−1,0} = Tor_1(ℤ/2, ℤ/2) = ℤ/2`, giving
  `H^0 = H^{−1} = ℤ/2` for `ℤ/2 ⊗^L ℤ/2`.
- **Products.** Pairings are over a commutative ring `R`, bilinear on the terms and graded by
  adding bidegrees; the Koszul sign of a homogeneous element is that of its total degree.

## Exact supplier contracts

### From Mathlib

- `HomologicalComplex₂`, `HomologicalComplex₂.flip`, `HomologicalComplex₂.HasTotal`,
  `HomologicalComplex₂.total`, `HomologicalComplex₂.ιTotal`, `HomologicalComplex₂.totalDesc`,
  `HomologicalComplex₂.total.map` (`Mathlib/Algebra/Homology/HomologicalBicomplex.lean`,
  `TotalComplex.lean`): the direct-sum total complex, which exists when the coproducts over the
  antidiagonals exist. `HomologicalComplex₂.totalFlipIso` (`TotalComplexSymmetry.lean`) with the
  signs `σ(p, q) = (−1)^{pq}` of `TotalComplexShapeSymmetry (up ℤ) (up ℤ) (up ℤ)`
  (`ComplexShapeSigns.lean`), and `HomologicalComplex₂.flipFunctor`, the flip on morphisms
  (`HomologicalBicomplex.lean`). There is no product total complex at the pin. Acyclicity and
  quasi-isomorphisms are Mathlib's `HomologicalComplex.Acyclic` (exact in every degree) and
  `QuasiIso`.
- `HomologicalComplex.mapBifunctor`, `CategoryTheory.Functor.mapBifunctorHomologicalComplex`
  (`Mathlib/Algebra/Homology/Bifunctor.lean`): the double complex and the total complex of a
  bifunctor applied to two complexes.
- `HomologicalComplex.stupidTrunc` (`Mathlib/Algebra/Homology/Embedding/StupidTrunc.lean`),
  `HomologicalComplex.homologyOp` (`Mathlib/Algebra/Homology/Opposite.lean`),
  `CochainComplex.opEquivalence` (`Mathlib/Algebra/Homology/CochainComplexOpposite.lean`).
- `CategoryTheory.SpectralSequence` and `CategoryTheory.SpectralSequence.Hom`, whose field `comm`
  determines the page-`(r + 1)` component of a morphism from its page-`r` component
  (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`).
- `DerivedCategory.Plus`, `DerivedCategory.Plus.Q`, `DerivedCategory.Plus.homologyFunctor`,
  `DerivedCategory.Plus.singleFunctor`, `DerivedCategory.Plus.isIso_iff`
  (`Mathlib/Algebra/Homology/DerivedCategory/Plus.lean`); `CochainComplex.Plus`,
  `CategoryTheory.Functor.mapCochainComplexPlus` (`CochainComplexPlus.lean`);
  `CategoryTheory.Functor.rightDerivedFunctorPlus`,
  `CategoryTheory.Functor.rightDerivedFunctorPlusUnit` and
  `CategoryTheory.NatTrans.rightDerivedFunctorPlus`
  (`Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean`). The unit is an
  isomorphism at bounded-below complexes of injective objects, and `RF` is a triangulated right
  derived functor: with its unit it is an instance of `CategoryTheory.Functor.IsRightDerivedFunctor`
  for the quasi-isomorphisms (`Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean`, a left Kan
  extension along the localisation). Assumed: nothing about left derived functors on `D⁻` (there are
  none at the pin) and no comparison with `Functor.rightDerived` (none is proved at the pin; the
  documentation of this file and of `Mathlib/CategoryTheory/Abelian/RightDerived.lean` records only
  the intention to redefine `Functor.rightDerived` through `rightDerivedFunctorPlus`).
  `CategoryTheory.Functor.rightDerivedDesc`
  (`Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean`): the natural transformation out of a
  right derived functor determined by a transformation out of the functor it derives, through the
  universal property of a left Kan extension along the localisation; and
  `CategoryTheory.Functor.mapCochainComplexPlus` (`CochainComplexPlus.lean`), the functor that an
  additive functor induces on bounded-below complexes.
- `CategoryTheory.Functor.rightDerived`, `CategoryTheory.NatTrans.rightDerived`,
  `CategoryTheory.InjectiveResolution.isoRightDerivedObj`
  (`Mathlib/CategoryTheory/Abelian/RightDerived.lean`), `CategoryTheory.Functor.leftDerived`,
  `CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`,
  `CategoryTheory.Functor.leftDerivedZeroIsoSelf` (`LeftDerived.lean`, for additive `F` preserving
  finite colimits), `InjectiveResolution`,
  `ProjectiveResolution`, `CategoryTheory.Injective.injective_of_adjoint`,
  `CategoryTheory.Adjunction.map_injective` and the instance giving `EnoughInjectives 𝒜ᵒᵖ` from
  `EnoughProjectives 𝒜` (`Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean`).
- `CategoryTheory.InjectiveResolution`
  (`Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean`): an `ℕ`-indexed cochain complex
  of injective objects with a quasi-isomorphism from the object placed in degree `0`
  (`CochainComplex.single₀`); `CategoryTheory.ShortComplex.ShortExact` and
  `CategoryTheory.ShortComplex.Splitting` for short exact and split short exact sequences.
- `CategoryTheory.Tor`, `CategoryTheory.Tor'`, `CategoryTheory.isZero_Tor'_succ_of_projective`
  (`Mathlib/CategoryTheory/Monoidal/Tor.lean`, which records `Tor ≅ Tor'` as missing), defined for
  a monoidal abelian category with `MonoidalPreadditive` and `HasProjectiveResolutions`;
  `CategoryTheory.MonoidalCategory.tensorLeft` and `CategoryTheory.MonoidalCategory.tensorRight`;
  exactness of a functor as `PreservesFiniteLimits` together with `PreservesFiniteColimits`.
- `CategoryTheory.Abelian.Ext` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`),
  `CategoryTheory.ProjectiveResolution.extEquivCohomologyClass` and
  `CategoryTheory.InjectiveResolution.extEquivCohomologyClass`
  (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`, `Injective/Ext.lean`),
  `CochainComplex.IsKInjective`, `CochainComplex.IsKProjective`.
- `CochainComplex.IsStrictlyGE` (`Mathlib/Algebra/Homology/Embedding/CochainComplex.lean`): a
  cochain complex indexed by `ℤ` whose terms vanish below a given degree.
  `CochainComplex.isKInjective_of_injective`
  (`Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean`): a cochain complex indexed by `ℤ`,
  strictly bounded below, with injective terms is K-injective, that is, every map into it from an
  acyclic complex is null-homotopic. `CochainComplex.IsKInjective.Qh_map_bijective`
  (`Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean`, under `HasDerivedCategory`): for `L`
  K-injective, homotopy classes of maps into `L` are in bijection with maps into `L` in the derived
  category. `CochainComplex.Plus.exists_quasiIso_injective`
  (`Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean`): with enough
  injectives, a complex strictly bounded below by `n` has a quasi-isomorphism into a complex of
  injectives strictly bounded below by `n`. `CategoryTheory.InjectiveResolution.desc` and
  `CategoryTheory.InjectiveResolution.descHomotopy`
  (`Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean`): a morphism of objects lifts to their
  injective resolutions, uniquely up to homotopy; dually `CategoryTheory.ProjectiveResolution.lift`
  and `CategoryTheory.ProjectiveResolution.liftHomotopy`
  (`Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean`) for projective resolutions.
  Assumed: nothing beyond these statements; Mathlib's injective resolutions are indexed by `ℕ` and
  are extended to `ℤ` where K-injectivity is used.
- `ModuleCat.restrictScalars`, `ModuleCat.coextendScalars` and
  `ModuleCat.restrictCoextendScalarsAdj` for any rings, `ModuleCat.extendScalars` and
  `ModuleCat.extendRestrictScalarsAdj` for commutative rings
  (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`).
- `HasCountableProducts`, `HasCountableCoproducts`
  (`Mathlib/CategoryTheory/Limits/Shapes/Countable.lean`), `CountableAB4Star`
  (`Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean`), `HasExactColimitsOfShape`
  (`Mathlib/CategoryTheory/Limits/HasExactLimitsOfShape.lean`), and the instances `AB5` and
  `AB4Star` of `ModuleCat.{u} R` for `R : Type u` (`Mathlib/Algebra/Category/ModuleCat/AB.lean`).
  Assumed: nothing beyond the definitions; existence of countable products is not exactness of
  products.

### From Tau Ceti

- `CochainComplex.filtrationFunctor`, `CochainComplex.filtrationFunctorMap`,
  `CochainComplex.spectralObjectMap`, `CochainComplex.spectralSequence`,
  `CochainComplex.spectralSequenceFirstPageXIsoCokernel`
  (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean`, `Naturality.lean`),
  `CochainComplex.spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean`) and
  `CategoryTheory.Abelian.SpectralObject.spectralSequenceMap`
  (`TauCeti/Algebra/Homology/SpectralObject/SpectralSequenceMap.lean`): the spectral sequence of a
  filtered cochain complex in any abelian category, starting on native page `2`, its first page as
  the cohomology of the graded pieces when the filtration maps are monomorphisms (the instance on
  `filtrationFunctor`), its first differential as the connecting morphism, and the morphisms induced
  by morphisms of filtrations. Read in the classical indexing of the Conventions.
  `CochainComplex.filtrationAbutmentIso` (`Filtered/Convergence.lean`) and
  `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (`Filtered/Stabilization.lean`): the
  abutment of that spectral sequence is `Hⁿ(K)`, and a page on which the relevant cohomology of the
  filtration steps vanishes is the limit term `EInfty`; the identification of `E_∞` with the graded
  pieces that DerivedModuleAlgebra §S.1 uses, compared with the canonical presentation in 1.3(a′).
- `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`
  (`TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean`): a morphism of spectral sequences
  that is an isomorphism at every position of page `r` is one on every later page.
- `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`
  (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/Comparison.lean`): in any abelian category,
  for monotone filtrations `F` of `K` and `G` of `L` by subobjects, indexed by `ℤ`, that are finite
  as filtrations of complexes (`F_a = G_a = ⊥` and `F_b = G_b = ⊤` for some `a ≤ b`), a morphism of
  the filtration functors that induces an isomorphism at every position of some native page `r ≥ 2`
  induces isomorphisms `Hⁿ(K) → Hⁿ(L)` for every `n`.
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`
  (`Filtered/Exhaustive.lean`): the same conclusion in one degree `n`, for cochain complexes of
  modules over a ring, when, for some `a ≤ b`, the stages of index `≤ a` of both filtrations have no
  cohomology in degrees `n`, `n + 1`, both filtrations are exhaustive in degrees `n − 1`, `n`, and
  the graded pieces of index `≥ b` have no cohomology in degrees `n − 1`, `n`. Special cases of
  SpectralSequencesAndConvergence §3.5 for the spectral sequences of filtered complexes, used in 1.4
  for the finite case.
- `HomologicalComplex₂.rowFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`
  (`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean`), and
  `HomologicalComplex₂.quasiIso_total_map_of_rows`,
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`TauCeti/Algebra/Homology/TotalComplex.lean`): first-quadrant homological bicomplexes indexed by
  `ℕ × ℕ` in an abelian category.
- `TauCeti.ExactStructure.abelian` and `TauCeti.ExactStructure.abelian_conflation`
  (`TauCeti/CategoryTheory/Exact/Abelian.lean`): the exact structure of an abelian category whose
  conflations are the short exact sequences; `TauCeti.ExactStructure.abelian_isInjective_iff` and
  `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`
  (`TauCeti/CategoryTheory/Exact/Injective.lean`): its relative injectives are the injective
  objects, and the one-step injective horseshoe: for a conflation `X ↪ Y ↠ Z` and conflations
  `X ↪ I_X ↠ C_X`, `Z ↪ I_Z ↠ C_Z` with `I_X` injective, `Y` embeds by a conflation into a split
  extension of `I_Z` by `I_X`, with cokernel an extension of `C_Z` by `C_X`, compatibly with the
  given conflations.
- `TauCeti.ExactStructure.FiniteResolution.horseshoe`
  (`TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean`) and
  `TauCeti.ExactStructure.abelian_isProjective_iff`
  (`TauCeti/CategoryTheory/Exact/Projective.lean`): for a conflation in an exact category and finite
  resolutions of its outer terms by relative projectives, a finite projective resolution of the
  middle term, no longer than the longer of the two, with augmentation-compatible chain maps and
  degreewise split exactness; for `TauCeti.ExactStructure.abelian` the relative projectives are the
  projective objects. Consumed as it stands, as the finite case of the projective form of 2.1(a) for
  objects.
- `CochainComplex.IsKFlat`, `CochainComplex.isKFlat_of_boundedAbove_flat`,
  `CochainComplex.quasiIso_id_tensorHom` (`TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`).
- `HomologicalComplex.homologyCross`, `HomologicalComplex.homologyKunnethShortComplex_shortExact`
  (`TauCeti/Algebra/Homology/Monoidal/Homology/Cross.lean`, `Kunneth/Sequence.lean`) and
  `TauCeti.ChainComplex.exact_extToHomology_kronecker`
  (`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean`): compared in Checks. The Künneth
  sequence is stated for `ℕ`-indexed chain complexes `K`, `L` of modules over a commutative ring,
  under the hypotheses that the cycles `Z_q(L)` and the quotients `L_q/Z_q(L)` be projective, and
  none on `K` or on the ring; it reads
  `0 → ⊕_{p+q=m+1} H_p(K) ⊗ H_q(L) → H_{m+1}(K ⊗ L) → ⊕_{p+q=m} Tor₁(H_p K, H_q L) → 0`.
- `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` and
  `CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`
  (`TauCeti/CategoryTheory/Monoidal/Tor.lean`): in a monoidal abelian category with
  `MonoidalPreadditive` and `HasProjectiveResolutions`, for a short exact sequence
  `0 → P₁ → P₀ → M → 0` with `P₁`, `P₀` projective, `Tor₁(X, M) ≅ ker(X ⊗ P₁ → X ⊗ P₀)` and
  `Tor_n(X, M) = 0` for `n ≥ 2`; the presentation is of the second variable, the one Mathlib's `Tor`
  derives. Compared in the Check *Resolutions of length one* of 4.1.
- `TauCeti.cyclicBockstein`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/AllDegrees.lean`): for a
  compact group `G` and a natural number `n ≠ 0`, the connecting map of
  `0 → ℤ/n →(×n) ℤ/n² → ℤ/n → 0` (trivial action) on continuous cohomology, which Tau Ceti defines
  as the connecting map of the short exact sequence of homogeneous continuous cochains. Compared in
  the Examples of Layer 6.
- `TauCeti.IsReplete` and the instance `TauCeti.IsReplete.countableAB4Star`
  (`TauCeti/CategoryTheory/Limits/Replete.lean`): a category is replete when, for every tower
  `ℕᵒᵖ ⥤ C` whose transitions are epimorphisms, the projection to the first term of every limit
  cone is an epimorphism; an abelian replete category with countable products satisfies
  `CountableAB4Star`. `CategoryTheory.Functor.towerDifference`
  (`TauCeti/CategoryTheory/Preadditive/TowerDifference.lean`): the map `1 − s` on `∏ Fₙ` whose
  cokernel is `lim¹`. Assumed: nothing beyond these; no instance of repleteness for `ModuleCat` is
  used from the pin, that being SpectralSequencesAndConvergence §7.2's.

### From TauCetiRoadmap.SpectralSequencesAndConvergence

The convergence language of this roadmap is SpectralSequencesAndConvergence's (*Scope and
ownership*). Each of its sections that a statement or a route here uses is listed below with the
statement and hypotheses under which it is used; none of them is restated as a target here. The
classical indexing of its §5.1 is read on Tau Ceti's construction (Conventions, *From Tau Ceti*),
and the pages of an exact couple on which 5.1 states its pairings are StableHomotopyKTheory §7.22's.
Of its tower theory only the class of categories of §7.4, the vanishing of `lim¹` of §7.2 and the
complete convergence theorem of §7.5 are used, not the limit side of §7.4.

- **§1.2–§1.4.** For a spectral sequence `E` in Mathlib's carrier
  `CategoryTheory.SpectralSequence C c r₀` over an abelian category and a position `pq`: the cycle
  and boundary towers `B_r(pq) ≤ Z_r(pq)` in `(E.page r₀).X pq`, presenting `(E.page r).X pq` as
  `Z_r/B_r` (§1.2); the notions "`E` stabilises at `pq` from page `s`" (every differential of every
  page `r ≥ s` leaving or entering `pq` vanishes), "`E` is regular at `pq`" (the leaving
  differentials vanish for all large `r`) and "`E` degenerates at page `s`" (every differential of
  every page `r ≥ s` vanishes), with the canonical isomorphisms `(E.page s).X pq ≅ (E.page r).X pq`
  for `r ≥ s` under stabilisation, compatible with composition and natural in morphisms, and
  stabilisation at every position from `s` under degeneration at `s` (§1.3); and the limit page
  `E_∞(pq) = Z_∞/B_∞` wherever the meet `Z_∞` of the `Z_r` and the join `B_∞` of the `B_r` exist in
  `Subobject ((E.page r₀).X pq)` (always under countable products and countable coproducts), with
  `E_∞(pq) ≅ (E.page s).X pq` when `E` stabilises at `pq` from `s` (no hypothesis on the category),
  functorial in morphisms of spectral sequences having limit pages (§1.4). Used in 1.3(a) and (c),
  4.2, 4.3 and 6.2, and through §3.2 wherever a convergence is stated.
- **§2.1.** Bidegree assignments `(fil, deg, e)` for a spectral sequence in Mathlib's carrier
  (`pq ↦ (fil pq, deg pq)` injective, every relation of page `r` raising `deg` by `1` and `fil` by
  `r − e`), transported along isomorphisms of spectral sequences; the cohomological assignment
  `(p, q) ↦ (p, p + q)`, `e = 0`; and the classical filtered-complex assignment
  `(p, q) ↦ (−q − 1, p + q)`, `e = 1`, on the native positions of `coreE₂Cohomological`. The
  homological assignment of the Conventions is an assignment in the sense of this definition. Used
  in the Conventions and 2.6, and through 2.6 in 3.4 and 4.4.
- **§2.2.** For a spectral sequence with a bidegree assignment, vanishing at a position persists to
  all later pages; a bounded-below sequence (for every `n` there is `β(n)` with
  `(E.page r₀).X pq = 0` whenever `deg pq = n` and `fil pq ≥ β(n)`) is regular at every position;
  and if only finitely many first-page positions of total degrees `n − 1` and `n + 1` are nonzero,
  every position of total degree `n` stabilises. Used in 1.3(a) (the stabilisation bound) and
  1.3(c) (the regularity criterion).
- **§3.1.** Decreasingly filtered objects as Mathlib `CategoryTheory.FilteredObject C ℤᵒᵖ`, their
  graded pieces `gr^p = F^p/F^{p+1}`, functorial in `CategoryTheory.FilteredObject.Hom`, and the
  predicates exhaustive (`⊤` is the join of the steps), separated (`⊥` is their meet), complete (the
  cone from `X` to the system `(X/F^p X)_p` is a limit cone) and finite (`F^a X = X` and
  `F^b X = 0` for some `a ≤ b`), finite implying the other three. Used in 6.2, and through §3.2.
- **§3.2.** For a spectral sequence `E` with a bidegree assignment `(fil, deg, e)`, a set `I ⊆ ℤ`
  and an abutment `H : ℤ → FilteredObject C ℤᵒᵖ`: the structures of weak convergence in `I`
  (limit pages at every position of total degree in `I`, isomorphisms `β : E_∞(pq) ≅ gr^s H^n`
  when `(fil pq, deg pq) = (s, n)` with `n ∈ I`, and `gr^s H^n = 0` when `(s, n)` is not of this
  form), of convergence in `I` (adding that the filtration of every `H^n`, `n ∈ I`, is exhaustive
  and separated) and of strong convergence in `I` (adding completeness), each restricting to
  subsets of `I` and transported along isomorphisms of spectral sequences and filtered
  isomorphisms of abutments. Used wherever a convergence is stated: 1.3–1.5, 2.4–2.6, 3.2–3.4,
  4.2–4.4, 5.2 and 6.2.
- **§3.3.** Morphisms of weakly converging structures in `I`: pairs `(f, h)` of a
  `CategoryTheory.SpectralSequence.Hom` `f : E ⟶ E′` and filtered morphisms `h_n : H^n ⟶ H′^n`
  with `β′ ∘ E_∞(f, pq) = gr^s(h_n) ∘ β` at every position of total degree `n ∈ I`, forming a
  category whose composition and identities are those of the components. Used in 1.4, 2.4, 2.5
  and 3.3.
- **§3.4.** Weak convergence in degree `n` together with a finite filtration of `H^n` is strong
  convergence in degree `n`; `H^n` then has a finite chain of subobjects whose successive quotients
  are the `E_∞` at the positions of total degree `n`, vanishes when all of them vanish, and lies in
  every weak Serre class (a property of objects containing `0` and closed under kernels, cokernels
  and extensions) that contains all of these `E_∞`, or that contains all `E_r` of total degree `n`
  for a page `r` on which every position of total degree `n` has reached its limit page. Used in
  1.3(a) and in the two-column sequences of 4.2 and 4.3.
- **§3.5.** For a morphism `(f, h)` of weakly converging structures in degree `n` such that `f` is
  an isomorphism at every position of some page `s ≥ r₀`: `E_∞(f)` is an isomorphism at every
  position of total degree `n`; `h_n` is an isomorphism when the filtrations of `H^n` and `H′^n`
  are finite; and, in an abelian category with exact sequential colimits, `h_n` is an isomorphism
  when both structures converge strongly in degree `n`. Used in 1.4.
- **§3.6.** For an `E₂` cohomological spectral sequence with the cohomological assignment and
  `E_2^{p,q} = 0` for `p < 0` or `q < 0`: under convergence in degree `n`, the edge morphisms
  `E_2^{n,0} ↠ E_∞^{n,0} ≅ F^n H^n ↪ H^n` and `H^n ↠ H^n/F^1 H^n ≅ E_∞^{0,n} ↪ E_2^{0,n}`; under
  convergence in degrees `1` and `2`, the exact sequence
  `0 → E_2^{1,0} → H^1 → E_2^{0,1} → E_2^{2,0} → H^2`, whose map `E_2^{0,1} → E_2^{2,0}` is `d_2`
  and whose other maps are the edge morphisms; and, for `m ≥ 1` with `E_2^{p,q} = 0` for all `p` and
  `0 < q < m`, under convergence in degrees up to `m + 1`, the isomorphisms `E_2^{j,0} ≅ H^j` for
  `j < m` and the exact sequence `0 → E_2^{m,0} → H^m → E_2^{0,m} → E_2^{m+1,0} → H^{m+1}`. Used in
  1.3(a′) and 3.3, and through 2.6 in the low-degree sequences of 3.4 and 4.4.
- **§4.3 and §4.6.** For a spectral object `X : CategoryTheory.Abelian.SpectralObject C EInt` and a
  position `(p, q)`, `n = p + q`, at which `X.spectralSequence coreE₂Cohomological` has a limit
  page, with `Zᵗ = ker(δ : H^n(q ≤ q + 1) → H^{n+1}(⊥ ≤ q))` and
  `Bᵗ = im(δ : H^{n−1}(q + 1 ≤ ⊤) → H^n(q ≤ q + 1))`: `Zᵗ ≤ Z_∞` and `B_∞ ≤ Bᵗ`, and the canonical
  subobject `Zᵗ/B_∞` of `E_∞(p, q)` maps onto Tau Ceti's
  `CategoryTheory.Abelian.SpectralObject.EInfty q n ≅ Zᵗ/Bᵗ`, the inclusion being an isomorphism
  exactly when `Z_∞ = Zᵗ` and the projection exactly when `B_∞ = Bᵗ` (§4.3); and a morphism of
  spectral objects induces a morphism of the converging structures whose `β` are these
  comparisons (§4.6). Used in 1.2 (naturality of the canonical presentation) and 5.2, and through
  §5.2.
- **§5.1.** The spectral sequence of a decreasingly filtered complex `(K, F)` is Tau Ceti's
  `CochainComplex.spectralSequence (CochainComplex.filtrationFunctor G _)` for `G_t = F^{−t}`, read
  in the classical indexing: `E_r^{p,q}` is page `r + 1` at `(2p + q + 1, −p − 1)`, with
  `E_1^{p,q} ≅ H^{p+q}(gr^p K)`, `d_1` the connecting morphism, and filtered morphisms inducing
  morphisms of spectral sequences. Used in the Conventions and throughout.
- **§5.2.** For a cochain complex `K` with an antitone family `F : ℤ → Subobject K` of
  subcomplexes, the induced filtration `F^p H^n(K) = im(H^n(F^p K) → H^n(K))`, functorial in
  filtered morphisms, and, wherever the limit page exists at `(p, n − p)`, the canonical
  presentation of `gr^p H^n(K)` as a subquotient of `E_∞^{p,n−p}`: an inclusion
  `Zᵗ/B_∞ ↪ E_∞^{p,n−p}` followed by a projection `Zᵗ/B_∞ ↠ Zᵗ/Bᵗ ≅ gr^p H^n(K)` (§4.3 read through
  Tau Ceti's `CochainComplex.filtrationAbutmentIso`). When both maps are isomorphisms at every
  position of total degree in `I`, these comparisons are the `β` of a weak convergence structure in
  `I` (stacks-012K line 3131–3140, Definition 24.9, tag 012U). The existence of some other
  isomorphism `E_∞^{p,n−p} ≅ gr^p H^n(K)` does not make the presentation invertible (its fourth
  Check). Used in the Conventions, 1.2, 1.3, 1.4 and 5.2.
- **§5.3.** For a decreasingly filtered cochain complex `(K, F)` in an abelian category and an
  integer `n` such that the filtrations of `K^{n−1}`, `K^n` and `K^{n+1}` are finite, the spectral
  sequence in the classical indexing stabilises at every position of total degree `n` and converges
  strongly in degree `n` to `H^n(K)` with the induced filtration, which is finite, through the
  canonical isomorphisms of §5.2; and `H^n(K)` lies in every weak Serre class that contains every
  `E_r^{p,q}` for some `r`. Used in 1.3(a), 4.3 and 5.2.
- **§5.4.** In an abelian category with exact sequential colimits, for a decreasingly filtered
  cochain complex `(K, F)` and an integer `n` such that the filtration is exhaustive on `K^{n−1}`
  and `K^n` and `H^m(F^s K) = 0` for `m ∈ {n, n + 1}` and all `s ≥ p₀(n)` (in particular when
  `F^s K^n = F^s K^{n+1} = 0` for `s ≥ p₀(n)`), the spectral sequence in the classical indexing is
  regular and has a limit page at every position of total degree `n`, and converges strongly in
  degree `n` to `H^n(K)` with the induced filtration, through the canonical isomorphisms of §5.2.
  Its comparison item: a morphism of the filtration functors of two such filtrations that is an
  isomorphism at every position of some native page `r ≥ 2` induces an isomorphism on `H^n`. Used in
  1.3(b), 1.4, 1.5 and 5.2.
- **§6.1.** For a bigraded exact couple of StableHomotopyKTheory §7.22 with degrees `a, b, c`, its
  spectral sequence in Mathlib's carrier
  `CategoryTheory.SpectralSequence C (fun r ↦ ComplexShape.up' (c + b − (r − 1) • a)) 1`, whose page
  `r` is the `E` of the `(r − 1)`-th derived couple with differential `j ∘ k` and whose homology
  isomorphisms identify the `E` of the next derived couple with `H(E, jk)`, functorial in morphisms
  of exact couples; for `a = (−1, 1)`, `b = (0, 0)`, `c = (1, 0)` it is a
  `CategoryTheory.CohomologicalSpectralSequence C 1`. Used in 5.2, 6.1 and 6.2.
- **§6.2.** For a cohomological exact couple, the towers of its spectral sequence are
  `Z_{r+1}^{s,t} = k^{−1}(im(i^r : D^{s+r+1,t−r} → D^{s+1,t}))` and
  `B_{r+1}^{s,t} = j(ker(i^r : D^{s,t} → D^{s−r,t+r}))`, the differential `d_{r+1}` sends the class
  of `x` with `k x = i^r y` to the class of `j y`, and the limit page exists whenever the meet of
  the `im i^r` and the join of the `ker i^r` exist, with `Z_∞ = k^{−1}(⋂_r im i^r)` and
  `B_∞ = j(⋃_r ker i^r)`. Used in 1.3(c) and 6.2.
- **§6.3.** For a decreasingly filtered cochain complex `(K, F)`, the cohomological exact couple
  `D^{s,t} = H^{s+t}(F^s K)`, `E^{s,t} = H^{s+t}(gr^s K)` with the maps of the long exact cohomology
  sequences, functorial in filtered morphisms, whose spectral sequence (§6.1) is the classical one
  of §5.1, compatibly with the differentials. Used in 1.3(c), 5.2 and 6.1.
- **§7.2.** Repleteness (Tau Ceti's `TauCeti.IsReplete`) of an abelian category with countable
  products is equivalent to `CountableAB4Star` together with `lim¹ = 0` for every tower of
  epimorphisms, `lim¹` being the cokernel of Tau Ceti's `CategoryTheory.Functor.towerDifference`;
  `ModuleCat.{v} R` is replete for every ring `R`. Used in the Conventions, 1.3(c) and 1.5.
- **§7.4 and §7.5.** The class of §7.4: abelian categories with countable products and coproducts,
  exact sequential colimits and repleteness. In it (§7.5), for a decreasingly filtered cochain
  complex `(K, F)` whose filtration is exhaustive and complete (`K^m ≅ lim_p K^m/F^p K^m`) in every
  degree and whose spectral sequence in the classical indexing is regular, and such that for every
  `n` there is a bound below which `E_1^{p,m−p} = 0` for `m ∈ {n − 1, n}`, the spectral sequence
  converges strongly in every degree to `H^*(K)` with the induced filtration; the isomorphisms are
  those of §7.4's first theorem for the exact couple of §6.3, induced by `j`. Used in the
  Conventions, 1.3(c) and 1.5.

### From TauCetiRoadmap.StableHomotopyKTheory

- §7.22: bigraded exact couples in an abelian category, their derived couples and their pages: page
  `r ≥ 1` is the `E` of the `(r − 1)`-th derived couple, with `d_r = j ∘ k` there of degree
  `c + b − (r − 1)a`. These pages carry the pairings of 5.1, and the couples are the input of
  SpectralSequencesAndConvergence §6.1. Assumed: the derived couple is again exact.

### From TauCetiRoadmap.GrothendieckEulerForms

- §3.5: the projective horseshoe lemma for projective resolutions in an exact category with enough
  projectives, with comparison maps to a fixed projective resolution unique up to chain homotopy.
  Cited in 2.1 for the projective forms over an abelian category, through the exact structure
  `TauCeti.ExactStructure.abelian`; nothing of it is used in a route here.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §0.2: the derived tensor bifunctor on `D(R)` for a commutative ring `R`, symmetric monoidal with
  unit `R[0]`, with `P ⊗^L L ≅ Tot(P ⊗ L)` naturally for every bounded-above complex `P` of flat
  modules.
- §S.1: the first-quadrant double complex spectral sequence and its consequences (second page,
  abutment filtration, edge morphisms, five-term and extended sequences), for double complexes with
  anticommuting differentials, compared with Layer 1 through `d′ = d₁`, `d″ = (−1)^p d₂` (1.2) and
  identified with `′E` of a first-quadrant double complex, with its edge morphisms, in 1.3(a′).
  Assumed: what its API and proof sketch state, that its spectral sequence is Tau Ceti's spectral
  sequence of the column filtration of the total complex, with abutment and `E_∞` identified
  through Tau Ceti's `CochainComplex.filtrationAbutmentIso` and
  `CochainComplex.filtrationSpectralSequencePageXIsoEInfty`.

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §D7.1, target *Derived composite spectral sequence*: for left exact `F : 𝒜 → ℬ`, `H : ℬ → 𝒞`
  with `𝒜, ℬ` having enough injectives and `F` sending injectives to `H`-acyclic objects, the
  natural convergent first-quadrant spectral sequence `E₂^{a,b} = R^aH(R^bF(X)) ⇒ R^{a+b}(H ∘ F)(X)`
  of an object `X`, with finite filtrations, whose edge maps are the canonical maps
  `R^aH(F(X)) → R^a(H ∘ F)(X)` and `R^b(H ∘ F)(X) → H(R^bF(X))`. Assumed: what its statement, its
  *Needs* line and its proof sketch say, that the sequence is DerivedModuleAlgebra §S.1's spectral
  sequence of the first-quadrant double complex obtained by applying `H` to a Cartan–Eilenberg
  resolution of `F` applied to an injective resolution of `X`, filtered so that its second page is
  `R^aH(R^bF(X))`, with abutment identified with `R^{a+b}(H ∘ F)(X)` through the acyclicity of the
  `F` of the injective terms. That double complex is the one of 3.2 for `X[0]`, and 1.3(a′),
  through the flip, identifies §S.1's sequence of it and its edge morphisms with `E(F, H; X[0])` of
  3.2 and the edge morphisms of SpectralSequencesAndConvergence §3.6; nothing else of §D7.1's
  construction is used.

## How to read the build

Layer 1 totalises double complexes, filters the totals by columns and by rows, and identifies the
two resulting spectral sequences of filtered complexes through their second pages; it proves their
convergence when every antidiagonal is finite and in the half-plane cases, by
SpectralSequencesAndConvergence §§5.3, 5.4 and 7.5, and deduces the acyclic assembly lemma and,
through mapping cones, the comparison of totals. Layer 2 builds horseshoe and Cartan–Eilenberg
resolutions, compares Mathlib's two right derived functors, and obtains the two hypercohomology
spectral sequences as the two spectral sequences of Layer 1 for a Cartan–Eilenberg resolution;
opposite categories give their duals. Layer 3 composes right derived functors on `D⁺` and obtains
the composite-functor spectral sequence of a complex as a second hypercohomology sequence. Layer 4
applies Layers 1–3 to modules: balancing Tor, the universal-coefficient sequences, the Künneth
sequence and the change-of-rings sequences. Layer 5 constructs products on the pages of exact
couples, filtered complexes and double complexes. Layer 6 constructs the Bockstein spectral sequence
as an exact couple and as the spectral sequence of a filtered complex, and computes its pages and
its limit page.

The roadmap is this README. `Suggested.lean` states the headline theorems whose carriers exist at
the pins: the direct-sum forms of the comparison of totals and of the acyclic assembly lemma (1.4,
1.5), the horseshoe lemma for injective resolutions of objects and of bounded-below complexes and
the relative horseshoe lemma (2.1(a), (a′), (b)), the comparison of Mathlib's two right derived
functors and Leray's acyclicity lemma (2.2(i), (v)), Grothendieck's criterion for the composition of
right derived functors (3.1) and the balancing of Tor (4.1). The spectral sequences themselves,
their convergence and products, the product totalisation, Cartan–Eilenberg resolutions and the
Bockstein spectral sequence are targets of this README whose carriers the pins lack; its module
docstring names what each lacks.

## Layer 1: double complexes and their two spectral sequences

### 1.1 Total complexes

Define the *product total complex* `Tot^Π(K)` of a double complex `K` in a preadditive category with
the products over the antidiagonals (for instance with countable products): its term in degree `n`
is `∏_{p+q=n} K^{p,q}`, and the component of its differential with target `K^{p,q}`
(`p + q = n + 1`) is `d₁ ∘ π_{p−1,q} + (−1)^p d₂ ∘ π_{p,q−1}`, where `π` are the product projections
(stacks-012K line 3400–3409, the complex `Tot_π` in the proof of Lemma 26.3, tag 09J0; weibel1994
§1.2, uncertified). The direct-sum total complex `Tot^⊕(K)` is Mathlib's `HomologicalComplex₂.total`
for the shape `up ℤ`. *Needs:* Mathlib `HomologicalComplex₂`, `HomologicalComplex₂.HasTotal`,
`HomologicalComplex₂.total`, `HomologicalComplex₂.totalFlipIso`, `HasCountableProducts`,
`HasCountableCoproducts`.

- The differential of `Tot^Π(K)` squares to zero; `Tot^Π` is an additive functor from double
  complexes to cochain complexes, and a morphism into `Tot^Π(K)` is determined by its composites
  with the projections.
- `Tot^⊕(K)` exists (Mathlib's `HasTotal`) when the category has countable coproducts, and in any
  preadditive category with finite coproducts when each antidiagonal has finitely many nonzero
  terms.
- When both exist, the canonical comparison `κ : Tot^⊕(K) → Tot^Π(K)`, the identity on each summand,
  is a natural chain map; it is an isomorphism when each antidiagonal has finitely many nonzero
  terms.
- `Tot^Π(K.flip) ≅ Tot^Π(K)` with the signs `(−1)^{pq}` of `HomologicalComplex₂.totalFlipIso`, and
  `κ` commutes with the two flip isomorphisms.

**Checks.**

- In the unit square of the Conventions, `Tot^Π = Tot^⊕` and the differential has the components
  computed there; a definition with `+d₂` in every column has a differential of square `2`.
- *Column sign.* For `K` concentrated in column `1` with `K^{1,0} = ℤ →(×2) K^{1,1} = ℤ`, both
  totals are `ℤ →(−2) ℤ` in degrees `1, 2`, with `H^2 = ℤ/2`; a sign `(−1)^q` or `(−1)^{p+1}` in
  place of `(−1)^p` would give `+2`.
- *The staircase.* Let `D_p = K^{p,−p} = ℤ` and `O_p = K^{p+1,−p} = ℤ` for `p ≥ 0`, all other terms
  zero, with `d₁ : D_p → O_p` and `d₂ : D_{p+1} → O_p` the identity. In degree `0` the total
  differential sends `x = (x_p)` to `(x_p − (−1)^p x_{p+1})_p` in degree `1`. On `Tot^⊕` it is an
  isomorphism `⊕ D_p → ⊕ O_p`; on `Tot^Π` its kernel is spanned by `(1, 1, −1, −1, 1, 1, …)`, so
  `H^0(Tot^⊕ K) = 0` and `H^0(Tot^Π K) = ℤ`. The comparison `κ` is injective and not surjective in
  degree `0`.
- *Column `0` carries no sign.* A double complex concentrated in column `0` has both totals equal to
  that column, with the same differential (`(−1)^0 = 1`); the sign `(−1)^{p+1}` would negate it.

### 1.2 The column and row filtrations and the two spectral sequences

For a double complex `K` and `Tot(K)` one of `Tot^⊕(K)`, `Tot^Π(K)`, define the *column filtration*
`F_I^p Tot(K)` as the subcomplex formed by the columns of index at least `p` (the total complex of
the truncation of `K` to those columns, through Mathlib's `HomologicalComplex.stupidTrunc`), a
decreasing filtration by subcomplexes. Define the *first spectral sequence* `′E(K)` as the spectral
sequence of the decreasingly filtered complex `(Tot(K), F_I)` (Conventions), and the *second
spectral sequence* `″E(K)` as `′E(K.flip)`, whose abutment `H^*(Tot(K.flip))` is identified with
`H^*(Tot(K))` through the flip isomorphism of 1.1; the filtration it transports to `Tot(K)` is the
*row filtration* `F_II^p`, formed by the rows of index at least `p`. Prove (stacks-012K line
3241–3265, §25 and Lemma 25.1, tags 012X and 0130; grothendieck1957 line 1226–1235, (2.4.1)):

- `gr^p_I Tot(K) ≅ (K^{p,•})⟦−p⟧`, the sign of the shift matching the column sign `(−1)^p`;
- `′E_1^{p,q} ≅ H^q(K^{p,•})`, with `′d_1 = H^q(d₁)`; hence `′E_2^{p,q} ≅ H_I^p H_II^q(K)`;
- `″E_1^{p,q} ≅ H^q(K^{•,p})`, with `″d_1 = H^q(d₂)`; hence `″E_2^{p,q} ≅ H_II^p H_I^q(K)`;
- a morphism of double complexes induces morphisms of both spectral sequences and filtered maps of
  the abutments (Tau Ceti `CochainComplex.filtrationFunctorMap`, `CochainComplex.spectralObjectMap`,
  `CategoryTheory.Abelian.SpectralObject.spectralSequenceMap`), functorially;
- the induced filtrations `F_I^p Hⁿ(Tot K)` and `F_II^p Hⁿ(Tot K)` are those of
  SpectralSequencesAndConvergence §5.2, and when the limit page exists `gr^p_I Hⁿ` is a subquotient
  of `′E_∞^{p,n−p}` through the canonical presentation of SpectralSequencesAndConvergence §5.2,
  natural in morphisms of double complexes; convergence of `′E` or `″E` (1.3) is convergence through
  this presentation (Conventions), and the presentation can fail to be invertible while
  `′E_∞^{p,n−p} ≅ gr^p_I Hⁿ` holds abstractly (last Check).

*Needs:* 1.1; SpectralSequencesAndConvergence §5.2, and §§4.3, 4.6 for the naturality of the
canonical presentation (the comparisons of §4.3 are natural in morphisms of spectral objects, which
is what §4.6 uses, and a filtered morphism induces one through Tau Ceti's
`CochainComplex.spectralObjectMap`); Mathlib `HomologicalComplex₂.flip`,
`HomologicalComplex₂.totalFlipIso`, `HomologicalComplex.stupidTrunc`; Tau Ceti
`CochainComplex.spectralSequence`, `CochainComplex.filtrationFunctor`,
`CochainComplex.filtrationFunctorMap`, `CochainComplex.spectralObjectMap`,
`CategoryTheory.Abelian.SpectralObject.spectralSequenceMap`,
`CochainComplex.spectralSequenceFirstPageXIsoCokernel`,
`CochainComplex.spectralSequence_first_page_d_eq`.

- `κ : Tot^⊕(K) → Tot^Π(K)` is a filtered map for the column filtrations and an isomorphism on every
  `gr^p_I`, so it induces an isomorphism of first spectral sequences from page `1` on; whether it is
  a quasi-isomorphism is decided by convergence (1.3).
- A morphism of double complexes that is a quasi-isomorphism on every column induces an isomorphism
  of first spectral sequences from page `1` on.

**Checks.**

- *First differential.* For `K^{0,0} = ℤ →(d₁ = ×2) K^{1,0} = ℤ`, the column filtration is the
  stupid filtration of `ℤ →(×2) ℤ`, `′d_1 : ′E_1^{0,0} = ℤ → ′E_1^{1,0} = ℤ` is `+2` (the witness of
  SpectralSequencesAndConvergence's Conventions), `′E_2^{1,0} = ℤ/2` and `′E_2^{0,0} = 0`.
- *Sign of `″d_1`.* For the column-sign complex of 1.1 (`K^{1,0} →(×2) K^{1,1}`),
  `″E_1^{0,1} = H^1(K^{•,0}) = ℤ`, `″E_1^{1,1} = H^1(K^{•,1}) = ℤ` and `″d_1 = +2` here, while
  stacks-012K Lemma 25.1(4) gives `(−1)^q H^q(d₂) = −2` for the row filtration of `Tot(K)` itself.
  `HomologicalComplex₂.totalFlipIso` has component `σ(1, 0) = +1` on `K^{1,0}` and `σ(1, 1) = −1` on
  `K^{1,1}`, and intertwines the two. Both give `″E_2^{1,1} = ℤ/2 = H^2(Tot K)`.
- A double complex with exact columns has `′E_1 = 0`.
- *Dictionary with DerivedModuleAlgebra §S.1.* §S.1's double complexes have anticommuting
  differentials `d′` (in `p`) and `d″` (in `q`). A double complex here gives one there by `d′ = d₁`,
  `d″ = (−1)^p d₂`: then `d′d″ + d″d′ = (−1)^p d₁d₂ + (−1)^{p+1} d₂d₁ = 0`, the total differential
  `d′ + d″` is `d₁ + (−1)^p d₂`, the column filtration is the same, and the vertical cohomologies,
  hence `H_I H_II`, are unchanged. On the unit square of the Conventions, `d″` is `+1` on `K^{0,0}`
  and `−1` on `K^{1,0}`, matching the total differential computed there; taking `d″ = d₂` instead
  would give `d′d″ + d″d′ = 2` on `K^{0,0}`. For a first-quadrant `K`, `′E_2 ≅ H_I H_II(K)` is then
  §S.1's identification (1.3(a′)), and for a first-quadrant homological bicomplex the first page
  agrees with Tau Ceti's `HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`.
- For the staircase, `′E_1` of both totals is `ℤ` at `(0, 0)` and zero elsewhere, and `κ` is an
  isomorphism on it although it is not a quasi-isomorphism.
- *Convergence is through the canonical presentation.* Over a field `k` let `V = ⊕_{n ≥ 0} k e_n`,
  and let `K^{0,0} = k y_0 ⊕ V`, `K^{−m,m−1} = k x_m` and `K^{−m,m} = k y_m` for `m ≥ 1`, other
  terms zero, with `d₂(x_m) = y_m`, `d₁(x_m) = y_{m−1}` and all other components zero. Columns `−m`,
  `m ≥ 1`, are exact, so for both totals `′E_1 = ′E_∞` is `k y_0 ⊕ V` at `(0, 0)` and zero
  elsewhere. The total differential sends `x_m` to `y_{m−1} + (−1)^m y_m`. On `Tot^Π` it maps
  `∏_m k x_m` isomorphically onto `∏_{j ≥ 0} k y_j` (`a_1 = b_0`, `a_{j+1} = b_j − (−1)^j a_j`;
  `y_0` is the boundary of `(1, 1, −1, −1, 1, 1, …)`, which lies in no `F_I^p`), so
  `H^0(Tot^Π K) = V = F_I^0 H^0`, `F_I^1 H^0 = 0`, `H^{−1} = 0`, and the canonical presentation at
  `(0, 0)` is the projection `k y_0 ⊕ V ↠ V`, with kernel `k y_0` (`B_∞ = 0`, `Bᵗ = k y_0`). Yet
  `(a y_0, Σ v_n e_n) ↦ a e_0 + Σ v_n e_{n+1}` is an isomorphism `k y_0 ⊕ V ≅ V`, and with zero
  elsewhere an abstract strong convergence structure (the filtration of `H^0` is finite). So `′E`
  does not converge to `H^*(Tot^Π K)` in the sense of the Conventions, and 1.3(c) does not apply
  (`K^{−m,m} ≠ 0` for every `m`). On `Tot^⊕` the image of `⊕_m k x_m` misses `y_0` (the functional
  with values `1, 1, −1, −1, …` on `y_0, y_1, y_2, y_3, …` kills it), so `H^0(Tot^⊕ K) = k y_0 ⊕ V`
  and the canonical presentation is the identity, as 1.3(b) asserts for this left half-plane `K`.

### 1.3 Convergence

Prove (stacks-012K line 3284–3291, Lemma 25.3, tag 0132, for (a); stacks-012K line 3250–3257 and
3271–3283, §25 and Definition 25.2, tags 012X and 0131, for (a′), where both spectral sequences are
that of the filtration `F_I` with convergence through the canonical comparison of `E_∞` with the
graded pieces; weibel1994 §5.6, uncertified, for (b) and (c)):

- (a) *Finite antidiagonals.* In any abelian category, if for every `n` only finitely many
  `K^{p,n−p}` are nonzero, both spectral sequences converge strongly in every degree to
  `H^*(Tot K)`, with finite filtrations (`F_I^p Hⁿ = Hⁿ` for `p` at most the least column meeting
  the antidiagonal `n`, and `0` for `p` beyond the largest), and every position stabilises.
  `Hⁿ(Tot K)` lies in every weak Serre class that contains `′E_r^{p,q}` for all `p, q` and some `r`
  (stacks-012K line 3289–3290, Lemma 25.3 (4); SpectralSequencesAndConvergence §5.3), and in every
  weak Serre class that contains `′E_r^{p,n−p}` for all `p` and some `r` from which every position
  of total degree `n` stabilises (SpectralSequencesAndConvergence §§1.3, 3.4); similarly for `″E`.
  Route: the filtrations are finite in each degree, SpectralSequencesAndConvergence §5.3 and §3.4;
  for the first weak Serre form, closure under kernels and cokernels carries the hypothesis from
  page `r` to every later page, hence to a page from which total degree `n` stabilises.
- (a′) *First-quadrant double complexes.* If `K^{p,q} = 0` for `p < 0` or `q < 0`, then from page
  `2` on `′E(K)`, in the classical indexing and with the convergence of (a), is isomorphic to the
  spectral sequence of DerivedModuleAlgebra §S.1 of the anticommuting pair `d′ = d₁`,
  `d″ = (−1)^p d₂`, by an isomorphism compatible with the two identifications of the second page
  with `H_I^p H_II^q(K)` (1.2 and §S.1). Both abut to `Hⁿ(Tot K)` with the same filtration
  `F_I^p Hⁿ = im(Hⁿ(F_I^p Tot K) → Hⁿ(Tot K))`, and the isomorphism of limit pages carries the
  isomorphisms `β` of (a) to §S.1's `E_∞^{p,q} ≅ F^pH^{p+q}/F^{p+1}H^{p+q}`. Hence the edge
  morphisms, the five-term exact sequence and the extended sequences of
  SpectralSequencesAndConvergence §3.6 for `′E(K)` are §S.1's. Applied to `K.flip`, the same holds
  for `″E(K)` and §S.1's sequence of the pair `d′ = d₂`, `d″ = (−1)^q d₁` on `K.flip`, the abutments
  being identified through `HomologicalComplex₂.totalFlipIso`. Route: §S.1 takes Tau Ceti's spectral
  sequence of the column filtration of the total complex of its pair (its API and proof sketch), and
  by the dictionary Check of 1.2 that filtered complex is `(Tot K, F_I)`; so the two sequences are
  built from one filtered complex and differ only in the numbering of pages and positions. Both
  identify `E_∞` with the graded pieces of `Hⁿ(Tot K)` through Tau Ceti's
  `CochainComplex.filtrationAbutmentIso` (for `′E`, through the canonical presentation of
  SpectralSequencesAndConvergence §5.2), and the edge morphisms of both are these identifications
  composed with `E₂^{n,0} ↠ E_∞^{n,0}`, `FⁿHⁿ ↪ Hⁿ`, `Hⁿ ↠ Hⁿ/F¹Hⁿ` and `E_∞^{0,n} ↪ E₂^{0,n}`.
- (b) *The direct-sum totalisation.* Let the category have exact sequential colimits and let
  `Tot^⊕(K)` exist (for instance, the category has countable coproducts). If for every `n` there is
  `b(n)` with `K^{p,n−p} = 0` for `p > b(n)`, then `′E(K)` converges strongly to `H^*(Tot^⊕ K)`. The
  left half-plane (`K^{p,q} = 0` for `p > b`) and the upper half-plane (`K^{p,q} = 0` for `q < a`)
  are instances. Through the flip, if for every `n` there is `b(n)` with `K^{n−q,q} = 0` for
  `q > b(n)` (the lower and the right half-planes), then `″E(K)` converges strongly to
  `H^*(Tot^⊕ K)`. Route: `F_I` is exhaustive on `Tot^⊕`, since a subobject of `Tot^⊕(K)^n` through
  which every summand inclusion factors is everything (universal property of the coproduct), and
  `F_I^p Tot^⊕(K)^m = 0` for `p > b(m)`; SpectralSequencesAndConvergence §5.4, whose hypotheses are
  exactly these with exact sequential colimits.
- (c) *The product totalisation.* Let the category be in the class of
  SpectralSequencesAndConvergence §7.4. If for every `n` there is `a(n)` with `K^{p,n−p} = 0` for
  `p < a(n)` and `′E(K)` is regular at every position, then `′E(K)` converges strongly to
  `H^*(Tot^Π K)`. The right half-plane (`K^{p,q} = 0` for `p < a`) and the lower half-plane
  (`K^{p,q} = 0` for `q > b`) are instances, and the flip gives the row statement for the upper and
  the left half-planes. Regularity holds when for every `n` there is `p₁(n)` with
  `H^{n+1−p}(K^{p,•}) = 0` for `p ≥ p₁(n)` (SpectralSequencesAndConvergence §2.2: bounded below
  implies regular). Route: `F_I` is complete on `Tot^Π`, since products commute with limits, and
  exhaustive by `a(n)`; `′E_1^{p,n−p}` vanishes for `p` below `a(n − 1)` and `a(n)`, which is the
  half-plane criterion of SpectralSequencesAndConvergence §7.5. Its isomorphisms are the canonical
  presentation of its §5.2: in the exact couple of its §6.3, `D^{s,n−s} = H^n(F_I^s)` equals
  `H^n(Tot^Π K)` for `s ≤ min(a(n − 1), a(n))`, so `⋃_r ker i^r` is the kernel of
  `H^n(F_I^s) → H^n(Tot^Π K)` and `B_∞ = j(⋃_r ker i^r)` (its §6.2) is `Bᵗ`; the isomorphism
  `gr^s Hⁿ ≅ ker k / B_∞ ⊆ E_∞` through `j` being onto, `Z_∞ = ker k = Zᵗ`.

*Needs:* 1.1, 1.2; SpectralSequencesAndConvergence §§1.3, 2.2, 3.2, 3.4, 5.3, 5.4, and, for (c),
§§6.2, 6.3, 7.2, 7.5 and the class of categories of §7.4; Mathlib `HomologicalComplex₂.HasTotal`,
`HasExactColimitsOfShape`, `CountableAB4Star`; Tau Ceti `TauCeti.IsReplete`; for (a′),
SpectralSequencesAndConvergence §§3.6 and 5.2, DerivedModuleAlgebra §S.1, Mathlib
`HomologicalComplex₂.totalFlipIso` and Tau Ceti `CochainComplex.spectralSequence`,
`CochainComplex.filtrationAbutmentIso`.

- In (a), the stabilisation page in total degree `n` is bounded by the number of columns meeting the
  antidiagonals `n − 1, n, n + 1`, plus one.

**Checks.**

- *The staircase separates the cases.* It is right and lower half-plane, its rows are exact and
  only column `0` has cohomology. (b) applies to `″E` (rows exact, `q ≤ 0`): `H^*(Tot^⊕) = 0`. (c)
  applies to `′E` (right half-plane, `′E_1 = ℤ` at `(0, 0)` only, hence regular): `H^0(Tot^Π) = ℤ`.
  Applying `′E` to `Tot^⊕` would predict `H^0 = ℤ`, and `″E` to `Tot^Π` would predict `0`; both
  predictions are false, and neither is licensed by (b) or (c).
- *Finite case.* For `ℤ →(×2) ℤ` placed horizontally, `′E` converges strongly with
  `F_I^1 H^1 = H^1 = ℤ/2` and `F_I^2 H^1 = 0`, the first Check of SpectralSequencesAndConvergence
  §3.2.
- *One antidiagonal on an arbitrary page is not enough.* In abelian groups let `P` be the ℚ-vector
  spaces, a weak Serre class that is not closed under subobjects, and let `K` be
  `K^{0,0} = ℚ →(d₁) K^{1,0} = ℚ/ℤ` (the quotient map). On antidiagonal `0`, `′E_1^{0,0} = ℚ` lies
  in `P` and every other `′E_1^{p,−p}` is zero, yet `H^0(Tot K) = ℤ` does not. Neither form of (a)
  is contradicted: the first fails its hypothesis at `′E_1^{1,0} = ℚ/ℤ` on page `1` and at
  `′E_2^{0,0} = ℤ` on every later page; the second cannot use `r = 1`, since `′d_1` leaves `(0, 0)`
  nonzero, and fails at `′E_2^{0,0} = ℤ` for `r ≥ 2`.
- *(a′) on a single row.* If `K^{p,q} = 0` for `q ≠ 0`, both sequences of (a′) are concentrated on
  the row `q = 0`, with `E₂^{n,0} = Hⁿ(K^{•,0}) = Hⁿ(Tot K)`, `F_I^n Hⁿ = Hⁿ` and
  `F_I^{n+1} Hⁿ = 0`, and both edge morphisms `E₂^{n,0} → Hⁿ` are the identity (§S.1's first Check).
  The automorphism `−1` of `′E(K)` is a morphism of spectral sequences; composed with the
  isomorphism of (a′) it would still be an isomorphism onto §S.1's sequence, but it is not
  compatible with the second-page identifications and turns one edge morphism into the negative of
  the other.
- *(a′) on a single column.* If `K` is concentrated in column `0`,
  `E₂^{0,n} = Hⁿ(K^{0,•}) = Hⁿ(Tot K)`, `F_I^0 Hⁿ = Hⁿ`, `F_I^1 Hⁿ = 0`, and both edge morphisms
  `Hⁿ → E₂^{0,n}` are the identity (§S.1's second Check).
- *(a′) needs the dictionary.* Let `K^{0,1} = ℤx`, `K^{1,0} = ℤy`, `K^{1,1} = ℤz`, `K^{2,0} = ℤw`,
  other terms zero, with `d₁x = z`, `d₂y = z`, `d₁y = w` (every square has a zero corner). Column
  `1` is exact, so `′E₂ = ′E₁` is `ℤ[x]` at `(0, 1)` and `ℤ[w]` at `(2, 0)`; the total differential
  sends `x ↦ z` and `y ↦ w − z`, an isomorphism `ℤ² → ℤ²`, so `H¹ = H² = 0`, `d(x + y) = w`, and
  `d₂ : ℤ[x] → ℤ[w]` is an isomorphism, as the five-term sequence `0 → 0 → 0 → ℤ → ℤ → 0` requires.
  §S.1's sequence of `d′ = d₁`, `d″ = (−1)^p d₂` has the same total complex and filtration, hence
  the same `d₂`. Here `d₁d₂ = d₂d₁ = 0`, so `(d₁, d₂)` also anticommutes, but its total differential
  sends `y ↦ w + z`; the sign change `y ↦ −y`, `w ↦ −w` is an isomorphism of filtered complexes
  between the two totals that is the identity on `ℤ[x]` and `−1` on `ℤ[w]`, so the `d₂` of that pair
  is the negative of `′E(K)`'s and no isomorphism compatible with the second-page identifications
  joins the two.

### 1.4 Comparison of totals

Let `f : K → L` be a morphism of double complexes that is a quasi-isomorphism on every column. Prove
that `Tot(f)` is a quasi-isomorphism in each of the following cases:

- both `K` and `L` have finitely many nonzero terms on each antidiagonal, in any abelian category
  (`quasiIso_total_map_of_finite_antidiagonals`, which also states the row form below);
- `Tot = Tot^⊕`, the category has exact sequential colimits, the direct-sum totals of `K` and `L`
  exist, and for every `n` there is `b(n)` with `K^{p,n−p} = L^{p,n−p} = 0` for `p > b(n)` (the
  hypotheses of 1.3(b) for `′E`; `quasiIso_total_map_of_bounded`, which also states the row form);
- `Tot = Tot^Π`, the category is in the class of SpectralSequencesAndConvergence §7.4, and for every
  `n` there is `a(n)` with `K^{p,n−p} = L^{p,n−p} = 0` for `p < a(n)` (the vanishing of 1.3(c); no
  regularity of `′E(K)` or `′E(L)` is asked).

Through the flip, the same holds for quasi-isomorphisms on every row under the row hypotheses (for
`Tot^⊕`: `K^{n−q,q} = L^{n−q,q} = 0` for `q > b(n)`; for `Tot^Π`: `K^{n−q,q} = L^{n−q,q} = 0` for
`q < a(n)`) (weibel1994 §5.6, uncertified; stacks-012K line 3293–3315, Lemma 25.4, tag 0133, for an
augmentation). Route: `f` is a quasi-isomorphism exactly when its mapping cone is acyclic, by the
long exact cohomology sequence of the cone. The mapping cone of `Tot(f)` is isomorphic, through
signs on the summands, to the total complex of the double complex `C(f)` whose column `p` is the
mapping cone of the column map `f^{p,•}` (both have the terms `∏_p` or `⊕_p` of
`K^{p,n+1−p} ⊕ L^{p,n−p}` in degree `n`, and finite products and coproducts commute with the
products or coproducts over `p`). The columns of `C(f)` are exact. Its antidiagonals are finite in
the first case; in the second its terms on antidiagonal `n` vanish for `p` beyond the larger of
`b(n + 1)` for `K` and `b(n)` for `L`; in the third they vanish for `p` below the smaller of
`a(n + 1)` for `K` and `a(n)` for `L`. So the acyclic assembly lemma 1.5 applies in each case. For
the finite and direct-sum cases a second route runs through the spectral sequences: by 1.2 `′E(f)`
is an isomorphism on page `1`, hence on every page (Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`); the filtered map `Tot(f)` gives a morphism
of the converging structures of 1.3 (SpectralSequencesAndConvergence §3.3), because these are
through the canonical presentation, which is natural in filtered morphisms (1.2); and the comparison
theorem (SpectralSequencesAndConvergence §3.5, its finite case for the first case and its strongly
convergent case for the second, which is the comparison item of its §5.4) makes `Hⁿ(Tot f)` an
isomorphism. On that route, when `K` and `L` have only finitely many nonzero columns, the column
filtrations are finite as filtrations of complexes and Tau Ceti's
`CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page` gives the conclusion from the
page-`1` isomorphism (native page `2`); for complexes of modules the first case follows in each
degree `n` from `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`,
whose hypotheses in degree `n` hold because the antidiagonals `n − 1`, `n` and `n + 1` of `K` and
`L` are finite. *Needs:* for the cone route, 1.5 and Mathlib `CochainComplex.mappingCone`; for the
spectral-sequence route, 1.2, 1.3, SpectralSequencesAndConvergence §§3.3, 3.5, 5.2, 5.4 and Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`, and, for the first case with finitely many
columns or over modules, Tau Ceti `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`
and `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`; Mathlib
`HomologicalComplex₂.total.map`, `HomologicalComplex₂.flipFunctor`, `QuasiIso`.

**Checks.**

- *The hypotheses are needed.* The projection of the staircase onto its column `0` (identity on
  `D_0`, zero elsewhere) is a morphism of double complexes and a quasi-isomorphism on every column.
  On `Tot^Π` it is a quasi-isomorphism (`H^0 = ℤ` on both sides), as the third case asserts (both
  are right half-plane); on `Tot^⊕` it is not (`H^0 = 0` against `ℤ`), and the staircase fails the
  vanishing for `p ≫ 0` of the second case. The cone route sees the same: column `p ≥ 1` of `C(f)`
  is column `p` of `K` shifted, which is exact, and `Tot^⊕ C(f)` has `H^0 = ℤ`, the cokernel of
  `H^0(Tot^⊕ K) = 0 → H^0(Tot^⊕ L) = ℤ`, although every column of `C(f)` is exact.
- For first-quadrant homological bicomplexes and quasi-isomorphisms on rows, the statement is Tau
  Ceti's `HomologicalComplex₂.quasiIso_total_map_of_rows`.
- *Finite antidiagonals ask less than finitely many columns.* Let `L^{p,p} = ℤ` for every `p ∈ ℤ`,
  all other terms and all differentials zero, and `K = L ⊕ C`, where column `p` of `C` is
  `ℤ →(id) ℤ` in rows `p`, `p + 1` and `C` has `d₁ = 0`. Each antidiagonal of `K` has exactly one
  nonzero position, `(p, p)` on antidiagonal `2p` and `(p, p + 1)` on antidiagonal `2p + 1`, each
  antidiagonal of `L` at most one, and the projection `K → L` is a quasi-isomorphism on every
  column. The first case gives `H^{2p}(Tot K) ≅ H^{2p}(Tot L) = ℤ` and `H^{2p+1} = 0` on both sides,
  as a direct computation confirms (`Tot C` is the sum over `p` of `ℤ →(±1) ℤ` in degrees `2p`,
  `2p + 1`). Every column of `L` is nonzero, so no stage of the column filtration of `Tot L` is `⊥`
  or `⊤`, and Tau Ceti's finite-filtration
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page` does not apply; its degreewise
  exhaustive form does, in each degree.

### 1.5 The acyclic assembly lemma

Prove (weibel1994 Lemma 2.7.3, uncertified, for modules; stacks-012K line 3293–3303, Lemma 25.4, tag
0133, for finite antidiagonals in any abelian category; stacks-012K line 3354–3358 and 3433–3438,
Lemmas 26.1 and 26.4, tags 0E1Q and 0E1R, for resolutions of complexes of abelian groups):

- `Tot^⊕(K)` is acyclic if the category has exact sequential colimits, `Tot^⊕(K)` exists (as in
  1.3(b)) and either the columns of `K` are exact and for every `n` the terms `K^{p,n−p}` vanish for
  `p ≫ 0`, or the rows are exact and for every `n` the terms `K^{n−q,q}` vanish for `q ≫ 0`
  (`acyclic_total_of_bounded`);
- `Tot^Π(K)` is acyclic if the category is as in 1.3(c) and either the columns are exact and for
  every `n` the terms `K^{p,n−p}` vanish for `p ≪ 0`, or the rows are exact and for every `n` the
  terms `K^{n−q,q}` vanish for `q ≪ 0`;
- `Tot(K)` is acyclic in any abelian category if its antidiagonals are finite and its columns or
  its rows are exact (`acyclic_total_of_finite_antidiagonals`, for `Tot^⊕`, which is `Tot^Π` here
  by 1.1);
- *augmented forms:* for a complex `M` and an exact complex of complexes `0 → M → A_0 → A_1 → ⋯`,
  the map `M → Tot^⊕(A)` (with `A^{p,q} = A_p^q`) is a quasi-isomorphism when the category is as in
  1.3(b); for an exact complex of complexes `⋯ → A_1 → A_0 → M → 0`, the map `Tot^Π(A) → M` (with
  `A^{p,q} = A_{−p}^q`) is a quasi-isomorphism when the category is as in 1.3(c).

Route: the spectral sequence whose first page is the cohomology of the exact lines is zero from page
`1`, hence regular, and converges strongly by 1.3; the augmented forms apply this to the double
complex with `M` adjoined as an extra column, whose total complex is the mapping cone. Stacks proves
the half-plane forms only for abelian groups and does not write the general case (stacks-012K line
3348–3351); the generality here is the one in which SpectralSequencesAndConvergence §§5.4 and 7.5
hold. *Needs:* 1.3; SpectralSequencesAndConvergence §§5.3, 5.4, 7.5 and the class of categories of
§7.4; Mathlib `CochainComplex.mappingCone`, `HomologicalComplex.Acyclic`,
`HomologicalComplex₂.HasTotal`, `HasExactColimitsOfShape`; Tau Ceti `TauCeti.IsReplete`.

- *Dictionary with Weibel.* Weibel's double complexes are homological, `C_{p,q} = K^{−p,−q}`: his
  upper half-plane is the lower half-plane here and his right half-plane the left half-plane. His
  four cases (`Tot^Π`: upper half-plane with exact columns, right half-plane with exact rows;
  `Tot^⊕`: upper half-plane with exact rows, right half-plane with exact columns) are among the
  eight cases above.

**Checks.**

- The staircase has exact rows and vanishes for `q > 0`: `Tot^⊕` is acyclic. `Tot^Π` is not
  (`H^0 = ℤ`), and indeed the staircase is not upper or left half-plane: the row condition for
  `Tot^Π` cannot be weakened to the lower half-plane.
- *The dual staircase: the column condition for `Tot^⊕` points the right way.* Let
  `A_p = K^{p,−p} = ℤ` and `B_p = K^{p,1−p} = ℤ` for `p ≥ 0`, all other terms zero, with
  `d₂ : A_p → B_p` and `d₁ : A_p → B_{p+1}` the identity (every square has a zero corner, so they
  commute). Its columns `A_p → B_p` are exact and it is right half-plane, so `K^{p,n−p}` vanishes
  for `p ≪ 0` but not for `p ≫ 0`. The total differential from degree `0` to degree `1` sends
  `(x_p)` to `y_p = (−1)^p x_p + x_{p−1}` (with `x_{−1} = 0`). On `Tot^Π` it is bijective, so
  `Tot^Π(K)` is acyclic, as the column case of the product statement asserts. On `Tot^⊕` it is
  injective but misses `y = (1, 0, 0, …)`: the functional with values `1, −1, −1, 1, 1, −1, −1, …`
  on `B_0, B_1, B_2, …` vanishes on the image and is `1` there, so `H^1(Tot^⊕ K) = ℤ`. A statement
  of the direct-sum case with "vanish for `p ≪ 0`" would be false here.
- `K = (ℤ →(id) ℤ)` placed horizontally has exact rows and finite antidiagonals, and `Tot(K)` is
  acyclic.
- For a resolution `0 → A → I^0 → I^1 → ⋯` of an object, regarded as a complex of complexes
  concentrated in degree `0`, the augmented form gives `A[0] → I` a quasi-isomorphism, which is the
  definition of a resolution.

### Examples

The unit square pins the total sign, the column-sign complex pins the flip sign, and the staircase
and the dual staircase separate the direct-sum and product totalisations, the two convergence
theorems and the two acyclic assembly statements, the first through its exact rows and the second
through its exact columns. First-quadrant double complexes are DerivedModuleAlgebra §S.1's
instances, through the dictionary `d′ = d₁`, `d″ = (−1)^p d₂` of 1.2 and the comparison 1.3(a′), and
Tau Ceti's row- and column-filtration spectral sequences their homological form.

### Dependencies

SpectralSequencesAndConvergence §§1.3, 1.4, 2.2, 3.2–3.6, 4.3, 4.6, 5.1–5.4, 6.2, 6.3, 7.2, 7.4
and 7.5; Mathlib double complexes, total complexes and their flip, mapping cones; Tau Ceti's
filtered-complex spectral sequence and comparison. DerivedModuleAlgebra §S.1 is compared in 1.3(a′)
and in Checks.

## Layer 2: Cartan–Eilenberg resolutions and hyper-derived functors

### 2.1 Horseshoe resolutions

Let `𝒜` be abelian. Prove (stacks-05QI line 3402–3448, Lemma 18.9, tag 013T, and for the choice of
both outer resolutions its proof at line 3436–3448; weibel1994 §2.2, the horseshoe lemma,
uncertified):

- (a) *Horseshoe for objects.* In any abelian category, for a short exact sequence
  `0 → A → B → C → 0` and injective resolutions `A → I₁`, `C → I₃` (Mathlib `InjectiveResolution`),
  there are an injective resolution `B → I₂` and chain maps `I₁ → I₂ → I₃`, compatible with the
  augmentations, that form a split short exact sequence in every degree; in particular
  `I₂^n ≅ I₁^n ⊕ I₃^n` (`exists_injectiveResolution_horseshoe`). No supply of injectives is needed:
  the construction lifts only into the given terms `I₁^n`.
- (a′) *Horseshoe for complexes.* Let `𝒜` have enough injectives and `n` be an integer. For a short
  exact sequence `0 → A → B → C → 0` of cochain complexes indexed by `ℤ` that vanish below degree
  `n`, and a quasi-isomorphism `A → I₁` into a complex of injective objects vanishing below degree
  `n`, there are complexes `I₂`, `I₃` of injective objects vanishing below degree `n`,
  quasi-isomorphisms `B → I₂` and `C → I₃`, and a degreewise split short exact sequence
  `0 → I₁ → I₂ → I₃ → 0` compatible with these quasi-isomorphisms and with the maps of the given
  sequence (`exists_quasiIso_injective_horseshoe`). Since bounded-below complexes have a common
  lower bound, this is the horseshoe for bounded-below complexes with a prescribed injective
  resolution of `A`, and, for `n = 0`, its refinement in which `I₂`, `I₃` vanish in negative degrees
  when `A`, `B`, `C`, `I₁` do (stacks-05QI line 3402–3420, Lemma 18.9 (1)–(3)).
- (b) *Relative horseshoe.* Given a morphism `(f₁, f₂, f₃)` from a short exact sequence of objects
  `0 → A → B → C → 0` to `0 → A′ → B′ → C′ → 0`, a sequence `R₁ → R₂ → R₃` of `ℕ`-indexed cochain
  complexes that is short exact in every degree, with quasi-isomorphisms from `A`, `B`, `C` placed
  in degree `0` into `R₁`, `R₂`, `R₃` compatible with it (resolutions of `A`, `B`, `C`, not
  necessarily injective), a degreewise split short exact sequence `0 → I₁′ → I₂′ → I₃′ → 0` of
  injective resolutions of `A′`, `B′`, `C′` compatible with the augmentations, and chain maps
  `α : R₁ → I₁′` over `f₁` and `β : R₃ → I₃′` over `f₃`, there is a chain map `μ : R₂ → I₂′` over
  `f₂` restricting to `α` and inducing `β` (`exists_horseshoe_lift`). Route: choose any
  `ν : R₂ → I₂′` over `f₂` (stacks-05QI line 3301–3310, Lemma 18.6, tag 013P); the two maps
  `R₂ → I₃′` over `f₃` differ by a null-homotopic map (Lemma 18.7, tag 013S), whose homotopy lifts
  through the split epimorphism `I₂′ → I₃′`; correcting `ν` by it makes the right square commute,
  after which the restriction to `R₁` differs from `α` by a null-homotopic map, whose homotopy
  extends along the degreewise monomorphism `R₁ → R₂` into the injective terms of `I₁′`. Neither
  homotopy touches the augmentation, so `μ` lies over `f₂`. The lifting and homotopy-uniqueness
  steps (Stacks Lemmas 18.4, 18.6, 18.7) are, for complexes extended to `ℤ`, the K-injectivity of
  bounded-below complexes of injectives (Mathlib `CochainComplex.isKInjective_of_injective`) and the
  bijection between homotopy classes of maps into a K-injective complex and maps in the derived
  category (`CochainComplex.IsKInjective.Qh_map_bijective`); between injective resolutions of
  objects they are `CategoryTheory.InjectiveResolution.desc` and
  `CategoryTheory.InjectiveResolution.descHomotopy`. For objects, (a) is the iteration, one degree
  at a time, of Tau Ceti's one-step injective horseshoe
  `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective` for the exact structure
  `TauCeti.ExactStructure.abelian` (whose conflations are the short exact sequences and whose
  relative injectives are the injective objects), applied to the cokernels of the augmentations and
  then of the successive differentials. For complexes, push out along `A → I₁` to reach a degreewise
  split sequence `0 → I₁ → E → C → 0`, resolve `C` by `C → I₃` (Mathlib
  `CochainComplex.Plus.exists_quasiIso_injective`), and lift the connecting map `C → I₁[1]` through
  `C → I₃` to `I₃ → I₁[1]` by K-injectivity of `I₁[1]`, the homotopy being absorbed into the
  augmentation, as in Stacks's proof of Lemma 18.9.

*Needs:* for (a), Mathlib `InjectiveResolution`, `CochainComplex.single₀`,
`CategoryTheory.ShortComplex.ShortExact`, `CategoryTheory.ShortComplex.Splitting` and Tau Ceti
`TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`,
`TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.abelian_isInjective_iff`; for (a′) and
(b), Mathlib `InjectiveResolution`, `EnoughInjectives` (for (a′) only),
`CochainComplex.IsStrictlyGE`, `QuasiIso`, `CochainComplex.isKInjective_of_injective`,
`CochainComplex.IsKInjective.Qh_map_bijective`, `CategoryTheory.InjectiveResolution.desc`,
`CategoryTheory.InjectiveResolution.descHomotopy`, `CochainComplex.Plus.exists_quasiIso_injective`.

- The dual statements hold for projective resolutions, through `𝒜ᵒᵖ` (Mathlib's instance
  `EnoughInjectives 𝒜ᵒᵖ`). For objects of an abelian category with enough projectives, the dual of
  (a) is GrothendieckEulerForms §3.5's projective horseshoe for the exact structure
  `TauCeti.ExactStructure.abelian` (with `TauCeti.ExactStructure.abelian_isProjective_iff`), and
  for finite projective resolutions it is Tau Ceti's
  `TauCeti.ExactStructure.FiniteResolution.horseshoe`, whose middle resolution has length at most
  the larger of the two outer lengths; the statements here add prescribed injective resolutions
  with no supply of injectives, complexes and the relative form (b).

**Checks.**

- For the split sequence `0 → A → A ⊕ C → C → 0`, the direct sum of resolutions is a horseshoe, and
  with `f` the identity, `μ = α ⊕ β` works.
- For `0 → ℤ →(×2) ℤ → ℤ/2 → 0` in abelian groups with `I₁ = (ℚ → ℚ/ℤ)` and `I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`
  (the resolution `ℤ/2 → ℚ/ℤ` by `1 ↦ 1/2`, then `ℚ/ℤ →(×2) ℚ/ℤ`), the middle resolution has terms
  `ℚ ⊕ ℚ/ℤ` in degree `0` and `ℚ/ℤ ⊕ ℚ/ℤ` in degree `1`, and its cohomology is `ℤ` in degree `0`
  only. A middle resolution with zero twisting (the plain direct sum) would have `H^0 = ℤ ⊕ ℤ/2`.
- *The off-diagonal part of `μ` is needed.* Let the target horseshoe be the source one transported
  by the graded automorphism `φ(u, v) = (u + h(v), v)` of `I₁ ⊕ I₃`, for a family `h` of maps
  `I₃^n → I₁^n`, and let `f`, `α`, `β` be identities. For the source differential
  `d(u, v) = (d₁u + t(v), d₃v)`, `φd − dφ` sends `(u, v)` to `((h d₃ − d₁ h)(v), 0)`, so the
  identity of `I₁ ⊕ I₃` is a chain map between the two middle resolutions exactly when `h` is a
  chain map, while `μ = φ` always is. Instance: the split sequence `0 → ℤ/2 → ℤ/2 ⊕ ℤ/2 → ℤ/2 → 0`
  with `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)` (the resolution of `ℤ/2` of the previous Check), `t = 0`, and `h`
  the identity in degree `0` and zero in degree `1`: `d₁h − hd₃` is `×2 ≠ 0` from degree `0` to
  degree `1`, the transported differential in degree `0` is `(u, v) ↦ (2u − 2v, 2v)` against
  `(2u, 2v)`, and the identity is not a chain map. For `h` the identity in both degrees the two
  differentials agree, but the identity still does not lie over `f₂`: the transported augmentation
  sends `(a, c)` to `(ε₁a + ε₃c, ε₃c)`, where `ε₁`, `ε₃` are the augmentations of `I₁`, `I₃`, and
  `ε₃c ≠ 0` for `c ≠ 0`.
- *The lower bound of (a′) needs the bound on `I₁`.* For `0 → ℤ[0] →(×2) ℤ[0] → ℤ/2[0] → 0` and
  `n = 0`, let `I₁` be `ℚ → ℚ/ℤ` in degrees `0, 1` plus the contractible `ℚ/ℤ →(id) ℚ/ℤ` in degrees
  `−1, 0`: it is a complex of injectives quasi-isomorphic to `ℤ[0]`, but `I₁^{−1} = ℚ/ℤ` is a direct
  summand of `I₂^{−1}` in any horseshoe, so no `I₂` vanishes below degree `0`. With `I₁ = (ℚ → ℚ/ℤ)`
  the bound holds, and the horseshoe of the second Check, extended by zero to `ℤ`, is one that (a′)
  asserts.

### 2.2 Right derived functors of objects and complexes

For an additive `F : 𝒜 → ℬ` with `𝒜` having enough injectives, define `RⁿF(X)` for `X` in
`DerivedCategory.Plus 𝒜` and for objects of `𝒜` as in the Conventions (stacks-05QI line 2893–2896,
Definition 16.2, tag 015A). Prove:

- (i) *Comparison with the classical functors.* For `n : ℕ` and every additive `F`, a natural
  isomorphism `RⁿF(A) ≅ (F.rightDerived n).obj A` of functors of `A`, such that for every natural
  transformation `τ : F₁ ⟶ F₂` of additive functors the map `Rⁿτ` induced by
  `CategoryTheory.NatTrans.rightDerivedFunctorPlus τ` corresponds to Mathlib's
  `CategoryTheory.NatTrans.rightDerived τ n`
  (`exists_rightDerivedFunctorPlus_homology_iso_rightDerived`). No exactness of `F` is needed.
  Route: an injective resolution `I` of `A`, extended to `ℤ`, is a bounded-below complex of
  injectives quasi-isomorphic to `A[0]`; the unit `F.rightDerivedFunctorPlusUnit` is an isomorphism
  there, and `InjectiveResolution.isoRightDerivedObj` computes the classical side from the same `I`;
  both sides map `τ` to `τ` applied termwise to `I` (Mathlib's
  `NatTrans.rightDerivedFunctorPlus_fac_app` on the derived side).
- (ii) *Computation by injective complexes.* For a bounded-below complex `K` and a quasi-isomorphism
  `K → T` into a bounded-below complex of injectives, `RⁿF(K) ≅ Hⁿ(F(T))`, naturally.
- (iii) *Vanishing and truncation* (stacks-05QI line 2872–2924, Lemmas 16.1 and 16.3, tags 05TC and
  05TD). If `Hⁱ(X) = 0` for `i < a` then `RⁱF(X) = 0` for `i < a`; `RⁱF(A) = 0` for `i < 0`; `R⁰F`
  is left exact, and `F(A) → R⁰F(A)` is an isomorphism for all `A` if and only if `F` is left exact;
  for `i ≤ a`, `Hⁱ(RF(τ_{≤a}X)) ≅ Hⁱ(RF(X))`.
- (iv) *Long exact sequences.* A short exact sequence of bounded-below complexes gives a long exact
  sequence of `RⁿF`, natural in the sequence; on objects the `RⁿF` form a δ-functor (stacks-05QI
  line 2952–2959, Lemma 16.6, tag 05TE).
- (v) *Acyclic objects and Leray's acyclicity lemma* (stacks-05QI line 2925–2935 and 2966–3011,
  Lemmas 16.4 and 16.7, tags 015C and 015E). Define `IsRightAcyclic F B`, for an additive `F` and an
  object `B`, to mean that `(DerivedCategory.Plus.homologyFunctor ℬ i).obj (RF(B[0]))` is zero for
  every integer `i > 0` (Conventions). For `F` left exact, `B` is right acyclic if and only if
  `RF(B[0]) ≅ F(B)[0]` through the unit; and for a bounded-below complex `L` of objects right
  acyclic for `F` the unit `F(L) → RF(L)` is an isomorphism in `DerivedCategory.Plus ℬ`
  (`isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic`). Route: Stacks's induction over stupid
  truncations, with (iii).

*Needs:* Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlus`,
`CategoryTheory.Functor.rightDerivedFunctorPlusUnit`, `DerivedCategory.Plus.homologyFunctor`,
`DerivedCategory.Plus.singleFunctor`, `CategoryTheory.Functor.rightDerived`,
`CategoryTheory.NatTrans.rightDerived`, `CategoryTheory.InjectiveResolution.isoRightDerivedObj`,
`HomologicalComplex.stupidTrunc`, `CategoryTheory.NatTrans.rightDerivedFunctorPlus`,
`CochainComplex.Plus`.

- `RⁿF` commutes with finite direct sums and is functorial in natural transformations of `F`
  (Mathlib `CategoryTheory.NatTrans.rightDerivedFunctorPlus`).
- Every injective object is right acyclic for every additive `F`; the zero object is; right
  acyclicity is invariant under isomorphism and passes to finite direct sums and to direct summands,
  since `RⁱF` is additive.
- For a left exact `F`, `B` is right acyclic exactly when `F(B)[0] → RF(B[0])` is an isomorphism;
  for an exact `F`, every object is right acyclic.

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` on abelian groups and `A = ℤ`, the resolution `ℚ → ℚ/ℤ` gives `R⁰F(ℤ) = 0`
  and `R¹F(ℤ) = Hom(ℤ/2, ℚ/ℤ) = ℤ/2 = Ext¹(ℤ/2, ℤ)`.
- An exact `F` has `RⁿF(A) = 0` for `n > 0`, and `R⁰F(A) = F(A)`.
- *Left exactness is needed for `R⁰F = F`.* For `F = − ⊗ ℤ/2` on abelian groups, `R⁰F(ℤ)` is the
  kernel of `ℚ ⊗ ℤ/2 → ℚ/ℤ ⊗ ℤ/2`, which is `0`, while `F(ℤ) = ℤ/2`.
- The complex `ℚ → ℚ/ℤ` consists of `F`-acyclic (injective) objects and computes `RF(ℤ)` by (v),
  consistently with (ii).
- *Right acyclicity separates.* For `F = Hom_ℤ(ℤ/2, −)`, `ℚ/ℤ` is right acyclic (injective) and `ℤ`
  is not (`R¹F(ℤ) = ℤ/2`); a definition that also asked for vanishing in degree `0` would make
  `ℚ/ℤ`, with `R⁰F(ℚ/ℤ) = ℤ/2`, fail.
- *Leray's lemma needs left exactness.* For `F = − ⊗ ℤ/2` on abelian groups, `ℤ` is right acyclic in
  the sense of `IsRightAcyclic` (`R¹F(ℤ)` is `H^1` of `ℚ ⊗ ℤ/2 → ℚ/ℤ ⊗ ℤ/2`, that is of `0 → 0`, and
  `RⁱF(ℤ) = 0` for `i ≥ 2`), yet for `L = ℤ[0]` the unit `F(ℤ)[0] = ℤ/2[0] → RF(ℤ[0])` is not an
  isomorphism, since `H^0(RF(ℤ[0])) = R⁰F(ℤ) = 0`.
- *(i) needs no exactness.* For the right exact, not left exact, `F = − ⊗ ℤ/2` and `n = 0`, both
  sides of (i) at `ℤ` are `H^0` of `ℚ ⊗ ℤ/2 → ℚ/ℤ ⊗ ℤ/2`, which is `0`, while `F(ℤ) = ℤ/2`: the
  comparison is with `R⁰F`, not with `F`. For the transformation `τ = 2 · 𝟙` of `F = Hom_ℤ(ℤ/2, −)`,
  both sides of the compatibility at `A = ℤ`, `n = 1` are multiplication by `2` on `ℤ/2`, that is
  `0`.

### 2.3 Cartan–Eilenberg resolutions

Let `𝒜` have enough injectives and `K` be a cochain complex with `K^p = 0` for `p < a`. Define a
*Cartan–Eilenberg resolution* of `K` as a double complex `I` with a morphism of complexes
`ε : K → I^{•,0}` such that (stacks-05QI line 3621–3629, Definition 21.1, tag 015H): `I^{p,q} = 0`
for `p < a` and for `q < 0`; for each `p`, the column `I^{p,•}`, with `ε^p`, is an injective
resolution of `K^p`; and the complexes (in `q`) of horizontal cycles `Ker(d₁^{p,•})`, horizontal
boundaries `Im(d₁^{p−1,•})` and horizontal cohomology `H_I^p(I)`, with the augmentations induced by
`ε`, are injective resolutions of `Z^p(K)`, `B^p(K)` and `H^p(K)`. *Needs:* 1.5 (finite case, for
the total complex), 2.1; Mathlib `HomologicalComplex₂`, `InjectiveResolution`.

- *Existence* (stacks-05QI line 3630–3654, Lemma 21.2, tag 015I): every such `K` has one. Route:
  decompose `K` into the short exact sequences `0 → Z^p → K^p → B^{p+1} → 0` and
  `0 → B^{p+1} → Z^{p+1} → H^{p+1} → 0` and choose horseshoes (2.1(a)) by induction on `p`.
- *Split rows.* Each row `I^{•,q}` is a complex of injectives whose cycles, boundaries and
  cohomology are injective, so every differential splits; hence any additive functor `G` commutes
  with the horizontal cycles, boundaries and cohomology of `I` (stacks-05QI line 3682–3689, in the
  proof of Lemma 21.3).
- *Total complex.* `Tot(I)` (finite antidiagonals) vanishes below degree `a`, has injective terms,
  and `K → Tot(I)` is a quasi-isomorphism (1.5, finite case, applied to the columns), so `Tot(I)` is
  an injective resolution of `K` (stacks-05QI line 3667–3668).
- *Lifting.* For a chain map `f : K → L` of complexes bounded below by `a` and Cartan–Eilenberg
  resolutions `I`, `J`, there is a morphism of double complexes `f̃ : I → J` with `f̃ ∘ ε = ε′ ∘ f`;
  it induces on columns, horizontal cycles, boundaries and cohomology chain maps over `f^p`,
  `Z^p(f)`, `B^p(f)` and `H^p(f)`. Route: by induction on `p`, the relative horseshoe 2.1(b) applied
  to `0 → Z^p → K^p → B^{p+1} → 0` and to `0 → B^{p+1} → Z^{p+1} → H^{p+1} → 0`, whose resolutions
  in `J` are degreewise split because their first terms are injective (weibel1994 Lemma 5.7.2,
  uncertified; cartan-eilenberg1956 Ch. XVII §1, uncertified). The relative horseshoe needs only
  resolutions on the source side, so the same induction lifts `f` from any double complex satisfying
  the conditions above with "injective resolution" replaced by "resolution" on the source side.
- Projective Cartan–Eilenberg resolutions of bounded-above complexes are Cartan–Eilenberg
  resolutions of `K°` in `𝒜ᵒᵖ` (2.6).

**Checks.**

- For `K = A[0]`, a Cartan–Eilenberg resolution is an injective resolution of `A` placed in column
  `0`: `Z^0 = K^0 = A`, `B = 0` and `H^0 = A`.
- *Column resolutions are not enough.* For `K = (ℤ →(×2) ℤ)` in degrees `0, 1` over abelian groups,
  the double complex whose columns are both `ℚ → ℚ/ℤ` and whose `d₁` is multiplication by `2` has
  columns resolving `K^0` and `K^1`, but its horizontal cohomology `H_I^1` is `ℚ/2ℚ = 0` and
  `(ℚ/ℤ)/2(ℚ/ℤ) = 0`, which does not resolve `H^1(K) = ℤ/2`; it is not a Cartan–Eilenberg
  resolution.
- For `K = (A →(id) A)`, the double complex with both columns the same injective resolution of `A`
  and `d₁` the identity is a Cartan–Eilenberg resolution: `Z^0 = 0`, `B^1 = A` and `H = 0` are
  resolved by `0`, the second column and `0`.

### 2.4 The first hypercohomology spectral sequence

Let `F : 𝒜 → ℬ` be additive, `𝒜` with enough injectives, `K` bounded below and `I` a
Cartan–Eilenberg resolution of `K`. Define the *first hypercohomology spectral sequence* `′E(F, K)`
as the first spectral sequence (1.2) of the double complex `F(I)`. Prove, for additive `F`
(stacks-05QI line 3655–3681, Lemma 21.3, tag 015J, first spectral sequence, for left exact `F`;
grothendieck1957 line 1236–1252, (2.4.2), for any additive `F`; the proof uses `F` only through
2.2(ii) and `Tot F(I) = F(Tot I)`, and left exactness is assumed only where a statement says so):

- `′E_1^{p,q} ≅ R^qF(K^p)`, with `′d_1 = R^qF(d_K^p)`, and `′E_2^{p,q} ≅ H^p(R^qF(K^•))`;
- it converges strongly in every degree to `R^{p+q}F(K)`, with finite filtrations, and
  `′E_1^{p,q} = 0` unless `p ≥ a` and `q ≥ 0`; the abutment is identified through
  `Hⁿ(Tot F(I)) = Hⁿ(F(Tot I)) ≅ RⁿF(K)` (2.3, 2.2(ii));
- *independence and naturality from page 1:* for `f : K → L` and any lift `f̃` (2.3), `F(f̃)`
  induces a morphism of converging spectral sequences (SpectralSequencesAndConvergence §3.3) whose
  page-`1` component is `R^qF(f^p)` and whose abutment component is `RⁿF(f)`. Two lifts give
  morphisms with the same page-`1` component, hence the same morphism (the field `comm` of
  `CategoryTheory.SpectralSequence.Hom` determines each page from the previous one). A lift of the
  identity between two Cartan–Eilenberg resolutions of `K` is an isomorphism of spectral sequences
  (Tau Ceti `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`);
- (grothendieck1957 line 1348–1354, Remarque 3) if `K` is a resolution of an object `A`
  (`K^p = 0` for `p < 0`, `H^0(K) = A`, `H^p(K) = 0` for `p ≠ 0`), the sequence is
  `′E_1^{p,q} = R^qF(K^p) ⇒ R^{p+q}F(A)`.

*Needs:* 1.2, 1.3(a); 2.2(ii), 2.3; SpectralSequencesAndConvergence §3.3; Mathlib
`CategoryTheory.SpectralSequence.Hom`; Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

- Natural in `F`: a natural transformation `F ⟶ F′` induces a morphism of first hypercohomology
  spectral sequences whose page-`1` component is `R^q` of it at `K^p`.

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` and `K = (ℤ →(×2) ℤ)` in degrees `0, 1`:
  `′E_1^{0,1} = ′E_1^{1,1} = Ext¹(ℤ/2, ℤ) = ℤ/2`, `′E_1^{p,0} = 0`, and `′d_1 = Ext¹(ℤ/2, ×2) = 0`.
  The abutment is `ℤ/2` in degrees `1` and `2`, agreeing with `K ≃ ℤ/2[−1]` and
  `Ext^{n−1}(ℤ/2, ℤ/2)`.
- For `K = A[0]` the sequence is concentrated in column `0` with `′E_1^{0,q} = R^qF(A)`.
- If `F` is left exact and every `K^p` is `F`-acyclic, `′E_1` is concentrated in row `0` and gives
  `RⁿF(K) ≅ Hⁿ(F(K))`, as Leray's acyclicity lemma 2.2(v) asserts. Left exactness is needed: for
  `F = − ⊗ ℤ/2` on abelian groups and `K = ℤ[0]`, `ℤ` is `F`-acyclic (2.2's Checks), `′E_1` is zero
  (`′E_1^{0,q} = R^qF(ℤ) = 0` for every `q`) and converges to `RⁿF(ℤ[0]) = 0`, while
  `H^0(F(K)) = ℤ/2`.

### 2.5 The second hypercohomology spectral sequence

With `F` additive, `K` and `I` as in 2.4, define the *second hypercohomology spectral sequence*
`″E(F, K)` as the second spectral sequence (1.2) of `F(I)`. Prove (stacks-05QI line 3655–3689, Lemma
21.3, tag 015J, for left exact `F`; grothendieck1957 line 1236–1252 and 1291–1299, for any additive
`F`; the first three items use `F` only through 2.2(ii), the split rows of 2.3 and
`Tot F(I) = F(Tot I)`):

- `″E_1^{p,q} ≅ F(H_I^q(I)^p)`, where `H_I^q(I)` is the complex, in the resolution degree, of
  horizontal cohomologies, with `″d_1` induced by its differential, and `″E_2^{p,q} ≅ R^pF(H^q(K))`;
  the first identification uses the split rows of 2.3;
- it converges strongly in every degree to `R^{p+q}F(K)`, with finite filtrations, and
  `″E_2^{p,q} = 0` unless `p ≥ 0` and `H^q(K) ≠ 0`;
- *independence and naturality from page 2:* for `f : K → L`, the morphism induced by any lift has
  page-`2` component `R^pF(H^q(f))` and abutment component `RⁿF(f)`, so it does not depend on the
  lift. A quasi-isomorphism induces an isomorphism from page `2` on. Hence, restricted to its pages
  `r ≥ 2`, `″E(F, −)` factors through the localisation `DerivedCategory.Plus.Q` and is a functor on
  `DerivedCategory.Plus 𝒜`; it is natural in `F`;
- *F-acyclic Cartan–Eilenberg resolutions* (grothendieck1957 line 1295–1298). For `F` left exact: if
  `L` is a double complex satisfying the conditions of 2.3 with "injective resolution" replaced by
  "resolution by `F`-acyclic objects", then `F` commutes with the horizontal cycles, boundaries and
  cohomology of `L`, and the second spectral sequence of `F(L)` is isomorphic from page `2` on,
  compatibly with the abutments, to `″E(F, K)`. Route: lift the identity of `K` from `L` to a
  Cartan–Eilenberg resolution (2.3, lifting from resolutions); on page `2` the induced map is the
  identity of `R^pF(H^q K)`, the two sides being computed by Leray's acyclicity lemma 2.2(v);
- (grothendieck1957 line 1352–1356, Remarque 3) for `F` left exact, if every `K^p` is `F`-acyclic,
  the sequence is `″E_2^{p,q} = R^pF(H^q(K)) ⇒ H^{p+q}(F(K))`, the abutment being identified by
  Leray's acyclicity lemma 2.2(v); the example in 2.4's last Check, where `″E_2^{p,0} = R^pF(ℤ) = 0`
  and `H^0(F(K)) = ℤ/2`, shows that left exactness is needed.

*Needs:* 1.2, 1.3(a); 2.2(ii), 2.2(v), 2.3; SpectralSequencesAndConvergence §3.3; Mathlib
`CategoryTheory.SpectralSequence.Hom`,
`DerivedCategory.Plus.Q`; Tau Ceti `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

**Checks.**

- For `F = Hom_ℤ(ℤ/2, −)` and `K = (ℤ →(×2) ℤ)`: `H^0(K) = 0`, `H^1(K) = ℤ/2`, so
  `″E_2^{0,1} = Hom(ℤ/2, ℤ/2) = ℤ/2` and `″E_2^{1,1} = Ext¹(ℤ/2, ℤ/2) = ℤ/2`, in total degrees `1`
  and `2`; all `d_r` vanish for degree reasons, and the abutment agrees with 2.4's Check.
- For `K = A[0]`, `″E_2^{p,0} = R^pF(A)` and the sequence degenerates at page `2`.
- *The Cartan–Eilenberg conditions are needed.* For `F` the identity of abelian groups and the
  column resolution of 2.3's second Check (*Column resolutions are not enough*), the second
  spectral sequence of that double complex has its only nonzero class `ℤ/2` at `(1, 0)` (horizontal
  kernel of `×2` on `ℚ/ℤ`, in row `1`), while
  `″E_2^{p,q} = R^pF(H^q K)` has it at `(0, 1)`. Both converge to `H^1(K) = ℤ/2`, with different
  filtrations.

### 2.6 Right exact and contravariant functors

Let `F : 𝒜 → ℬ` be additive with `𝒜` having enough projectives, so that `Fᵒᵖ : 𝒜ᵒᵖ → ℬᵒᵖ` is
additive and `𝒜ᵒᵖ` has enough injectives; `Fᵒᵖ` is left exact exactly when `F` is right exact.
Define, for a bounded-above complex `K` of `𝒜`, the *hyper-left-derived functors*
`L_nF(K) := unop R^nFᵒᵖ(K°)`. Prove (grothendieck1957 line 1304–1308; stacks-05QI line 3449–3478,
§19, the dual statements; weibel1994 §5.7, uncertified):

- for an object `A`, `L_nF(A) ≅ (F.leftDerived n).obj A` naturally (a projective resolution of `A`
  is an injective resolution of `op A` in `𝒜ᵒᵖ`; Mathlib `ProjectiveResolution.isoLeftDerivedObj`);
  for `F` right exact, `L_0F(A) ≅ F(A)` (Mathlib `Functor.leftDerivedZeroIsoSelf`);
- *projective Cartan–Eilenberg resolutions* of `K` are the unop of Cartan–Eilenberg resolutions of
  `K°`; they exist, their rows split, their total complex is a bounded-above complex of projectives
  quasi-isomorphic to `K`, and chain maps lift;
- the two *hyperhomology spectral sequences* `E^1_{p,q} = L_qF(K_p)` and `E^2_{p,q} = L_pF(H_q(K))`,
  with `K_p = K^{−p}` and `H_q = H^{−q}`, are the unop of 2.4 and 2.5 for `Fᵒᵖ` at `K°` (pages and
  homology isomorphisms taken termwise through Mathlib's `HomologicalComplex.unop`, which turns the
  cohomological shapes `ComplexShape.up' (r, 1 − r)` into the homological shapes of the Conventions
  at the same positions); they converge strongly with finite filtrations to `L_{p+q}F(K)` with the
  homological bidegree assignment of the Conventions, with the same independence and naturality;
- a contravariant additive functor `G : 𝒜ᵒᵖ → ℬ` has hypercohomology spectral sequences at `K°`:
  `′E_1^{p,q} = R^qG(op K^{−p})` and `″E_2^{p,q} = R^pG(op H^{−q}(K))`, converging to
  `R^{p+q}G(K°)`, computed from projective Cartan–Eilenberg resolutions of `K`.

*Needs:* 2.2–2.5; Mathlib `CochainComplex.opEquivalence`, `HomologicalComplex.homologyOp`,
`CategoryTheory.Functor.leftDerived`, `CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`,
`CategoryTheory.Functor.leftDerivedZeroIsoSelf`, `HomologicalComplex.unop`, the instance
`EnoughInjectives 𝒜ᵒᵖ`; SpectralSequencesAndConvergence §2.1.

**Checks.**

- For `F = − ⊗ ℤ/2` on abelian groups, `L_1F(ℤ/2) = Tor_1(ℤ/2, ℤ/2) = ℤ/2`: the projective
  resolution `0 → ℤ →(×2) ℤ → ℤ/2` becomes `ℤ/2 →(0) ℤ/2`.
- *Index witness.* For `K = (ℤ →(×2) ℤ)` in cohomological degrees `−1, 0` (homological `1, 0`) and
  the same `F`: `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, so `L_0F(K) = L_1F(K) = ℤ/2`, in agreement
  with `K ≃ ℤ/2[0]` and `Tor_n(ℤ/2, ℤ/2)`. Indexing `E^1_{p,q}` by `K^p` in place of `K^{−p}` would
  put a term in homological degree `−1`.
- An exact `F` has `L_nF(A) = 0` for `n > 0`.

### Examples

`Hom_ℤ(ℤ/2, −)` on `ℤ →(×2) ℤ` computes both hypercohomology spectral sequences with the same
abutment and different pages. SchemeKTheoryOperations §6.7's hyperhomology spectral sequence of a
group acting on a chain complex is the homological first sequence of 2.6 for coinvariants, and
TopologicalSheafCohomology §1.4's Čech hypercohomology sequences are first and second sequences of
double complexes (1.2) on a fixed cover.

### Dependencies

Layer 1; SpectralSequencesAndConvergence §3.3 and §2.1 (for the homological reading of 2.6);
Mathlib derived functors on `D⁺`, classical derived functors, resolutions and opposite complexes,
K-injective complexes and the lifting of maps to injective resolutions; Tau Ceti's one-step
injective horseshoe in an exact category. GrothendieckEulerForms §3.5 is cited in 2.1 for the
projective forms.

## Layer 3: composite functors

### 3.1 Composition of right derived functors

Let `F : 𝒜 → ℬ` be additive and `G : ℬ → 𝒞` left exact, with `𝒜` and `ℬ` having enough injectives.
Define the *composition transformation* `compositionTrans F G : R(G ∘ F) ⟶ RF ⋙ RG` of functors
`DerivedCategory.Plus 𝒜 ⥤ DerivedCategory.Plus 𝒞` (written `t`) as the transformation that the
universal property of the right derived functor `R(G ∘ F)` (Mathlib's `IsRightDerivedFunctor` for
`rightDerivedFunctorPlusUnit`, through `CategoryTheory.Functor.rightDerivedDesc`) attaches to the
composite `(G ∘ F)(K) → RG(F(K)) → RG(RF(K))` of the unit of `RG` at `F(K)` with `RG` of the unit of
`RF` at `K`, for bounded-below complexes `K`; it is defined for any additive `G`. Prove (stacks-05QI
line 3696–3717, Lemma 22.1, tags 015L and 015M, for left exact `F`): `t` is an isomorphism if and
only if `F(I)` is right acyclic for `G` for every injective `I` of `𝒜`
(`isIso_compositionTrans_iff`). Stacks assumes `F` left exact as well; neither direction of the
proof uses it. Prove also (grothendieck1957 line 1338–1342, Remarque 1) that this holds if and only
if every object of `𝒜` embeds into an object `M` with `R^qG(F(M)) = 0` for `q > 0` (an injective `I`
embedded in such an `M` is a direct summand of it, and `R^qG ∘ F` is additive), and that it holds
when `F` has an exact left adjoint (then `F` preserves injectives: Mathlib
`CategoryTheory.Injective.injective_of_adjoint`). Route: at a bounded-below complex `A` with
injective resolution `A → J`, the units of `R(G ∘ F)` at `J` and of `RF` at `J` are isomorphisms
(Mathlib's instance for bounded-below complexes of injective objects), so `t` at `J` is an
isomorphism exactly when the unit `G(F(J)) → RG(F(J))` is, which Leray's acyclicity lemma 2.2(v)
gives; conversely, `t` at `I[0]` is then the unit of `RG` at `F(I)[0]`, whose invertibility is right
acyclicity of `F(I)` for the left exact `G` (2.2(v)). *Needs:* 2.2(v); Mathlib
`CategoryTheory.Functor.rightDerivedFunctorPlus`,
`CategoryTheory.Functor.rightDerivedFunctorPlusUnit`,
`CategoryTheory.Functor.IsRightDerivedFunctor`, `CategoryTheory.Functor.rightDerivedDesc`,
`CategoryTheory.Functor.mapCochainComplexPlus`, `CategoryTheory.Injective.injective_of_adjoint`.

- `t` is compatible with the units: composing the unit of `R(G ∘ F)` at `K` with `t` at `K` gives
  the composite above (the defining property of `rightDerivedDesc`), and `t` is the only
  transformation with this property.
- `t` is natural in `F` and `G` (for transformations `F ⟶ F′`, `G ⟶ G′` it intertwines the maps of
  `CategoryTheory.NatTrans.rightDerivedFunctorPlus`), and it is an isomorphism when `F` or `G` is
  the identity functor.

**Checks.**

- *The criterion is sharp.* For `F = G = Hom_ℤ(ℤ/2, −)` on abelian groups, `F(ℚ/ℤ) = ℤ/2` is not
  `G`-acyclic (`Ext¹(ℤ/2, ℤ/2) = ℤ/2`), and `t` fails at `ℚ/ℤ`:
  `G ∘ F = Hom(ℤ/2 ⊗ ℤ/2, −) = Hom(ℤ/2, −)` gives `R¹(G ∘ F)(ℚ/ℤ) = 0`, while
  `H¹(RG(RF(ℚ/ℤ))) = H¹(RG(ℤ/2)) = ℤ/2`.
- For `F` the identity, the condition holds (injectives are right acyclic for every `G`) and `t` is
  an isomorphism.
- For a ring map `R → S`, `ModuleCat.coextendScalars` is right adjoint to the exact restriction of
  scalars (`ModuleCat.restrictCoextendScalarsAdj`), so it preserves injectives and satisfies the
  condition for every `G`.
- *Exactness of `F` plays no role.* For the right exact `F = − ⊗ ℤ/2` on abelian groups and `G` the
  identity, every object is right acyclic for the exact `G`, so `t` is an isomorphism; indeed both
  `R(G ∘ F)` and `RF ⋙ RG` are `RF`, with `H^0(RF(ℤ[0])) = 0`.

### 3.2 The composite-functor spectral sequence of a complex

Let `F` be additive and `G` left exact, satisfying the equivalent conditions of 3.1, and `X` be an
object of `DerivedCategory.Plus 𝒜`. Define the *composite-functor spectral sequence* `E(F, G; X)` as
the second hypercohomology spectral sequence `″E(G, F(J))` (2.5), for a bounded-below complex `J` of
injectives representing `X`, with abutment `RⁿG(F(J)) ≅ Hⁿ(RG(RF(X))) ≅ Rⁿ(G ∘ F)(X)` through `t⁻¹`
(`F(J) ≅ RF(X)` by the unit of `RF`, invertible on bounded-below complexes of injectives for every
additive `F`). Prove (stacks-05QI line 3718–3730, Lemma 22.2, tag 015N, for left exact `F`;
grothendieck1957 line 1309–1337, Théorème 2.4.1, which asks left exactness of the second functor
only):

- `E₂^{p,q} ≅ R^pG(H^q(RF(X)))`, and for `X = A[0]`, `E₂^{p,q} ≅ R^pG(R^qF(A))`;
- it converges strongly in every degree to `R^{p+q}(G ∘ F)(X)`, with finite filtrations, and
  `E₂^{p,q} = 0` unless `p ≥ 0` and `q ≥ a` when `Hⁱ(X) = 0` for `i < a`;
- from page `2` on it does not depend on `J` and is a functor of `X` on `DerivedCategory.Plus 𝒜`;
- *computation by F-acyclic resolutions* (grothendieck1957 line 1343–1347, Remarque 2, and line
  1506–1529, Proposition 2.5.4): for `F` left exact and any bounded-below complex `L` of
  `F`-acyclic objects quasi-isomorphic to `X`, `E(F, G; X)` is isomorphic from page `2` on to
  `″E(G, F(L))`. Route: `F(L)` and `F(J)` are isomorphic in `DerivedCategory.Plus ℬ` (2.2(v)), and
  `″E(G, −)` is a functor there (2.5);
- for `F` left exact (as §D7.1 assumes) and `X = A[0]`, this is ArithmeticGaloisDuality §D7.1's
  *Derived composite spectral sequence*, with its edge maps: §D7.1 takes DerivedModuleAlgebra §S.1's
  spectral sequence of the double complex `G(I)` of this construction (`I` a Cartan–Eilenberg
  resolution of `F(J)`, `J` an injective resolution of `A`), filtered by rows; `G(I)` is
  first-quadrant, so 1.3(a′), through the flip, identifies that sequence from page `2` on with
  `″E(G, F(J))` and its edge maps with the edge morphisms of SpectralSequencesAndConvergence §3.6.
  Both abutments are identified with `Rⁿ(G ∘ F)(A)` through the augmentation `G(F(J)) → Tot G(I)`,
  which lands in row `0`, where the flip signs `(−1)^{pq}` are `1` (for 3.2 by 3.1's route: `t` at
  `J` is the unit of `RG` at `F(J)`).

*Needs:* 2.2(v), 2.5, 3.1; for the comparison with ArithmeticGaloisDuality §D7.1, 1.3(a′) and
§D7.1; Mathlib `DerivedCategory.Plus`.

**Checks.**

- If `F` is exact, `R^qF(A) = 0` for `q > 0` and `R^pG(F(A)) ≅ R^p(G ∘ F)(A)`; if `G` is exact, only
  the column `p = 0` survives and `G(R^qF(A)) ≅ R^q(G ∘ F)(A)` (ArithmeticGaloisDuality §D7.1's
  Checks).
- *Acyclicity cannot be dropped.* For the pair of 3.1's first Check at `A = ℚ/ℤ`, the would-be page
  `R^pG(R^qF(ℚ/ℤ))` is the single row `q = 0` with `E₂^{1,0} = Ext¹(ℤ/2, ℤ/2) = ℤ/2`, which would
  survive and force `R¹(G ∘ F)(ℚ/ℤ) ≠ 0`; in fact `R¹(G ∘ F)(ℚ/ℤ) = 0`.
- *Additive `F`, and where left exactness enters.* For `F = − ⊗ ℤ/2` and `G` the identity of abelian
  groups (3.1's last Check) at `X = ℤ[0]`: `J = (ℚ → ℚ/ℤ)` gives `F(J) = 0`, so `E(F, G; ℤ[0]) = 0`;
  this agrees with `R^pG(R^qF(ℤ)) = 0` (`R⁰F(ℤ) = R¹F(ℤ) = 0`, 2.2's Checks) and with the abutment
  `Rⁿ(G ∘ F)(ℤ) = RⁿF(ℤ) = 0`. The computation by `F`-acyclic resolutions fails for this `F`:
  `L = ℤ[0]` consists of `F`-acyclic objects, yet `″E(G, F(L)) = ″E(G, ℤ/2[0])` has
  `E₂^{0,0} = ℤ/2`.
- For `ℤ/4 → ℤ/2`, `F = Hom_{ℤ/4}(ℤ/2, −)` (coextension of scalars) and `G = Hom_{ℤ/2}(ℤ/2, −)`, at
  `A = ℤ/2`: `R^qF(ℤ/2) = Ext^q_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for every `q ≥ 0` (`ℤ/4` is self-injective,
  and `Hom_{ℤ/4}(ℤ/2, −)` of the injective resolution `ℤ/2 → ℤ/4 →(×2) ℤ/4 →(×2) ⋯` has zero
  differentials), `G` is exact, so `E₂^{0,q} = ℤ/2` and `E₂^{p,q} = 0` for `p > 0`, and the abutment
  is `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`.

### 3.3 Low degrees and naturality in the functors

Let `F`, `G` be as in 3.2 and `A` an object of `𝒜`. Prove (SpectralSequencesAndConvergence §3.6,
first quadrant, applied to the sequence of 3.2, which for an object is the spectral sequence of
grothendieck1957 line 1330–1337, Théorème 2.4.1):

- for `F` left exact, the five-term exact sequence
  `0 → R¹G(F(A)) → R¹(G ∘ F)(A) → G(R¹F(A)) → R²G(F(A)) → R²(G ∘ F)(A)`, whose first, second and
  fourth maps are the edge morphisms of SpectralSequencesAndConvergence §3.6 for the sequence of
  3.2, which are the canonical maps `R^aG(F(A)) → R^a(G ∘ F)(A)` and `R¹(G ∘ F)(A) → G(R¹F(A))` of
  ArithmeticGaloisDuality §D7.1 (3.2's comparison with §D7.1, through 1.3(a′)), and whose third map
  is `d₂`;
- for `F` left exact and `m ≥ 1`, if `R^qF(A) = 0` for `0 < q < m`, then
  `R^jG(F(A)) ≅ R^j(G ∘ F)(A)` for `j < m` and
  `0 → R^mG(F(A)) → R^m(G ∘ F)(A) → G(R^mF(A)) → R^{m+1}G(F(A)) → R^{m+1}(G ∘ F)(A)` is exact;
- for `F` merely additive, the same two statements with `R⁰F(A)` in place of `F(A)` (`F(A)` itself
  is wrong there: for `F = − ⊗ ℤ/2`, `G` the identity and `A = ℤ`, the case `j = 0` reads
  `R⁰G(R⁰F(ℤ)) = 0 = R⁰(G ∘ F)(ℤ)`, while `G(F(ℤ)) = ℤ/2`);
- *naturality in the functors:* natural transformations `α : F ⟶ F′` and `β : G ⟶ G′`, between pairs
  satisfying 3.1's condition, induce morphisms of composite-functor spectral sequences
  (SpectralSequencesAndConvergence §3.3) whose page-`2` components are `R^pG(R^qα)` and `R^pβ(R^qF)`
  and whose abutment components are those of `Mathlib`'s
  `CategoryTheory.NatTrans.rightDerivedFunctorPlus`; the morphisms are natural in `A`.

For both left exact and merely additive `F`, the transgression is `d₂` in the five-term sequence
and `d_{m+1}` in the extended sequence, using the row-gap identifications with page `m + 1`. The
other maps are the edge morphisms of SpectralSequencesAndConvergence §3.6.

Route: SpectralSequencesAndConvergence §3.6 applied to the first-quadrant convergence of 3.2; the
double complex `G(I)` of 3.2 for `X = A[0]` is first-quadrant, so 1.3(a′), through the flip,
identifies the edge morphisms of SpectralSequencesAndConvergence §3.6 with those of
DerivedModuleAlgebra §S.1's sequence of `G(I)`, which ArithmeticGaloisDuality §D7.1 identifies with
the canonical maps (3.2, last item); for naturality, `α` gives a chain map `F(J) → F′(J)` and 2.5's
naturality in the complex, and `β` gives `G(I) → G′(I)` and 2.5's naturality in the functor.
*Needs:* 3.1 (the condition on the pairs), 3.2; 2.5 (its naturality in the complex and in the
functor, for naturality in the functors); SpectralSequencesAndConvergence §3.3, §3.6 ; for the edge
maps, 1.3(a′) and ArithmeticGaloisDuality §D7.1; Mathlib
`CategoryTheory.NatTrans.rightDerivedFunctorPlus`.

**Checks.**

- For the coextension example of 3.2, the five-term sequence reads
  `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, with the middle map an isomorphism.
- If `F` is exact the hypothesis holds for every `m`, and `R^jG(F(A)) ≅ R^j(G ∘ F)(A)` for all `j`.
- *The page of the transgression.* For `m = 2`, the row-gap hypothesis gives `E₂^{p,1} = 0`.
  The differential `d₂ : E₂^{0,2} → E₂^{2,1}` therefore vanishes; the required map to
  `E₂^{3,0}` is `d₃ : E₃^{0,2} → E₃^{3,0}`, with both page-`3` terms identified with their
  page-`2` terms. Its bidegree is `(3, −2)`, whereas `d₂` has bidegree `(2, −1)`.
- *The third map can be nonzero.* For `ℤ → ℤ/4`, `F = ModuleCat.coextendScalars` (`Hom_ℤ(ℤ/4, −)`,
  which preserves injectives by 3.1's third Check) and `G = Hom_{ℤ/4}(ℤ/2, −)`, so that
  `G ∘ F ≅ Hom_ℤ(ℤ/2, −)`, at `A = ℤ/2` (4.4(b) with `M = N = ℤ/2`): `R^qF(ℤ/2) = Ext^q_ℤ(ℤ/4, ℤ/2)`
  is `ℤ/2` for `q = 0, 1` and `0` otherwise, and `Ext^p_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for every `p ≥ 0`, so
  `E₂^{p,q} = ℤ/2` for `p ≥ 0`, `q ∈ {0, 1}`, while the abutment `Ext^n_ℤ(ℤ/2, ℤ/2)` vanishes for
  `n ≥ 2`. The five-term sequence reads `0 → ℤ/2 → ℤ/2 → ℤ/2 → ℤ/2 → 0`; exactness at `R²G(F(A))`
  forces `d₂ : G(R¹F(A)) → R²G(F(A))` to be an isomorphism, hence the second map to be `0` and the
  first an isomorphism. A sequence with `0` as its third map would not be exact there.

### 3.4 Right exact and mixed-variance composites

Prove, by 3.1–3.3 applied in opposite categories (2.6) (weibel1994 §5.8, uncertified;
cartan-eilenberg1956 Ch. XVI, uncertified):

- *Right exact composites.* For additive `F : 𝒜 → ℬ` and right exact `G : ℬ → 𝒞` with `𝒜`, `ℬ`
  having enough projectives and `F` sending projectives to objects `B` with `L_qG(B) = 0` for
  `q > 0`: the composition transformation of 3.1 for `Fᵒᵖ`, `Gᵒᵖ` is an isomorphism, and for an
  object `A` there is a spectral sequence `E²_{p,q} = L_pG(L_qF(A)) ⇒ L_{p+q}(G ∘ F)(A)`, converging
  strongly with finite filtrations in the homological bidegree assignment, with naturality as in 3.3
  and, for `F` right exact, the exact sequence
  `L₂(G ∘ F)(A) → L₂G(F(A)) → G(L₁F(A)) → L₁(G ∘ F)(A) → L₁G(F(A)) → 0` (for additive `F`, the same
  with `L₀F(A)` in place of `F(A)`).
- *Mixed variance.* For additive `F : 𝒜 → ℬ` (enough projectives in `𝒜` and `ℬ`) and a left exact
  `G : ℬᵒᵖ → 𝒞`, with `R^qG(op F(P)) = 0` for `q > 0` and every projective `P`, there is a spectral
  sequence `E₂^{p,q} = R^pG(op L_qF(A)) ⇒ R^{p+q}(G ∘ Fᵒᵖ)(op A)`, with the low-degree sequences of
  3.3.

*Needs:* 2.6, 3.1–3.3.

**Checks.**

- For `ℤ → ℤ/2`, `F = ModuleCat.extendScalars` and `G = Hom_{ℤ/2}(−, ℤ/2)`, at `A = ℤ/2`:
  `L_qF(ℤ/2) = Tor^ℤ_q(ℤ/2, ℤ/2) = ℤ/2` for `q = 0, 1`, `G` is exact, so `E₂^{0,q} = ℤ/2` for
  `q = 0, 1`, and the abutment is `Ext^n_ℤ(ℤ/2, ℤ/2) = ℤ/2` for `n = 0, 1` and `0` otherwise.
- If `F` is exact and preserves projectives, `L_pG(F(A)) ≅ L_p(G ∘ F)(A)`.
- With `F = − ⊗ ℤ/2` and `G = Hom_ℤ(−, ℤ)`, projectives `ℤ^{(X)}` go to `(ℤ/2)^{(X)}`, which are not
  `G`-acyclic (`Ext¹(ℤ/2, ℤ) = ℤ/2`): the mixed-variance hypothesis fails, as it must, since
  `G ∘ Fᵒᵖ = Hom(− ⊗ ℤ/2, ℤ) = 0` has zero derived functors while
  `R¹G(op L₀F(ℤ)) = Ext¹(ℤ/2, ℤ) ≠ 0`.

### Examples

SchemeAndStackFoundations §2.2's `leray_spectral_sequence` is 3.2 for a direct image, which has the
exact left adjoint inverse image and preserves injectives, followed by global sections (as obtained
at grothendieck1957 line 2421–2425 and Théorème 3.7.3, line 2443–2456); its `cech_to_cohomology` is
a second hypercohomology sequence of the Čech resolution, or 3.2 for the Čech complex of a covering
followed by `H⁰` (grothendieck1957 line 2493–2509), and its `localToGlobal` and
`hochschildSerre_galois_covering` are composite-functor sequences of sections with supports and of
invariants. The local-to-global Ext sequence `E₂^{p,q} = H^p(X, ℰxt^q(F, G)) ⇒ Ext^{p+q}(F, G)` is
3.2 for `Γ ∘ ℋom(F, −)`. For a group `G` with normal subgroup `N`, invariants under `N` are right
adjoint to the exact inflation, so invariants under `N` followed by invariants under `G/N` satisfy
3.1.

### Dependencies

Layer 2; SpectralSequencesAndConvergence §§3.3, 3.6; 1.3(a′) and ArithmeticGaloisDuality §D7.1,
for the edge maps; Mathlib derived functors on `D⁺`.

## Layer 4: Tor and Ext over rings

### 4.1 Balancing Tor

Let `𝒞` be a monoidal abelian category (Mathlib `MonoidalCategory`, `MonoidalPreadditive`,
`HasProjectiveResolutions`) in which, for every projective `P`, the functors `P ⊗ −` and `− ⊗ P`
(`tensorLeft P`, `tensorRight P`) are exact, that is preserve finite limits and finite colimits.
Prove that there is an isomorphism `Tor 𝒞 n ≅ Tor' 𝒞 n` of functors `𝒞 ⥤ 𝒞 ⥤ 𝒞` for every `n`
(`nonempty_tor_iso_tor'`; weibel1994 Theorem 2.7.2, uncertified, for modules). Route: for projective
resolutions `P → X` and `Q → Y`, the first-quadrant homological double complex `P ⊠ Q` (Mathlib
`CategoryTheory.Functor.mapBifunctorHomologicalComplex`) has exact augmented rows
`P_• ⊗ Q_j → X ⊗ Q_j` and exact augmented columns `P_i ⊗ Q_• → P_i ⊗ Y`; Tau Ceti's
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`, applied to `P ⊠ Q` and to its flip with
`HomologicalComplex₂.totalFlipIso`, gives quasi-isomorphisms `X ⊗ Q ← Tot(P ⊠ Q) → P ⊗ Y`, whose
homologies are `Tor_n(X, Y)` and `Tor'_n(X, Y)`; naturality comes from the lifting of maps to
projective resolutions. `ModuleCat R` for a commutative ring `R` satisfies the hypothesis,
projective modules being flat. *Needs:* Mathlib `CategoryTheory.Tor`, `CategoryTheory.Tor'`,
`CategoryTheory.Functor.mapBifunctorHomologicalComplex`, `HomologicalComplex₂.totalFlipIso`,
`CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`; Tau Ceti
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`.

**Checks.**

- `Tor_1(ℤ/4, ℤ/6) = ℤ/2` both ways: resolving `ℤ/6` gives the kernel of `×6` on `ℤ/4`, which is
  `{0, 2}`; resolving `ℤ/4` gives the kernel of `×4` on `ℤ/6`, which is `{0, 3}`.
- *Degree zero.* The route covers `n = 0`: `Tor_0(X, Y)` and `Tor'_0(X, Y)` are the cokernels of
  `X ⊗ Q_1 → X ⊗ Q_0` and of `P_1 ⊗ Y → P_0 ⊗ Y`, both `H_0` of `Tot(P ⊠ Q)`. They are `X ⊗ Y` when
  `X ⊗ −` and `− ⊗ Y` preserve finite colimits (Mathlib `Functor.leftDerivedZeroIsoSelf`, which
  assumes exactly this). In `ModuleCat R`, `R` commutative, both do: `X ⊗ −` is left adjoint to the
  internal Hom of Mathlib's `MonoidalClosed` instance, and `− ⊗ Y ≅ Y ⊗ −` by the braiding. For
  example, `Tor_0(ℤ/4, ℤ/6) = Tor'_0(ℤ/4, ℤ/6) = ℤ/4 ⊗ ℤ/6 = ℤ/2`.
- *Exactness with projectives alone does not give `Tor_0 = ⊗`.* Take `R = 𝔽₂[x, y]/(x², y²)`,
  `k = R/(x, y)` and, on finite-dimensional `R`-modules, `D = Hom_{𝔽₂}(−, 𝔽₂)` and
  `U ⋆ V := D(DU ⊗_R DV)`, a symmetric monoidal preadditive structure with unit `DR`. Taking the
  coefficient of `xy` in a product is a nondegenerate pairing on `R`, so `DR ≅ R`. Since `R` is
  local, projectives are free and `P ⋆ V ≅ V^n` for `P = R^n`, so the theorem's hypothesis holds.
  However, `U ⋆ k ≅ soc(U)`, the socle. For `X = R/(xy)`, resolving `k` by `R² →(x, y) R` gives
  `Tor_0(X, k) = X/(x, y)X = k`. Resolving `X` by `R →(×xy) R` gives
  `Tor'_0(X, k) = coker(0 : soc R → soc R) = k`. But `X ⋆ k = soc(X) = k·x ⊕ k·y` has dimension `2`.
  Balance holds; the identification with `⋆` fails because `− ⋆ k` is not right exact: applied to
  `R ↠ X` it gives the zero map `soc(R) = k·xy → soc(X) = k·x ⊕ k·y`, which is not surjective.
  Likewise `X ⋆ −` is not right exact: it sends `R ↠ k` to the zero map
  `X ≅ X ⋆ R → X ⋆ k = soc(X)`, induced by multiplication by `xy`, which kills `X`.
- For a projective `X`, `Tor_n(X, Y) = 0` for `n > 0`, which by definition is a statement about the
  second variable and follows here from `CategoryTheory.isZero_Tor'_succ_of_projective`.
- *Resolutions of length one.* In `ModuleCat ℤ`, let `X` have a two-term free presentation
  `0 → B → Z → X → 0` with `B`, `Z` finitely generated. The route with `P = (B → Z)` gives
  `Tor_1(X, M) ≅ Tor'_1(X, M) = ker(B ⊗ M → Z ⊗ M)` and `Tor_n(X, M) = 0` for `n ≥ 2`; this is
  KhovanovHomology §K5's comparison of `CategoryTheory.Tor'` and `CategoryTheory.Tor` for
  `X = Hⁱ(C)`. For `X = ℤ/2 ⊕ ℤ`, presented by `ℤ →(2, 0) ℤ²`, and `M = ℤ/2`, the kernel of
  `ℤ/2 → (ℤ/2)²`, `1 ↦ (0, 0)`, is `ℤ/2`, and resolving `M` by `ℤ →(×2) ℤ` gives the kernel of `×2`
  on `ℤ/2 ⊕ ℤ`, again `ℤ/2`: the free summand contributes nothing on either side. The second
  computation presents the second variable and is Tau Ceti's
  `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` for `0 → ℤ →(×2) ℤ → ℤ/2 → 0`, with
  `Tor_n(X, ℤ/2) = 0` for `n ≥ 2` by `CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`;
  the first, which presents `X`, needs the balance proved here. The cokernel of the same map,
  `(ℤ/2)² = X ⊗ M`, is `Tor_0`, not `Tor_1`.
- *Ext needs no balancing at the pin.* `Ext¹_ℤ(ℤ/2, ℤ)` is `ℤ/2` both from `ℤ →(×2) ℤ → ℤ/2`
  (Mathlib `ProjectiveResolution.extEquivCohomologyClass`) and from `ℤ → ℚ → ℚ/ℤ` (Mathlib
  `InjectiveResolution.extEquivCohomologyClass`); the double complex `Hom(P, I)` is first-quadrant
  and its two augmentations are quasi-isomorphisms by 1.5.

### 4.2 Universal-coefficient spectral sequences

- (a) *Tor form.* For a commutative ring `R`, a complex `K` of `R`-modules (no boundedness) and an
  `R`-module `M`, there is a spectral sequence
  `E₂^{p,q} = Tor^R_{−p}(H^q(K), M) ⇒ H^{p+q}(K ⊗^L M)`, converging strongly, with `E₂^{p,q} = 0`
  for `p > 0`, natural in `K`; from page `2` on it does not depend on `P` and is natural in `M`: a
  map `M → M′` lifts to a chain map of projective resolutions (Mathlib
  `CategoryTheory.ProjectiveResolution.lift`), which induces a map of double complexes, any two
  lifts are homotopic (`CategoryTheory.ProjectiveResolution.liftHomotopy`), and homotopic chain maps
  induce the same map on `″E₂^{p,q} = H^p(H^q(K) ⊗ P^•)` and on the abutment, hence on every later
  page (the field `comm` of `CategoryTheory.SpectralSequence.Hom`). It is `″E` of the double complex
  `K ⊠ P` on `Tot^⊕`, for a projective resolution `P` of `M` in degrees `≤ 0`: its rows vanish for
  `q > 0`, so 1.3(b) applies; `″E_1^{p,q} = H^q(K) ⊗ P^p` since `P^p` is flat, so
  `″E_2^{p,q} = Tor_{−p}(H^q K, M)` (Mathlib `CategoryTheory.Tor` resolves the second variable); and
  `Tot^⊕(K ⊠ P) = K ⊗ P` computes `K ⊗^L M` (DerivedModuleAlgebra §0.2). If `K` is bounded above,
  the first spectral sequence `E₁^{p,q} = Tor^R_{−q}(K^p, M)` converges to the same abutment by
  1.3(b). If `Tor^R_i = 0` for `i ≥ 2`, the two columns give
  `0 → Hⁿ(K) ⊗ M → Hⁿ(K ⊗^L M) → Tor^R_1(H^{n+1}(K), M) → 0` (SpectralSequencesAndConvergence §§1.3,
  3.4) (stacks-more-algebra line 7121–7134, Example 63.1, tag 061Z, for `K` bounded above; line
  7413–7422, Example 65.5, tag 0H80).
- (b) *Ext forms.* For any ring `R`, an `R`-module `M` and `K` with `Hⁱ(K) = 0` for `i ≪ 0`, with
  `Extⁿ(M, K) := Hom_{D(R)}(M[0], K[n])`, there are spectral sequences
  `E₂^{i,j} = Ext^i_R(M, H^j(K)) ⇒ Ext^{i+j}_R(M, K)` and, for a bounded-below representative,
  `E₁^{i,j} = Ext^j_R(M, K^i) ⇒ Ext^{i+j}_R(M, K)`: the hypercohomology sequences 2.4, 2.5 of
  `Hom_R(M, −)`, with `R^iHom(M, −)(N) ≅ CategoryTheory.Abelian.Ext M N i` through
  `InjectiveResolution.extEquivCohomologyClass`, and `RⁿHom(M, −)(K) ≅ Hom_{D(R)}(M[0], K[n])` since
  bounded-below complexes of injectives are K-injective (stacks-more-algebra line 8115–8127, §69,
  tags 0AVG, 0AVH, 0AVI).
- (c) *Contravariant Ext form.* For any ring `R`, an `R`-module `M` and `K` with `Hⁱ(K) = 0` for
  `i ≫ 0`, there is a spectral sequence `E₂^{p,q} = Ext^p_R(H^{−q}(K), M) ⇒ Hom_{D(R)}(K, M[p+q])`,
  the second hypercohomology sequence of the contravariant `Hom_R(−, M)` at `K°` (2.6;
  grothendieck1957 line 1304–1308, the contravariant variant of (2.4.2); cartan-eilenberg1956 Ch.
  XVII, uncertified); for `K = P` a bounded-above complex of projectives the abutment is
  `H^{p+q}(Hom_R(P, M))`. If `Ext^i_R = 0` for `i ≥ 2`, the two columns give
  `0 → Ext¹_R(H^{1−n}(K), M) → Hom_{D(R)}(K, M[n]) → Hom_R(H^{−n}(K), M) → 0` (hatcher-at line
  8476–8479, Theorem 3.2, for `R = ℤ` and a complex of free abelian groups; weibel1994 §3.6, the
  universal coefficient theorem for cohomology, uncertified).

*Needs:* 1.2, 1.3(b), 2.4–2.6; SpectralSequencesAndConvergence §1.3, §3.4 ; DerivedModuleAlgebra
§0.2; Mathlib `CategoryTheory.Tor`, `CategoryTheory.Abelian.Ext`,
`CategoryTheory.InjectiveResolution.extEquivCohomologyClass`, `CochainComplex.IsKInjective`,
`CochainComplex.IsKProjective`, and, for the naturality in `M` of (a),
`CategoryTheory.ProjectiveResolution.lift`, `CategoryTheory.ProjectiveResolution.liftHomotopy`,
`CategoryTheory.SpectralSequence.Hom`.

**Checks.**

- `ℤ/2 ⊗^L ℤ/2` over `ℤ`: `E₂^{0,0} = ℤ/2` and `E₂^{−1,0} = ℤ/2`, so `H^0 = H^{−1} = ℤ/2`, as
  DerivedModuleAlgebra §0.2's Check computes from `ℤ →(×2) ℤ`.
- *Unbounded complexes.* For `K = ⊕_{n ∈ ℤ} ℤ/2[n]` (zero differential) and `M = ℤ/2`, every
  `Hⁿ(K ⊗^L M)` is an extension of `Tor_1 = ℤ/2` by `ℤ/2 ⊗ ℤ/2`, and indeed
  `K ⊗^L ℤ/2 = ⊕ (ℤ/2 ⊗^L ℤ/2)[n]` has `Hⁿ = (ℤ/2)²`.
- *Contravariant form.* For the chain complex `X = (ℤ →(×2) ℤ)` in homological degrees `1, 0` and
  `M = ℤ`: `E₂^{1,0} = Ext¹(H_0 X, ℤ) = ℤ/2` and `E₂^{0,0} = Hom(ℤ/2, ℤ) = 0`, so
  `H¹(Hom(X, ℤ)) = ℤ/2`, which a direct computation of `ℤ →(×2) ℤ` confirms. Over a hereditary ring
  the two-column sequence is Tau Ceti's `TauCeti.ChainComplex.exact_extToHomology_kronecker`
  (`0 → Ext¹(H_{n−1}X, M) → Hⁿ(Hom(X, M)) → Hom(H_n X, M) → 0`).
- For an injective `M` the contravariant sequence is concentrated in column `0` and
  `Hom_{D(R)}(K, M[n]) ≅ Hom_R(H^{−n}(K), M)`.
- *Bounded finite free integral complexes.* For a bounded complex `C` of finitely generated free
  `ℤ`-modules and an abelian group `M`, `C ⊗^L M = C ⊗ M` and `Hom_{D(ℤ)}(C, M[n]) = Hⁿ(Hom(C, M))`
  (`C` is K-projective), and the two-column sequences of (a) and (c) are KhovanovHomology §K5's
  coefficient and Hom/Ext sequences in the same indexing:
  `0 → Hⁿ(C) ⊗ M → Hⁿ(C ⊗ M) → Tor_1(H^{n+1}(C), M) → 0` and
  `0 → Ext¹(H^{1−n}(C), M) → Hⁿ(Hom(C, M)) → Hom(H^{−n}(C), M) → 0`. For `C = (ℤ →(×2) ℤ)` in
  degrees `−1, 0` (`H^{−1} = 0`, `H^0 = ℤ/2`) and `M = ℤ/2`, (a) at `n = −1` reads
  `0 → 0 → H^{−1}(C ⊗ ℤ/2) → Tor_1(ℤ/2, ℤ/2) → 0`, and indeed `C ⊗ ℤ/2 = (ℤ/2 →(0) ℤ/2)` has
  `H^{−1} = ℤ/2`; with `H^n(C)` in place of `H^{n+1}(C)` in the Tor term the right-hand side would
  be `Tor_1(H^{−1}(C), ℤ/2) = 0`. For `M = ℤ`, (c) at `n = 1` reads
  `0 → Ext¹(ℤ/2, ℤ) → H¹(Hom(C, ℤ)) → 0 → 0`, `ℤ/2` on both sides, as in the contravariant Check
  above.

### 4.3 The Künneth spectral sequence

Let `R` be a commutative ring and `K`, `L` complexes of `R`-modules with `Hⁱ = 0` for `i ≫ 0`,
represented by bounded-above complexes. Prove that there is a spectral sequence
`E₂^{p,q} = ⊕_{i+j=q} Tor^R_{−p}(H^i(K), H^j(L)) ⇒ H^{p+q}(K ⊗^L L)`, with finitely many nonzero
terms in each total degree, converging strongly with finite filtrations, natural in `K` and `L` from
page `2` (stacks-more-algebra line 7399–7412, Lemma 65.4, tag 0H7Z, proved there for bounded
complexes; cartan-eilenberg1956 Ch. XVII, uncertified; weibel1994 §5.6, uncertified). Route: let `P`
be a projective Cartan–Eilenberg resolution of `K` (2.6), with resolution degree `s ≤ 0`, so that
`Tot(P)` is a bounded-above complex of projectives quasi-isomorphic to `K` and `Tot(P) ⊗ L` computes
`K ⊗^L L` (DerivedModuleAlgebra §0.2). Filter `Tot(P) ⊗ L` by
`F^s = Tot(rows of P of index ≥ s) ⊗ L`; the filtration is finite in each degree, so its spectral
sequence (Conventions) converges strongly (SpectralSequencesAndConvergence §5.3). Its graded pieces
are the rows `P_s` of `P` tensored with `L`, and each `P_s` is a split complex with projective
cohomology `H_I(P)_s`, so `E₁^{s,m} ≅ ⊕_{i+j=m} H_I^i(P)_s ⊗ H^j(L)` (the Künneth isomorphism for
split complexes below). Each `H_I^i(P)` is a projective resolution of `H^i(K)`, so
`E₂^{s,m} ≅ ⊕_{i+j=m} Tor'_{−s}(H^i K, H^j L) ≅ ⊕ Tor_{−s}(H^i K, H^j L)` by 4.1. Naturality from
page `2` follows from the lifting of 2.6. *Needs:* 2.6, 4.1; SpectralSequencesAndConvergence §5.3;
SpectralSequencesAndConvergence §1.3 and §3.4, for the two-column sequence; DerivedModuleAlgebra
§0.2; Tau Ceti `CochainComplex.spectralSequence`, `CochainComplex.isKFlat_of_boundedAbove_flat`,
`HomologicalComplex.homologyCross`.

- *Künneth isomorphism for split complexes.* For a complex `S` of `R`-modules whose differentials
  split and whose cohomology is projective, and any complex `L`, the cross product
  `⊕_{i+j=n} H^i(S) ⊗ H^j(L) → Hⁿ(S ⊗ L)` is an isomorphism: `S` is the direct sum of its
  cohomology, with zero differential, and of contractible complexes.
- *Edge map.* The edge map `E₂^{0,n} = ⊕_{i+j=n} H^i(K) ⊗ H^j(L) ↠ E_∞^{0,n} = F^0 Hⁿ ↪ Hⁿ(K ⊗^L L)`
  is the cross product (Tau Ceti `HomologicalComplex.homologyCross` on representatives).
- If `K` is a bounded-above complex of flat modules, `Tot(K ⊗ L)` computes `K ⊗^L L`, so the
  sequence abuts to `H^{p+q}(Tot(K ⊗ L))`.
- If `Tor^R_i = 0` for `i ≥ 2`, the two columns `p ∈ {−1, 0}` give
  `0 → ⊕_{i+j=n} H^i(K) ⊗ H^j(L) → Hⁿ(K ⊗^L L) → ⊕_{i+j=n+1} Tor^R_1(H^i K, H^j L) → 0`
  (stacks-more-algebra line 7413–7422, Example 65.5, tag 0H80).

**Checks.**

- `K = L = ℤ/2[0]` over `ℤ`: `E₂^{0,0} = E₂^{−1,0} = ℤ/2`, and the two-column sequence gives
  `H^0 = H^{−1} = ℤ/2`.
- *Non-degeneration at two columns.* Over `R = k[ε]/(ε²)` with `K = L = k[0]`,
  `E₂^{p,0} = Tor_{−p}(k, k) = k` for every `p ≤ 0`; the page is concentrated on the row `q = 0`,
  every `d_r` with `r ≥ 2` leaves it, so `H^{−n}(k ⊗^L k) = k` for every `n ≥ 0`: infinitely many
  columns, one term in each total degree.
- `K = R[0]` gives `E₂^{0,q} = H^q(L)` and nothing else.
- With `L = M[0]` the page and abutment are those of 4.2(a) for the bounded-above complex `K`.
- Over a ring of global dimension at most one (so that the two-column item applies), for `ℕ`-indexed
  chain complexes `K`, `L` placed in non-positive degrees with `L` a complex of projective modules,
  `K ⊗ L` computes `K ⊗^L L` and the two-column sequence is Tau Ceti's
  `HomologicalComplex.homologyKunnethShortComplex_shortExact` in the degrees `n = −m − 1 ≤ −1` it
  covers, the Tor term summed over `i + j = n + 1` (its `p + q = m`). That declaration asks less:
  only that the cycles `Z_q(L)` and the quotients `L_q/Z_q(L)` be projective, which over such a ring
  holds for every complex of projectives (submodules of projectives being projective), and nothing
  of `K` or of the ring. Under those hypotheses alone each `H_q(L)` has the projective presentation
  `0 → L_{q+1}/Z_{q+1}(L) → Z_q(L) → H_q(L) → 0`, so the Tor terms in columns `p ≤ −2` still vanish.
- *Bounded finite free integral complexes.* For two bounded complexes `C`, `D` of finitely generated
  free `ℤ`-modules, `C ⊗^L D = C ⊗ D` and the two-column sequence is KhovanovHomology §K5's Künneth
  sequence, with the Tor term summed over `i + j = n + 1`. For `C = D = (ℤ →(×2) ℤ)` in degrees
  `−1, 0`, with generators `e` in degree `−1` and `f` in degree `0`, `C ⊗ D` (with
  `d(x ⊗ y) = dx ⊗ y + (−1)^{|x|} x ⊗ dy`, as in 5.2) is `ℤ → ℤ² → ℤ` in degrees `−2, −1, 0`, with
  `e ⊗ e ↦ (−2, 2)` and `(a, b) ↦ 2a + 2b` on the basis `(e ⊗ f, f ⊗ e)`, so `H^{−2} = 0`,
  `H^{−1} = ℤ/2` and `H^0 = ℤ/2`. At `n = −1` the tensor term `⊕_{i+j=−1} H^i ⊗ H^j` vanishes and
  the Tor term is `Tor_1(H^0, H^0) = ℤ/2`, matching `H^{−1}`; summing the Tor term over `i + j = n`
  would give `0` there.

### 4.4 Change of rings

Let `f : R → S` be a ring map. Prove (stacks-more-algebra line 7135–7140, Example 63.2, tag 068F;
weibel1994 §5.6, the base-change spectral sequence for Tor, uncertified; cartan-eilenberg1956
Ch. XVI, uncertified):

- (a) For `R`, `S` commutative, an `R`-module `M` and an `S`-module `N`, a spectral sequence
  `E²_{p,q} = Tor^S_p(Tor^R_q(M, S), N) ⇒ Tor^R_{p+q}(M, N)` (homological bidegrees, `N` restricted
  to `R`), converging strongly with finite filtrations. Route (Stacks): for a projective resolution
  `P` of `M`, `P ⊗_R N = (P ⊗_R S) ⊗_S N` with `P ⊗_R S` a complex of projective `S`-modules whose
  homology is `Tor'^R_q(M, S)`; apply 4.2(a) over `S` to it and `N`, and 4.1 to pass from `Tor'` to
  `Tor`.
- (b) For any rings, an `S`-module `N` and an `R`-module `M`, a spectral sequence
  `E₂^{p,q} = Ext^p_S(N, Ext^q_R(S, M)) ⇒ Ext^{p+q}_R(N, M)`: 3.2 for
  `F = ModuleCat.coextendScalars f` (which preserves injectives, 3.1's third Check) and
  `G = Hom_S(N, −)`, with `G ∘ F ≅ Hom_R(N, −)` by `ModuleCat.restrictCoextendScalarsAdj` and
  `R^qF(M) ≅ Ext^q_R(S, M)` as abelian groups.
- (c) For `R`, `S` commutative, an `R`-module `M` and an `S`-module `N`, a spectral sequence
  `E₂^{p,q} = Ext^p_S(Tor^R_q(S, M), N) ⇒ Ext^{p+q}_R(M, N)`: 3.4's mixed-variance sequence for
  `F = ModuleCat.extendScalars f`, which preserves projectives, and `G = Hom_S(−, N)`, with
  `G ∘ Fᵒᵖ ≅ Hom_R(−, N)` by `ModuleCat.extendRestrictScalarsAdj` and `L_qF(M) ≅ Tor^R_q(S, M)`.
- Each has the low-degree exact sequences of 3.3 and 3.4.

*Needs:* 3.1–3.4, 4.1, 4.2(a); Mathlib `ModuleCat.extendScalars`, `ModuleCat.coextendScalars`,
`ModuleCat.restrictScalars`, `ModuleCat.restrictCoextendScalarsAdj`,
`ModuleCat.extendRestrictScalarsAdj`.

**Checks.**

- *A nonzero differential.* For `ℤ → ℤ/4`, `M = ℤ/2`, `N = ℤ/2`: `Tor^ℤ_q(ℤ/2, ℤ/4) = ℤ/2` for
  `q = 0, 1`, and `Tor^{ℤ/4}_p(ℤ/2, ℤ/2) = ℤ/2` for every `p ≥ 0`, so `E²_{p,q} = ℤ/2` for `p ≥ 0`,
  `q ∈ {0, 1}`. The abutment `Tor^ℤ_n(ℤ/2, ℤ/2)` is `ℤ/2` for `n = 0, 1` and `0` for `n ≥ 2`; as
  only `d²` can leave `E²_{p,0}` (into `E²_{p−2,1}`), every `d² : E²_{p,0} → E²_{p−2,1}` with
  `p ≥ 2` is an isomorphism.
- For `ℤ/4 → ℤ/2`, `N = M = ℤ/2`, (b) is the coextension example of 3.2: concentrated in column `0`,
  abutting to `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`.
- For `ℤ → ℤ/2`, `M = N = ℤ/2`, (c) is 3.4's first Check, abutting to `Ext^n_ℤ(ℤ/2, ℤ/2)`.
- For `f` the identity, all three sequences are concentrated in one column or one row.

### Examples

AlgebraicTopology §5.1's Künneth spectral sequence of singular chains of `X × Y` is 4.3 for the
bounded-above complexes of free modules of singular chains (in non-positive cohomological degrees),
whose two-column collapse over a hereditary ring is Tau Ceti's Künneth sequence.
ArithmeticLocallySymmetricSpaces ALS.1.7's coefficient-change sequence for `RΓ(X_K, V)` is an
instance of 4.2(a).

### Dependencies

Layers 1–3; SpectralSequencesAndConvergence §§1.3, 3.4, 5.3; DerivedModuleAlgebra
§0.2; Mathlib Tor, Ext and change of rings; Tau Ceti's filtered-complex spectral sequence, K-flat
complexes, cross products and first-quadrant bicomplexes.

## Layer 5: products

### 5.1 Pairings of exact couples

Let `R` be a commutative ring and `C₁ = (D₁, E₁; i₁, j₁, k₁)`, `C₂`, `C = (D, E; i, j, k)`
cohomological exact couples of `R`-modules (StableHomotopyKTheory §7.22). A *pairing*
`φ : E₁ ⊗ E₂ → E` is a family of bilinear maps `E₁^{s,t} × E₂^{s′,t′} → E^{s+s′,t+t′}`, written
`xy`. For `n ≥ 0`, `φ` *satisfies Massey's condition `μ_n`* if for all `x ∈ E₁^{s,t}`, `y ∈ E₂`,
`a ∈ D₁`, `b ∈ D₂` with `k₁(x) = i₁ⁿ(a)` and `k₂(y) = i₂ⁿ(b)` there is `c ∈ D` with `k(xy) = iⁿ(c)`
and `j(c) = j₁(a)y + (−1)^{s+t} x j₂(b)`; it *satisfies `μ`* if it satisfies every `μ_n` (may-primer
line 249–266; massey1954, uncertified). Prove: `μ_0` holds if and only if `d = jk` satisfies the
Leibniz rule `d(xy) = d(x)y + (−1)^{s+t} x d(y)`; under `μ_0`, for every `m ≥ 0`, `φ` satisfies
`μ_{m+1}` if and only if the induced pairing `φ′` of the derived couples satisfies `μ_m` (may-primer
line 267–279, Proposition 4.1, whose index `n = m + 1` is positive); hence if `φ` satisfies `μ`,
every induced pairing `φ_r : E_r(C₁) ⊗ E_r(C₂) → E_r(C)` on the pages `E_r` (the `E` of the
`(r − 1)`-th derived couple, StableHomotopyKTheory §7.22) satisfies `μ`, satisfies the Leibniz rule
for `d_r`, and `φ_{r+1}` is the map induced on cohomology by `φ_r` (may-primer line 280–287,
Corollary 4.2). Route for the equivalence, with `n = m + 1`: a class of `E′₁` is `x̄` for a
`d`-cycle `x`, an element of `D′₁ = i₁D₁` is `i₁a`, and `k′₁(x̄) = i′₁^m(i₁a)` exactly when
`k₁(x) = i₁ⁿ(a)`, so `μ_n` for `φ` gives `μ_m` for `φ′` with `c′ = i(c)`. Conversely, an `x` with
`k₁(x) = i₁ⁿ(a)` is a `d`-cycle because `j₁i₁ = 0` and `n ≥ 1`; `μ_m` for `φ′` gives `c′ = i(c)`
with `j(c)` equal to the required element up to a boundary `jk(z)`, and `c − k(z)` satisfies `μ_n`
for `φ` because `iⁿk = 0` for `n ≥ 1`. *Needs:* StableHomotopyKTheory §7.22; Mathlib `ModuleCat`.

- The pairings `φ_r` are natural in morphisms of exact couples compatible with the pairings.
- `μ_0` for a pairing on `E₁ = E` is exactly that `φ` is a map of complexes for `jk`.

**Checks.**

- For the Bockstein couple of `ℤ` (SpectralSequencesAndConvergence §6.2's Check: `D = ℤ`, `i = ×ℓ`,
  `E = ℤ/ℓ`, `k = 0`) with the multiplication of `ℤ/ℓ`, `μ_n` holds with `c = 0`: `iⁿ(a) = 0` forces
  `a = 0` in `ℤ`.
- *A non-example.* For the couple of the stupid filtration of `ℤ →(×2) ℤ`
  (`E₁^{0,0} = E₁^{1,0} = ℤ`, `d₁ = ×2`) and the pairing multiplying `E^{0,0} × E^{0,0} → E^{0,0}`
  and zero elsewhere, `d(1·1) = 2` in `E^{1,0}` while `d(1)·1 + 1·d(1) = 0`, so `μ_0` fails.
- *The index shift starts at `μ_1`.* Let `M = (ℤ →(×4) ℤ)` in degrees `0, 1` and take the couple of
  `0 → M →(×2) M → M/2M → 0` with `D^{s,t} = H^{s+t}(M)`, `E^{s,t} = H^{s+t}(M/2M)` and
  `i : D^{s+1,t−1} → D^{s,t}` multiplication by `2`: `E^{s,−s} = E^{s,1−s} = ℤ/2`,
  `D^{s,1−s} = ℤ/4`, other terms `0`, and `k(1) = 2`. Pair `E^{s,−s} × E^{s′,−s′} → E^{s+s′,−s−s′}`
  by the product of `𝔽₂`, and every other pair to `0`. Then `j(2) = 0` gives `d₁ = 0`, so `μ_0`
  holds and `φ′ = φ`. With `x = y = 1 ∈ E^{0,0}` and `a = b = 1 ∈ D^{2,−1}`, any `c` with
  `i(c) = k(1·1) = 2` is odd, so `j(c) = 1`, whereas `j(a)·1 + 1·j(b) = 0`: `μ_1` fails for `φ`.
  Likewise `d₂(1·1) = j(1) = 1` in `E^{2,−1}` while `d₂(1)·1 + 1·d₂(1) = 0`: `μ_0` fails for `φ′`.
  The equivalence at `m = 0` reads false ⟺ false; a reading of the shift at index `0` that sends
  `μ_0` for `φ` to `μ_0` for `φ′` would claim true ⟺ false.
- *The sign `(−1)^{s+t}` in `μ_n`.* For the couple of the degree filtration of `A = ℤ[v] ⊗ Λ(u)`,
  `du = v` (the last Check of 5.2: `E^{s,0} = A^s`, `jk = d`) with the product of `A`, `μ_0` reads
  `jk(xy) = jk(x)y + (−1)^{s+t} x jk(y)`, which holds since `d` is a derivation of `A`. At
  `x = y = u ∈ E^{1,0}` both sides are `0` (`u² = 0`, `vu − uv = 0`), while the condition with
  `+ x j₂(b)` in place of `(−1)^{s+t} x j₂(b)` would ask `0 = vu + uv = 2uv ≠ 0` in
  `E^{3,0} = ℤ·uv`.

### 5.2 Pairings of filtered complexes

Let `R` be commutative and `A`, `B`, `C` decreasingly filtered cochain complexes of `R`-modules, and
`φ : A ⊗ B → C` a chain map from the tensor product of complexes (Mathlib
`HomologicalComplex.mapBifunctor` with the sign `d(x ⊗ y) = dx ⊗ y + (−1)^{|x|} x ⊗ dy`) with
`φ(F^pA ⊗ F^{p′}B) ⊆ F^{p+p′}C`. Prove (may-primer line 295–324; mccleary2001 Ch. 2, uncertified):

- there are pairings `E_r^{p,q}(A) ⊗ E_r^{p′,q′}(B) → E_r^{p+p′,q+q′}(C)` for every `r ≥ 1`, each
  `d_r` satisfying `d_r(xy) = d_r(x)y + (−1)^{p+q} x d_r(y)`, the pairing on page `r + 1` induced on
  cohomology by the one on page `r`;
- the pairing on page `1` is the one induced by `φ` on `H(gr^p A) ⊗ H(gr^{p′} B) → H(gr^{p+p′} C)`;
- at every position where the three spectral sequences converge weakly through the canonical
  presentation of SpectralSequencesAndConvergence §5.2 (both of its maps isomorphisms; the
  comparison of SpectralSequencesAndConvergence §4.3), in particular under
  SpectralSequencesAndConvergence §5.3 or §5.4, the pairing of limit pages is the one induced on
  graded pieces by `H(A) ⊗ H(B) → H(C)`, which respects the induced filtrations;
- the pairings are natural in filtered maps compatible with the pairings.

Route: the exact couples of the three filtered complexes (SpectralSequencesAndConvergence §6.3)
carry the pairing induced by `φ` on `E₁ = H(gr)`, which satisfies `μ` (may-primer line 310–311): for
`k₁(x) = i₁ⁿ(a)` choose a representative `x̃` of `x` with `dx̃ ∈ F^{p+n+1}A` representing `a`,
likewise `ỹ`, and take `c` the class of `d(x̃ỹ)`; then 5.1. *Needs:* 5.1;
SpectralSequencesAndConvergence §4.3, §5.2, §5.3, §5.4, §6.1, §6.3; Tau Ceti
`CochainComplex.spectralSequence`; Mathlib `HomologicalComplex.mapBifunctor`.

**Checks.**

- *Leibniz on page 1 with a nonzero differential.* Over `𝔽₂`, `A = 𝔽₂[x, y]/(x²)` with `|x| = 1`,
  `|y| = 2`, `dx = y`, filtered by the powers of the ideal `(y)`. Then `E₁` has basis `y^p` at
  `(p, p)` and `xy^p` at `(p, p + 1)`, `d₁(xy^p) = y^{p+1}`, and `d₁(x·y) = y² = d₁(x)·y + x·d₁(y)`.
  `E₂ = 𝔽₂` at `(0, 0)`, which is `H(A)` with its product.
- The trivial filtration `F^0 = A`, `F^1 = 0` of a differential graded algebra gives `E₁ = H(A)`
  with its cohomology product and all differentials zero.
- *The Leibniz sign over `ℤ`.* Let `A = ℤ[v] ⊗ Λ(u)`, the free graded-commutative `ℤ`-algebra on `u`
  of degree `1` and `v` of degree `2` (`u² = 0`, `uv = vu`), with `du = v` and `dv = 0`, so that
  `d(v^k) = 0` and `d(u v^k) = v^{k+1}`, and filter it by degree, `F^p = A^{≥p}`, a multiplicative
  filtration. Then `gr^p A = A^p` with zero differential, `E₁^{p,0} = A^p` and `E₁^{p,q} = 0` for
  `q ≠ 0`, `d₁ = d` and the page-`1` pairing is the product of `A`. For `x = y = u` at `(1, 0)`:
  `d₁(u·u) = d₁(0) = 0` and `d₁(u)·u − u·d₁(u) = vu − uv = 0`, while the rule without the sign
  `(−1)^{p+q}` would give `vu + uv = 2uv`, which is nonzero since `uv` is a basis element of
  `A³ = ℤ·uv`. `E₂ = H(A) = ℤ` at `(0, 0)`.

### 5.3 Pairings of double complexes

Let `R` be commutative and `K`, `L`, `M` double complexes of `R`-modules. Define a *pairing of
double complexes* as a family of bilinear maps `K^{p,q} × L^{p′,q′} → M^{p+p′,q+q′}` for which the
induced map `Tot^⊕(K) ⊗ Tot^⊕(L) → Tot^⊕(M)` is a chain map. Prove (cartan-eilenberg1956 Ch. XV,
uncertified):

- the condition holds if and only if `d₁(xy) = d₁(x)y + (−1)^{p+q} x d₁(y)` and
  `d₂(xy) = (−1)^{p′} d₂(x)y + (−1)^q x d₂(y)` for `x ∈ K^{p,q}`, `y ∈ L^{p′,q′}`;
- the column filtrations, and the row filtrations, are multiplicative, so `′E` and `″E` carry
  pairings satisfying 5.2; on `′E₂ = H_I H_II` the pairing is the one induced on iterated
  cohomology;
- `″E`, being `′E` of the flip, uses the flipped pairing `x ·_{flip} y = (−1)^{pq′+p′q} xy`, the
  unique sign making `HomologicalComplex₂.totalFlipIso` multiplicative, and on `″E₂ = H_II H_I` its
  pairing is the one induced by the flipped pairing on iterated cohomology.

*Needs:* 1.1, 1.2, 5.2; Mathlib `HomologicalComplex₂.totalFlipIso`,
`HomologicalComplex.mapBifunctor`.

- The tensor product `A ⊠ B` of two differential graded algebras, `K^{p,q} = A^p ⊗ B^q` with product
  `(a ⊗ b)(a′ ⊗ b′) = (−1)^{|b||a′|} aa′ ⊗ bb′`, is a pairing of double complexes with itself, with
  `Tot(A ⊠ B) = A ⊗ B` as differential graded algebras.

**Checks.**

- *The sign in the vertical rule.* In `A ⊠ B`, for `x = 1 ⊗ b ∈ K^{0,q}` and `y = a′ ⊗ 1 ∈ K^{p′,0}`
  with `p′` odd, `d₂(xy) = (−1)^{qp′} a′ ⊗ db = (−1)^{p′} d₂(x)y`; a rule
  `d₂(xy) = d₂(x)y + (−1)^q x d₂(y)` would give `(−1)^{(q+1)p′} a′ ⊗ db`, the wrong sign.
- *Graded commutativity.* For `A = B = ℤ[ε]/(ε²)` with `|ε| = 1` and zero differentials,
  `(ε ⊗ 1)(1 ⊗ ε) = ε ⊗ ε` and `(1 ⊗ ε)(ε ⊗ 1) = −ε ⊗ ε`, the Koszul sign of two elements of total
  degree `1`.
- *One column.* A differential graded algebra `A` placed in column `0` (`K^{0,q} = A^q`, `d₂ = d_A`,
  `d₁ = 0`), with its associative unital multiplication as the self-pairing, satisfies both rules
  (at `p = p′ = 0` the vertical rule is the Leibniz rule of `A`), `Tot(K) = A`, and `′E₁ = H(A)` in
  column `0` with its induced algebra product, all later differentials being zero. For
  `A = ℤ[ε]/(ε²)`, `|ε| = 1`, `d = 0`: `(1·ε)·1 = ε = 1·(ε·1)` and `′E₁ = A = H(A)`.
- *A self-pairing is not an algebra.* Let `K^{0,0} = ℤe ⊕ ℤf`, all other terms `0`, paired with
  itself by `e² = f`, `fe = e`, `ef = f² = 0`. Every differential is zero, so both rules read
  `0 = 0` and this is a pairing of double complexes; but `(ee)e = fe = e` while `e(ee) = ef = 0`,
  and no element `u = ae + bf` is a unit on either side (`eu = af ≠ e`, and `ue = e` forces `u = f`,
  with `ff = 0 ≠ f`). So the definition imposes neither associativity nor a unit, and `′E₁ = K`
  carries this non-associative product.

### Examples

DGFloer Layer 1 item 2's multiplicative Serre spectral sequence is 5.2 for the product-filtered cup
pairing of the Serre filtration. May's Example 4.3 (may-primer line 288–294), the Bockstein spectral
sequence of the singular cochains with the cup product, is 5.2 for the filtration of 6.1.

### Dependencies

Layer 1; SpectralSequencesAndConvergence §§4.3, 5.2–5.4, 6.1, 6.3; StableHomotopyKTheory
§7.22; Tau Ceti's filtered-complex spectral sequence; Mathlib tensor products of complexes.

## Layer 6: the Bockstein spectral sequence

### 6.1 The Bockstein exact couple

Let `A` be a commutative ring, `f ∈ A`, and `M` a cochain complex of `A`-modules on every term of
which multiplication by `f` is injective. Define the *Bockstein exact couple* of `(M, f)` as the
cohomological exact couple (SpectralSequencesAndConvergence §6.1) with `D^{s,t} = H^{s+t}(M)`,
`E^{s,t} = H^{s+t}(M/fM)`, `i : D^{s+1,t−1} → D^{s,t}` multiplication by `f`, `j` the reduction and
`k` the connecting morphism of `0 → M →(f) M → M/fM → 0`, of degrees `(−1, 1)`, `(0, 0)`, `(1, 0)`;
and the *Bockstein spectral sequence* as its spectral sequence (may-primer line 136–150, Example
2.3, for torsion-free chain complexes over `ℤ`; stacks-more-algebra line 12960–13006, §97, the
Bockstein operators, and line 13013–14, footnote 18; mccleary2001 Ch. 10, uncertified). *Needs:*
SpectralSequencesAndConvergence §6.1, §6.3 ; StableHomotopyKTheory §7.22; Tau Ceti
`CochainComplex.spectralSequence`; Mathlib connecting morphisms.

- Exactness at the three vertices is the long exact cohomology sequence.
- *Periodicity.* `(s, t) ↦ (s + 1, t − 1)` is an automorphism of the couple; the pages `E_r^{s,t}`
  depend only on `n = s + t` and are written `E_r^n`.
- `E_1^n = Hⁿ(M/fM)`, and `d_1` is the connecting morphism of `0 → M/fM →(f) M/f²M → M/fM → 0`, the
  Bockstein operator.
- *The filtered complex.* The couple is isomorphic to the exact couple
  (SpectralSequencesAndConvergence §6.3) of `M[1/f] = M ⊗_A A_f` filtered by `F^s = f^sM`, `s ∈ ℤ`,
  through multiplication by `f^{−s}` on `D` and `f^sM/f^{s+1}M ≅ M/fM` on `E`; so the Bockstein
  spectral sequence is the spectral sequence of that filtered complex (Conventions), as
  stacks-more-algebra footnote 18 records.

**Checks.**

- *Sign of `d_1`.* For `M = (ℤ →(×p) ℤ)` in degrees `0, 1` and `f = p`: `k(1) = [1] ∈ H^1(M) = ℤ/p`
  and `j([1]) = 1`, so `d_1 : E_1^0 = ℤ/p → E_1^1 = ℤ/p` is `+1`, an isomorphism.
- For `M = ℤ[0]` and `f = p`, `k = 0` and every `d_r` vanishes: `E_r^0 = ℤ/p` for all `r`
  (SpectralSequencesAndConvergence §6.2's Check).
- *Torsion-freeness is needed.* For `M = ℤ/p[0]` and `f = p`, multiplication by `p` is zero, so
  `0 → M → M → M/pM → 0` is not exact and there is no couple.
- For `M = (ℤ →(×p²) ℤ)`, `k(1) = [p] ∈ ℤ/p²` and `j([p]) = 0`: `d_1 = 0`.

### 6.2 Pages, higher Bocksteins and the limit page

With `M`, `f` as in 6.1, write `T[f^r]` for the `f^r`-torsion and `T[f^∞]` for the `f`-power torsion
of a module `T`, and `H̄ⁿ = Hⁿ(M)/Hⁿ(M)[f^∞]`. Prove, for `r ≥ 1` and every `n`:

- *Towers* (SpectralSequencesAndConvergence §6.2): `Z_{r+1}^n = k^{−1}(f^r H^{n+1}(M))` and
  `B_{r+1}^n = j(Hⁿ(M)[f^r])`; the limit page exists, with `Z_∞^n = k^{−1}(⋂_r f^r H^{n+1}(M))` and
  `B_∞^n = j(Hⁿ(M)[f^∞])`.
- *Higher universal-coefficient sequences* (may-primer line 147–150, Example 2.3, in homological
  form): `0 → (f^{r−1}Hⁿ(M)) ⊗_A A/f → E_rⁿ → (f^{r−1}H^{n+1}(M))[f] → 0` is exact.
- *Higher Bocksteins.* A class of `E_rⁿ` is represented by `x ∈ Hⁿ(M/fM)` that lifts to
  `x̃ ∈ Hⁿ(M/f^rM)`, and `d_r[x] = [β_r(x̃)]`, where `β_r` is the connecting morphism of
  `0 → M/fM →(f^r) M/f^{r+1}M → M/f^rM → 0` (mccleary2001 Ch. 10, uncertified, for `A = ℤ` and
  `f = p`; for a general pair `(A, f)` by the route below).
- *Stabilisation.* If `Hⁿ(M)[f^∞] = Hⁿ(M)[f^a]` and `H^{n+1}(M)[f^∞] = H^{n+1}(M)[f^b]`, the
  sequence stabilises in total degree `n` from page `max(a, b) + 1`, and `E_∞ⁿ ≅ H̄ⁿ ⊗_A A/f`
  (may-primer line 161–168, Example 2.3, for `A = ℤ`, `f = p` and homology of finite type, through
  the pages of each cyclic summand; mccleary2001 Ch. 10, uncertified).
- *Convergence* (mccleary2001 Ch. 10, uncertified, for `A = ℤ` and `f = p`; the criterion for a
  general pair `(A, f)` is the exact-couple computation of the route below). Let `Hⁿ(M)[1/f]` be
  filtered by the images `F^s = f^s H̄ⁿ` of `f^sHⁿ(M)`; this filtration is exhaustive and every
  `gr^s = f^sH̄ⁿ/f^{s+1}H̄ⁿ ≅ H̄ⁿ ⊗_A A/f`. The canonical comparison
  `gr^s ≅ ker k / B_∞ ⊆ E_∞^{s,n−s}` is an isomorphism at every position of total degree `n` if and
  only if `⋂_r f^r H^{n+1}(M) ∩ H^{n+1}(M)[f] = 0`, which holds under the bounded torsion of the
  previous item; then these isomorphisms are a weak convergence structure
  (SpectralSequencesAndConvergence §3.2) to `Hⁿ(M)[1/f]` in degree `n`, which converges
  (SpectralSequencesAndConvergence §3.2) when moreover `⋂_s f^s H̄ⁿ = 0`.

Route: the towers are SpectralSequencesAndConvergence §6.2 for this couple. The higher
universal-coefficient sequence comes from `0 → ker k/B_r → Z_r/B_r → k(Z_r) → 0`, with
`ker k / B_r ≅ Hⁿ/(fHⁿ + Hⁿ[f^{r−1}]) ≅ f^{r−1}Hⁿ/f^rHⁿ` (by `x ↦ f^{r−1}x`) and
`k(Z_r) = f^{r−1}H^{n+1} ∩ H^{n+1}[f]`. The higher Bockstein formula is
SpectralSequencesAndConvergence §6.2's description of `d_{r}`: if `k(x) = f^{r−1}y`,
`d_r[x] = [j(y)]`; a cochain `u ∈ Mⁿ` whose reduction modulo `f^r` is a cocycle has `du = f^r w` for
a unique `w ∈ M^{n+1}` (multiplication by `f^r` is injective), `w` is a cocycle since
`f^r dw = d²u = 0`, and `u` gives both `k(u mod f) = f^{r−1}[w]` and `β_r(u mod f^r) = w mod f`.
Stabilisation: for `r ≥ b`, `f^rH^{n+1} ∩ H^{n+1}[f] = 0`, so `Z_{r+1} = ker k`, and `B_{r+1}` is
constant for `r ≥ a`. Convergence: in modules, the kernel of `D^{s,n−s} → Hⁿ(M)[1/f]` (where
`D^{s,n−s} = Hⁿ(M)` for every `s`) is `⋃_r ker i^r`, so the image filtration of the colimit
`Hⁿ(M)[1/f]` of the tower `i` has `gr^s ≅ D^{s,n−s}/(iD^{s+1,n−s−1} + ⋃_r ker i^r) ≅ ker k / B_∞`
through `j`, a submodule of the limit page `Z_∞/B_∞`, equal to it exactly when `Z_∞ = ker k`.
*Needs:* 6.1; 5.2 (for multiplicativity only); SpectralSequencesAndConvergence §1.3, §1.4, §3.1 ,
§3.2, §6.2 .

- *Multiplicativity.* If `M` is a differential graded `A`-algebra, the filtration `f^sM` of `M[1/f]`
  is multiplicative, so every page carries a pairing with `d_r` a derivation (5.2; may-primer line
  288–294, Example 4.3).

**Checks.**

- *The ℤ/p^r complex.* For `M = (ℤ →(×p^r) ℤ)` in degrees `0, 1` and `f = p`: `H^0 = 0` and
  `H^1 = ℤ/p^r`; the higher universal-coefficient sequences give `E_s^0 = E_s^1 = ℤ/p` for `s ≤ r`
  and `0` for `s > r`, so `d_1 = ⋯ = d_{r−1} = 0`, `d_r` is an isomorphism and `E_{r+1} = 0`,
  matching `H^1 = ℤ/p^r`; stabilisation is from page `max(0, r) + 1`. The route's representative of
  `1 ∈ E_r^0` is `u = 1 ∈ M^0`, which is not a cocycle of `M` (`du = p^r`) but reduces to one modulo
  `p^r`, with `w = 1`: `k(1) = p^{r−1}[1]` and `d_r(1) = β_r(1) = 1`. Requiring `u` to be a cocycle
  of `M` would force `w = 0` and miss this `d_r`.
- *A limit page reached by no page.* For `M = ⊕_{k ≥ 1} (ℤ →(×p^k) ℤ)`, `H^1 = ⊕_k ℤ/p^k` has
  unbounded torsion, `E_r^0 = ⊕_{k ≥ r} ℤ/p ≠ 0` for every `r`, while `⋂_r p^r H^1 = 0` gives
  `Z_∞^0 = ker k = 0` (`H^0 = 0`) and `E_∞^0 = 0`, consistent with `H^0(M)[1/p] = 0`.
- *Weak convergence can fail.* For `M = (ℤ → ℤ[1/p])` (the inclusion) in degrees `0, 1`,
  `H^1 = ℤ[1/p]/ℤ` is `p`-divisible with `H^1[p] = ℤ/p`, so the criterion fails; indeed
  `M/pM = (ℤ/p → 0)` gives `E_r^0 = ℤ/p` for every `r`, while `H^0(M)[1/p] = 0`: no isomorphism
  `E_∞^0 ≅ gr^s` exists at all, canonical or not.
- *Hatcher's Bockstein cohomology.* For `A = ℤ`, `f = p` and `M` the integral singular cochains of a
  space with finitely generated integral cohomology, `E_2ⁿ` is the Bockstein cohomology
  `BHⁿ(X; ℤ/p)`, and the `r = 2` sequence reproduces hatcher-at line 13330–13337, Proposition 3E.3:
  a `ℤ` summand of `Hⁿ` contributes `ℤ/p` to `E_2ⁿ`, a `ℤ/p^k` summand with `k > 1` contributes
  `ℤ/p` to `E_2^{n−1}` and `E_2ⁿ`, and a `ℤ/p` summand contributes nothing;
  `E_∞ⁿ = (Hⁿ/torsion) ⊗ ℤ/p` (may-primer line 155–168).

### Examples

The Bockstein spectral sequences of torsion-free complexes over a principal ideal domain with a
prime `p`, and of torsion-free abelian groups, are the cases `A` a principal ideal domain and
`A = ℤ`. Tau Ceti's `TauCeti.cyclicBockstein`, for a compact group `G` and `n ≠ 0`, is `d_1` of 6.1
for `A = ℤ`, `f = n` and `M` the homogeneous continuous cochains of `G` with values in `ℤ` (trivial
action), on whose terms multiplication by `n` is injective: since `G` is compact, a continuous map
from a power of `G` to `ℤ/n` or `ℤ/n²` lifts to `ℤ`, so `M/nM` and `M/n²M` are the continuous
cochains with values in `ℤ/n` and `ℤ/n²`, and `0 → M/nM →(n) M/n²M → M/nM → 0` is the sequence of
cochains of `0 → ℤ/n → ℤ/n² → ℤ/n → 0` whose connecting map Tau Ceti takes.

### Dependencies

SpectralSequencesAndConvergence §§1.3, 1.4, 3.1, 3.2, 6.1–6.3; Tau Ceti's filtered-complex
spectral sequence; Layer 5 for multiplicativity; StableHomotopyKTheory §7.22.

## Downstream consumers

- **CohomologyOfGroups**: group hyperhomology and hypercohomology as Layer 2 (2.4–2.6 for
  coinvariants and invariants), the extension spectral sequences as Layer 3 (invariants under `N`
  followed by invariants under `G/N`, and the homological form through coinvariants), the Künneth
  and universal-coefficient sequences of group (co)homology as Layer 4, and the multiplicativity of
  the extension sequence through the filtered-complex pairings of Layer 5.
- **InverseGaloisAndArithmeticFundamentalGroupsPartII** (its composite Tor sequence
  `Tor^{R̄}_i(k, Tor^R_j(R̄, M)) ⇒ Tor^R_{i+j}(k, M)` and its hyperhomology sequence of a
  bounded-below chain complex of right modules tensored with a left module, over a graded, possibly
  noncommutative algebra, are instances of 3.4's right exact composites, for `R̄ ⊗_R −` followed by
  `k ⊗_{R̄} −`, and of 2.6, for `− ⊗_R M`, in the abelian categories of graded modules; Layer 4 does
  not state them, and that roadmap takes them from the supplier named in its own supplier
  contracts), **K3BlochGroups** (group hyperhomology sequences), **EtaleDualityAndPerverseSheaves**
  (hypercohomology sequences), **TorsionCohomologyInfrastructure** (Künneth and
  universal-coefficient sequences), and **HilbertModularVarietiesAndShimuraCurvesPartII** (change of
  rings for Ext along `A → A/x`): they state these sequences, or instances of them, for their own
  use.

## References

- stacks-012K: The Stacks Project Authors, *The Stacks Project*, chapter Homological Algebra, §18
  (Definition 18.3, tag 012Z), §24 (Definition 24.9, tag 012U), §25 (tags 012X, 0130–0133), §26
  (tags 0E1P, 0E1Q, 09IZ, 09J0, 0E1R).
- stacks-05QI: The Stacks Project Authors, *The Stacks Project*, chapter Derived Categories, §16
  (tags 05TC, 015A, 05TD, 015C, 05TE, 015E), §18 (tags 013R, 013P, 013S, 013T), §19, §21 (tags
  015G–015K), §22 (tags 015L–015N).
- stacks-more-algebra: The Stacks Project Authors, *The Stacks Project*, chapter More on Algebra,
  §63 (tags 061Y, 061Z, 068F), §65 (tags 0H7Z, 0H80), §69 (tags 0AVG–0AVI), §97 (the Bockstein
  operators and footnote 18).
- grothendieck1957: A. Grothendieck, *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. 9
  (1957): Chapitre II, §2.4 ((2.4.1), (2.4.2), Théorème 2.4.1, Remarques 1–3), §2.5 (Proposition
  2.5.4); Chapitre III, §§3.7–3.8.
- may-primer: J. P. May, *A primer on spectral sequences*: §2 (Example 2.3, the Bockstein spectral
  sequence), §4 (Proposition 4.1, Corollary 4.2, Example 4.3, pairings of filtered complexes).
- hatcher-at: A. Hatcher, *Algebraic Topology*, §3.1, Theorem 3.2; §3.E, Proposition 3E.3.
- douady1959: A. Douady, *La suite spectrale d'Adams : structure multiplicative*, Séminaire Henri
  Cartan 11 (1958–1959), exposé 19, §II A (products of spectral systems, named in *Scope and
  ownership* as outside this roadmap).
- weibel1994: C. A. Weibel, *An Introduction to Homological Algebra*, §§1.2, 2.2, 2.7 (Theorem
  2.7.2, Lemma 2.7.3), 3.6, 5.6–5.8 (uncertified).
- mccleary2001: J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Ch. 2 and Ch. 10
  (uncertified).
- cartan-eilenberg1956: H. Cartan, S. Eilenberg, *Homological Algebra*, Ch. XV–XVII (uncertified).
- massey1954: W. S. Massey, *Products in exact couples*, Ann. of Math. 59 (1954) (uncertified).
