import Mathlib
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Bounded
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.Uniform
import TauCeti.RingTheory.Huber.StableUniform
import TauCeti.RingTheory.Huber.Padic.Field
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Adic
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Affinoid
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafyRing
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion

/-!
# Perfectoid rings and spaces: representative target signatures

The README is the definitive specification. These are suggested forms for a subset of its
targets, not an exhaustive checklist: the key predicates and structures over Tau Ceti's Huber
rings and pre-adic spaces, and the end theorems of each layer that can be stated against them.
Constructions that are themselves formalisation targets (the almost category, the tilt, untilts,
completed tensor products, the étale and pro-étale sites, tilde-limits) are specified in the
README only.
-/

noncomputable section

namespace TauCetiRoadmap.PerfectoidSpaces

open TauCeti TauCeti.Huber TauCeti.ValuationSpectrum CategoryTheory Topology Filter TensorProduct

universe u v

/-! ## Layer P0: almost mathematics over a basic setup -/

namespace Almost

/-- A *basic setup* `(V, m)`: an ideal `m` of `V` with `m * m = m` such that `m̃ = m ⊗_V m` is
flat (GR (2.1.1), p. 7, and the standing assumption of (2.5.14), p. 32). Data, not a class: one
ring carries several setups. -/
structure BasicSetup (V : Type u) [CommRing V] where
  /-- The ideal `m`. -/
  ideal : Ideal V
  /-- `m * m = m`, in the semiring `Ideal V`. -/
  isIdempotentElem : IsIdempotentElem ideal
  /-- `m̃ = m ⊗_V m` is a flat `V`-module. -/
  flat_tilde : Module.Flat V (ideal ⊗[V] ideal)

namespace BasicSetup

variable {V : Type u} [CommRing V] (S : BasicSetup V)

/-- The `V`-module `m̃ := m ⊗_V m` (GR (2.1.1)). -/
abbrev tilde : Type u := S.ideal ⊗[V] S.ideal

/-- The multiplication `m̃ → V`, `x ⊗ y ↦ xy` (GR (2.1.1)). -/
def tildeMul : S.tilde →ₗ[V] V :=
  TensorProduct.lift ((LinearMap.mul V V).compl₁₂ S.ideal.subtype S.ideal.subtype)

/-- A `V`-module `M` is *almost zero* if `m · M = 0` (GR (2.1.3)). -/
def IsAlmostZero (M : Type*) [AddCommGroup M] [Module V M] : Prop :=
  ∀ ε ∈ S.ideal, ∀ x : M, ε • x = 0

/-- The almost zero `V`-modules, as an object property of `ModuleCat V` (GR (2.2.2)). -/
def almostZero : ObjectProperty (ModuleCat.{u} V) := fun M ↦ S.IsAlmostZero M

/-- A linear map is an *almost isomorphism* if its kernel and cokernel are almost zero
(GR (2.1.3)). -/
def IsAlmostIso {M N : Type u} [AddCommGroup M] [Module V M] [AddCommGroup N] [Module V N]
    (f : M →ₗ[V] N) : Prop :=
  S.IsAlmostZero (LinearMap.ker f) ∧ S.IsAlmostZero (N ⧸ LinearMap.range f)

/-- Condition (A): the principal subideals of `m` form a directed family (GR (2.1.6)). -/
def IsFilteredPrincipal : Prop :=
  ∀ x ∈ S.ideal, ∀ y ∈ S.ideal, ∃ z ∈ S.ideal, z ∣ x ∧ z ∣ y

/-- Condition (B): the `k`-th powers of elements of `m` generate `m` for every `k ≥ 1`
(GR (2.1.6)). -/
def PowersGenerate : Prop :=
  ∀ k : ℕ, 0 < k → Ideal.span ((fun x : V ↦ x ^ k) '' (S.ideal : Set V)) = S.ideal

/-- An idempotent ideal which is a directed union of principal ideals has flat `m ⊗ m`
(GR Proposition 2.1.7(i), pp. 8–9). -/
theorem flat_tilde_of_isFilteredPrincipal (I : Ideal V) (hI : IsIdempotentElem I)
    (hdir : ∀ x ∈ I, ∀ y ∈ I, ∃ z ∈ I, z ∣ x ∧ z ∣ y) : Module.Flat V (I ⊗[V] I) := sorry

/-- Condition (A) implies condition (B) for an idempotent ideal (GR (2.1.6), p. 8). -/
theorem IsFilteredPrincipal.powersGenerate (h : S.IsFilteredPrincipal) : S.PowersGenerate :=
  sorry

/-- Flatness of `m̃` already implies condition (B) (GR Proposition 2.1.7(ii), p. 9). -/
theorem powersGenerate : S.PowersGenerate := sorry

/-- `m ⊗ m` is flat for `m = V` (GR Example 2.1.2(ii), p. 7). -/
theorem flat_tilde_top : Module.Flat V ((⊤ : Ideal V) ⊗[V] (⊤ : Ideal V)) := sorry

/-- The classical setup `(V, V)` (GR Example 2.1.2(ii), p. 7). -/
def classical (V : Type u) [CommRing V] : BasicSetup V where
  ideal := ⊤
  isIdempotentElem := by simp [IsIdempotentElem]
  flat_tilde := flat_tilde_top

/-- The zero setup `(V, 0)`: `m = 0` is idempotent and `m̃ = 0 ⊗ 0 = 0` is flat. Every module is
almost zero, and `(V^a)_! ≅ m̃ = 0`, so `M ↦ M_!` is not unital into `ModuleCat V` when `V ≠ 0`
(GR (2.2.20)–(2.2.24), p. 15). -/
def zero (V : Type u) [CommRing V] : BasicSetup V where
  ideal := ⊥
  isIdempotentElem := by simp [IsIdempotentElem]
  flat_tilde := inferInstance

/-- For the classical setup, almost zero means zero (GR Example 2.1.2(ii)). -/
theorem isAlmostZero_classical_iff (M : Type*) [AddCommGroup M] [Module V M] :
    (classical V).IsAlmostZero M ↔ Subsingleton M := sorry

/-- `mW` is idempotent for the image of an idempotent ideal (GR Remark 2.1.4(ii), p. 8). -/
theorem isIdempotentElem_map (W : Type*) [CommRing W] [Algebra V W] :
    IsIdempotentElem (S.ideal.map (algebraMap V W)) := sorry

/-- `(mW) ⊗_W (mW) ≅ W ⊗_V m̃` is flat (GR Remark 2.1.4(ii), p. 8). -/
theorem flat_tilde_map (W : Type*) [CommRing W] [Algebra V W] :
    Module.Flat W (S.ideal.map (algebraMap V W) ⊗[W] S.ideal.map (algebraMap V W)) := sorry

/-- The base change `(W, mW)` of a setup along `V → W` (GR Remark 2.1.4(ii), p. 8). -/
def baseChange (W : Type*) [CommRing W] [Algebra V W] : BasicSetup W where
  ideal := S.ideal.map (algebraMap V W)
  isIdempotentElem := S.isIdempotentElem_map W
  flat_tilde := S.flat_tilde_map W

/-- Inverting an element of `m` makes the setup classical (GR Remark 2.1.4(ii)). -/
theorem baseChange_away_eq_classical (ϖ : V) (hϖ : ϖ ∈ S.ideal) :
    S.baseChange (Localization.Away ϖ) = classical (Localization.Away ϖ) := sorry

/-- Tensoring with `m̃` detects almost zero modules (GR Remark 2.1.4(i), p. 8). -/
theorem isAlmostZero_iff_tensor_eq_zero (M : Type u) [AddCommGroup M] [Module V M] :
    S.IsAlmostZero M ↔ Subsingleton (S.tilde ⊗[V] M) := sorry

/-- Almost zero modules form a Serre class of `ModuleCat V` (Sch12 Lemma 4.2, p. 18;
GR (2.2.2), p. 11). The almost category is Mathlib's Serre quotient by this class. -/
instance almostZero_isSerreClass : S.almostZero.IsSerreClass := sorry

/-- The almost isomorphisms are the morphisms inverted by the Serre quotient (GR (2.2.2)). -/
theorem isAlmostIso_iff_isoModSerre {M N : ModuleCat.{u} V} (f : M ⟶ N) :
    S.IsAlmostIso f.hom ↔ S.almostZero.isoModSerre f := sorry

/-- `M^a` is *almost finitely generated*: for every finitely generated `m₀ ⊆ m` there is
`φ : Vⁿ → N` with cokernel killed by `m₀` (GR Proposition 2.3.10(i), p. 18). -/
def AlmostFG (N : Type*) [AddCommGroup N] [Module V N] : Prop :=
  ∀ m₀ : Ideal V, m₀ ≤ S.ideal → m₀.FG → ∃ (n : ℕ) (φ : (Fin n → V) →ₗ[V] N),
    ∀ ε ∈ m₀, ∀ x : N, ε • x ∈ LinearMap.range φ

