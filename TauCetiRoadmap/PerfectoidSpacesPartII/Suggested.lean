module

public import Mathlib
public import TauCeti.RingTheory.Perfectoid.Basic
public import TauCeti.RingTheory.Huber.Basic
public import TauCeti.RingTheory.Huber.PowerBounded
public import TauCeti.RingTheory.Huber.LocalizationTopology.Plus
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Localization.PlusComparison
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.GlobalSections
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.Stalk.Basic
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.Plus.Basic
public import TauCeti.LinearAlgebra.Trace.Projective

/-!
# Perfectoid rings and spaces, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, each with `sorry`,
together with the few definitions their statements need.

Stated here:

* Bhatt's quantitative Riemann extension theorem, both clauses (README §1.2; Bhatt, *On the
  direct summand conjecture and its derived variant*, Theorem 4.2): the kernel clause
  `bhatt_riemann_extension_ker_almostZero` and the cokernel clause with the constant `c = pᵏm`,
  `bhatt_quantitative_riemann_extension`, and the kernel clause without regularity
  `bhatt_kernel_without_regularity` (README §1.4; Bhatt, Remark 4.4). They are stated on Tau
  Ceti's presentationwise rational localisation: `A⟨tⁿ/g⟩` is `TauCeti.Huber.PairOfDefinition.completedPlusSubring` of the
  presentation `({tⁿ, g}, g)`, the structure map is `toCompletionLoc`, and the restriction from
  `n + c` to `n` is `TauCeti.ValuationSpectrum.pairHomOfRationalSubsetSubset` of the inclusion of
  rational subsets; each clause uses one restriction map at a time. The assembled
  almost-pro-isomorphism (README §1.2(3), and §1.4) is the conjunction of the cokernel clause with
  a kernel clause, the offsets being raised to their maximum, and is not restated.
* Bhatt's Riemann extension theorem after limits (README §1.5; Bhatt, Remark 1.7):
  `bhatt_riemann_extension_limit`, on the annular tower `annularTower`, Tau Ceti's plus presheaf
  `TauCeti.ValuationSpectrum.presentationLimitPlusPresheaf` along the opens `annularOpen` of the
  annuli, with its limit in commutative rings and the canonical maps `coeffToSections`.
* André's perfectoid Riemann extension theorem, in its complete-integral-closure form
  (README §3.6(2); André, *Le lemme d'Abhyankar perfectoïde*, Théorème 4.2.2):
  `riemann_extension_completeIntegralClosure`, on the root saturation `rootSaturation` of
  README §2.3; and the complete integral closedness of the root saturation in `R[1/g]` (README
  §3.6(3); André, *Le lemme d'Abhyankar perfectoïde*, Lemme 4.2.3):
  `rootSaturation_completelyIntegrallyClosed`. Both hold for every compatible system of roots,
  with no regularity of `g` (Théorème 4.2.2 assumes `g` a nonzerodivisor; the general case of the
  first is derived from Lemme 4.2.3, README §3.6).
* The trace clause of André's perfectoid Abhyankar lemma (README §4.7(3); André, *Le lemme
  d'Abhyankar perfectoïde*, Théorème 0.3.1(3) and Proposition 5.3.1(3)), in the integral-closure
  model `B̃°` of README §4.6: `abhyankar_trace_almost_surjective`, with the trace of a finite
  projective algebra given by Tau Ceti's `LinearMap.projectiveTrace`.
* Purity of the normalized Kummer extensions of `W(k)⟦T₁, …, Tₙ⟧` for all finite and infinite
  indices (README §5.9; André, *La conjecture du facteur direct*, Corollaire 2.6.1):
  `kummer_isPureHom`.
* André's flatness theorem for the Kummer tower (README §5.8; André, *La conjecture du facteur
  direct*, Théorème 2.5.2): `kummer_almost_faithfullyFlat`.
* Ramified almost faithful flatness modulo `pᵐ` for the Kummer tower (README §5.12; André, *La
  conjecture du facteur direct*, Théorème 3.2.1): `kummer_ramified_almost_faithfullyFlat`, on the
  completed tower `KummerCompletion`, its localisation `KummerCompletionAway` and the ramified
  ideal `kummerRamifiedIdeal`. Its consequence for the integral model `S` of README §5.11 follows
  through README §5.2 and is not restated.

Headline theorems of the README that are not statable at the pins, and what each lacks:

* The derived form of Bhatt's theorem (README §1.3). It concerns `K ⊗^L_{A/tᵐ} A⟨tⁿ/g⟩/tᵐ` for
  every complex `K` in the derived category of `A/tᵐ`-modules; the pinned Mathlib has the derived
  category and `CategoryTheory.Tor` for objects, but no derived tensor product of complexes, and
  restricting to modules would lose the complexes the theorem is about.
* The first and fourth clauses of André's Riemann extension theorem, `lim_j A{ϖʲ/g}° = g^{-1/p^∞}A°`
  and its uniform-limit form, and the nested-systems theorem (README §3.6, §3.11): the uniform
  Banach localisations `A{λ/g}` with their transition maps, uniform limits, and the 2-limit
  category of perfectoid algebras on the annuli are missing.
* Ramified almost purity (README §4.5): the almost-module category is native, but almost
  perfectoid algebra and almost finite étale algebra structures are missing.
* Clauses (1) and (2) of André's perfectoid Abhyankar lemma (README §4.7): the largest perfectoid
  subalgebra of a finite étale `A[1/g]`-algebra needs topologies on intermediate algebras, and the
  almost finite étaleness of `B°/pᵐ` over `A°/pᵐ` needs almost finite étale algebra structures.
-/

noncomputable section

@[expose] public section

namespace TauCetiRoadmap.PerfectoidSpacesPartII

open TensorProduct

universe u

section Perfectoid

open TauCeti.Huber

variable (p : ℕ) [Fact p.Prime]

/-! ## Layer 1: the quantitative Riemann extension theorem -/

open TauCeti.ValuationSpectrum TauCeti.Huber.PairOfDefinition in
open Classical in
/-- **Bhatt's quantitative Riemann extension theorem, kernel clause** (Bhatt, *On the direct
summand conjecture and its derived variant*, Theorem 4.2(1), p. 6).

