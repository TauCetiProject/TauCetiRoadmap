/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Compact.Haar
import TauCeti.RepresentationTheory.Compact.PeterWeyl
import TauCeti.GroupTheory.Amenable.Basic

/-!
# Almost periodicity, Bohr sets and the Bogolyubov–Ruzsa lemma: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline theorems, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib and Tau Ceti, with `sorry`, and every
definition has its real body.

The headline theorems are:

* Layer 2: the Croot–Sisask lemma in a group with a bi-invariant measure;
* Layer 3: the Balog–Szemerédi–Gowers theorem for measures;
* Layer 4: the measure of Bohr sets of unitary representations, and Bogolyubov's lemma on
  compact groups;
* Layer 5: Sanders' quasi-polynomial Bogolyubov–Ruzsa lemma on compact abelian groups;
* Layer 7: Ruzsa modelling and the quasi-polynomial Freiman–Ruzsa theorem in torsion-free abelian
  groups and in vector spaces over `𝔽_p`;
* Layer 9: Grothendieck's double-limit criterion, in `C(K)` and for groups, and Eberlein's
  theorem;
* Layer 10: Ellis's theorem and the unique invariant mean on weakly almost periodic functions;
* Layer 11: the qualitative Bogolyubov theorem and the Følner–Bogolyubov theorem.

Two results of the Summary are not stated here: the factorisation of almost periodic functions
through the Bohr compactification (Layer 8.3), which needs the carrier `BohrCompactification`, a
README target; and the de Leeuw–Glicksberg decomposition (Layer 10.5).

Conventions: general groups are multiplicative; abelian layers are additive. Convolution is
`mconvolution f g μ x = ∫ y, f y * g (y⁻¹ * x) ∂μ`. Bohr sets use the operator-norm (chord)
convention `‖π x - 1‖ ≤ ρ`. Constants are absolute: theorems with constants quantify over groups
after the constant.
-/

open MeasureTheory Filter Topology Pointwise
open scoped ENNReal NNReal InnerProductSpace BoundedContinuousFunction ComplexOrder

universe u

namespace TauCetiRoadmap.AlmostPeriodicityAndBohrSets

/-! ### Layer 0: convolution and energy -/

section Layer0

variable {G : Type*} [Group G] [MeasurableSpace G]

/-- Convolution of complex functions on a group against a measure:
`(f ⋆ g) x = ∫ y, f y * g (y⁻¹ * x) ∂μ`. The Bochner counterpart of Mathlib's
`MeasureTheory.mlconvolution`. -/
noncomputable def mconvolution (f g : G → ℂ) (μ : Measure G) (x : G) : ℂ :=
  ∫ y, f y * g (y⁻¹ * x) ∂μ

/-- The multiplicative energy of two sets with respect to a measure: the squared `L²` norm of
the convolution of their indicators. For the counting measure it is `Finset.mulEnergy`. -/
noncomputable def mulEnergy (μ : Measure G) (A B : Set G) : ℝ :=
  ∫ x, ‖mconvolution (A.indicator 1) (B.indicator 1) μ x‖ ^ 2 ∂μ

/-- Sanity check of the convolution convention (the first Check of Layer 0.1), not a headline:
for the counting measure, the convolution of indicators of finite sets counts representations,
as in Mathlib's `Finset.convolution`. -/
theorem mconvolution_indicator_count [MeasurableSingletonClass G] [Countable G] [DecidableEq G]
    (A B : Finset G) (x : G) :
    mconvolution ((A : Set G).indicator 1) ((B : Set G).indicator 1) Measure.count x =
      (A.convolution B x : ℂ) := by
  sorry

end Layer0

/-! ### Layers 2–3: almost periodicity and Balog–Szemerédi–Gowers in measured groups -/

section Measured

variable {G : Type*} [Group G] [MeasurableSpace G] [MeasurableMul₂ G] [MeasurableInv G]
  (μ : Measure G) [SigmaFinite μ] [μ.IsMulLeftInvariant] [μ.IsMulRightInvariant]
  [μ.IsInvInvariant]