/-- `M^a` is *almost finitely presented*: for every finitely generated `m₀ ⊆ m` there is a complex
`V^r → Vⁿ → N` whose cokernel is killed by `m₀` and whose homology at `Vⁿ` is killed by `m₀`
(GR Proposition 2.3.10(ii)(c), p. 18). The integers and maps may depend on `m₀`. -/
def AlmostFP (N : Type*) [AddCommGroup N] [Module V N] : Prop :=
  ∀ m₀ : Ideal V, m₀ ≤ S.ideal → m₀.FG → ∃ (r n : ℕ) (ψ : (Fin r → V) →ₗ[V] (Fin n → V))
    (φ : (Fin n → V) →ₗ[V] N), φ ∘ₗ ψ = 0 ∧ (∀ ε ∈ m₀, ∀ x : N, ε • x ∈ LinearMap.range φ) ∧
      ∀ ε ∈ m₀, ∀ y ∈ LinearMap.ker φ, ε • y ∈ LinearMap.range ψ

/-- Almost finitely presented modules are almost finitely generated (GR Definition 2.3.8). -/
theorem AlmostFP.almostFG {N : Type*} [AddCommGroup N] [Module V N] (h : S.AlmostFP N) :
    S.AlmostFG N := fun m₀ hm hfg ↦
  let ⟨_, n, _, φ, _, hφ, _⟩ := h m₀ hm hfg
  ⟨n, φ, hφ⟩

/-- `M^a` is *almost finite projective*, in the `ε`-factorisation form: for every `ε ∈ m`,
`ε • id_M` factors through a finite free module (GR Lemma 2.4.15, p. 25). -/
def IsAlmostFiniteProjective (M : Type*) [AddCommGroup M] [Module V M] : Prop :=
  ∀ ε ∈ S.ideal, ∃ (n : ℕ) (u : M →ₗ[V] (Fin n → V)) (v : (Fin n → V) →ₗ[V] M),
    v ∘ₗ u = ε • LinearMap.id

/-- An almost finite projective module is almost finitely generated (GR Lemma 2.4.15). -/
theorem IsAlmostFiniteProjective.almostFG {M : Type*} [AddCommGroup M] [Module V M]
    (h : S.IsAlmostFiniteProjective M) : S.AlmostFG M := sorry

/-! ### The root setup -/

section roots

/-- The ideal generated by compatible `p`-power roots is idempotent (Bhatt Example 4.1.3). -/
theorem isIdempotentElem_span_roots (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V)
    (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) : IsIdempotentElem (Ideal.span (Set.range ϖ)) := sorry

/-- The ideal generated by compatible `p`-power roots has flat `m ⊗ m` (Bhatt Example 4.1.3,
via condition (A)). -/
theorem flat_tilde_span_roots (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V)
    (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) :
    Module.Flat V (Ideal.span (Set.range ϖ) ⊗[V] Ideal.span (Set.range ϖ)) := sorry

/-- The *root setup* of `ϖ` with `ϖ (n + 1) ^ p = ϖ n`, `p ≥ 2`: the ideal `m = ⋃ ϖ_n V`
(Bhatt Example 4.1.3, p. 18; ECD Definition 3.21, p. 19). -/
def ofCompatibleRoots (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V) (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) :
    BasicSetup V where
  ideal := Ideal.span (Set.range ϖ)
  isIdempotentElem := isIdempotentElem_span_roots p hp ϖ hϖ
  flat_tilde := flat_tilde_span_roots p hp ϖ hϖ

variable (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V) (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n)

/-- `x ∈ m` iff some `ϖ_n` divides `x` (Bhatt Example 4.1.3). -/
theorem mem_ofCompatibleRoots_ideal (x : V) :
    x ∈ (ofCompatibleRoots p hp ϖ hϖ).ideal ↔ ∃ n, ϖ n ∣ x := sorry

/-- Almost zero for the root setup is annihilation by every root (ECD Definition 3.21). -/
theorem ofCompatibleRoots_isAlmostZero_iff (M : Type*) [AddCommGroup M] [Module V M] :
    (ofCompatibleRoots p hp ϖ hϖ).IsAlmostZero M ↔ ∀ n (x : M), ϖ n • x = 0 := sorry

end roots

/-! ### The setup of a valuation ring -/

/-- For a valuation domain that is not a field, the maximal ideal is idempotent iff it is not
finitely generated (GR Example 2.1.2(i), p. 7). -/
theorem isIdempotentElem_maximalIdeal_iff (O : Type u) [CommRing O] [IsDomain O]
    [ValuationRing O] (h : IsLocalRing.maximalIdeal O ≠ ⊥) :
    IsIdempotentElem (IsLocalRing.maximalIdeal O) ↔ ¬ (IsLocalRing.maximalIdeal O).FG := sorry

/-- The maximal ideal of a valuation domain is torsion-free, so `m ⊗ m ≅ m` is flat
(Sch12 Lemma 4.2, p. 18). -/
theorem flat_tilde_maximalIdeal (O : Type u) [CommRing O] [IsDomain O] [ValuationRing O] :
    Module.Flat O (IsLocalRing.maximalIdeal O ⊗[O] IsLocalRing.maximalIdeal O) := sorry

/-- The idempotence of a non-finitely-generated maximal ideal, in every case including fields. -/
theorem isIdempotentElem_maximalIdeal_of_not_fg (O : Type u) [CommRing O] [IsDomain O]
    [ValuationRing O] (h : ¬ (IsLocalRing.maximalIdeal O).FG) :
    IsIdempotentElem (IsLocalRing.maximalIdeal O) := sorry

/-- The setup `(O, 𝔪)` of a valuation domain whose maximal ideal is not finitely generated
(GR Example 2.1.2(i), p. 7; Sch12 Lemma 4.2; ECD Example 3.22(i)). -/
def ofValuationRing (O : Type u) [CommRing O] [IsDomain O] [ValuationRing O]
    (h : ¬ (IsLocalRing.maximalIdeal O).FG) : BasicSetup O where
  ideal := IsLocalRing.maximalIdeal O
  isIdempotentElem := isIdempotentElem_maximalIdeal_of_not_fg O h
  flat_tilde := flat_tilde_maximalIdeal O

/-- The valuation setup is the root setup of compatible roots of `ϖ_0 ∈ 𝔪 \ 0` when every
element of `𝔪` is divisible by some `ϖ_n` (ECD Example 3.22(i)). -/
theorem ofValuationRing_eq_ofCompatibleRoots (O : Type u) [CommRing O] [IsDomain O]
    [ValuationRing O] (h : ¬ (IsLocalRing.maximalIdeal O).FG) (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → O)
    (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) (h0 : ϖ 0 ≠ 0) (hm : ϖ 0 ∈ IsLocalRing.maximalIdeal O)
    (hrank : ∀ x ∈ IsLocalRing.maximalIdeal O, ∃ n, ϖ n ∣ x) :
    ofValuationRing O h = ofCompatibleRoots p hp ϖ hϖ := sorry

/-- The value group of `ℂ_p` has no least positive element (GR Example 2.1.2(i)). -/
theorem padicComplex_maximalIdeal_not_fg (p : ℕ) [Fact p.Prime] :
    ¬ (IsLocalRing.maximalIdeal (PadicComplexInt p)).FG := sorry

-- Check: the zero ideal is a basic setup, and every module is almost zero for it.
example : (zero V).ideal = ⊥ := rfl
example (M : Type*) [AddCommGroup M] [Module V M] : (zero V).IsAlmostZero M := by
  intro ε hε x
  rw [Ideal.mem_bot.mp hε, zero_smul]

-- Check: for the zero setup `m̃ = 0`, so `(V^a)_! ≅ m̃` vanishes.
example : Subsingleton (zero V).tilde :=
  inferInstanceAs (Subsingleton ((⊥ : Ideal V) ⊗[V] (⊥ : Ideal V)))

-- Negative control: for `V ≠ 0` and the zero setup, the unit comparison `m̃ → V` of `M ↦ M_!`
-- is not surjective, so `M ↦ M_!` is not strong monoidal into `ModuleCat V`.
example [Nontrivial V] : ¬ Function.Surjective (zero V).tildeMul := by
  intro h
  obtain ⟨x, hx⟩ := h 1
  have hx0 : x = 0 :=
    @Subsingleton.elim _ (inferInstanceAs (Subsingleton ((⊥ : Ideal V) ⊗[V] (⊥ : Ideal V)))) x 0
  rw [hx0, map_zero] at hx
  exact zero_ne_one hx

-- Check: classically, almost finite presentation is finite presentation.
example (M : Type u) [AddCommGroup M] [Module V M] :
    (classical V).AlmostFP M ↔ Module.FinitePresentation V M := sorry

