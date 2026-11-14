module

import Mathlib
import TauCeti.Algebra.Homology.SpectralObject.Abutment
import TauCeti.Algebra.Homology.SpectralObject.Stabilization
import TauCeti.Algebra.Homology.SpectralObject.SpectralSequenceMap
import TauCeti.Algebra.Homology.SpectralSequence.Filtered.SpectralObject
import TauCeti.CategoryTheory.Preadditive.TowerDifference
import TauCeti.CategoryTheory.Limits.Replete

/-!
# Spectral sequences and convergence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the three
real-bodied definitions they need: bidegree assignments (README 2.1), convergence bounds of a
spectral object in one degree (README 4.4) and the Mittag–Leffler condition for a tower in an
abelian category (README 7.2). The README carries every target, API list and Check.

Stated here:

* the stabilisation of bounded spectral sequences, leaving and entering differentials separately
  (README 2.2, Stacks Lemma 24.8);
* the invariance of the Euler characteristic of a finitely supported page in a weak Serre class
  under passage to the next page, for an arbitrary spectral sequence with a bidegree assignment
  (README 2.3, the page step of Stacks Lemma 24.12);
* the convergence of the spectral sequence of a spectral object indexed by `EInt` in one degree
  `n` under convergence bounds `a`, `b`: `H^n(⊥ ≤ i)` and `H^{n+1}(⊥ ≤ i)` vanish for every integer
  `i ≤ a`, and `H^n(⊥ ≤ j) ⟶ H^n(⊥ ≤ ⊤)` is an isomorphism, not merely a monomorphism, for every
  integer `j ≥ b`; through the canonical maps of Mathlib's spectral objects (README 4.3–4.4,
  Stacks Lemma 24.13 in spectral-object form);
* the comparison theorem for spectral objects that both have these convergence bounds
  (README 4.6);
* the convergence bounds of the spectral object of an increasingly filtered complex whose stages
  have vanishing `H^n` and `H^{n+1}` below one bound and compute `H^n(K)` above another, through
  which the convergence theorem above applies to the spectral sequence of a filtered complex
  (README 5.3, Stacks Lemma 24.13);
* the Euler-characteristic identity for a complex whose filtration is finite in each degree and a
  weak Serre class (README 5.3, Stacks Lemma 24.12);
* the comparison theorem for exhaustive filtrations that vanish termwise below a bound, in an
  abelian category with exact sequential colimits (README 3.5 with 5.4);
* the characterisation of Tau Ceti's repleteness through `lim¹` of towers with epimorphic
  transitions, and the vanishing of `lim¹` of Mittag–Leffler towers in a replete abelian category
  with countable products (README 7.2).

Headline theorems that are not statable at the pins, and what each lacks:

* weak, ordinary and strong convergence of an arbitrary spectral sequence (README 3.2) and the
  theorems stated through them: the general comparison theorem (3.5), the Euler identity for a
  converging spectral sequence (3.4) and the vanishing, dimension-count, two-row, two-column,
  edge-morphism and five-term consequences (3.6). Each needs the limit page `E_∞` of a spectral
  sequence in Mathlib's carrier `CategoryTheory.SpectralSequence` (README 1.4), the quotient of the
  meet of the cycle tower by the join of the boundary tower of README 1.2; the towers are a
  construction by recursion over the pages, transporting subquotient presentations along the
  homology isomorphisms, and neither library has them. The filtered-complex and spectral-object
  forms of 3.4 and 3.5, whose limit page is Tau Ceti's `EInfty`, are stated below;
* the convergence of Mathlib's first- and third-quadrant spectral sequences
  (`coreE₂CohomologicalNat`, `coreE₂HomologicalNat`, README 4.5) as convergence structures: this is
  the structure of 3.2. The identification of a page object with an object `E^n(⊥ ≤ i₁ ≤ i₂ ≤ ⊤)`
  on the pages that 4.5 names is already at the pins: Mathlib's `spectralSequencePageXIso` for
  these recipes followed by the inverse of `isoMapFourδ₁Toδ₀'` and by `isoMapFourδ₄Toδ₃'`, whose
  vanishing hypotheses the classes `IsFirstQuadrant` and `IsThirdQuadrant` supply;