/-- **The Croot–Sisask lemma.** If `μ (S * A) ≤ K μ A`, then a subset `T ⊆ S` of measure at least
`μ S / (2 K^k)`, `k = ⌈256 m / ε²⌉`, consists of left `ε`-almost periods of `μ_A ⋆ f` in
`L^{2m}`: every `x ∈ T⁻¹ * T` translates it by at most `ε ‖f‖_{2m}`. -/
theorem croot_sisask {A S : Set G} (hA : MeasurableSet A) (hS : MeasurableSet S)
    (hA₀ : μ A ≠ 0) (hA₁ : μ A ≠ ∞) (hS₀ : μ S ≠ 0) (hS₁ : μ S ≠ ∞) {K : ℝ} (hK : 1 ≤ K)
    (hSA : μ (S * A) ≤ ENNReal.ofReal K * μ A) {m : ℕ} (hm : 1 ≤ m) {f : G → ℂ}
    (hf : MemLp f (2 * m) μ) {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε ≤ 1) :
    ∃ T ⊆ S, MeasurableSet T ∧
      μ.real S / (2 * K ^ ⌈256 * (m : ℝ) / ε ^ 2⌉₊) ≤ μ.real T ∧
      ∀ x ∈ T⁻¹ * T,
        eLpNorm (fun y ↦ mconvolution ((μ.real A)⁻¹ • A.indicator 1) f μ (x⁻¹ * y) -
            mconvolution ((μ.real A)⁻¹ • A.indicator 1) f μ y) (2 * m) μ ≤
          ENNReal.ofReal ε * eLpNorm f (2 * m) μ := by
  sorry

/-- **Ruzsa's triangle inequality for measures.** Product sets are measured by the outer
measure. -/
theorem ruzsa_triangle {X Y Z : Set G} (hX : MeasurableSet X) (hY : MeasurableSet Y)
    (hZ : MeasurableSet Z) :
    μ (X * Z⁻¹) * μ Y ≤ μ (X * Y⁻¹) * μ (Y * Z⁻¹) := by
  sorry

end Measured

/-- **The Balog–Szemerédi–Gowers theorem for measures.** The constant `C` is absolute: it is
chosen before the group. -/
theorem balog_szemeredi_gowers :
    ∃ C > (0 : ℝ), ∀ (G : Type u) [Group G] [MeasurableSpace G] [MeasurableMul₂ G]
      [MeasurableInv G] (μ : Measure G) [SigmaFinite μ] [μ.IsMulLeftInvariant]
      [μ.IsMulRightInvariant] [μ.IsInvInvariant] (A B : Set G), MeasurableSet A →
      MeasurableSet B → μ A ≠ 0 → μ A ≠ ∞ → μ B ≠ 0 → μ B ≠ ∞ → ∀ K : ℝ, 1 ≤ K →
      μ.real A ^ (3 / 2 : ℝ) * μ.real B ^ (3 / 2 : ℝ) ≤ K * mulEnergy μ A B →
      ∃ A' ⊆ A, ∃ B' ⊆ B, MeasurableSet A' ∧ MeasurableSet B' ∧
        μ.real A ≤ C * K ^ C * μ.real A' ∧ μ.real B ≤ C * K ^ C * μ.real B' ∧
        μ (A' * B') ≤
          ENNReal.ofReal (C * K ^ C * μ.real A ^ (1 / 2 : ℝ) * μ.real B ^ (1 / 2 : ℝ)) := by
  sorry

/-! ### Layer 4: Bohr sets of unitary representations and Bogolyubov's lemma -/

section Bohr

variable {G : Type*} [Group G] [TopologicalSpace G]

/-- The Bohr set of a family of irreducible unitary models with widths `ρ`, in the
operator-norm (chord) convention. Defined for every topological group. -/
def unitaryBohrSet {ι : Type*} (π : ι → TauCeti.IrrepModel ℂ G) (ρ : ι → ℝ) : Set G :=
  {x | ∀ i, ‖(π i).rep x - 1‖ ≤ ρ i}

end Bohr

section Compact

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [T2Space G] [MeasurableSpace G] [BorelSpace G]

/-- The operator-valued Fourier coefficient of `f` at an irreducible model,
`∫ y, f y • m.rep y⁻¹ ∂ haarProb G`. -/
noncomputable def fourierCoeff (m : TauCeti.IrrepModel ℂ G) (f : G → ℂ) :
    EuclideanSpace ℂ (Fin m.dim) →L[ℂ] EuclideanSpace ℂ (Fin m.dim) :=
  ∫ y, f y • m.rep y⁻¹ ∂TauCeti.haarProb G