Let `K` be a perfectoid field (given by the criterion: its norms accumulate at `1`, `‖p‖ < 1` and
Frobenius is surjective on `K°/p`), `t ∈ K` a pseudouniformizer given by a compatible system of
`p`-power roots `t l` (`0 < ‖t 0‖ < 1`, `t (l + 1) ^ p = t l`), `R` a perfectoid Tate ring which is
a topological `K`-algebra, `A = R°`, and `g ∈ R°` an element given by a compatible system of
`p`-power roots `g k` in `R°`. For `m ≥ 0` and every `n ≥ 0` (`n = 0` gives the locus
`{1 ≤ |g|}`), `A⟨tⁿ/g⟩ = O⁺(X⟨tⁿ/g⟩)` is the completed plus ring
`completedPlusSubring` of the presentation `({tⁿ, g}, g)` of the rational subset `{|tⁿ| ≤ |g|}` of
`X = Spa(R, R°)`, with structure map `f_n = toCompletionLoc`. The pair of definition `P`, the
containment of its ideal of definition in `R°` and the denominator condition of each presentation
are hypotheses that every pair of definition satisfies. Assume that `g` is an almost nonzerodivisor
modulo `tᵐ`: if `g a ∈ tᵐ R°` then `t^{1/p^l} a ∈ tᵐ R°` for every `l`. Then the kernel of
`A/tᵐ → A⟨tⁿ/g⟩/tᵐ` is almost zero for `t^{1/p^∞}`: if `f_n(a) ∈ tᵐ A⟨tⁿ/g⟩` then
`t^{1/p^l} a ∈ tᵐ R°` for every `l`. -/
theorem bhatt_riemann_extension_ker_almostZero
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (t : ℕ → K) (ht0 : 0 < ‖t 0‖) (ht1 : ‖t 0‖ < 1) (htr : ∀ l, t (l + 1) ^ p = t l)
    (g : ℕ → R) (hgA : ∀ k, g k ∈ powerBoundedSubring R) (hgr : ∀ k, g (k + 1) ^ p = g k)
    (P : PairOfDefinition R)
    (hIplus : ∀ j : P.ringOfDefinition, j ∈ P.idealOfDefinition → (j : R) ∈ powerBoundedSubring R)
    (hden : ∀ n : ℕ, HasDenominatorPower P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)))
    (m : ℕ)
    (hgreg : ∀ a ∈ powerBoundedSubring R,
      (∃ b ∈ powerBoundedSubring R, g 0 * a = algebraMap K R (t 0) ^ m * b) →
      ∀ l : ℕ, ∃ b ∈ powerBoundedSubring R,
        algebraMap K R (t l) * a = algebraMap K R (t 0) ^ m * b)
    (n : ℕ) (a : R) (ha : a ∈ powerBoundedSubring R) :
    let _instLocUniform := locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    let _instLocAdd := isUniformAddGroup_locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    let _instLocRing := isTopologicalRing_locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    (∃ y ∈ completedPlusSubring P (powerBoundedSubring R) ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
        (Localization.Away (g 0)) (hden n),
      toCompletionLoc P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden n)
          a =
        toCompletionLoc P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden n)
          (algebraMap K R (t 0) ^ m) * y) →
    ∀ l : ℕ, ∃ b ∈ powerBoundedSubring R,
      algebraMap K R (t l) * a = algebraMap K R (t 0) ^ m * b :=
  sorry

open TauCeti.ValuationSpectrum TauCeti.Huber.PairOfDefinition in
open Classical in
/-- **Bhatt's quantitative Riemann extension theorem, cokernel clause** (Bhatt, *On the direct
summand conjecture and its derived variant*, Theorem 4.2(2) with its proof, pp. 6–7).

In the setting of `bhatt_riemann_extension_ker_almostZero` (without the regularity hypothesis on
`g`), the restriction `ρ_{n+c,n} : A⟨t^{n+c}/g⟩ → A⟨tⁿ/g⟩` is `pairHomOfRationalSubsetSubset` of
the inclusion `X⟨tⁿ/g⟩ ⊆ X⟨t^{n+c}/g⟩` of rational subsets, a hypothesis that holds because
`|t| ≤ 1` on `Spa(R, R°)`. For every `m`, `k` and `n ≥ 0` (Bhatt states this clause for
`n ≥ 0`), with `c = pᵏm`, the image of the `c`-fold
transition `coker f_{n+c} → coker f_n` is almost killed by `g^{1/p^k}`: for every
`x ∈ A⟨t^{n+c}/g⟩` and every `l`, `g^{1/p^k} t^{1/p^l} ρ_{n+c,n}(x)` is the image of an element of
`R°` plus `tᵐ` times an element of `A⟨tⁿ/g⟩`. -/
theorem bhatt_quantitative_riemann_extension
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (t : ℕ → K) (ht0 : 0 < ‖t 0‖) (ht1 : ‖t 0‖ < 1) (htr : ∀ l, t (l + 1) ^ p = t l)
    (g : ℕ → R) (hgA : ∀ k, g k ∈ powerBoundedSubring R) (hgr : ∀ k, g (k + 1) ^ p = g k)
    (P : PairOfDefinition R)
    (hIplus : ∀ j : P.ringOfDefinition, j ∈ P.idealOfDefinition → (j : R) ∈ powerBoundedSubring R)
    (hden : ∀ n : ℕ, HasDenominatorPower P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)))
    (hsub : ∀ n c : ℕ,
      rationalSubset (powerBoundedSubring R) ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) ⊆
        rationalSubset (powerBoundedSubring R) ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0))
    (m k n : ℕ) :
    let _instLocUniform := locUniformSpace P ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + p ^ k * m))
    let _instLocAdd := isUniformAddGroup_locUniformSpace P ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + p ^ k * m))
    let _instLocRing := isTopologicalRing_locUniformSpace P ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + p ^ k * m))
    let _instLocHuber := isHuberRing_completion_locTopology P ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R)
      (g 0) (Localization.Away (g 0)) (hden (n + p ^ k * m))
    let _instLocUniform := locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    let _instLocAdd := isUniformAddGroup_locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    let _instLocRing := isTopologicalRing_locUniformSpace P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    let _instLocHuber := isHuberRing_completion_locTopology P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden n)
    ∀ x ∈ completedPlusSubring P (powerBoundedSubring R)
        ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R) (g 0) (Localization.Away (g 0))
        (hden (n + p ^ k * m)),
    ∀ l : ℕ, ∃ a ∈ powerBoundedSubring R,
    ∃ y ∈ completedPlusSubring P (powerBoundedSubring R) ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
        (Localization.Away (g 0)) (hden n),
      toCompletionLoc P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden n)
          (g k * algebraMap K R (t l)) *
        (pairHomOfRationalSubsetSubset P (powerBoundedSubring R) hIplus
            (fun _ h ↦ mem_powerBoundedSubring.mp h)
            ({algebraMap K R (t 0) ^ (n + p ^ k * m), g 0} : Finset R) (g 0) (Localization.Away (g 0))
            (hden (n + p ^ k * m))
            ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden n)
            (hsub n (p ^ k * m))).toRingHom x =
      toCompletionLoc P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden n)
          a +
        toCompletionLoc P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0) (Localization.Away (g 0))
          (hden n) (algebraMap K R (t 0) ^ m) * y :=
  sorry