* the classical convergence theorem for exhaustive filtrations bounded below (README 5.4) and the
  complete convergence theorem (README 7.5): at a position that is regular but not coregular the
  boundary tower has no last term, so the limit page `E_∞` of README 1.4 is needed, and 7.5 also
  needs the whole-plane obstruction `W^n` of the exact couple of README 6.3. The comparison
  theorem that 5.4 yields is stated below;
* the spectral sequence of an exact couple, its towers and its identification with the spectral
  sequence of a spectral object (README 6.1–6.3), and Boardman's conditional-convergence theorems
  (README 7.4): neither library has bigraded exact couples (planned in StableHomotopyKTheory
  §7.22), and 7.4 also needs `E_∞` and the `lim¹` of the cycle tower of README 1.2;
* Boardman's double-tower short exact sequence `0 → lim¹_s Q^s → lim¹_s A^s → lim_s RQ^s → 0`
  (README 7.3): it needs the image system `Im^r A^s = im(A^{s+r} ⟶ A^s)` as a functor of `(r, s)`,
  the towers `s ↦ Q^s = lim_r Im^r A^s` and `s ↦ RQ^s = lim¹_r Im^r A^s` with their transition
  maps, and the map `lim¹_s A^s ⟶ lim_s RQ^s` built from them through invariance of `lim¹` under
  cofinal subsequences; neither library has these in an abelian category (Tau Ceti's cofinality
  of `lim¹` is stated for towers of modules), and Tau Ceti's `towerDifference` is the map `1 - s`
  of a single tower.
-/

namespace TauCetiRoadmap.SpectralSequencesAndConvergence

open CategoryTheory Limits ComposableArrows Opposite

universe v u

/-! ## Layer 2: bidegree assignments, boundedness and Euler characteristics of pages -/

/-- A *bidegree assignment* for spectral sequences whose `r`th page has shape `c r` (`r ≥ r₀`):
integer functions `fil` (filtration degree) and `deg` (total degree) on the positions, jointly
injective, and an integer `e` (the page offset), such that the differential of page `r` raises
`deg` by `1` and `fil` by `r - e` (Stacks, Homological Algebra, the discussion after Definition
24.1, Tag 012L, for the filtration, complementary and total degrees, and Lemma 24.2, Tag 012M, for
the bidegree `(r, 1 - r)` of `d_r`). The cohomological carriers have
`(p, q) ↦ (p, p + q)` with `e = 0`. -/
structure BidegreeAssignment {κ : Type*} (c : ℤ → ComplexShape κ) (r₀ : ℤ) where
  /-- The filtration degree of a position. -/
  fil : κ → ℤ
  /-- The total degree of a position. -/
  deg : κ → ℤ
  /-- The page offset: the differential of page `r` raises `fil` by `r - e`. -/
  e : ℤ
  /-- A position is determined by its filtration and total degrees. -/
  injective : Function.Injective fun pq : κ ↦ (fil pq, deg pq)
  /-- Every differential raises the total degree by one. -/
  deg_rel : ∀ r : ℤ, r₀ ≤ r → ∀ pq pq' : κ, (c r).Rel pq pq' → deg pq' = deg pq + 1
  /-- The differential of page `r` raises the filtration degree by `r - e`. -/
  fil_rel : ∀ r : ℤ, r₀ ≤ r → ∀ pq pq' : κ, (c r).Rel pq pq' → fil pq' = fil pq + r - e