-- Negative control: the maximal ideal of `ℤ_p` is not idempotent.
example (p : ℕ) [Fact p.Prime] : ¬ IsIdempotentElem (IsLocalRing.maximalIdeal ℤ_[p]) := sorry

-- Negative control: `(t) ⊆ 𝔽_p[t]` satisfies (A) but its squares generate `(t²) ≠ (t)`.
example (p : ℕ) [Fact p.Prime] :
    Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ 2} ≠
      Ideal.span {(Polynomial.X : Polynomial (ZMod p))} := sorry

-- Check: over `(ℤ, ℤ)`, `m̃ → V` sends `2 ⊗ 3 + 5 ⊗ 7` to `41`.
example : (classical ℤ).tildeMul
    ((⟨2, by simp [classical]⟩ : (classical ℤ).ideal) ⊗ₜ[ℤ] ⟨3, by simp [classical]⟩ +
     (⟨5, by simp [classical]⟩ : (classical ℤ).ideal) ⊗ₜ[ℤ] ⟨7, by simp [classical]⟩) = 41 := by
  norm_num [tildeMul, classical, TensorProduct.lift.tmul]

-- Check: classically, an almost isomorphism is a bijection; `2 : ℤ → ℤ` is not one.
example {M N : Type u} [AddCommGroup M] [Module V M] [AddCommGroup N] [Module V N]
    (f : M →ₗ[V] N) : (classical V).IsAlmostIso f ↔ Function.Bijective f := sorry