open TauCeti.ValuationSpectrum TauCeti.Huber.PairOfDefinition in
open Classical in
/-- **Bhatt's Riemann extension theorem without regularity, kernel clause** (Bhatt,
*On the direct summand conjecture and its derived variant*, Remark 4.4, p. 7; README §1.4).
With the perfectoid field, Tate algebra, compatible roots and rational presentations of §1.2,
but with no regularity assumption on `g`, for every `m`, `k`, `n` some offset `c` makes every
element of the kernel at `n + c` killed modulo `tᵐ` by `g^{1/p^k} t^{1/p^k}`. The offset
precedes the quantified kernel element. Together with the quantitative cokernel clause this
is the almost-pro-isomorphism for `(tg)^{1/p^∞}`. -/
theorem bhatt_kernel_without_regularity
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (t : ℕ → K) (ht0 : 0 < ‖t 0‖) (ht1 : ‖t 0‖ < 1) (htr : ∀ l, t (l + 1) ^ p = t l)
    (g : ℕ → R) (hgA : ∀ k, g k ∈ powerBoundedSubring R) (hgr : ∀ k, g (k + 1) ^ p = g k)
    (P : PairOfDefinition R)
    (hIplus : ∀ j : P.ringOfDefinition, j ∈ P.idealOfDefinition → (j : R) ∈ powerBoundedSubring R)
    (hden : ∀ n : ℕ, HasDenominatorPower P ({algebraMap K R (t 0) ^ n, g 0} : Finset R) (g 0)
      (Localization.Away (g 0)))
    (m k n : ℕ) :
    ∃ c : ℕ,
    let _instLocUniform := locUniformSpace P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    let _instLocAdd := isUniformAddGroup_locUniformSpace P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    let _instLocRing := isTopologicalRing_locUniformSpace P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
      (Localization.Away (g 0)) (hden (n + c))
    ∀ a ∈ powerBoundedSubring R,
    (∃ y ∈ completedPlusSubring P (powerBoundedSubring R) ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0)
        (Localization.Away (g 0)) (hden (n + c)),
      toCompletionLoc P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden (n + c))
          a =
        toCompletionLoc P ({algebraMap K R (t 0) ^ (n + c), g 0} : Finset R) (g 0) (Localization.Away (g 0)) (hden (n + c))
          (algebraMap K R (t 0) ^ m) * y) →
    ∃ b ∈ powerBoundedSubring R,
      (g k * algebraMap K R (t k)) * a = algebraMap K R (t 0) ^ m * b :=
  sorry