/-- **Bounded below implies regular** (Stacks, Tag 0BDV, Lemma 24.8 (4)). Let `A` be a bidegree
assignment and `β : ℤ → ℤ` a bound below: the first page vanishes at every position `pq` with
`β (deg pq) ≤ fil pq`. Then at a position `pq` the differential leaving `pq` vanishes on every
page `r ≥ r₀` with `β (deg pq + 1) - fil pq + e ≤ r`. -/
theorem dFrom_eq_zero_of_boundedBelow {C : Type u} [Category.{v} C] [Abelian C] {κ : Type*}
    {c : ℤ → ComplexShape κ} {r₀ : ℤ} (E : SpectralSequence C c r₀) (A : BidegreeAssignment c r₀)
    (β : ℤ → ℤ) (hβ : ∀ pq : κ, β (A.deg pq) ≤ A.fil pq → IsZero ((E.page r₀ le_rfl).X pq))
    (pq : κ) (r : ℤ) (hr : r₀ ≤ r) (hrβ : β (A.deg pq + 1) - A.fil pq + A.e ≤ r) :
    (E.page r hr).dFrom pq = 0 := by
  sorry

/-- **Bounded above implies coregular** (Stacks, Tag 0BDV, Lemma 24.8 (5)). Let `A` be a bidegree
assignment and `α : ℤ → ℤ` a bound above: the first page vanishes at every position `pq` with
`fil pq ≤ α (deg pq)`. Then at a position `pq` the differential entering `pq` vanishes on every
page `r ≥ r₀` with `fil pq - α (deg pq - 1) + e ≤ r`. With a bound below as well, both
differentials at `pq` vanish from the first page satisfying both bounds. -/
theorem dTo_eq_zero_of_boundedAbove {C : Type u} [Category.{v} C] [Abelian C] {κ : Type*}
    {c : ℤ → ComplexShape κ} {r₀ : ℤ} (E : SpectralSequence C c r₀) (A : BidegreeAssignment c r₀)
    (α : ℤ → ℤ) (hα : ∀ pq : κ, A.fil pq ≤ α (A.deg pq) → IsZero ((E.page r₀ le_rfl).X pq))
    (pq : κ) (r : ℤ) (hr : r₀ ≤ r) (hrα : A.fil pq - α (A.deg pq - 1) + A.e ≤ r) :
    (E.page r hr).dTo pq = 0 := by
  sorry

/-- **The Euler characteristic of a page is that of the next page** (README 2.3; Stacks, Tag
0BDW, the page step in the proof of Lemma 24.12, there for filtered complexes). Let `A` be a
bidegree assignment, `P` a weak Serre class (it contains a zero object and is closed under
kernels, cokernels and extensions) and `v` a function on objects, with values in an abelian group,
that is additive on short exact sequences of objects of `P`. If on page `r` every position outside
a finite set `s` is zero and every position in `s` lies in `P`, then the same holds on page
`r + 1`, and `Σ_{pq ∈ s} (-1)^(deg pq) v(E_r(pq)) = Σ_{pq ∈ s} (-1)^(deg pq) v(E_{r+1}(pq))`. -/
theorem sum_negOnePow_page_eq_sum_negOnePow_page_add_one {C : Type u} [Category.{v} C]
    [Abelian C] {κ : Type*} {c : ℤ → ComplexShape κ} {r₀ : ℤ} (E : SpectralSequence C c r₀)
    (A : BidegreeAssignment c r₀) (P : ObjectProperty C) [P.ContainsZero]
    [P.IsClosedUnderKernels] [P.IsClosedUnderCokernels] [P.IsClosedUnderExtensions]
    {G : Type*} [AddCommGroup G] (v : C → G)
    (hv : ∀ S : ShortComplex C, S.ShortExact → P S.X₁ → P S.X₂ → P S.X₃ →
      v S.X₂ = v S.X₁ + v S.X₃)
    (r : ℤ) (hr : r₀ ≤ r) (s : Finset κ)
    (hs : ∀ pq : κ, pq ∉ s → IsZero ((E.page r hr).X pq))
    (hsP : ∀ pq ∈ s, P ((E.page r hr).X pq)) :
    (∀ pq : κ, pq ∉ s → IsZero ((E.page (r + 1)).X pq)) ∧
      (∀ pq ∈ s, P ((E.page (r + 1)).X pq)) ∧
      ∑ pq ∈ s, ((A.deg pq).negOnePow : ℤ) • v ((E.page r hr).X pq) =
        ∑ pq ∈ s, ((A.deg pq).negOnePow : ℤ) • v ((E.page (r + 1)).X pq) := by
  sorry