/-- **The measure of a Bohr set** (Layer 4.3). -/
theorem inv_prod_le_measureReal_unitaryBohrSet {ι : Type*} [Fintype ι]
    (π : ι → TauCeti.IrrepModel ℂ G) (ρ : ι → ℝ) (hρ : ∀ i, 0 < ρ i) :
    (∏ i, (1 + 2 / ρ i) ^ (2 * (π i).dim ^ 2))⁻¹ ≤
      (TauCeti.haarProb G).real (unitaryBohrSet π ρ) := by
  sorry

/-- **Bogolyubov's lemma on compact groups** (Layer 4.4). The irreducible classes at which the
Fourier coefficient of `1_A` has norm at least `α^{3/2}/2` are finitely many, of total
dimension at most `4/α²`, and their Bohr set of radius `1/2` lies in `A A⁻¹ A A⁻¹`. -/
theorem bogolyubov {A : Set G} (hA : MeasurableSet A) (hα : 0 < (TauCeti.haarProb G).real A) :
    ∃ hfin : {i : TauCeti.IrrepClass ℂ G |
        (TauCeti.haarProb G).real A ^ (3 / 2 : ℝ) / 2 ≤
          ‖fourierCoeff i.model (A.indicator 1)‖}.Finite,
      (∑ i ∈ hfin.toFinset, (i.model.dim : ℝ)) ≤ 4 / (TauCeti.haarProb G).real A ^ 2 ∧
      unitaryBohrSet (fun i : hfin.toFinset ↦ i.1.model) (fun _ ↦ 1 / 2) ⊆
        A * A⁻¹ * A * A⁻¹ ∧
      ((5 : ℝ) ^ (2 * ∑ i ∈ hfin.toFinset, i.model.dim ^ 2))⁻¹ ≤
        (TauCeti.haarProb G).real
          (unitaryBohrSet (fun i : hfin.toFinset ↦ i.1.model) (fun _ ↦ 1 / 2)) := by
  sorry

end Compact

/-! ### Layer 5: abelian Bohr sets and the quasi-polynomial Bogolyubov–Ruzsa lemma -/

/-- An abelian Bohr set: each continuous character `ψ` of `G` carries a width in `[0, ∞]`, finite
at finitely many characters (the frequencies). The shape follows LeanAPAP's `BohrSet`. -/
structure BohrSet (G : Type*) [AddCommGroup G] [TopologicalSpace G] where
  /-- The width at each character; `⊤` means no constraint. -/
  ewidth : AddChar G Circle → ℝ≥0∞
  /-- Only finitely many characters constrain the set. -/
  finite_frequencies : {ψ | ewidth ψ ≠ ⊤}.Finite
  /-- Every frequency is continuous. -/
  continuous_of_ne_top : ∀ ψ, ewidth ψ ≠ ⊤ → Continuous ψ

namespace BohrSet

variable {G : Type*} [AddCommGroup G] [TopologicalSpace G]

/-- The chord set of a Bohr set: the points at which every frequency is within its width of
`1`. -/
def chordSet (B : BohrSet G) : Set G :=
  {x | ∀ ψ, (‖((ψ x : Circle) : ℂ) - 1‖₊ : ℝ≥0∞) ≤ B.ewidth ψ}

/-- The rank of a Bohr set: its number of frequencies. -/
noncomputable def rank (B : BohrSet G) : ℕ :=
  B.finite_frequencies.toFinset.card

end BohrSet