open CategoryTheory TopologicalSpace TauCeti.ValuationSpectrum in
/-- The canonical map `R → 𝒪_X(V)` from a complete Hausdorff Huber ring to the sections of the
presentation-limit structure presheaf of `X = Spa(R, R⁺)` over an open `V`, as a map of rings: Tau
Ceti's `toPresentationLimit` with the topology forgotten. -/
def coeffToSections {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [CompleteSpace R] [T0Space R] (P : PairOfDefinition R)
    (Rplus : Subring R) (V : Opens ↥(spa Rplus)) :
    R →+* (presentationLimitPresheafInCommRingCat P Rplus).obj (Opposite.op V) :=
  ((forget₂ _root_.TopCommRingCat CommRingCat).map
      (eqToHom (TauCeti.CompleteSeparatedTopCommRingCat.of_obj R).symm) ≫
    (TauCeti.TopCommRingCat.isCompleteSeparated.ι ⋙ forget₂ _root_.TopCommRingCat CommRingCat).map
      (toPresentationLimit (P := P) Rplus V) ≫
    eqToHom (presentationLimitPresheafInCommRingCat_obj P Rplus (Opposite.op V)).symm).hom

open TopologicalSpace TauCeti.ValuationSpectrum in
open Classical in
/-- The annulus `X⟨tⁿ/g⟩ = {x : |tⁿ(x)| ≤ |g(x)| ≠ 0}` of `X = Spa(R, R°)`, as an open set:
Tau Ceti's `spaBasicOpen` of the presentation `({tⁿ, g}, g)`. -/
def annularOpen {R : Type u} [CommRing R] [TopologicalSpace R] [NonarchimedeanRing R]
    (t g : R) (n : ℕ) : Opens ↥(spa (powerBoundedSubring R)) :=
  spaBasicOpen (powerBoundedSubring R) ({t ^ n, g} : Finset R) g

open CategoryTheory TauCeti.ValuationSpectrum in
/-- The annular tower `n ↦ A⟨tⁿ/g⟩ = 𝒪⁺_X(X⟨tⁿ/g⟩)` of `X = Spa(R, R°)` with its restriction maps:
Tau Ceti's plus presheaf `presentationLimitPlusPresheaf` along the increasing annuli. -/
def annularTower {R : Type u} [CommRing R] [TopologicalSpace R] [NonarchimedeanRing R]
    (P : PairOfDefinition R) (t g : R) (h : Monotone (annularOpen t g)) :
    ℕᵒᵖ ⥤ CommRingCat.{u} :=
  h.functor.op ⋙ presentationLimitPlusPresheaf (P := P)
    (fun _ ha ↦ mem_powerBoundedSubring.mp ha) P.le_powerBoundedSubring

open CategoryTheory CategoryTheory.Limits TauCeti.ValuationSpectrum in
/-- **Bhatt's Riemann extension theorem after limits** (Bhatt, *On the direct summand conjecture
and its derived variant*, Remark 1.7, p. 3; Scholze's Hebbarkeitssatz in the principal case).

With the perfectoid field, Tate algebra and compatible roots `t l` of `t` and `g k` of `g` of §1.2,
and no regularity assumption on `g`, the canonical map `R° → lim_n 𝒪⁺(X⟨tⁿ/g⟩)` is an almost
isomorphism for `(tg)^{1/p^∞}`. The tower is `annularTower`, its limit is taken in commutative rings,
and the structure map `R° → 𝒪⁺(X⟨tⁿ/g⟩)` followed by the inclusion `𝒪⁺ ⊆ 𝒪` is the restriction of
`coeffToSections` to `R°`. Kernel: if the image
of `a ∈ R°` vanishes on every annulus, then `t^{1/p^k} g^{1/p^k} a = 0` for every `k`. Cokernel: for
every compatible family `x` and every `k` some `a ∈ R°` has image `t^{1/p^k} g^{1/p^k} xₙ` on every
annulus. The monotonicity of the annuli is a hypothesis that always holds, since `|t| ≤ 1` on
`Spa(R, R°)`. -/
theorem bhatt_riemann_extension_limit
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (t : ℕ → K) (ht0 : 0 < ‖t 0‖) (ht1 : ‖t 0‖ < 1) (htr : ∀ l, t (l + 1) ^ p = t l)
    (g : ℕ → R) (hgA : ∀ k, g k ∈ powerBoundedSubring R) (hgr : ∀ k, g (k + 1) ^ p = g k)
    (P : PairOfDefinition R)
    (hmono : Monotone (annularOpen (algebraMap K R (t 0)) (g 0))) :
    (∀ a ∈ powerBoundedSubring R,
      (∀ n, coeffToSections P (powerBoundedSubring R)
        (annularOpen (algebraMap K R (t 0)) (g 0) n) a = 0) →
      ∀ k, (algebraMap K R (t k) * g k) * a = 0) ∧
    ∀ x : (limit (annularTower P (algebraMap K R (t 0)) (g 0) hmono) : CommRingCat.{u}),
    ∀ k : ℕ, ∃ a ∈ powerBoundedSubring R, ∀ n : ℕ,
      coeffToSections P (powerBoundedSubring R) (annularOpen (algebraMap K R (t 0)) (g 0) n)
          (algebraMap K R (t k) * g k) *
        (limit.π (annularTower P (algebraMap K R (t 0)) (g 0) hmono) (Opposite.op n) ≫
          (presentationLimitPlusPresheafι (P := P) (fun _ ha ↦ mem_powerBoundedSubring.mp ha)
            P.le_powerBoundedSubring).app
            (Opposite.op (annularOpen (algebraMap K R (t 0)) (g 0) n))).hom x =
      coeffToSections P (powerBoundedSubring R) (annularOpen (algebraMap K R (t 0)) (g 0) n) a :=
  sorry

/-! ## Layer 2: uniform Banach algebras: closures, localisations, uniform limits and colimits -/

/-- The **root saturation** `g^{-1/p^∞}R° = {b ∈ R[1/g] : g^{1/p^m} b ∈ R° for all m}` of the
power-bounded subring of a nonarchimedean ring `R` along a compatible system `g m` of `p`-power
roots of `g 0` in `R°` (`g (m + 1) ^ p = g m`), as an `R°`-subalgebra of `R[1/g]` (André, *Le lemme
d'Abhyankar perfectoïde*, §2.5.2 and (2.12)–(2.16), pp. 24–25). It is closed under products
because `g^{1/p^m} = g^{1/p^{m+1}} · (g^{1/p^{m+1}})^{p-2} · g^{1/p^{m+1}}` and `p ≥ 2`. -/
def rootSaturation {R : Type u} [CommRing R] [TopologicalSpace R] [NonarchimedeanRing R]
    (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m) :
    Subalgebra (powerBoundedSubring R) (Localization.Away ((g 0 : powerBoundedSubring R) : R)) where
  carrier := {b | ∀ m, ∃ a : powerBoundedSubring R,
    algebraMap R _ (a : R) = algebraMap R _ (g m : R) * b}
  mul_mem' := by
    intro x y hx hy m
    obtain ⟨a, ha⟩ := hx (m + 1)
    obtain ⟨b, hb⟩ := hy (m + 1)
    have hp : 2 ≤ p := (Fact.out : p.Prime).two_le
    obtain ⟨q, hq⟩ : ∃ q, p = q + 2 := ⟨p - 2, by omega⟩
    refine ⟨a * g (m + 1) ^ q * b, ?_⟩
    have h := congrArg (fun z : powerBoundedSubring R ↦ algebraMap R
      (Localization.Away ((g 0 : powerBoundedSubring R) : R)) (z : R)) (hg m)
    simp only [Subring.coe_pow, map_pow] at h
    simp only [Subring.coe_mul, Subring.coe_pow, map_mul, map_pow]
    rw [← h, ha, hb, hq]
    ring
  add_mem' := by
    intro x y hx hy m
    obtain ⟨a, ha⟩ := hx m
    obtain ⟨b, hb⟩ := hy m
    refine ⟨a + b, ?_⟩
    simp only [Subring.coe_add, map_add]
    rw [ha, hb]
    ring
  algebraMap_mem' := by
    intro r m
    refine ⟨g m * r, ?_⟩
    simp only [Subring.coe_mul, map_mul]
    rfl

/-! ## Layer 3: the perfectoid Riemann extension theorem -/

/-- **André's perfectoid Riemann extension theorem**, complete-integral-closure form (André,
*Le lemme d'Abhyankar perfectoïde*, Théorème 4.2.2 and Lemme 4.2.3, pp. 55–56).

Let `K` be a perfectoid field (given by the criterion: its norms accumulate at `1`, `‖p‖ < 1` and
Frobenius is surjective on `K°/p`), `R` a perfectoid Tate ring which is a topological
`K`-algebra, and `g ∈ R°` with a compatible system of `p`-power roots `g m` (`g 0 = g`,
`g (m + 1) ^ p = g m`). No regularity of `g` is assumed (André's Théorème 4.2.2 assumes `g` a
nonzerodivisor; the general case is derived from Lemme 4.2.3, README §3.6); `R°` acts on `R[1/g]`
through its image.
In `R[1/g]`, the root saturation
`rootSaturation p g hg = g^{-1/p^∞} R° = {b | g^{1/p^m} b ∈ R° for all m}` equals the complete
integral closure of the image of `R°`, the set of `b` whose powers all lie in one finitely
generated `R°`-submodule. -/
theorem riemann_extension_completeIntegralClosure
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m) :
    (rootSaturation p g hg : Set (Localization.Away ((g 0 : powerBoundedSubring R) : R))) =
      {b | ∃ M : Submodule (powerBoundedSubring R)
          (Localization.Away ((g 0 : powerBoundedSubring R) : R)), M.FG ∧ ∀ n : ℕ, b ^ n ∈ M} :=
  sorry

/-- **André's perfectoid Riemann extension theorem, complete integral closedness of the root
saturation** (André, *Le lemme d'Abhyankar perfectoïde*, Lemme 4.2.3, p. 56; README §3.6(3)).

Let `K` be a perfectoid field (given by the criterion of
`riemann_extension_completeIntegralClosure`), `R` a perfectoid Tate ring which is a topological
`K`-algebra, and `g m` a compatible system of `p`-power roots in `R°` of `g = g 0`
(`g (m + 1) ^ p = g m`), equivalently a `K⟨T^{1/p^∞}⟩`-algebra structure on `R` with `g` the image
of `T`. No regularity of `g` is assumed: `g` may be a zero divisor of `R`. Then the root saturation
`S = rootSaturation p g hg = g^{-1/p^∞}R°` is completely integrally closed in `R[1/g]`: every
`b ∈ R[1/g]` whose powers `bⁿ` all lie in one finitely generated `S`-submodule of `R[1/g]` belongs
to `S`. -/
theorem rootSaturation_completelyIntegrallyClosed
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m)
    (b : Localization.Away ((g 0 : powerBoundedSubring R) : R))
    (hb : ∃ M : Submodule (rootSaturation p g hg)
        (Localization.Away ((g 0 : powerBoundedSubring R) : R)), M.FG ∧ ∀ n : ℕ, b ^ n ∈ M) :
    b ∈ rootSaturation p g hg :=
  sorry

/-! ## Layer 4: the perfectoid Abhyankar lemma -/

/-- **André's perfectoid Abhyankar lemma, trace clause** (André, *Le lemme d'Abhyankar
perfectoïde*, Théorème 0.3.1(3), p. 2, and Proposition 5.3.1(3), p. 68).