/-! ## Layer 4: spectral objects indexed by `EInt` -/

/-- A spectral object `X` indexed by `EInt` has *convergence bounds* `a` and `b` in degree `n`
when `H^n(⊥ ≤ i)` and `H^{n+1}(⊥ ≤ i)` vanish for all integers `i ≤ a`, and the map
`H^n(⊥ ≤ j) ⟶ H^n(⊥ ≤ ⊤)` is an isomorphism for all integers `j ≥ b` (README 4.4; Stacks,
Tag 0BK5, Lemma 24.13, for filtered complexes). -/
def HasConvergenceBounds {C : Type u} [Category.{v} C] [Abelian C]
    (X : Abelian.SpectralObject C EInt) (n a b : ℤ) : Prop :=
  (∀ i : ℤ, i ≤ a → IsZero ((X.H n).obj (mk₁ (homOfLE (bot_le : (⊥ : EInt) ≤ i)))) ∧
      IsZero ((X.H (n + 1)).obj (mk₁ (homOfLE (bot_le : (⊥ : EInt) ≤ i))))) ∧
    ∀ j : ℤ, b ≤ j → IsIso ((X.H n).map (twoδ₂Toδ₁ (homOfLE (bot_le : (⊥ : EInt) ≤ j))
      (homOfLE (le_top : (j : EInt) ≤ ⊤)) (homOfLE (bot_le : (⊥ : EInt) ≤ ⊤))
      (Subsingleton.elim _ _)))

/-- **Convergence in one degree for a spectral object** (README 4.3–4.4; Stacks, Tag 0BK5,
Lemma 24.13, in spectral-object form). Let `X` have convergence bounds `a`, `b` in degree `n`.
Then the filtration of the abutment `H^n(⊥ ≤ ⊤)` by the images of `H^n(⊥ ≤ q)` is finite (zero
for `q ≤ a`, everything for `q ≥ b`), and at every position `(n - q, q)` of total degree `n`, on
every page `r ≥ 2` with `q - a + 2 ≤ r` and `b - q + 1 ≤ r`:

* both canonical maps
  `E^n(q - r + 2 ≤ q ≤ q + 1 ≤ q + r - 1) ⟵ E^n(⊥ ≤ q ≤ q + 1 ≤ q + r - 1) ⟶ E^n(⊥ ≤ q ≤ q + 1 ≤ ⊤)`
  are isomorphisms; the target of the first is the page object, by Mathlib's
  `spectralSequencePageXIso`, and the target of the second is Tau Ceti's `EInfty q n`, the graded
  piece of the abutment by `EInftyIsoCokernel`;
* the differentials of page `r` leaving and entering `(n - q, q)` vanish.

The second map is an isomorphism as soon as `H^n(⊥ ≤ q + r - 1) ⟶ H^n(⊥ ≤ ⊤)` is a monomorphism
(README 4.3, boundary side), a condition weaker than the vanishing of `H^{n-1}(q + r - 1 ≤ ⊤)` that
Tau Ceti's `spectralSequencePageXIsoEInfty` assumes. The top condition of `HasConvergenceBounds`
asks for an isomorphism because the filtration must also exhaust the abutment, and neither the
monomorphism nor that vanishing suffices for this (README 4.4, Checks). -/
theorem convergence_of_hasConvergenceBounds {C : Type u} [Category.{v} C] [Abelian C]
    (X : Abelian.SpectralObject C EInt) {n a b : ℤ} (hX : HasConvergenceBounds X n a b) :
    (∀ i : ℤ, i ≤ a → IsZero (X.abutmentFiltration i n)) ∧
      (∀ j : ℤ, b ≤ j → IsIso (X.abutmentFiltrationι j n)) ∧
      ∀ (q r : ℤ) (hr : 2 ≤ r), q - a + 2 ≤ r → b - q + 1 ≤ r →
        ∀ (h₀₁ : ((q - r + 2 : ℤ) : EInt) ≤ (q : EInt))
          (h₂₃ : ((q + 1 : ℤ) : EInt) ≤ ((q + r - 1 : ℤ) : EInt)),
        IsIso (X.mapFourδ₁Toδ₀' ⊥ ((q - r + 2 : ℤ) : EInt) (q : EInt) ((q + 1 : ℤ) : EInt)
            ((q + r - 1 : ℤ) : EInt) bot_le h₀₁
            (Abelian.SpectralObject.coe_le_coe_add_one q) h₂₃ (n - 1) n (n + 1)) ∧
          IsIso (X.mapFourδ₄Toδ₃' ⊥ (q : EInt) ((q + 1 : ℤ) : EInt) ((q + r - 1 : ℤ) : EInt) ⊤
            bot_le (Abelian.SpectralObject.coe_le_coe_add_one q) h₂₃ le_top (n - 1) n (n + 1)) ∧
          ((X.spectralSequence Abelian.SpectralObject.coreE₂Cohomological).page r hr).dFrom
            (n - q, q) = 0 ∧
          ((X.spectralSequence Abelian.SpectralObject.coreE₂Cohomological).page r hr).dTo
            (n - q, q) = 0 := by
  sorry