example : ¬ (classical ℤ).IsAlmostIso (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := sorry

-- Check: `m ↪ V` is an almost isomorphism.
example : S.IsAlmostIso S.ideal.subtype := sorry

-- Check: the all-one chain gives the classical setup; the all-zero chain gives `m = 0`.
example (p : ℕ) (hp : 2 ≤ p) :
    ofCompatibleRoots p hp (fun _ ↦ (1 : V)) (fun _ ↦ one_pow p) = classical V := sorry
example (p : ℕ) (hp : 2 ≤ p) :
    (ofCompatibleRoots p hp (fun _ ↦ (0 : V)) (fun _ ↦ zero_pow (by omega : p ≠ 0))).ideal =
      ⊥ := sorry

-- Check: `ϖ_0 = 0` with `ϖ_1 ≠ 0` gives a nonzero root ideal.
example (p : ℕ) (hp : 2 ≤ p) (ϖ : ℕ → V) (hϖ : ∀ n, ϖ (n + 1) ^ p = ϖ n) (h0 : ϖ 0 = 0)
    (h1 : ϖ 1 ≠ 0) : (ofCompatibleRoots p hp ϖ hϖ).ideal ≠ ⊥ := sorry

-- Check: over `𝒪_{ℂ_p}`, the residue field is almost zero and `V/p` is not.
example (p : ℕ) [Fact p.Prime] :
    let V := PadicComplexInt p
    let S := ofValuationRing V (padicComplex_maximalIdeal_not_fg p)
    S.IsAlmostZero (IsLocalRing.ResidueField V) ∧
      ¬ S.IsAlmostZero (V ⧸ Ideal.span {(p : V)}) := sorry

-- Negative control: a field has idempotent, finitely generated maximal ideal `0`.
example (K : Type u) [Field K] :
    IsIdempotentElem (IsLocalRing.maximalIdeal K) ∧ (IsLocalRing.maximalIdeal K).FG := sorry

-- Check: classically, almost finite projective is finite projective.
example (M : Type u) [AddCommGroup M] [Module V M] :
    (classical V).IsAlmostFiniteProjective M ↔ Module.Projective V M ∧ Module.Finite V M :=
  sorry

end BasicSetup

end Almost
/-! ## Layer P1: perfectoid Tate rings, tilts and untilts -/

namespace Perfectoid

section Definition

variable (p : ℕ) [Fact p.Prime]

/-- A complete Hausdorff Tate ring `R` is a *perfectoid Tate ring* (ECD Definition 3.1, p. 14) if
(a) `R°` is bounded and (b) some pseudouniformiser `ϖ ∈ R°` has `ϖ ^ p ∣ p` in `R°` and Frobenius
`Φ : R°/ϖ → R°/ϖ^p`, `[x] ↦ [x ^ p]`, is bijective; (b) is written elementwise: every `x ∈ R°` is
a `p`-th power modulo `ϖ ^ p`, and `ϖ ^ p ∣ y ^ p` forces `ϖ ∣ y`. No base field is fixed. -/
class IsPerfectoidTateRing (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
    [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R] : Prop where
  /-- (a) `R` is uniform: the power-bounded subring `R°` is bounded. -/
  isBounded_powerBoundedSubring : IsBounded (powerBoundedSubring R : Set R)
  /-- (b) a pseudouniformiser `ϖ ∈ R°` with `ϖ ^ p ∣ p` in `R°` and `Φ` bijective. -/
  exists_pseudoUniformizer : ∃ ϖ : powerBoundedSubring R, IsPseudoUniformizer (ϖ : R) ∧
    ϖ ^ p ∣ (p : powerBoundedSubring R) ∧
    (∀ x : powerBoundedSubring R, ∃ y, ϖ ^ p ∣ x - y ^ p) ∧
    ∀ y : powerBoundedSubring R, ϖ ^ p ∣ y ^ p → ϖ ∣ y

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- Surjectivity of `Φ : R°/ϖ → R°/ϖ^p` suffices; injectivity is automatic (ECD Remark 3.2). -/
theorem IsPerfectoidTateRing.of_surjective (hb : IsBounded (powerBoundedSubring R : Set R))
    (ϖ : powerBoundedSubring R) (hϖ : IsPseudoUniformizer (ϖ : R))
    (h : ϖ ^ p ∣ (p : powerBoundedSubring R))
    (hs : ∀ x : powerBoundedSubring R, ∃ y, ϖ ^ p ∣ x - y ^ p) : IsPerfectoidTateRing p R :=
  sorry

/-- For uniform `R`: perfectoid iff some pseudouniformiser `ϖ ∈ R°` has `ϖ ^ p ∣ p` in `R°` and
Frobenius on `R°/p` is surjective (ECD Remark 3.2; BMS Lemma 3.9). Uniformity is a hypothesis:
`ℂ_p[ε]/(ε²)` satisfies the right-hand side and is not perfectoid. -/
theorem IsPerfectoidTateRing.iff_frobenius_surjective_modP
    (hb : IsBounded (powerBoundedSubring R : Set R)) :
    IsPerfectoidTateRing p R ↔
      ∃ ϖ : powerBoundedSubring R, IsPseudoUniformizer (ϖ : R) ∧
        ϖ ^ p ∣ (p : powerBoundedSubring R) ∧
        Function.Surjective fun x : ModP (powerBoundedSubring R) p ↦ x ^ p := sorry

/-- In characteristic `p`, perfectoid is perfect (ECD Proposition 3.5, p. 15). -/
theorem IsPerfectoidTateRing.iff_perfectRing [CharP R p] :
    IsPerfectoidTateRing p R ↔ PerfectRing R p := sorry

omit [Fact p.Prime] in
/-- A perfectoid Tate ring is uniform. -/
theorem IsPerfectoidTateRing.isUniform [IsPerfectoidTateRing p R] : IsUniform R :=
  ⟨IsPerfectoidTateRing.isBounded_powerBoundedSubring (p := p)⟩

omit [Fact p.Prime] in
/-- A perfectoid Tate ring is reduced: the perfectoid case of `TauCeti.Huber.IsUniform.isReduced`
(Sch12 proof of Proposition 5.8). -/
theorem IsPerfectoidTateRing.isReduced [IsPerfectoidTateRing p R] : IsReduced R := by
  have := IsPerfectoidTateRing.isUniform p (R := R)
  exact TauCeti.Huber.IsUniform.isReduced

end Definition

/-- A product of Tate rings is a Tate ring, with pair of definition the product and
pseudouniformiser `(ϖ_A, ϖ_B)`. -/
instance IsTateRing.instProd {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsTateRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsTateRing B] : IsTateRing (A × B) := sorry

/-- A nontrivially normed ultrametric field is a Tate ring, with ring of definition the closed
unit ball and pseudouniformiser any `0 < ‖ϖ‖ < 1`. -/
instance isTateRing_of_nontriviallyNormedField (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] : IsTateRing K := sorry

/-- A product of perfectoid Tate rings is perfectoid (ECD Example 3.4). -/
instance IsPerfectoidTateRing.prod (p : ℕ) [Fact p.Prime] {R S : Type*} [CommRing R]
    [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R]
    [T2Space R] [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
    [IsTateRing S] [CompleteSpace S] [T2Space S] [IsPerfectoidTateRing p R]
    [IsPerfectoidTateRing p S] : IsPerfectoidTateRing p (R × S) := sorry

/-! ### Compatible `p`-power roots -/

section Roots

variable (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] [TopologicalSpace R]
  [IsTopologicalRing R] [IsTateRing R]

/-- A *pseudouniformiser with compatible `p`-power roots*: `ϖ♭ = (ϖ^{1/pⁿ})ₙ ∈ lim_{x ↦ x^p} R`
(Mathlib `Perfection R p`) whose zeroth coordinate `ϖ` is a pseudouniformiser in `R°` with
`ϖ ^ p ∣ p` in `R°` (ECD Lemma 3.10, p. 16; Sch12 Remark 3.5). -/
structure PseudoUniformizerRoots where
  /-- The compatible system `(ϖ^{1/pⁿ})ₙ`. -/
  roots : Perfection R p
  /-- `ϖ = ϖ^{1/p⁰}` is power-bounded. -/
  mem_powerBoundedSubring : Perfection.coeffMonoidHom R p 0 roots ∈ powerBoundedSubring R
  /-- `ϖ` is a pseudouniformiser. -/
  isPseudoUniformizer : IsPseudoUniformizer (Perfection.coeffMonoidHom R p 0 roots)
  /-- `ϖ ^ p ∣ p` in `R°`. -/
  pow_dvd_p : (⟨_, mem_powerBoundedSubring⟩ : powerBoundedSubring R) ^ p ∣
    (p : powerBoundedSubring R)

variable {p R} in
/-- `root n = ϖ^{1/pⁿ}`, the `n`-th coordinate. -/
def PseudoUniformizerRoots.root (ϖ : PseudoUniformizerRoots p R) (n : ℕ) : R :=
  Perfection.coeffMonoidHom R p n ϖ.roots

end Roots

/-- Every perfectoid Tate ring has a pseudouniformiser with compatible `p`-power roots
(ECD Lemma 3.10, p. 16; BMS Lemma 3.9). -/
theorem PseudoUniformizerRoots.nonempty (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R]
    [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R]
    [T2Space R] [IsPerfectoidTateRing p R] : Nonempty (PseudoUniformizerRoots p R) := sorry

/-! ### The almost setup of a perfectoid Tate ring -/

section AlmostSetup

variable (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- `R°° = ⋃ ϖ^{1/pⁿ} R°` is idempotent (ECD Definition 3.21, p. 19). -/
theorem isIdempotentElem_topologicallyNilpotentIdeal [IsPerfectoidTateRing p R] :
    IsIdempotentElem (topologicallyNilpotentIdeal R) := sorry

/-- `R°° ⊗ R°° ≅ R°°` is flat over `R°`, a filtered union of free modules (Bhatt Lemma 3.1.3). -/
theorem flat_tilde_topologicallyNilpotentIdeal [IsPerfectoidTateRing p R] :
    Module.Flat (powerBoundedSubring R)
      (topologicallyNilpotentIdeal R ⊗[powerBoundedSubring R] topologicallyNilpotentIdeal R) :=
  sorry

/-- The basic setup `(R°, R°°)` of a perfectoid Tate ring (ECD Definitions 3.21–3.23, p. 19). -/
def almostSetup [IsPerfectoidTateRing p R] : Almost.BasicSetup (powerBoundedSubring R) where
  ideal := topologicallyNilpotentIdeal R
  isIdempotentElem := isIdempotentElem_topologicallyNilpotentIdeal p R
  flat_tilde := flat_tilde_topologicallyNilpotentIdeal p R

/-- A module is almost zero for `(R°, R°°)` iff every pseudouniformiser kills it (ECD Definition
3.21). -/
theorem almostSetup_isAlmostZero_iff [IsPerfectoidTateRing p R] (M : Type*) [AddCommGroup M]
    [Module (powerBoundedSubring R) M] :
    (almostSetup p R).IsAlmostZero M ↔
      ∀ ϖ : powerBoundedSubring R, IsPseudoUniformizer (ϖ : R) → ∀ x : M, ϖ • x = 0 := sorry

end AlmostSetup

/-! ### Perfectoid fields -/

section Field

variable (p : ℕ) [Fact p.Prime] (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
  [CompleteSpace K]

/-- A *perfectoid field* (ECD Definition 3.6, p. 15): a complete nontrivially normed
nonarchimedean field which is a perfectoid Tate ring. -/
class IsPerfectoidField : Prop extends IsPerfectoidTateRing p K

variable {K}

/-- ECD Proposition 3.8: `K` is perfectoid iff its norms accumulate at `1` (not discretely
valued), `‖p‖ < 1`, and Frobenius is surjective on `K°/p`. -/
theorem IsPerfectoidField.iff :
    IsPerfectoidField p K ↔ (∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) ∧ ‖(p : K)‖ < 1 ∧
      Function.Surjective fun x : ModP (powerBoundedSubring K) p ↦ x ^ p := sorry

/-- The value group of a perfectoid field is `p`-divisible (Sch12 Lemma 3.2, p. 15). -/
theorem IsPerfectoidField.valueGroup_pDivisible [IsPerfectoidField p K] (x : K) (hx : x ≠ 0) :
    ∃ y : K, ‖y‖ ^ p = ‖x‖ := sorry

/-- `ℂ_p` is a perfectoid field (Bhatt Example 3.1.2(2)). -/
instance isPerfectoidField_padicComplex : IsPerfectoidField p ℂ_[p] := sorry

end Field

/-- Kedlaya's theorem: a perfectoid Tate ring which is a field has its topology defined by a
nontrivial nonarchimedean absolute value (KBF Theorem 4.2, p. 13; AWS Theorem 2.9.1). -/
theorem exists_absoluteValue_of_isField (p : ℕ) [Fact p.Prime] {R : Type*} [CommRing R]
    [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R]
    [T2Space R] [IsPerfectoidTateRing p R] (hR : IsField R) :
    ∃ v : AbsoluteValue R ℝ, IsNonarchimedean (v : R → ℝ) ∧ (∃ x, 0 < v x ∧ v x < 1) ∧
      (𝓝 (0 : R)).HasBasis (fun ε : ℝ ↦ 0 < ε) (fun ε ↦ {x | v x < ε}) := sorry

/-! ### The completed cyclotomic field -/

section Cyclotomic

variable (p : ℕ) [Fact p.Prime]

/-- `ℚ_p^cycl`, the closure in `ℂ_p` of the subfield generated by the `p`-power roots of
unity. -/
def padicCyclotomic : Subfield ℂ_[p] :=
  (Subfield.closure {ζ : ℂ_[p] | ∃ n : ℕ, ζ ^ p ^ n = 1}).topologicalClosure

instance padicCyclotomic.instCompleteSpace : CompleteSpace (padicCyclotomic p) :=
  (Subfield.isClosed_topologicalClosure _).completeSpace_coe

/-- The norm of `ℚ_p^cycl` is nontrivial (`‖p‖ = p⁻¹`). -/
theorem padicCyclotomic.exists_one_lt_norm : ∃ x : padicCyclotomic p, 1 < ‖x‖ := sorry

instance padicCyclotomic.instNontriviallyNormedField :
    NontriviallyNormedField (padicCyclotomic p) :=
  { (inferInstance : NormedField (padicCyclotomic p)) with
    non_trivial := padicCyclotomic.exists_one_lt_norm p }

/-- `ℚ_p^cycl` is a perfectoid field (ECD Example 3.4(i); KL15 Example 3.3.8). -/
theorem isPerfectoidField_padicCyclotomic : IsPerfectoidField p (padicCyclotomic p) := sorry

end Cyclotomic

/-! ### Distinguished elements and Fontaine's `θ` -/

section Witt

variable (p : ℕ) [Fact p.Prime]

/-- A Witt vector is *distinguished* if its first Witt coordinate is a unit (BMS Remark 3.11,
p. 23). -/
def IsDistinguished {S : Type*} [CommRing S] (ξ : WittVector p S) : Prop :=
  IsUnit (ξ.coeff 1)

/-- A Witt vector is *primitive of degree one* if its zeroth Witt coordinate is topologically
nilpotent and its first is a unit (AWS Definition 2.3.4; KL16 Definition 3.2.3; ECD Definition
3.15). -/
structure IsPrimitive {S : Type*} [CommRing S] [TopologicalSpace S] (ξ : WittVector p S) :
    Prop where
  /-- `ξ₀` is topologically nilpotent. -/
  isTopologicallyNilpotent_coeff_zero : IsTopologicallyNilpotent (ξ.coeff 0)
  /-- `ξ₁` is a unit. -/
  isUnit_coeff_one : IsUnit (ξ.coeff 1)

/-- An ideal of `W(S)` is *primitive of degree one* if it has a primitive generator (ECD
Definition 3.15). -/
def IsPrimitiveIdeal {S : Type*} [CommRing S] [TopologicalSpace S]
    (J : Ideal (WittVector p S)) : Prop :=
  ∃ ξ, IsPrimitive p ξ ∧ J = Ideal.span {ξ}

-- Check: `p` is distinguished in characteristic `p`.
example {S : Type*} [CommRing S] [CharP S p] : IsDistinguished p (p : WittVector p S) := by
  simp [IsDistinguished, WittVector.coeff_p_one]

-- Negative control: over a nonzero ring of characteristic `p`, `p²` and Teichmüller lifts are
-- not distinguished.
example {S : Type*} [CommRing S] [CharP S p] [Nontrivial S] :
    ¬ IsDistinguished p ((p : WittVector p S) ^ 2) := sorry
example {S : Type*} [CommRing S] [CharP S p] [Nontrivial S] (x : S) :
    ¬ IsDistinguished p (WittVector.teichmuller p x) := sorry

variable {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- **Fontaine's `θ` has distinguished kernel.** For a perfectoid Tate ring and a ring of integral
elements `R⁺`, the kernel of Mathlib's `θ : W(PreTilt R⁺ p) → R⁺` is generated by a distinguished
element, and an element of the kernel generates it iff it is distinguished (ECD Lemma 3.14(ii),
pp. 17–18; BMS Remark 3.11). The instance hypotheses are those of Mathlib's `fontaineTheta`. -/
theorem ker_fontaineTheta [IsPerfectoidTateRing p R] (P : Pair R)
    [Fact ¬ IsUnit (p : P.plus)] [IsAdicComplete (Ideal.span {(p : P.plus)}) P.plus] :
    (∃ ξ, IsDistinguished p ξ ∧
      RingHom.ker (WittVector.fontaineTheta P.plus p) = Ideal.span {ξ}) ∧
    ∀ ξ ∈ RingHom.ker (WittVector.fontaineTheta P.plus p),
      RingHom.ker (WittVector.fontaineTheta P.plus p) = Ideal.span {ξ} ↔ IsDistinguished p ξ :=
  sorry

end Witt

/-! ### Integral perfectoid rings -/

section IntegralPerfectoid

variable (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A]

/-- An *integral perfectoid* ring (BMS Definition 3.5, p. 21): an element `π` with `π ^ p ∣ p`
for which `A` is `π`-adically complete, surjective Frobenius on `A/p`, and principal kernel of
Mathlib's `θ`. If `p` is a unit these conditions force the zero ring, whose unique map has
principal kernel; the kernel clause is therefore stated for every proof that `p` is a nonunit. -/
class IsIntegralPerfectoid : Prop where
  /-- A complete separated adic element with `π ^ p ∣ p`. -/
  exists_adic_element : ∃ π : A, π ^ p ∣ (p : A) ∧ IsAdicComplete (Ideal.span {π}) A
  /-- Frobenius on `A/p` is surjective. -/
  frobenius_surjective : Function.Surjective (fun x : ModP A p ↦ x ^ p)
  /-- The kernel of Mathlib's Fontaine map is principal. -/
  theta_kernel_principal : ∀ (hp : ¬ IsUnit (p : A))
      (hc : IsAdicComplete (Ideal.span {(p : A)}) A),
    letI : Fact (¬ IsUnit (p : A)) := ⟨hp⟩
    letI := hc
    (RingHom.ker (WittVector.fontaineTheta A p)).IsPrincipal

-- Check: a perfect ring of characteristic `p` is integral perfectoid (with `π = 0`).
example [CharP A p] [PerfectRing A p] : IsIntegralPerfectoid p A := sorry

-- Negative control: `ℤ_p` is not integral perfectoid (every `π` with `π ^ p ∣ p` is a unit).
example : ¬ IsIntegralPerfectoid p ℤ_[p] := sorry

-- Check: `𝒪_{ℂ_p}` is integral perfectoid.
example : IsIntegralPerfectoid p (powerBoundedSubring ℂ_[p]) := sorry

variable {p} {R : Type*} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- `R` is perfectoid iff `R⁺` is bounded and integral perfectoid (BMS Lemma 3.20, pp. 26–27). -/
theorem isPerfectoidTateRing_iff_integral (P : Pair R) :
    IsPerfectoidTateRing p R ↔ IsBounded (P.plus : Set R) ∧ IsIntegralPerfectoid p P.plus :=
  sorry

end IntegralPerfectoid

section Examples

variable (p : ℕ) [Fact p.Prime]

-- Negative control: `ℚ_p` is not perfectoid (no `ϖ` with `ϖ ^ p ∣ p` in `ℤ_p`), and not a
-- perfectoid field, although Frobenius on `𝔽_p` is bijective.
example : ¬ IsPerfectoidTateRing p ℚ_[p] := sorry
example : ¬ IsPerfectoidField p ℚ_[p] := sorry

-- Negative control: `ℚ_p` has no pseudouniformiser with compatible roots.
example : IsEmpty (PseudoUniformizerRoots p ℚ_[p]) := sorry

-- Check: the zero ring is perfectoid.
example (R : Type*) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
    [IsTateRing R] [CompleteSpace R] [T2Space R] [Subsingleton R] : IsPerfectoidTateRing p R :=
  sorry

-- Negative control for the Frobenius criterion: for `A = ℤ_p[π]` with `π ^ p = p`,
-- `A/π^p = A/p ≅ 𝔽_p[u]/(u^p)` with `u` the class of `π`, and `u` is not a `p`-th power there; so
-- neither the relative Frobenius `A/π → A/π^p` nor Frobenius on `A/p` is surjective, although the
-- Frobenius endomorphism of `A/π ≅ 𝔽_p` is bijective.
example : ¬ ∃ y : Polynomial (ZMod p) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ p},
    y ^ p = Ideal.Quotient.mk _ Polynomial.X := sorry

end Examples

end Perfectoid
/-! ## Layer P2: rational localisation, the sheaf theorem and perfectoid spaces -/

namespace Perfectoid

section Sheaf

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- **Rational localisations of a perfectoid Tate ring are perfectoid** (ECD Theorem 3.18, p. 18;
HK Proposition 3.8; KL16 Theorem 3.3.18). The localisation is Tau Ceti's completed rational
localisation `R⟨T/s⟩` for an admissible presentation, with the topology of
`IsStablyUniform.isUniform_rationalLocalization`. -/
theorem isPerfectoidTateRing_rationalLocalization [IsPerfectoidTateRing p R]
    (P : PairOfDefinition R) (T : Finset R) (s : R)
    (hT : IsOpen (Ideal.span (T : Set R) : Set R)) :
    let hden := P.hasDenominatorPower_of_isOpen_span T s (Localization.Away s) hT
    letI := P.locUniformSpace T s (Localization.Away s) hden
    haveI := P.isUniformAddGroup_locUniformSpace T s (Localization.Away s) hden
    haveI := P.isTopologicalRing_locUniformSpace T s (Localization.Away s) hden
    haveI := P.isTateRing_completion_locTopology_of_isTateRing T s (Localization.Away s) hden
    IsPerfectoidTateRing p (UniformSpace.Completion (Localization.Away s)) := sorry

/-- **Perfectoid Tate rings are stably uniform** (KL15 Theorem 3.6.15; KL16 Corollary 3.3.19;
HK Corollary 3.15). -/
theorem isStablyUniform [IsPerfectoidTateRing p R] : IsStablyUniform R := sorry

/-- **Perfectoid Tate rings are sheafy**, the stably uniform case of the Buzzard–Verberkmoes
theorem (KL16 Corollary 3.3.19; ECD Theorem 3.18). -/
theorem isSheafyRing [IsPerfectoidTateRing p R] : IsSheafyRing R := sorry

end Sheaf

end Perfectoid

namespace PerfectoidSpace

open Perfectoid PreAdicSpace

variable (p : ℕ) [Fact p.Prime]

/-- The presentation-limit spaces `Spa(R, R⁺)` of perfectoid Tate pairs, as an object property of
Tau Ceti's `PreAdicSpace`; compare `PreAdicSpace.isAffinoidModel`. -/
def isAffinoidPerfectoidModel : ObjectProperty PreAdicSpace.{u} := fun X ↦
  ∃ (A : Type u) (_ : CommRing A) (_ : UniformSpace A) (_ : IsUniformAddGroup A)
    (_ : IsTopologicalRing A) (_ : IsTateRing A) (_ : CompleteSpace A) (_ : T2Space A)
    (_ : IsPerfectoidTateRing p A) (S : Pair A) (P : PairOfDefinition A)
    (hP : P.ringOfDefinition ≤ S.plus),
    X = presentationLimitPreAdicSpace P S.plus S.isRingOfIntegralElements.isPowerBounded_of_mem hP

/-- A pre-adic space is *affinoid perfectoid* if it is isomorphic to `Spa(R, R⁺)` for a
perfectoid Tate pair (Berkeley Remark 7.1.3; Sch12 after Theorem 6.3). -/
abbrev isAffinoidPerfectoid : ObjectProperty PreAdicSpace.{u} :=
  (isAffinoidPerfectoidModel p).isoClosure

omit [Fact p.Prime] in
/-- `Spa(R, R⁺)` of a perfectoid Tate pair is affinoid perfectoid. -/
theorem isAffinoidPerfectoid_presentationLimitPreAdicSpace {A : Type u} [CommRing A]
    [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A]
    [T2Space A] [IsPerfectoidTateRing p A] (S : Pair A) (P : PairOfDefinition A)
    (hP : P.ringOfDefinition ≤ S.plus) :
    isAffinoidPerfectoid p
      (presentationLimitPreAdicSpace P S.plus
        S.isRingOfIntegralElements.isPowerBounded_of_mem hP) :=
  ObjectProperty.le_isoClosure _ _
    ⟨A, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance,
      inferInstance, inferInstance, S, P, hP, rfl⟩

/-- A *perfectoid space* (ECD Definition 3.19, p. 18; Berkeley Definition 7.1.2): an adic space,
so a sheafy pre-adic space, in which every point has an open neighbourhood which is affinoid
perfectoid. Sheafiness is part of the definition: without it the empty pre-adic space with nonzero
sections over `∅` would qualify. -/
def isPerfectoidSpace : ObjectProperty PreAdicSpace.{u} := fun X ↦
  PreAdicSpace.isSheafy X ∧ ∀ x : X, ∃ U : TopologicalSpace.Opens X, x ∈ U ∧
    isAffinoidPerfectoid p (X.restrict U.isOpenEmbedding)

/-- The category `Perfd` of perfectoid spaces, a full subcategory of pre-adic spaces. -/
abbrev Perfd : Type (u + 1) := (isPerfectoidSpace.{u} p).FullSubcategory

/-- A perfectoid space has *characteristic `p`* if `p = 0` in every ring of sections. -/
def InCharP : ObjectProperty (Perfd.{u} p) := fun X ↦
  ∀ U : (TopologicalSpace.Opens X.obj)ᵒᵖ,
    ((p : ℕ) : X.obj.toRingPresheafedSpace.presheaf.obj U) = 0

/-- The category `Perf` of perfectoid spaces of characteristic `p`. -/
abbrev Perf : Type (u + 1) := (InCharP.{u} p).FullSubcategory

/-- Affinoid perfectoid spaces are perfectoid spaces. -/
theorem isAffinoidPerfectoid_le_isPerfectoidSpace :
    isAffinoidPerfectoid.{u} p ≤ isPerfectoidSpace.{u} p := sorry

/-- **Perfectoid spaces are adic spaces**: their charts are sheafy, by `Perfectoid.isSheafyRing`
(ECD Theorem 3.18). -/
theorem isPerfectoidSpace_le_isAdic : isPerfectoidSpace.{u} p ≤ PreAdicSpace.isAdic := sorry

/-- Open subspaces of perfectoid spaces are perfectoid (Sch12 proof of Proposition 6.17). -/
theorem isPerfectoidSpace_restrict {X : PreAdicSpace.{u}} (hX : isPerfectoidSpace p X)
    (U : TopologicalSpace.Opens X) : isPerfectoidSpace p (X.restrict U.isOpenEmbedding) := sorry

/-- The affinoid perfectoid opens of a perfectoid space form a basis (ECD Theorem 3.18; Wedhorn
Remark 8.23). -/
theorem isBasis_affinoidPerfectoidOpens {X : PreAdicSpace.{u}} (hX : isPerfectoidSpace p X) :
    TopologicalSpace.Opens.IsBasis
      {U : TopologicalSpace.Opens X | isAffinoidPerfectoid p (X.restrict U.isOpenEmbedding)} :=
  sorry

/-- **Fibre products of perfectoid spaces exist** (Sch12 Proposition 6.18; Berkeley Proposition
8.2.5(3)). -/
instance hasPullbacks : Limits.HasPullbacks (Perfd.{u} p) := sorry

/-- **Absolute binary products exist in `Perf`** (Berkeley Lemma 8.3.5; ECD proof of
Proposition 11.4). -/
instance hasBinaryProducts_perf : Limits.HasBinaryProducts (Perf.{u} p) := sorry

-- Check: an empty pre-adic space is perfectoid exactly when it is sheafy (its sections over `∅`
-- vanish); the chart condition is vacuous.
example (X : PreAdicSpace.{u}) [IsEmpty X] (hX : PreAdicSpace.isSheafy X) :
    isPerfectoidSpace p X := ⟨hX, fun x ↦ isEmptyElim x⟩

end PerfectoidSpace
/-! ## Layer P3: almost purity and the étale site -/

namespace Perfectoid

section AlmostPurity

variable (p : ℕ) [Fact p.Prime]

/-- Étale algebras over a perfect ring of characteristic `p` are perfect: the relative Frobenius
of an étale map is an isomorphism (Bhatt Lemma 4.3.8). -/
theorem perfectRing_of_etale {A B : Type*} [CommRing A] [CommRing B] [Algebra A B] [CharP A p]
    [PerfectRing A p] [CharP B p] [Algebra.Etale A B] : PerfectRing B p := sorry

variable {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- **Almost purity, (i).** A finite étale algebra over a perfectoid Tate ring, with its
finite-module topology, is a complete Hausdorff perfectoid Tate ring (ECD Theorem 6.1(i), p. 26;
Sch12 Theorem 7.9). -/
theorem isPerfectoidTateRing_of_finiteEtale [IsPerfectoidTateRing p R] (S : Type u) [CommRing S]
    [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S] [Algebra R S]
    [IsModuleTopology R S] [Module.Finite R S] [Algebra.Etale R S] :
    ∃ (_ : IsTateRing S) (_ : CompleteSpace S) (_ : T2Space S), IsPerfectoidTateRing p S :=
  sorry

/-- **Almost purity, (iii), projectivity.** For `S` finite étale over a perfectoid Tate ring `R`,
`S°` is uniformly almost finite projective over `R°`: one `n` serves every `ε ∈ R°°`, with
`ε • id_{S°}` factoring through `(R°)ⁿ` (ECD Theorem 6.1(iii); Sch12 Theorem 7.9(iii)). The maps
`S° → R°` are written as `R`-linear maps `S → R` preserving the integral subrings. -/
theorem exists_uniformlyAlmostFiniteProjective_powerBounded [IsPerfectoidTateRing p R]
    (S : Type u) [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
    [IsTateRing S] [CompleteSpace S] [T2Space S] [Algebra R S] [IsModuleTopology R S]
    [Module.Finite R S] [Algebra.Etale R S] :
    ∃ n : ℕ, ∀ ε ∈ topologicallyNilpotentIdeal R,
      ∃ (s : Fin n → S) (u : Fin n → S →ₗ[R] R), (∀ i, s i ∈ powerBoundedSubring S) ∧
        (∀ i, ∀ x ∈ powerBoundedSubring S, u i x ∈ powerBoundedSubring R) ∧
        ∀ x : S, (ε : R) • x = ∑ i, u i x • s i := sorry

-- Check: the split finite étale algebra `R × R` is perfectoid.
example [IsPerfectoidTateRing p R] : IsPerfectoidTateRing p (R × R) := inferInstance

end AlmostPurity

section Fields

variable (p : ℕ) [Fact p.Prime]

/-- **Finite extensions of perfectoid fields are perfectoid** (Sch12 Theorem 3.7(i), p. 17). -/
theorem IsPerfectoidField.of_finiteDimensional {K L : Type u} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] [NontriviallyNormedField L]
    [IsUltrametricDist L] [CompleteSpace L] [NormedAlgebra K L] [FiniteDimensional K L] :
    IsPerfectoidField p L := sorry

/-- A complete algebraically closed nonarchimedean field of residue characteristic `p` is a
perfectoid field (Sch12 §3, after Definition 3.1). -/
theorem isPerfectoidField_of_isAlgClosed {K : Type u} [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [IsAlgClosed K] (hp : ‖(p : K)‖ < 1) :
    IsPerfectoidField p K := sorry

end Fields

end Perfectoid

/-! ## Layer P4: Zariski closed subsets and immersions -/

namespace Perfectoid

section RootedQuotient

variable (p : ℕ) [Fact p.Prime] {A : Type u} [CommRing A] [IsIntegralPerfectoid p A]

/-- The p-adic completion of an integral perfectoid ring modulo an ideal generated by a
compatible sequence of p-power roots is integral perfectoid (BS22, proof of Theorem 7.4,
p. 62; README P4.15.5). -/
theorem isIntegralPerfectoid_completedRootQuotient (r : ℕ → A)
    (hr : ∀ n, r (n + 1) ^ p = r n) :
    IsIntegralPerfectoid p
      (AdicCompletion (Ideal.span {(p : A ⧸ Ideal.span (Set.range r))})
        (A ⧸ Ideal.span (Set.range r))) := sorry

/-- The canonical map to the completed rooted quotient is surjective (BS22, proof of
Theorem 7.4, p. 62; README P4.15.5). -/
theorem surjective_completedRootQuotientMap (r : ℕ → A)
    (hr : ∀ n, r (n + 1) ^ p = r n) :
    Function.Surjective
      (fun x : A ↦ AdicCompletion.of (Ideal.span {(p : A ⧸ Ideal.span (Set.range r))})
        (A ⧸ Ideal.span (Set.range r)) (Ideal.Quotient.mk (Ideal.span (Set.range r)) x)) :=
  sorry

end RootedQuotient

section ZariskiClosed

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- The universal perfectoid quotient of `R` killing `I`: a surjection onto a perfectoid Tate ring,
initial among continuous maps to perfectoid Tate rings that kill `I` (ECD Theorem 5.8;
BS22 Theorem 7.4 and Remark 7.5). Its integral construction and surjectivity use the
universal-prism, Hodge–Tate, flat root-cover and rooted-quotient targets of README P4.15.1–P4.15.5. -/
theorem exists_surjective_perfectoidQuotient [IsPerfectoidTateRing p R] (I : Ideal R) :
    ∃ (S : Type u) (_ : CommRing S) (_ : UniformSpace S) (_ : IsUniformAddGroup S)
      (_ : IsTopologicalRing S) (_ : IsTateRing S) (_ : CompleteSpace S) (_ : T2Space S)
      (_ : IsPerfectoidTateRing p S) (f : R →+* S), Continuous f ∧ Function.Surjective f ∧
      (∀ x ∈ I, f x = 0) ∧
      ∀ (T : Type u) [CommRing T] [UniformSpace T] [IsUniformAddGroup T] [IsTopologicalRing T]
        [IsTateRing T] [CompleteSpace T] [T2Space T] [IsPerfectoidTateRing p T] (g : R →+* T),
        Continuous g → (∀ x ∈ I, g x = 0) → ∃! h : S →+* T, Continuous h ∧ h.comp f = g :=
  sorry

-- Check: the vanishing clause is pointwise, so a map killing the unit ideal has zero target.
example {T : Type*} [CommRing T] (f : R →+* T) (hf : ∀ x ∈ (⊤ : Ideal R), f x = 0) :
    Subsingleton T := by
  have h := hf 1 Submodule.mem_top
  rw [map_one] at h
  exact subsingleton_of_zero_eq_one h.symm

end ZariskiClosed

end Perfectoid

/-! ## Layer P5: cofiltered limits -/

namespace Perfectoid

/-- Along an `ℵ₁`-filtered diagram of rings, each complete for a compatible principal adic
topology, the colimit is complete: `ω₁`-cofiltered limits of affinoid perfectoid spaces need no
completion (ECD Proposition 6.5, p. 30, and proof of Proposition 8.5). -/
theorem isAdicComplete_colimit_of_isCardinalFiltered {J : Type u} [SmallCategory J]
    [Fact (Cardinal.aleph 1 : Cardinal.{u}).IsRegular] [IsCardinalFiltered J (Cardinal.aleph 1)]
    (F : J ⥤ CommRingCat.{u}) (t : ∀ j, F.obj j)
    (ht : ∀ {i j : J} (f : i ⟶ j), (F.map f).hom (t i) = t j)
    (hc : ∀ j, IsAdicComplete (Ideal.span {t j}) (F.obj j)) (j₀ : J) :
    IsAdicComplete (Ideal.span {(Limits.colimit.ι F j₀).hom (t j₀)})
      ((Limits.colimit F : CommRingCat.{u}) : Type u) :=
  sorry

end Perfectoid

/-! ## Layer P6: κ-small perfectoid spaces and pro-étale presentations -/

/-- A Hausdorff first-countable uniform additive group with a dense subset of size `≤ κ` has
completion of size `≤ κ ^ ℵ₀` (ECD Remark 4.3, p. 20). -/
theorem completion_cardinality_bound (G : Type u) [AddGroup G] [UniformSpace G]
    [IsUniformAddGroup G] [T2Space G] [FirstCountableTopology G]
    (A : Set G) (hA : Dense A) (κ : Cardinal.{u}) (hκ : Cardinal.aleph0 ≤ κ)
    (hcard : Cardinal.mk A ≤ κ) :
    Cardinal.mk (UniformSpace.Completion G) ≤ κ ^ Cardinal.aleph0 :=
  sorry

namespace PerfectoidSpace

open Perfectoid PreAdicSpace

variable (p : ℕ) [Fact p.Prime]

/-- A perfectoid space is *κ-small* if its points and the sections over each affinoid perfectoid
open have fewer than `κ` elements (ECD Definition 4.2, p. 20). -/
structure IsKappaSmall (κ : Cardinal.{u}) (X : Perfd.{u} p) : Prop where
  card_lt : Cardinal.mk X.obj < κ
  card_sections_lt : ∀ U : TopologicalSpace.Opens X.obj,
    isAffinoidPerfectoid p (X.obj.restrict U.isOpenEmbedding) →
      Cardinal.mk (X.obj.toRingPresheafedSpace.presheaf.obj (Opposite.op U)) < κ

/-- One cardinal `μ < κ` bounds the points and all affinoid perfectoid sections (ECD Proposition
6.4, p. 27). -/
def IsUniformlyKappaSmall (κ : Cardinal.{u}) (X : Perfd.{u} p) : Prop :=
  ∃ μ < κ, Cardinal.mk X.obj ≤ μ ∧ ∀ U : TopologicalSpace.Opens X.obj,
    isAffinoidPerfectoid p (X.obj.restrict U.isOpenEmbedding) →
      Cardinal.mk (X.obj.toRingPresheafedSpace.presheaf.obj (Opposite.op U)) ≤ μ

variable {p}

omit [Fact p.Prime] in
theorem IsKappaSmall.mono {κ κ' : Cardinal.{u}} (hκ : κ ≤ κ') {X : Perfd.{u} p}
    (h : IsKappaSmall p κ X) : IsKappaSmall p κ' X :=
  ⟨h.card_lt.trans_le hκ, fun U hU ↦ (h.card_sections_lt U hU).trans_le hκ⟩

omit [Fact p.Prime] in
theorem IsUniformlyKappaSmall.isKappaSmall {κ : Cardinal.{u}} {X : Perfd.{u} p}
    (h : IsUniformlyKappaSmall p κ X) : IsKappaSmall p κ X := by
  obtain ⟨μ, hμ, hX, hU⟩ := h
  exact ⟨hX.trans_lt hμ, fun U h ↦ (hU U h).trans_lt hμ⟩

/-- Open subspaces of κ-small perfectoid spaces are κ-small (ECD Proposition 4.4). -/
theorem IsKappaSmall.restrict {κ : Cardinal.{u}} {X : Perfd.{u} p} (h : IsKappaSmall p κ X)
    (U : TopologicalSpace.Opens X.obj) :
    IsKappaSmall p κ
      ⟨X.obj.restrict U.isOpenEmbedding, isPerfectoidSpace_restrict p X.property U⟩ :=
  sorry

/-- For an uncountable strong limit `κ`, `Spa(A, A⁺)` is κ-small iff `#A < κ` (ECD Proposition 4.4,
p. 21). -/
theorem isKappaSmall_presentationLimit_iff {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A]
    [IsPerfectoidTateRing p A] (S : Pair A) (P : PairOfDefinition A)
    (hP : P.ringOfDefinition ≤ S.plus) {κ : Cardinal.{u}} (hκ : κ.IsStrongLimit)
    (hκ₀ : Cardinal.aleph0 < κ) :
    IsKappaSmall p κ ⟨_, isAffinoidPerfectoid_le_isPerfectoidSpace p _
      (isAffinoidPerfectoid_presentationLimitPreAdicSpace p S P hP)⟩ ↔ Cardinal.mk A < κ :=
  sorry

-- Negative control: smallness is strict, so no perfectoid space is `0`-small.
example (X : Perfd.{u} p) : ¬ IsKappaSmall p 0 X :=
  fun h ↦ absurd h.card_lt (not_lt.mpr zero_le)

/-- A pro-object of `C`, as an object of Mathlib's `(Ind Cᵒᵖ)ᵒᵖ`, has a *κ-small presentation* if
it is the limit of a cofiltered diagram with fewer than `κ` arrows (ECD Proposition 7.10). -/
def HasKappaSmallPresentation {C : Type u} [Category.{v} C] (κ : Cardinal.{v+1})
    (Z : (Ind Cᵒᵖ)ᵒᵖ) : Prop :=
  ∃ (I : Type v) (_ : SmallCategory I) (_ : IsCofiltered I) (D : I ⥤ C),
    Cardinal.lift.{v+1} (Cardinal.mk (Σ i j : I, i ⟶ j)) < κ ∧
      Nonempty (Z ≅ Opposite.op ((Ind.lim Iᵒᵖ).obj D.op))

/-- The category `Pro_κ(C)`. -/
abbrev ProKappa (κ : Cardinal.{v+1}) (C : Type u) [Category.{v} C] :=
  ObjectProperty.FullSubcategory (HasKappaSmallPresentation (C := C) κ)

theorem HasKappaSmallPresentation.of_diagram {C : Type u} [Category.{v} C]
    {κ : Cardinal.{v+1}} {I : Type v} [SmallCategory I] [IsCofiltered I]
    (D : I ⥤ C) (hD : Cardinal.lift.{v+1} (Cardinal.mk (Σ i j : I, i ⟶ j)) < κ) :
    HasKappaSmallPresentation κ (Opposite.op ((Ind.lim Iᵒᵖ).obj D.op)) :=
  ⟨I, inferInstance, inferInstance, D, hD, ⟨Iso.refl _⟩⟩

-- Negative control: `Pro_0(C)` is empty.
example (C : Type u) [Category.{v} C] : IsEmpty (ProKappa 0 C) :=
  ⟨fun Z ↦ by
    obtain ⟨_, _, _, _, h, _⟩ := Z.property
    exact absurd h (not_lt.mpr zero_le)⟩

end PerfectoidSpace

/-! ## Layer P7: Frobenius-controlled towers -/

namespace Perfectoid

/-- An integral tower: rings `A_n⁺` with transition maps and a compatible parameter `ϖ` which is
regular, adically complete and satisfies `ϖ ^ p ∣ p` at every stage (Scholze, *Torsion*, proof of
Corollary III.2.19). -/
structure IntegralTower (p : ℕ) where
  ring : ℕ → Type u
  [commRing : ∀ n, CommRing (ring n)]
  transition : ∀ n, ring n →+* ring (n + 1)
  parameter : ∀ n, ring n
  parameter_map : ∀ n, transition n (parameter n) = parameter (n + 1)
  regular : ∀ n, parameter n ∈ nonZeroDivisors (ring n)
  complete : ∀ n, IsAdicComplete (Ideal.span {parameter n}) (ring n)
  divides : ∀ n, parameter n ^ p ∣ (p : ring n)

attribute [instance] IntegralTower.commRing

namespace IntegralTower

variable {p : ℕ} (T : IntegralTower.{u} p)

/-- The stage `A_n⁺ / ϖ ^ k`. -/
abbrev quotient (n k : ℕ) := T.ring n ⧸ Ideal.span {T.parameter n ^ k}

/-- The transition map modulo `ϖ ^ k`. -/
def quotientMap (n k : ℕ) : T.quotient n k →+* T.quotient (n + 1) k :=
  Ideal.quotientMap _ (T.transition n) (by
    refine Ideal.span_le.mpr (Set.singleton_subset_iff.mpr ?_)
    change T.transition n (T.parameter n ^ k) ∈ Ideal.span {T.parameter (n + 1) ^ k}
    rw [map_pow, T.parameter_map]
    exact Ideal.subset_span (Set.mem_singleton _))

/-- The direct system `A_0⁺ → A_1⁺ → ⋯`. -/
def diagram : ℕ ⥤ CommRingCat.{u} :=
  Functor.ofSequence (X := fun n ↦ CommRingCat.of (T.ring n))
    (fun n ↦ CommRingCat.ofHom (T.transition n))

/-- The constant tower on `A` with a chosen parameter `π`. Regularity of `π` is an explicit input:
it does not follow from `A` being integral perfectoid (`𝔽_p` is integral perfectoid with `π = 0`,
and has no regular parameter for which it is adically complete). -/
def const (A : Type u) [CommRing A] (π : A) (hreg : π ∈ nonZeroDivisors A)
    (hc : IsAdicComplete (Ideal.span {π}) A) (hd : π ^ p ∣ (p : A)) : IntegralTower.{u} p where
  ring _ := A
  transition _ := RingHom.id A
  parameter _ := π
  parameter_map _ := rfl
  regular _ := hreg
  complete _ := hc
  divides _ := hd

-- Check: the consecutive maps of the system are the transition maps.
example (n : ℕ) : (T.diagram.map (homOfLE (Nat.le_succ n))).hom = T.transition n := by
  simp [diagram, Functor.ofSequence_map_homOfLE_succ]
  rfl

/-- The image of `ϖ` in `colim A_n⁺`. -/
abbrev colimitParameter : (Limits.colimit T.diagram : CommRingCat.{u}) :=
  (Limits.colimit.ι T.diagram 0).hom (T.parameter 0)

/-- `A_∞⁺`, the `ϖ`-adic completion of `colim A_n⁺`. -/
abbrev completedPlus :=
  AdicCompletion (Ideal.span {T.colimitParameter}) (Limits.colimit T.diagram : CommRingCat.{u})

end IntegralTower

/-- A *Frobenius-controlled* tower: from `start` on, isomorphisms `w_n : A_{n+1}⁺/ϖ ≅ A_n⁺/ϖ ^ p`
with `t_n ∘ w_n` the Frobenius of `A_{n+1}⁺/ϖ ^ p` and `w_{n+1} ∘ t_{n+1} = t_n ∘ w_n`
(Scholze, *Torsion*, proof of Corollary III.2.19). -/
structure FrobeniusTower (p : ℕ) [Fact p.Prime] extends IntegralTower.{u} p where
  start : ℕ
  lift : ∀ n, start ≤ n → toIntegralTower.quotient (n + 1) 1 ≃+* toIntegralTower.quotient n p
  transition_comp_lift : ∀ n (hn : start ≤ n) (x : ring (n + 1)),
    toIntegralTower.quotientMap n p (lift n hn (Ideal.Quotient.mk _ x)) =
      Ideal.Quotient.mk _ (x ^ p)
  lift_comp_transition : ∀ n (hn : start ≤ n) (x : ring (n + 1)),
    lift (n + 1) (Nat.le_trans hn (Nat.le_succ n)) (Ideal.Quotient.mk _ (transition (n + 1) x)) =
      toIntegralTower.quotientMap n p (lift n hn (Ideal.Quotient.mk _ x))

/-- **The perfectoid Frobenius criterion**: the completion `A_∞⁺` of a Frobenius-controlled tower
is integral perfectoid (Scholze, *Torsion*, proof of Corollary III.2.19; BMS Lemma 3.10(ii)). -/
theorem FrobeniusTower.isIntegralPerfectoid_completedPlus {p : ℕ} [Fact p.Prime]
    (T : FrobeniusTower.{u} p) : IsIntegralPerfectoid p T.completedPlus :=
  sorry

-- Negative control: at `p = 2` no stage has parameter `2` unless it is the zero ring, since
-- `4 ∣ 2` with `2` regular makes `2` a unit.
example (T : IntegralTower.{u} 2) (n : ℕ) (h : T.parameter n = 2) : Subsingleton (T.ring n) := by
  obtain ⟨c, hc⟩ := h ▸ T.divides n
  have h0 : (1 - 2 * c) * 2 = 0 := by push_cast at hc; linear_combination hc
  have h1 := (mem_nonZeroDivisors_iff.mp (h ▸ T.regular n)).2 _ h0
  have hu : IsUnit (2 : T.ring n) := IsUnit.of_mul_eq_one (b := c) (by linear_combination -h1)
  have hH := (h ▸ T.complete n).toIsHausdorff
  rw [Ideal.span_singleton_eq_top.mpr hu] at hH
  have hz : ∀ x : T.ring n, x = 0 := fun x ↦
    hH.haus x fun k ↦ by simp [SModEq.zero, Ideal.top_pow]
  exact ⟨fun a b ↦ (hz a).trans (hz b).symm⟩

-- Negative control: no stage of an integral tower is a field. A regular parameter of a field is
-- nonzero, hence a unit, and adic separatedness for the unit ideal forces the zero ring. So a
-- perfect field such as `𝔽_p`, integral perfectoid with `π = 0`, has no constant tower.
example {p : ℕ} (T : IntegralTower.{u} p) (n : ℕ) (hF : IsField (T.ring n)) : False := by
  obtain ⟨a, b, hab⟩ := hF.exists_pair_ne
  have hne : T.parameter n ≠ 0 := fun h0 ↦ by
    have h := (mem_nonZeroDivisors_iff.mp (h0 ▸ T.regular n)).2
    exact hab ((h a (mul_zero a)).trans (h b (mul_zero b)).symm)
  obtain ⟨c, hc⟩ := hF.mul_inv_cancel hne
  have hH := (T.complete n).toIsHausdorff
  rw [Ideal.span_singleton_eq_top.mpr (IsUnit.of_mul_eq_one (b := c) hc)] at hH
  have hz : ∀ x : T.ring n, x = 0 := fun x ↦
    hH.haus x fun k ↦ by simp [SModEq.zero, Ideal.top_pow]
  exact hab ((hz a).trans (hz b).symm)

end Perfectoid

end TauCetiRoadmap.PerfectoidSpaces