Let `K` be a perfectoid field (given by the criterion of `riemann_extension_completeIntegralClosure`),
`R` a perfectoid Tate ring which is a topological `K`-algebra, and `g ∈ R°` a nonzerodivisor of `R`
with a compatible system of `p`-power roots `g m`. Let `B′` be a finite étale `R[1/g]`-algebra,
finite projective as a module, which is faithful (`R[1/g] → B′` is injective), and let
`B̃°` be the integral closure in `B′` of the root saturation `S = rootSaturation p g hg`. Then the
trace of `B′` over `R[1/g]` (the finite-projective trace of multiplication) maps `B̃°` into `S`,
and `S / tr(B̃°)` is almost zero in the setup `(K°[T^{1/p^∞}], T^{1/p^∞}K°°[T^{1/p^∞}])` acting
through `T^{1/p^l} ↦ g^{1/p^l}`: for every `a ∈ S`, every `c ∈ K` with `‖c‖ < 1` and every `l`,
`c g^{1/p^l} a` is the trace of an element of `B̃°`. -/
theorem abhyankar_trace_almost_surjective
    (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
    (hKF : Function.Surjective
      (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
    (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
    [Algebra K R] (hKR : Continuous (algebraMap K R))
    (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m)
    (hreg : ((g 0 : powerBoundedSubring R) : R) ∈ nonZeroDivisors R)
    (B' : Type u) [CommRing B'] [Algebra (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
    [Module.Finite (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
    [Module.Projective (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
    [Algebra.Etale (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
    (hfaith : Function.Injective
      (algebraMap (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B')) :
    (∀ b ∈ integralClosure (rootSaturation p g hg) B',
      LinearMap.projectiveTrace (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B'
        (LinearMap.mulLeft _ b) ∈ rootSaturation p g hg) ∧
    ∀ a ∈ rootSaturation p g hg, ∀ c : K, ‖c‖ < 1 → ∀ l : ℕ,
      ∃ b ∈ integralClosure (rootSaturation p g hg) B',
        LinearMap.projectiveTrace (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B'
          (LinearMap.mulLeft _ b) =
        algebraMap R _ (algebraMap K R c * (g l : R)) * a :=
  sorry

end Perfectoid

/-! ## Layer 5: purity and André's flatness theorem for Kummer towers -/

section Kummer

/-- The variables of the Kummer tower: the `p ^ j`-th roots of unity `ζ_j`, the roots
`T_i^{1/p^j}` of the coordinates and the roots `g^{1/p^l}`. -/
inductive KummerVar (n : ℕ) : Type
  /-- `ζ_j`, a primitive `p ^ j`-th root of unity. -/
  | zeta (j : ℕ) : KummerVar n
  /-- `T_i^{1/p^j}`. -/
  | coord (i : Fin n) (j : ℕ) : KummerVar n
  /-- `g^{1/p^l}`. -/
  | root (l : ℕ) : KummerVar n

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] (n : ℕ)

/-- The base `A = W(k)⟦T₁, …, Tₙ⟧`. -/
def KummerBase : Type u := MvPowerSeries (Fin n) (WittVector p k)

/-- The ring structure of `A = W(k)⟦T₁, …, Tₙ⟧`. -/
instance : CommRing (KummerBase p k n) :=
  inferInstanceAs (CommRing (MvPowerSeries (Fin n) (WittVector p k)))

/-- The coordinate `T_i` of `A`. -/
def kummerCoord (i : Fin n) : KummerBase p k n :=
  (MvPowerSeries.X i : MvPowerSeries (Fin n) (WittVector p k))

open MvPolynomial in
/-- The relations of the Kummer tower over `A`: `ζ_j ^ (p ^ j) = 1`, `ζ_(j+1) ^ p = ζ_j` and
`Φ_p(ζ_1) = 0`; `(T_i^{1/p^j}) ^ (p ^ j) = T_i` and `(T_i^{1/p^(j+1)}) ^ p = T_i^{1/p^j}`;
`(g^{1/p^l}) ^ (p ^ l) = g` and `(g^{1/p^(l+1)}) ^ p = g^{1/p^l}`. All branches of the roots are
retained: no root is chosen in a field. -/
def kummerRelations (g : KummerBase p k n) :
    Set (MvPolynomial (KummerVar n) (KummerBase p k n)) :=
  Set.range (fun j : ℕ ↦ X (KummerVar.zeta j) ^ (p ^ j) - 1) ∪
  Set.range (fun j : ℕ ↦ X (KummerVar.zeta (j + 1)) ^ p - X (KummerVar.zeta j)) ∪
  {∑ i ∈ Finset.range p, X (KummerVar.zeta 1) ^ i} ∪
  Set.range (fun ij : Fin n × ℕ ↦
    X (KummerVar.coord ij.1 ij.2) ^ (p ^ ij.2) - C (kummerCoord p k n ij.1)) ∪
  Set.range (fun ij : Fin n × ℕ ↦
    X (KummerVar.coord ij.1 (ij.2 + 1)) ^ p - X (KummerVar.coord ij.1 ij.2)) ∪
  Set.range (fun l : ℕ ↦ X (KummerVar.root l) ^ (p ^ l) - C g) ∪
  Set.range (fun l : ℕ ↦ X (KummerVar.root (l + 1)) ^ p - X (KummerVar.root l))

/-- The algebraic Kummer tower before inverting `p`: the quotient of the polynomial ring over `A`
in the Kummer variables by the Kummer relations. -/
abbrev KummerQuotient (g : KummerBase p k n) : Type u :=
  MvPolynomial (KummerVar n) (KummerBase p k n) ⧸ Ideal.span (kummerRelations p k n g)

/-- The `K₀`-algebra `A_∞∞ = ⋃_{j,l} A_jl`, with `A_jl = K_j°⟦T^{1/p^j}⟧[g^{1/p^l}][1/p]`
(André, *La conjecture du facteur direct*, §2.2, formula (8), p. 78). -/
abbrev KummerAlgebra (g : KummerBase p k n) : Type u :=
  Localization.Away (p : KummerQuotient p k n g)

/-- The image in `A_∞∞` of a Kummer variable. -/
def kummerVar (g : KummerBase p k n) (v : KummerVar n) : KummerAlgebra p k n g :=
  algebraMap (KummerQuotient p k n g) (KummerAlgebra p k n g)
    (Ideal.Quotient.mk _ (MvPolynomial.X v))

/-- The generators of the stage `A_jl` inside `A_∞∞`, for `j, l ∈ ℕ ∪ {∞}`: the `ζ_j'`, the
`T_i^{1/p^j'}` with `j' ≤ j`, the `g^{1/p^l'}` with `l' ≤ l`, and `1/p`. -/
def kummerGenerators (g : KummerBase p k n) (j l : ℕ∞) : Set (KummerAlgebra p k n g) :=
  {x | ∃ j' : ℕ, (j' : ℕ∞) ≤ j ∧ x = kummerVar p k n g (KummerVar.zeta j')} ∪
  {x | ∃ (i : Fin n) (j' : ℕ), (j' : ℕ∞) ≤ j ∧ x = kummerVar p k n g (KummerVar.coord i j')} ∪
  {x | ∃ l' : ℕ, (l' : ℕ∞) ≤ l ∧ x = kummerVar p k n g (KummerVar.root l')} ∪
  {IsLocalization.Away.invSelf (p : KummerQuotient p k n g)}

/-- The stage `A_jl ⊆ A_∞∞` of the Kummer tower, for `j, l ∈ ℕ ∪ {∞}`; infinite indices give
directed unions. -/
def kummerStage (g : KummerBase p k n) (j l : ℕ∞) :
    Subalgebra (KummerBase p k n) (KummerAlgebra p k n g) :=
  Algebra.adjoin (KummerBase p k n) (kummerGenerators p k n g j l)

/-- The normalized stage `A°_jl`: the integral closure of `A` in `A_jl` (André, *La conjecture du
facteur direct*, §2.3, p. 78). -/
def kummerIntegralStage (g : KummerBase p k n) (j l : ℕ∞) :
    Subalgebra (KummerBase p k n) (KummerAlgebra p k n g) :=
  integralClosure (KummerBase p k n) (KummerAlgebra p k n g) ⊓ kummerStage p k n g j l

/-- The normalized stages increase with both indices. -/
theorem kummerIntegralStage_mono (g : KummerBase p k n) {j j' l l' : ℕ∞} (hj : j ≤ j')
    (hl : l ≤ l') : kummerIntegralStage p k n g j l ≤ kummerIntegralStage p k n g j' l' := by
  refine inf_le_inf_left _ (Algebra.adjoin_mono ?_)
  rintro x (((⟨a, ha, rfl⟩ | ⟨i, a, ha, rfl⟩) | ⟨a, ha, rfl⟩) | hx)
  · exact Or.inl (Or.inl (Or.inl ⟨a, ha.trans hj, rfl⟩))
  · exact Or.inl (Or.inl (Or.inr ⟨i, a, ha.trans hj, rfl⟩))
  · exact Or.inl (Or.inr ⟨a, ha.trans hl, rfl⟩)
  · exact Or.inr hx

/-- A ring map `f : R → S` is *pure* (universally injective) if `P → P ⊗_R S` is injective for
every `R`-module `P` (André, *La conjecture du facteur direct*, Annexe A.2). -/
def IsPureHom {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) : Prop :=
  letI := f.toAlgebra
  ∀ (P : Type u) [AddCommGroup P] [Module R P],
    Function.Injective ((Algebra.linearMap R S).lTensor P)

/-- **Purity of the normalized Kummer extensions** (André, *La conjecture du facteur direct*,
Corollaire 2.6.1, p. 82). For `A = W(k)⟦T₁, …, Tₙ⟧`, `0 ≠ g ∈ A` and all `j, l ∈ ℕ ∪ {∞}`, the
inclusion `A°_j0 ⊆ A°_jl` of normalized Kummer stages is pure. -/
theorem kummer_isPureHom [CharP k p] [PerfectRing k p] (g : KummerBase p k n) (hg : g ≠ 0)
    (j l : ℕ∞) :
    IsPureHom (Subalgebra.inclusion
      (kummerIntegralStage_mono p k n g (le_refl j) (zero_le : (0 : ℕ∞) ≤ l))).toRingHom :=
  sorry

/-- A `V`-module `M` is *almost flat* for `m` if tensoring with `M` turns injective maps of
`V`-modules into maps with almost zero kernel: `M^a ⊗ −` is exact on almost modules (Gabber–Ramero,
*Almost ring theory*, Definition 2.4.4(i)). -/
def IsAlmostFlat {V : Type u} [CommRing V] (m : Ideal V) (M : Type u) [AddCommGroup M]
    [Module V M] : Prop :=
  ∀ ⦃N N' : Type u⦄ [AddCommGroup N] [Module V N] [AddCommGroup N'] [Module V N']
    (f : N →ₗ[V] N'), Function.Injective f → Module.IsTorsionBySet V (LinearMap.ker (f.lTensor M)) (m : Set V)

/-- A `V`-module `M` is *almost faithfully flat* for `m` if it is almost flat and `M ⊗_V N`
almost zero forces `N` almost zero: `M^a ⊗ −` is exact and faithful on almost modules (Gabber–Ramero,
*Almost ring theory*, Definition 2.4.4(i)). -/
def IsAlmostFaithfullyFlat {V : Type u} [CommRing V] (m : Ideal V) (M : Type u)
    [AddCommGroup M] [Module V M] : Prop :=
  IsAlmostFlat m M ∧ ∀ (N : Type u) [AddCommGroup N] [Module V N],
    Module.IsTorsionBySet V (M ⊗[V] N) (m : Set V) →
      Module.IsTorsionBySet V N (m : Set V)

/-- `ζ_j` is integral over `A`. -/
theorem isIntegral_kummerVar_zeta (g : KummerBase p k n) (j : ℕ) :
    IsIntegral (KummerBase p k n) (kummerVar p k n g (KummerVar.zeta j)) := by
  refine IsIntegral.map (IsScalarTower.toAlgHom (KummerBase p k n) (KummerQuotient p k n g)
    (KummerAlgebra p k n g)) ?_
  refine ⟨Polynomial.X ^ (p ^ j) - 1, Polynomial.monic_X_pow_sub_C 1
    (pow_ne_zero _ (Fact.out : p.Prime).ne_zero), ?_⟩
  rw [Polynomial.eval₂_sub, Polynomial.eval₂_X_pow, Polynomial.eval₂_one, ← map_pow, ← map_one
    (Ideal.Quotient.mk _), ← map_sub, Ideal.Quotient.eq_zero_iff_mem]
  exact Ideal.subset_span (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl ⟨j, rfl⟩))))))

/-- The element `ζ_j - 1` of the normalized coordinate tower `A°_∞0`. -/
def kummerZetaSubOne (g : KummerBase p k n) (j : ℕ) : kummerIntegralStage p k n g ⊤ 0 :=
  ⟨kummerVar p k n g (KummerVar.zeta j) - 1,
    ⟨(isIntegral_kummerVar_zeta p k n g j).sub isIntegral_one,
      Subalgebra.sub_mem _
        (Algebra.subset_adjoin (Or.inl (Or.inl (Or.inl ⟨j, le_top, rfl⟩))))
        (Subalgebra.one_mem _)⟩⟩

/-- The ideal `K°°_∞ · A°_∞0` of the normalized coordinate tower, generated by the `ζ_j - 1`; it
is the extension of the maximal ideal of `K°_∞`, since the valuations of the `ζ_j - 1` tend
to `0`. -/
def kummerAlmostIdeal (g : KummerBase p k n) : Ideal (kummerIntegralStage p k n g ⊤ 0) :=
  Ideal.span (Set.range (kummerZetaSubOne p k n g))

/-- **André's flatness theorem** (André, *La conjecture du facteur direct*, Théorème 2.5.2,
pp. 79–82). For `A = W(k)⟦T₁, …, Tₙ⟧` and `0 ≠ g ∈ A`, the `p`-adic completion `Â°_∞∞` of the
normalized Kummer tower is almost faithfully flat over the normalized coordinate tower
`A°_∞0`, for the ideal `K°°_∞ · A°_∞0`. -/
theorem kummer_almost_faithfullyFlat [CharP k p] [PerfectRing k p] (g : KummerBase p k n)
    (hg : g ≠ 0) :
    let _instStageModule : Module (kummerIntegralStage p k n g ⊤ 0) (kummerIntegralStage p k n g ⊤ ⊤) :=
      (Subalgebra.inclusion (kummerIntegralStage_mono p k n g (le_refl ⊤)
        (zero_le : (0 : ℕ∞) ≤ ⊤))).toRingHom.toModule
    let _instCompletionModule : Module (kummerIntegralStage p k n g ⊤ 0)
        (AdicCompletion (Ideal.span {(p : kummerIntegralStage p k n g ⊤ 0)})
          (kummerIntegralStage p k n g ⊤ ⊤)) :=
      AdicCompletion.instModuleOfIsScalarTower
        (I := Ideal.span {(p : kummerIntegralStage p k n g ⊤ 0)})
        (M := kummerIntegralStage p k n g ⊤ ⊤)
    IsAlmostFaithfullyFlat (kummerAlmostIdeal p k n g)
      (AdicCompletion (Ideal.span {(p : kummerIntegralStage p k n g ⊤ 0)})
        (kummerIntegralStage p k n g ⊤ ⊤)) :=
  sorry

/-- The root `g^{1/p^l}` as an element of the normalized tower `A°_∞∞`; it is integral over `A`
as a root of the monic `X^{p^l} − g`. -/
def kummerRoot (g : KummerBase p k n) (l : ℕ) : kummerIntegralStage p k n g ⊤ ⊤ :=
  ⟨kummerVar p k n g (KummerVar.root l),
    ⟨IsIntegral.map (IsScalarTower.toAlgHom (KummerBase p k n) (KummerQuotient p k n g)
        (KummerAlgebra p k n g))
      ⟨Polynomial.X ^ (p ^ l) - Polynomial.C g, Polynomial.monic_X_pow_sub_C g
        (pow_ne_zero _ (Fact.out : p.Prime).ne_zero), by
        rw [Polynomial.eval₂_sub, Polynomial.eval₂_X_pow, Polynomial.eval₂_C,
          IsScalarTower.algebraMap_apply (KummerBase p k n)
            (MvPolynomial (KummerVar n) (KummerBase p k n)) (KummerQuotient p k n g),
          Ideal.Quotient.algebraMap_eq, MvPolynomial.algebraMap_eq, ← map_pow, ← map_sub,
          Ideal.Quotient.eq_zero_iff_mem]
        exact Ideal.subset_span (Or.inl (Or.inr ⟨l, rfl⟩))⟩,
      Algebra.subset_adjoin (Or.inl (Or.inr ⟨l, le_top, rfl⟩))⟩⟩

/-- The ring `Â°_∞∞`: the `p`-adic completion of the normalized Kummer tower `A°_∞∞`. -/
abbrev KummerCompletion (g : KummerBase p k n) : Type u :=
  AdicCompletion (Ideal.span {(p : kummerIntegralStage p k n g ⊤ ⊤)})
    (kummerIntegralStage p k n g ⊤ ⊤)

/-- The algebra `Â_∞∞[1/g] = Â°_∞∞[1/(pg)]`, since `Â_∞∞ = Â°_∞∞[1/p]`. -/
abbrev KummerCompletionAway (g : KummerBase p k n) : Type u :=
  Localization.Away ((p : KummerCompletion p k n g) *
    algebraMap (KummerBase p k n) (KummerCompletion p k n g) g)

/-- The ideal of `Â°_∞∞` generated by the `(ζ_j − 1) g^{1/p^l}`: the extension of the ideal
`T^{1/p^∞}K°°_∞[T^{1/p^∞}]` of the ramified setup along `T^{1/p^l} ↦ g^{1/p^l}`, since
`K°°_∞ = ⋃_j (ζ_j − 1)K°_∞`. -/
def kummerRamifiedIdeal (g : KummerBase p k n) : Ideal (KummerCompletion p k n g) :=
  Ideal.span (Set.range fun jl : ℕ × ℕ ↦
    algebraMap (kummerIntegralStage p k n g ⊤ ⊤) (KummerCompletion p k n g)
      (Subalgebra.inclusion (kummerIntegralStage_mono p k n g (le_refl ⊤)
        (zero_le : (0 : ℕ∞) ≤ ⊤)) (kummerZetaSubOne p k n g jl.1) * kummerRoot p k n g jl.2))

/-- **Ramified almost faithful flatness modulo `pᵐ` for the Kummer tower** (André, *La conjecture
du facteur direct*, §3.2 and Théorème 3.2.1, p. 83; André, *Le lemme d'Abhyankar perfectoïde*,
Théorème 0.3.1). Let `A = W(k)⟦T₁, …, Tₙ⟧`, `A → B` finite and injective with `B` reduced and
`p`-torsion-free, and `g ∈ A ∖ pA` with `B[1/(pg)] = A[1/(pg)] ⊗_A B` étale over `A[1/(pg)]`. Let
`B°` be the integral closure of `Â°_∞∞` in the finite étale `Â_∞∞[1/g]`-algebra
`Â_∞∞[1/g] ⊗_A B`. Then for every `m`, `B°/pᵐ = (Â°_∞∞/pᵐ) ⊗_{Â°_∞∞} B°` is almost faithfully flat
over `Â°_∞∞/pᵐ` for the image of `kummerRamifiedIdeal`, that is, in the setup
`(K°_∞[T^{1/p^∞}], T^{1/p^∞}K°°_∞[T^{1/p^∞}])` acting through `T^{1/p^l} ↦ g^{1/p^l}`. -/
theorem kummer_ramified_almost_faithfullyFlat [CharP k p] [PerfectRing k p]
    (g : KummerBase p k n) (hg : g ∉ Ideal.span {(p : KummerBase p k n)})
    (B : Type u) [CommRing B] [Algebra (KummerBase p k n) B] [Module.Finite (KummerBase p k n) B]
    (hinj : Function.Injective (algebraMap (KummerBase p k n) B)) [IsReduced B]
    (hptf : IsSMulRegular B (p : B))
    (het : Algebra.Etale (Localization.Away ((p : KummerBase p k n) * g))
      (Localization.Away ((p : KummerBase p k n) * g) ⊗[KummerBase p k n] B))
    (m : ℕ) :
    IsAlmostFaithfullyFlat
      ((kummerRamifiedIdeal p k n g).map
        (Ideal.Quotient.mk (Ideal.span {(p : KummerCompletion p k n g) ^ m})))
      ((KummerCompletion p k n g ⧸ Ideal.span {(p : KummerCompletion p k n g) ^ m}) ⊗[
          KummerCompletion p k n g]
        integralClosure (KummerCompletion p k n g)
          (KummerCompletionAway p k n g ⊗[KummerBase p k n] B)) :=
  sorry

end Kummer

end TauCetiRoadmap.PerfectoidSpacesPartII