/-- **The comparison theorem for spectral objects** (README 4.6; Weibel, Theorem 5.2.12, applied
through README 3.5). Let `φ : X ⟶ Y` be a morphism of spectral objects indexed by `EInt` that
both have convergence bounds `a`, `b` in degree `n`. If the induced morphism of spectral
sequences is an isomorphism at every position of some page `r ≥ 2`, then `φ` is an isomorphism
on the abutments `H^n(⊥ ≤ ⊤)`. This contains Tau Ceti's
`isIso_hom_app_abutment_of_isIso_page`, which asks `H^{n-1}(j ≤ ⊤)` and `H^n(j ≤ ⊤)` to vanish for
`j ≥ b`. -/
theorem isIso_hom_app_abutment_of_hasConvergenceBounds {C : Type u} [Category.{v} C] [Abelian C]
    {X Y : Abelian.SpectralObject C EInt} (φ : X ⟶ Y) {n a b : ℤ}
    (hX : HasConvergenceBounds X n a b) (hY : HasConvergenceBounds Y n a b) (r : ℤ) (hr : 2 ≤ r)
    (h : ∀ pq : ℤ × ℤ, IsIso (((Abelian.SpectralObject.spectralSequenceMap
      Abelian.SpectralObject.coreE₂Cohomological φ).hom r hr).f pq)) :
    IsIso ((φ.hom n).app (mk₁ (homOfLE (bot_le : (⊥ : EInt) ≤ ⊤)))) := by
  sorry

/-! ## Layer 5: filtered complexes -/

/-- **Convergence bounds of the spectral object of a filtered complex** (README 5.3; Stacks,
Tag 0BK5, Lemma 24.13, in one degree). Let `F` be an increasing filtration of a cochain complex
`K` by subcomplexes and fix integers `n`, `a`, `b`. If `H^n(F i)` and `H^{n+1}(F i)` vanish for
every `i ≤ a`, and the inclusion `F j ⟶ K` induces an isomorphism on `H^n` for every `j ≥ b`, then
the spectral object of `F` has convergence bounds `a`, `b` in degree `n`, so that
`convergence_of_hasConvergenceBounds` applies to the spectral sequence of `F`. For the decreasing
filtration `F^s = F_{-s}` of README 5.1 with bounds `p₀` and `p₁` these are `a = -p₀` and
`b = -p₁`. -/
theorem hasConvergenceBounds_spectralObject_filtrationFunctor {C : Type u} [Category.{v} C]
    [Abelian C] {K : CochainComplex C ℤ} (F : ℤ → Subobject K) (hF : Monotone F) (n a b : ℤ)
    (hbot : ∀ i : ℤ, i ≤ a → IsZero ((F i : CochainComplex C ℤ).homology n) ∧
      IsZero ((F i : CochainComplex C ℤ).homology (n + 1)))
    (htop : ∀ j : ℤ, b ≤ j → IsIso (HomologicalComplex.homologyMap (F j).arrow n)) :
    HasConvergenceBounds
      (CochainComplex.spectralObject (CochainComplex.filtrationFunctor F hF)) n a b := by
  sorry