/-- **Quasi-polynomial Bogolyubov–Ruzsa** (a weak form of Sanders' lemma) on second-countable
compact abelian groups, with `μ` the Haar probability measure. With `L = log (e/α)`, `2A − 2A`
contains a Bohr set of rank at most `C L⁴` whose widths are at least `e^{−CL}`, of measure at
least `e^{−CL⁵}`. -/
theorem bogolyubov_ruzsa :
    ∃ C ≥ (1 : ℝ), ∀ (G : Type u) [AddCommGroup G] [TopologicalSpace G]
      [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G] [SecondCountableTopology G]
      [MeasurableSpace G] [BorelSpace G] (μ : Measure G) [μ.IsAddHaarMeasure]
      [IsProbabilityMeasure μ] (A : Set G),
      MeasurableSet A → ∀ α : ℝ, 0 < α → α ≤ μ.real A →
      ∃ B : BohrSet G,
        (B.rank : ℝ) ≤ C * Real.log (Real.exp 1 / α) ^ 4 ∧
        (∀ ψ, B.ewidth ψ ≠ ⊤ →
          ENNReal.ofReal (Real.exp (-(C * Real.log (Real.exp 1 / α)))) ≤ B.ewidth ψ) ∧
        B.chordSet ⊆ 2 • A - 2 • A ∧
        Real.exp (-(C * Real.log (Real.exp 1 / α) ^ 5)) ≤ μ.real B.chordSet := by
  sorry

/-! ### Layer 7: coset progressions and the Freiman–Ruzsa theorem -/

/-- A symmetric coset progression `H + {Σ nᵢ xᵢ : |nᵢ| ≤ Nᵢ}` with `H` a finite subgroup. -/
structure CosetProgression (G : Type*) [AddCommGroup G] where
  /-- The subgroup part. -/
  H : AddSubgroup G
  /-- The subgroup part is finite. -/
  finite_H : (H : Set G).Finite
  /-- The rank. -/
  rank : ℕ
  /-- The generators. -/
  gen : Fin rank → G
  /-- The lengths. -/
  len : Fin rank → ℕ

namespace CosetProgression

variable {G : Type*} [AddCommGroup G]

/-- The underlying set of a coset progression. -/
def carrier (P : CosetProgression G) : Set G :=
  (P.H : Set G) +
    {y | ∃ n : Fin P.rank → ℤ, (∀ i, |n i| ≤ P.len i) ∧ y = ∑ i, n i • P.gen i}

/-- A coset progression is proper when distinct coefficient vectors in the box give distinct
cosets of `H`. -/
def IsProper (P : CosetProgression G) : Prop :=
  Set.InjOn (fun n : Fin P.rank → ℤ ↦ ((∑ i, n i • P.gen i : G) : G ⧸ P.H))
    {n | ∀ i, |n i| ≤ P.len i}

end CosetProgression

/-- **Ruzsa modelling in torsion-free groups** (Layer 7.3; Ruzsa 2009, Theorem 3.5): for
`q ≥ #(k • A - k • A)`, a subset `A' ⊆ A` with `#A ≤ k #A'` is Freiman `k`-isomorphic to a subset
of `ZMod q`. -/
theorem exists_isAddFreimanIso_zmod {G : Type*} [AddCommGroup G] [IsAddTorsionFree G]
    [DecidableEq G] (A : Finset G) (hA : A.Nonempty) {k : ℕ} (hk : 2 ≤ k) (q : ℕ)
    (hq : (k • A - k • A).card ≤ q) :
    ∃ A' ⊆ A, ∃ φ : G → ZMod q, A.card ≤ k * A'.card ∧
      IsAddFreimanIso k (A' : Set G) (φ '' A') φ := by
  sorry

/-- **Ruzsa modelling in vector spaces over `𝔽_p`** (Layer 7.3): a finite set is Freiman
`s`-isomorphic, through a linear map, to a subset of a finite `𝔽_p`-vector space of size at most
`p * #(s • A - s • A)`. -/
theorem exists_linearMap_isAddFreimanIso {p : ℕ} [Fact p.Prime] {G : Type*} [AddCommGroup G]
    [Module (ZMod p) G] [DecidableEq G] (A : Finset G) (hA : A.Nonempty) (s : ℕ) :
    ∃ (G' : Type u) (_ : AddCommGroup G') (_ : Module (ZMod p) G') (_ : Fintype G')
      (φ : G →ₗ[ZMod p] G'), Fintype.card G' ≤ p * (s • A - s • A).card ∧
      IsAddFreimanIso s (A : Set G) (φ '' A) φ := by
  sorry

/-- **The quasi-polynomial Freiman–Ruzsa theorem in torsion-free abelian groups** (Layer 7.5): a
finite set with `#(A + A) ≤ K #A` is covered by `e^{C L⁵}` translates of a coset progression of
rank `≤ C L⁴` and size `≤ e^{C L⁵} #A`, where `L = log (2K)`. -/
theorem freiman_ruzsa :
    ∃ C > (0 : ℝ), ∀ (G : Type u) [AddCommGroup G] [IsAddTorsionFree G] [DecidableEq G]
      (A : Finset G) (K : ℝ), A.Nonempty → 1 ≤ K → ((A + A).card : ℝ) ≤ K * A.card →
      ∃ (Q : CosetProgression G) (X : Finset G), X ⊆ A ∧
        (Q.rank : ℝ) ≤ C * Real.log (2 * K) ^ 4 ∧
        (Q.carrier.ncard : ℝ) ≤ Real.exp (C * Real.log (2 * K) ^ 5) * A.card ∧
        (X.card : ℝ) ≤ Real.exp (C * Real.log (2 * K) ^ 5) ∧
        (A : Set G) ⊆ (X : Set G) + Q.carrier := by
  sorry

/-- **The quasi-polynomial Freiman–Ruzsa theorem in vector spaces over `𝔽_p`** (Layer 7.5), with
`L = log (2pK)`; the constant `C` is absolute. -/
theorem freiman_ruzsa_zmod :
    ∃ C > (0 : ℝ), ∀ (p : ℕ) [Fact p.Prime] (G : Type u) [AddCommGroup G] [Module (ZMod p) G]
      [DecidableEq G] (A : Finset G) (K : ℝ), A.Nonempty → 1 ≤ K →
      ((A + A).card : ℝ) ≤ K * A.card →
      ∃ (Q : CosetProgression G) (X : Finset G), X ⊆ A ∧
        (Q.rank : ℝ) ≤ C * Real.log (2 * p * K) ^ 4 ∧
        (Q.carrier.ncard : ℝ) ≤ Real.exp (C * Real.log (2 * p * K) ^ 5) * A.card ∧
        (X.card : ℝ) ≤ Real.exp (C * Real.log (2 * p * K) ^ 5) ∧
        (A : Set G) ⊆ (X : Set G) + Q.carrier := by
  sorry

/-! ### Layers 8–9: almost periodic and weakly almost periodic functions -/

section WAP

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The left translate `y ↦ f (x⁻¹ * y)` of a bounded continuous function. -/
noncomputable def leftTranslate (x : G) (f : G →ᵇ ℂ) : G →ᵇ ℂ :=
  f.compContinuous ⟨fun y ↦ x⁻¹ * y, by fun_prop⟩

/-- A bounded continuous function is almost periodic when its left translates form a totally
bounded set. -/
def IsAlmostPeriodic (f : G →ᵇ ℂ) : Prop :=
  TotallyBounded (Set.range fun x : G ↦ leftTranslate x f)

/-- A bounded continuous function is weakly almost periodic when its left translates form a
relatively compact set in the weak topology. -/
def IsWeaklyAlmostPeriodic (f : G →ᵇ ℂ) : Prop :=
  IsCompact (closure (toWeakSpace ℂ (G →ᵇ ℂ) '' Set.range fun x : G ↦ leftTranslate x f))

/-- **Grothendieck's double-limit criterion for groups** (Layer 9.3). -/
theorem isWeaklyAlmostPeriodic_iff (f : G →ᵇ ℂ) :
    IsWeaklyAlmostPeriodic f ↔
      ∀ (x y : ℕ → G) (u v : ℕ → ℂ) (a b : ℂ),
        (∀ m, Tendsto (fun n ↦ f (x m * y n)) atTop (𝓝 (u m))) → Tendsto u atTop (𝓝 a) →
        (∀ n, Tendsto (fun m ↦ f (x m * y n)) atTop (𝓝 (v n))) → Tendsto v atTop (𝓝 b) →
        a = b := by
  sorry

/-- **Eberlein's theorem.** Coefficients of strongly continuous unitary representations are
weakly almost periodic. -/
theorem exists_isWeaklyAlmostPeriodic_coeff {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (π : G →* (H →L[ℂ] H))
    (hπ : ∀ g, π g ∈ unitary (H →L[ℂ] H)) (hcont : ∀ ξ, Continuous fun g ↦ π g ξ) (ξ η : H) :
    ∃ F : G →ᵇ ℂ, (∀ x, F x = ⟪π x ξ, η⟫_ℂ) ∧ IsWeaklyAlmostPeriodic F := by
  sorry

/-- A left-invariant mean on weakly almost periodic functions: a linear functional, unital,
nonnegative for `ℂ`'s order on nonnegative weakly almost periodic functions (which forces it to
be real on real functions and bounded) and invariant under left translation of weakly almost
periodic functions. -/
def IsWAPMean (m : (G →ᵇ ℂ) →ₗ[ℂ] ℂ) : Prop :=
  m 1 = 1 ∧
    (∀ f, IsWeaklyAlmostPeriodic f → (∀ x, 0 ≤ f x) → 0 ≤ m f) ∧
    ∀ x f, IsWeaklyAlmostPeriodic f → m (leftTranslate x f) = m f

/-- **Existence of the invariant mean** on weakly almost periodic functions (Layer 10.2). -/
theorem exists_isWAPMean : ∃ m : (G →ᵇ ℂ) →ₗ[ℂ] ℂ, IsWAPMean m := by
  sorry

/-- **Uniqueness of the invariant mean** on weakly almost periodic functions (Layer 10.2). -/
theorem IsWAPMean.eq {m m' : (G →ᵇ ℂ) →ₗ[ℂ] ℂ} (hm : IsWAPMean m) (hm' : IsWAPMean m')
    {f : G →ᵇ ℂ} (hf : IsWeaklyAlmostPeriodic f) : m f = m' f := by
  sorry

/-- **The qualitative Bogolyubov theorem** (Layer 11.2): if `f ≥ 0` is weakly almost periodic
with positive mean and `S = {f > 0}`, then `S S⁻¹` contains a Bohr neighbourhood of `1`. -/
theorem exists_unitaryBohrSet_subset_mul_inv {m : (G →ᵇ ℂ) →ₗ[ℂ] ℂ} (hm : IsWAPMean m)
    {f : G →ᵇ ℂ} (hf : IsWeaklyAlmostPeriodic f) (hnonneg : ∀ x, 0 ≤ f x) (hmean : 0 < m f) :
    ∃ (ι : Type) (_ : Fintype ι) (π : ι → TauCeti.IrrepModel ℂ G) (ρ : ι → ℝ),
      (∀ i, 0 < ρ i) ∧
        unitaryBohrSet π ρ ⊆ {x | 0 < (f x).re} * {x | 0 < (f x).re}⁻¹ := by
  sorry

/-- **The Følner–Bogolyubov theorem** (Layer 11.3): in a discrete group, if `A` has positive
measure for some left-invariant mean, `A A⁻¹ A A⁻¹` contains a Bohr neighbourhood of `1`. -/
theorem exists_unitaryBohrSet_subset_of_mean [DiscreteTopology G] (m : TauCeti.Mean G)
    (hm : m.IsLeftInvariant) (A : Set G) (f : TauCeti.UCB G)
    (hf : ∀ x, (f : G →ᵇ ℝ) x = A.indicator 1 x) (hpos : 0 < m f) :
    ∃ (ι : Type) (_ : Fintype ι) (π : ι → TauCeti.IrrepModel ℂ G) (ρ : ι → ℝ),
      (∀ i, 0 < ρ i) ∧ unitaryBohrSet π ρ ⊆ A * A⁻¹ * A * A⁻¹ := by
  sorry

end WAP

/-- **Grothendieck's criterion in `C(K)`** (Layer 9.2): a bounded set of continuous functions is
relatively weakly compact iff iterated limits along sequences of functions and of points of a
dense set agree. -/
theorem isCompact_closure_toWeakSpace_iff_doubleLimit {K : Type*} [TopologicalSpace K]
    [CompactSpace K] [T2Space K] {D : Set K} (hD : Dense D) {S : Set C(K, ℂ)}
    (hS : Bornology.IsBounded S) :
    IsCompact (closure (toWeakSpace ℂ C(K, ℂ) '' S)) ↔
      ∀ (f : ℕ → C(K, ℂ)) (x : ℕ → K), (∀ n, f n ∈ S) → (∀ m, x m ∈ D) →
        ∀ (u v : ℕ → ℂ) (a b : ℂ),
          (∀ n, Tendsto (fun m ↦ f n (x m)) atTop (𝓝 (u n))) → Tendsto u atTop (𝓝 a) →
          (∀ m, Tendsto (fun n ↦ f n (x m)) atTop (𝓝 (v m))) → Tendsto v atTop (𝓝 b) →
          a = b := by
  sorry

/-- **Ellis's theorem** (Layer 10.4): a compact Hausdorff group with separately continuous
multiplication is a topological group. -/
theorem ellis {G : Type*} [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
    [CompactSpace G] [T2Space G] : ContinuousMul G ∧ ContinuousInv G := by
  sorry

end TauCetiRoadmap.AlmostPeriodicityAndBohrSets