/-- **The Euler characteristic of a filtered complex** (README 5.3; Stacks, Tag 0BDW,
Lemma 24.12). Let `F` be an increasing filtration of a cochain complex `K` that is finite in each
degree: for every `m` some stage vanishes in degree `m` and the inclusion of some stage is an
isomorphism in degree `m`. Let `P` be a weak Serre class (it contains a zero object and is closed
under kernels, cokernels and extensions) and `v` a function on objects, with values in an abelian
group, that is additive on short exact sequences of objects of `P`. If on some page `r ≥ 2` of the
spectral sequence of `F` every position outside a finite set `s` is zero and every position in
`s` lies in `P`, then every `H^n(K)` lies in `P`, `H^n(K)` vanishes unless `n` is the total degree
`p + q` of a position of `s`, and `Σ_n (-1)^n v(H^n(K)) = Σ_{(p,q) ∈ s} (-1)^(p+q) v(E_r^{p,q})`. -/
theorem sum_negOnePow_homology_eq_sum_negOnePow_page {C : Type u} [Category.{v} C] [Abelian C]
    {K : CochainComplex C ℤ} (F : ℤ → Subobject K) (hF : Monotone F)
    (hfin : ∀ m : ℤ, ∃ a b : ℤ, IsZero ((F a : CochainComplex C ℤ).X m) ∧ IsIso ((F b).arrow.f m))
    (P : ObjectProperty C) [P.ContainsZero] [P.IsClosedUnderKernels]
    [P.IsClosedUnderCokernels] [P.IsClosedUnderExtensions] {G : Type*} [AddCommGroup G]
    (v : C → G)
    (hv : ∀ S : ShortComplex C, S.ShortExact → P S.X₁ → P S.X₂ → P S.X₃ →
      v S.X₂ = v S.X₁ + v S.X₃)
    (r : ℤ) (hr : 2 ≤ r) (s : Finset (ℤ × ℤ))
    (hs : ∀ pq : ℤ × ℤ, pq ∉ s → IsZero
      (((CochainComplex.spectralSequence (CochainComplex.filtrationFunctor F hF)).page r hr).X pq))
    (hsP : ∀ pq ∈ s,
      P (((CochainComplex.spectralSequence (CochainComplex.filtrationFunctor F hF)).page r hr).X pq)) :
    (∀ n : ℤ, P (K.homology n)) ∧
      (∀ n : ℤ, n ∉ s.image (fun pq : ℤ × ℤ ↦ pq.1 + pq.2) → IsZero (K.homology n)) ∧
      ∑ n ∈ s.image (fun pq : ℤ × ℤ ↦ pq.1 + pq.2), (n.negOnePow : ℤ) • v (K.homology n) =
        ∑ pq ∈ s, ((pq.1 + pq.2).negOnePow : ℤ) •
          v (((CochainComplex.spectralSequence
            (CochainComplex.filtrationFunctor F hF)).page r hr).X pq) := by
  sorry

/-- **The comparison theorem for exhaustive filtrations bounded below** (README 3.5 with 5.4;
Weibel, Theorems 5.2.12 and 5.5.1). Let `C` have exact sequential colimits, and let `α` be a
morphism between the functors of increasing filtrations `F` of `K` and `G` of `L`. Fix a degree
`n`. Suppose that the stages `F a` and `G a` vanish in degrees `n` and `n + 1` (the decreasing
filtrations `F^p = F_{-p}` and `G^p = G_{-p}` are bounded below in those degrees), and that in
degrees `n - 1` and `n` the degreewise images of the stages have least upper bound `⊤` (the
filtrations are exhaustive there). If the morphism of spectral sequences induced by `α` is an
isomorphism at every position of some page `r ≥ 2`, then `α.app ⊤` induces an isomorphism on
`H^n`. No bound on the other side of the filtrations is assumed. -/
theorem isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow
    {C : Type u} [Category.{v} C] [Abelian C] [HasColimitsOfShape ℕ C]
    [HasExactColimitsOfShape ℕ C] {K L : CochainComplex C ℤ} (F : ℤ → Subobject K)
    (hF : Monotone F) (G : ℤ → Subobject L) (hG : Monotone G)
    (α : CochainComplex.filtrationFunctor F hF ⟶ CochainComplex.filtrationFunctor G hG)
    (n a : ℤ)
    (hFa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → IsZero ((F a : CochainComplex C ℤ).X m))
    (hGa : ∀ m : ℤ, n ≤ m → m ≤ n + 1 → IsZero ((G a : CochainComplex C ℤ).X m))
    (hFex : ∀ m : ℤ, n - 1 ≤ m → m ≤ n →
      IsLUB (Set.range fun i : ℤ ↦ imageSubobject ((F i).arrow.f m)) ⊤)
    (hGex : ∀ m : ℤ, n - 1 ≤ m → m ≤ n →
      IsLUB (Set.range fun i : ℤ ↦ imageSubobject ((G i).arrow.f m)) ⊤)
    (r : ℤ) (hr : 2 ≤ r)
    (h : ∀ pq : ℤ × ℤ, IsIso (((Abelian.SpectralObject.spectralSequenceMap
      Abelian.SpectralObject.coreE₂Cohomological (CochainComplex.spectralObjectMap α)).hom r hr).f
        pq)) :
    IsIso (HomologicalComplex.homologyMap (α.app ⊤) n) := by
  sorry

/-! ## Layer 7: towers and conditional convergence -/

/-- **Repleteness through `lim¹`** (README 7.2; the implication from repleteness is, for a
replete topos, Bhatt–Scholze, Proposition 3.1.9 for the exactness of countable products and
Proposition 3.1.10 for `lim¹ = 0` of abelian sheaves; the converse is README 7.2's). An abelian
category with countable products is replete in the sense of Tau Ceti's `TauCeti.IsReplete` if and
only if countable products are exact and every tower with epimorphic transitions has `lim¹ = 0`,
that is, its product–difference map `1 - s` is an epimorphism. -/
theorem isReplete_iff_countableAB4Star_and_epi_towerDifference {C : Type u} [Category.{v} C]
    [Abelian C] [HasCountableProducts C] :
    TauCeti.IsReplete C ↔ CountableAB4Star C ∧
      ∀ F : ℕᵒᵖ ⥤ C, (∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op)) →
        Epi F.towerDifference := by
  sorry

/-- A tower `F : ℕᵒᵖ ⥤ C` in an abelian category satisfies the *Mittag–Leffler condition* when
for every `n` the images of the transitions `F k ⟶ F n` are eventually constant: there is
`m ≥ n` such that for every `k ≥ m` the image of `F k ⟶ F n` is the image of `F m ⟶ F n`
(Stacks, Tag 02N0, Definition 31.2). -/
def IsMittagLeffler {C : Type u} [Category.{v} C] [Abelian C] (F : ℕᵒᵖ ⥤ C) : Prop :=
  ∀ n : ℕ, ∃ m : ℕ, ∃ hnm : n ≤ m, ∀ k : ℕ, ∀ hmk : m ≤ k,
    imageSubobject (F.map (homOfLE (hnm.trans hmk)).op) = imageSubobject (F.map (homOfLE hnm).op)

/-- **Mittag–Leffler towers have vanishing `lim¹` in a replete abelian category** (README 7.2;
Stacks, Tag 02N1, Lemma 31.3, for abelian groups). In a replete abelian category with countable
products, the product–difference map `1 - s` of a Mittag–Leffler tower is an epimorphism. In an
abelian category with exact countable products that is not replete this can fail (Neeman's
example, recorded in Stacks, Homological Algebra, Section 31, in the paragraph after
Definition 31.2). -/
theorem epi_towerDifference_of_isMittagLeffler {C : Type u} [Category.{v} C] [Abelian C]
    [HasCountableProducts C] [TauCeti.IsReplete C] {F : ℕᵒᵖ ⥤ C} (hF : IsMittagLeffler F) :
    Epi F.towerDifference := by
  sorry

end TauCetiRoadmap.SpectralSequencesAndConvergence
