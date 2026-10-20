import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# AnabelianGeometryAndNonabelianChabauty: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is README.md.
The declarations suggest forms for particular milestones; discharging them does not finish a layer.
This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. Equation-level cocycle formulas
retain their ordered multiplication, and sections are over a fixed quotient. The continuous cocycle and H¹ carriers are supplied by the native Tau Ceti
Nonabelian.Basic and Nonabelian.Inflation modules specified in README.md; the signatures here
use the pinned APIs without introducing another carrier or quotient. The linear correspondence
and height formulas record their signs and normalization.
Geometric fundamental groups, comparison functors and represented Selmer varieties are targets
of README.md. They are not introduced here by admitted data definitions.
-/

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

universe u v w

open scoped Topology

/-! ## Headline reconstruction and finiteness theorems

Finite étale covers use the native morphism-property over categories.
Affine period and Selmer schemes are expressed through their coordinate algebras. Compact
charts and absence of a zero germ record the analytic consequence of residue-disc density.
The geometric constructions and comparisons supplying these hypotheses are README targets.
-/

open CategoryTheory AlgebraicGeometry in
/-- An equivalence of finite étale cover categories compatible with constant covers
comes from a unique base-field isomorphism of proper hyperbolic curves over a sub-p-adic
field. No rational point is required; the base field embeds in a finitely generated
extension of the specified p-adic field. -/
theorem anabelian_isom
    (p : ℕ) [Fact p.Prime] {K L : Type u} [Field K] [Field L] [Algebra ℚ_[p] L]
    (embedding : K →+* L)
    (hfg : ∃ s : Finset L, IntermediateField.adjoin ℚ_[p] (s : Set L) = ⊤)
    (X Y : Scheme.{u}) [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))]
    [SmoothOfRelativeDimension 1 (X ↘ Spec (.of K))]
    [SmoothOfRelativeDimension 1 (Y ↘ Spec (.of K))]
    [IsProper (X ↘ Spec (.of K))] [IsProper (Y ↘ Spec (.of K))]
    [GeometricallyConnected (X ↘ Spec (.of K))]
    [GeometricallyConnected (Y ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X).obj 1)]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial Y).obj 1)]
    (hX : 2 ≤ X.genus K) (hY : 2 ≤ Y.genus K) :
    let P : MorphismProperty Scheme.{u} := @AlgebraicGeometry.IsFinite ⊓ @AlgebraicGeometry.Etale
    letI : P.IsStableUnderBaseChange := {
      of_isPullback := fun sq hf =>
        ⟨MorphismProperty.of_isPullback (P := @AlgebraicGeometry.IsFinite) sq hf.1,
          MorphismProperty.of_isPullback (P := @AlgebraicGeometry.Etale) sq hf.2⟩ }
    ∀ e : P.Over ⊤ X ≌ P.Over ⊤ Y,
      Nonempty (MorphismProperty.Over.pullback P ⊤ (X ↘ Spec (.of K)) ⋙ e.functor ≅
        MorphismProperty.Over.pullback P ⊤ (Y ↘ Spec (.of K))) →
      ∃! f : X ≅ Y, f.hom.IsOver (Spec (.of K)) ∧
        Nonempty (e.functor ≅ MorphismProperty.Over.pullback P ⊤ f.inv) := by
  sorry

/-- A smaller-dimensional affine Selmer source cuts out a finite closed period locus on
finitely many compact analytic charts. Global points with Selmer witnesses form a finite set.
The period algebra is integral, and density is required near every point of every chart. -/
theorem chabautyKim_finite
    {K : Type*} [NontriviallyNormedField K]
    {A B : Type*} [CommRing A] [CommRing B] [IsDomain B]
    [Algebra K A] [Algebra K B] [Algebra.FiniteType K A] [Algebra.FiniteType K B]
    (period : B →ₐ[K] A) (hdim : ringKrullDim A < ringKrullDim B)
    {X I : Type*} [Finite I] (domain : I → Set K) (chart : I → K → X)
    (Y points : Set X) (j : X → (B →ₐ[K] K))
    (hcompact : ∀ i, IsCompact (domain i))
    (hcover : ∀ x ∈ Y, ∃ i, x ∈ chart i '' domain i)
    (hanalytic : ∀ i b, AnalyticOnNhd K (fun t => j (chart i t) b) (domain i))
    (hdense : ∀ i b, b ≠ 0 → ∀ t ∈ domain i,
      ¬ ∀ᶠ z in 𝓝 t, j (chart i z) b = 0)
    (hpoints : points ⊆ Y)
    (hglobal : ∀ x ∈ points, ∃ a : A →ₐ[K] K, j x = a.comp period) :
    {x ∈ Y | ∀ b : B, period b = 0 → j x b = 0}.Finite ∧ points.Finite := by
  sorry

/-- Joint polynomial density of the Abel–Jacobi and height coordinates makes every
quadratic residual equation have finitely many solutions on the compact chart domain.
A finite correction set containing all global residuals therefore bounds the global points. -/
theorem quadraticChabauty_finite
    {K : Type*} [NontriviallyNormedField K]
    {X I : Type*} [Finite I] {m : ℕ}
    (domain : I → Set K) (chart : I → K → X) (Y points : Set X)
    (AJ : X → Fin m → K) (θ : X → K)
    (E : (Fin m → K) →ₗ[K] (Fin m → K)) (c : Fin m → K)
    (B : (Fin m → K) →ₗ[K] (Fin m → K) →ₗ[K] K)
    (Υ : Set K) (hΥ : Υ.Finite)
    (hcompact : ∀ i, IsCompact (domain i))
    (hcover : ∀ x ∈ Y, ∃ i, x ∈ chart i '' domain i)
    (hAJ : ∀ i k, AnalyticOnNhd K (fun t => AJ (chart i t) k) (domain i))
    (hθ : ∀ i, AnalyticOnNhd K (fun t => θ (chart i t)) (domain i))
    (hdense : ∀ i (P : MvPolynomial (Option (Fin m)) K), P ≠ 0 → ∀ t ∈ domain i,
      ¬ ∀ᶠ z in 𝓝 t,
        MvPolynomial.eval (fun k => match k with
          | none => θ (chart i z)
          | some a => AJ (chart i z) a) P = 0)
    (hpoints : points ⊆ Y)
    (hglobal : ∀ x ∈ points, θ x - B (AJ x) (E (AJ x) + c) ∈ Υ) :
    {x ∈ Y | θ x - B (AJ x) (E (AJ x) + c) ∈ Υ}.Finite ∧ points.Finite := by
  sorry

/-- An analytic function with no zero germ has finitely many zeros on a compact chart. -/
theorem analytic_zero_set_finite {K : Type*} [NontriviallyNormedField K]
    (D : Set K) (f : K → K) (hcompact : IsCompact D) (hf : AnalyticOnNhd K f D)
    (hnonzero : ∀ t ∈ D, ¬ ∀ᶠ z in 𝓝 t, f z = 0) :
    {t ∈ D | f t = 0}.Finite := by
  sorry

/-- A morphism from a smaller-dimensional finite-type affine scheme to an integral affine
scheme has a nonzero regular annihilator of its scheme-theoretic image. -/
theorem selmer_period_annihilator
    {K : Type*} [Field K] {A B : Type*} [CommRing A] [CommRing B] [IsDomain B]
    [Algebra K A] [Algebra K B] [Algebra.FiniteType K A] [Algebra.FiniteType K B]
    (period : B →ₐ[K] A) (hdim : ringKrullDim A < ringKrullDim B) :
    ∃ b : B, b ≠ 0 ∧ period b = 0 := by
  sorry

/-! ## Layer 0: Continuous nonabelian cohomology -/

namespace Nonabelian

variable {G : Type u} {U : Type v} [Group G] [Group U]

/-- The ordered cocycle equation for an action by group automorphisms. -/
def IsCocycle (ρ : G →* MulAut U) (c : G → U) : Prop :=
  ∀ g h, c (g * h) = c g * ρ g (c h)

/-- Gauge translation uses the source action on the inverse gauge. -/
def gauge (ρ : G →* MulAut U) (a : U) (c : G → U) : G → U :=
  fun g => a * c g * (ρ g a)⁻¹

/-- The positive defect matches the additive differential after central abelian conversion. -/
def positiveDefect (ρ : G →* MulAut U) (a : G → U) (g h : G) : U :=
  a g * ρ g (a h) * (a (g * h))⁻¹

/-- The cocycle law fixes the identity value. -/
theorem cocycle_one (ρ : G →* MulAut U) {c : G → U} (hc : IsCocycle ρ c) :
    c 1 = 1 := by
  sorry

/-- Gauge translation preserves the ordered cocycle law. -/
theorem gauge_isCocycle (ρ : G →* MulAut U) {c : G → U}
    (hc : IsCocycle ρ c) (a : U) : IsCocycle ρ (gauge ρ a c) := by
  sorry

/-- Joint continuity of the action gives continuity of the gauge-translated representative. -/
theorem gauge_continuous [TopologicalSpace G] [TopologicalSpace U] [IsTopologicalGroup U]
    (ρ : G →* MulAut U) (hρ : Continuous (fun z : G × U => ρ z.1 z.2))
    (a : U) (c : C(G, U)) : Continuous (gauge ρ a c) := by
  sorry

/-- A cocycle has zero positive defect. -/
theorem positiveDefect_eq_one (ρ : G →* MulAut U) {c : G → U}
    (hc : IsCocycle ρ c) (g h : G) : positiveDefect ρ c g h = 1 := by
  sorry

/-- Vanishing of every positive defect characterizes the ordered cocycle law. -/
theorem positiveDefect_eq_one_iff (ρ : G →* MulAut U) (b : G → U) :
    (∀ g h, positiveDefect ρ b g h = 1) ↔ IsCocycle ρ b := by
  sorry

/-- An equivariant quotient sends a lift's defect to the identity when its projection is a cocycle. -/
theorem positiveDefect_mem_ker {Q : Type w} [Group Q]
    (ρ : G →* MulAut U) (σ : G →* MulAut Q) (q : U →* Q)
    (hequiv : ∀ g u, q (ρ g u) = σ g (q u)) (b : G → U)
    (hb : IsCocycle σ (fun g => q (b g))) (g h : G) :
    positiveDefect ρ b g h ∈ q.ker := by
  sorry

/-- Translation by a cocycle identifies the twisted ordered cocycle equation with the
original equation, with the translating cocycle on the right. -/
theorem twisted_cocycle_iff (ρ : G →* MulAut U) {c : G → U}
    (hc : IsCocycle ρ c) (d : G → U) :
    (∀ g h, d (g * h) = d g * (c g * ρ g (d h) * (c g)⁻¹)) ↔
      IsCocycle ρ (fun g => d g * c g) := by
  sorry

/-- Central defects obey the multiplicative two-cocycle identity without normalizing the lift. -/
theorem positiveDefect_central_cocycle (ρ : G →* MulAut U) (b : G → U)
    (hcentral : ∀ g h, positiveDefect ρ b g h ∈ Subgroup.center U) (g h k : G) :
    ρ g (positiveDefect ρ b h k) * positiveDefect ρ b g (h * k) =
      positiveDefect ρ b g h * positiveDefect ρ b (g * h) k := by
  sorry

/-- The stabilizers of a cocycle under gauge translation are the invariants of its inner twist. -/
theorem gauge_eq_self_iff (ρ : G →* MulAut U) (c : G → U) (a : U) :
    gauge ρ a c = c ↔ ∀ g, c g * ρ g a * (c g)⁻¹ = a := by
  sorry

section CentralObstruction

variable [TopologicalSpace G] [IsTopologicalGroup G]
variable [TopologicalSpace U] [IsTopologicalGroup U]
variable {M : Type w} [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
variable [DistribMulAction G M] [ContinuousSMul G M]

/-- A continuous central defect, transported through an injective equivariant coefficient map,
is a cocycle on the native continuous degree-two carrier. -/
theorem central_defect_mem_Z2 (ρ : G →* MulAut U) (i : Multiplicative M →* U)
    (hi : Function.Injective i) (hcentral : ∀ m, i m ∈ Subgroup.center U)
    (hequiv : ∀ g m, i (Multiplicative.ofAdd (g • m)) = ρ g (i (Multiplicative.ofAdd m)))
    (b : C(G, U)) (f : C(G × G, M))
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f (g, h))) = positiveDefect ρ b g h) :
    (f : G × G → M) ∈ TauCeti.ContCohomology.Z2 G M := by
  sorry

/-- Multiplying a lift by a continuous central cochain adds its positive differential
on the native continuous cochain complex. -/
theorem central_defect_change_lift (ρ : G →* MulAut U) (i : Multiplicative M →* U)
    (hi : Function.Injective i) (hcentral : ∀ m, i m ∈ Subgroup.center U)
    (hequiv : ∀ g m, i (Multiplicative.ofAdd (g • m)) = ρ g (i (Multiplicative.ofAdd m)))
    (b : C(G, U)) (a : C(G, M)) (f f' : C(G × G, M))
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f (g, h))) = positiveDefect ρ b g h)
    (hdefect' : ∀ g h, i (Multiplicative.ofAdd (f' (g, h))) =
      positiveDefect ρ (fun g => i (Multiplicative.ofAdd (a g)) * b g) g h) :
    (f' : G × G → M) = (f : G × G → M) + TauCeti.ContCohomology.d1 G M a := by
  sorry

/-- The central obstruction is a continuous coboundary exactly when a continuous central
correction turns the chosen lift into an ordered cocycle. -/
theorem central_defect_lift_iff (ρ : G →* MulAut U) (i : Multiplicative M →* U)
    (hi_cont : Continuous i) (hi : Function.Injective i) (hcentral : ∀ m, i m ∈ Subgroup.center U)
    (hequiv : ∀ g m, i (Multiplicative.ofAdd (g • m)) = ρ g (i (Multiplicative.ofAdd m)))
    (b : C(G, U)) (f : C(G × G, M))
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f (g, h))) = positiveDefect ρ b g h) :
    (f : G × G → M) ∈ TauCeti.ContCohomology.B2 G M ↔
      ∃ a : C(G, M), IsCocycle ρ (fun g => i (Multiplicative.ofAdd (a g)) * b g) ∧
        Continuous (fun g => i (Multiplicative.ofAdd (a g)) * b g) := by
  sorry

end CentralObstruction

end Nonabelian

/-! ## Layer 1: Étale K(π,1) schemes and arithmetic paths -/

namespace ArithmeticPath

variable {G : Type u} {E : Type v} [Group G] [Group E]

/-- In a common group frame, the geometric arithmetic path cocycle is p⁻¹sₓ(g)p s_b(g)⁻¹.
The two-fibre-functor construction of README.md specializes to this formula. -/
def pathCocycle (sb sx : G →* E) (p : E) (g : G) : E :=
  p⁻¹ * sx g * p * (sb g)⁻¹

/-- The action on the geometric kernel is conjugation by the reference section. -/
theorem pathCocycle_law (sb sx : G →* E) (p : E) (g h : G) :
    pathCocycle sb sx p (g * h) =
      pathCocycle sb sx p g * (sb g * pathCocycle sb sx p h * (sb g)⁻¹) := by
  sorry

/-- If both sections split q, and p is geometric, the cocycle values lie in the actual kernel. -/
theorem pathCocycle_mem_ker (q : E →* G) (sb sx : G →* E)
    (hsb : q.comp sb = MonoidHom.id G) (hsx : q.comp sx = MonoidHom.id G)
    {p : E} (hp : p ∈ q.ker) (g : G) : pathCocycle sb sx p g ∈ q.ker := by
  sorry

/-- Changing a path by right translation gives gauge translation with the inverse parameter. -/
theorem pathCocycle_changePoint (sb sx : G →* E) (p a : E) (g : G) :
    pathCocycle sb sx (p * a) g =
      a⁻¹ * pathCocycle sb sx p g * (sb g * a * (sb g)⁻¹) := by
  sorry

/-- A neutral representative identifies the endpoint section with the conjugated reference. -/
theorem pathCocycle_neutral_iff (sb sx : G →* E) (p : E) :
    (∀ g, pathCocycle sb sx p g = 1) ↔ (∀ g, p⁻¹ * sx g * p = sb g) := by
  sorry

open CategoryTheory in
/-- Two paths between fixed fibre functors differ by a unique source automorphism,
acting by right precomposition. -/
theorem existsUnique_translation {C : Type*} {D : Type*}
    [CategoryTheory.Category C] [CategoryTheory.Category D]
    {F H : C ⥤ D} (p q : F ≅ H) :
    ∃! a : CategoryTheory.Aut F, a ≪≫ p = q := by
  sorry

end ArithmeticPath

/-! ## Layer 2: Unipotent fundamental groups and their realizations -/

namespace Unipotent

open scoped TensorProduct

variable {K : Type u} [Field K] {G : Type v} [Group G]
variable {V : Type w} [AddCommGroup V] [Module K V] [Module.Finite K V]

/-- Extension length n means n + 1 trivial graded layers, agreeing with C_n in the README.
The finite-dimensional representation version uses submodules over any field. -/
def UnipotentLength (ρ : G →* (V ≃ₗ[K] V)) (n : ℕ) : Prop :=
  ∃ F : ℕ → Submodule K V,
    F 0 = ⊥ ∧ F (n + 1) = ⊤ ∧ Monotone F ∧
      ∀ i, i < n + 1 → ∀ g v, v ∈ F (i + 1) → ρ g v - v ∈ F i

/-- Length zero means trivial action, including on a nonzero vector space. -/
theorem length_zero_iff (ρ : G →* (V ≃ₗ[K] V)) :
    UnipotentLength ρ 0 ↔ ∀ g v, ρ g v = v := by
  sorry

/-- Inserting zero graded layers preserves a bound on unipotent extension length. -/
theorem length_mono (ρ : G →* (V ≃ₗ[K] V)) {n m : ℕ}
    (hρ : UnipotentLength ρ n) (hnm : n ≤ m) : UnipotentLength ρ m := by
  sorry

/-- The diagonal tensor action has unipotent length at most the sum of the two lengths. -/
theorem length_tensor {W : Type*} [AddCommGroup W] [Module K W] [Module.Finite K W]
    (ρ : G →* (V ≃ₗ[K] V)) (σ : G →* (W ≃ₗ[K] W))
    (τ : G →* ((V ⊗[K] W) ≃ₗ[K] (V ⊗[K] W)))
    (hτ : ∀ g v w, τ g (v ⊗ₜ[K] w) = ρ g v ⊗ₜ[K] σ g w)
    {n m : ℕ} (hρ : UnipotentLength ρ n) (hσ : UnipotentLength σ m) :
    UnipotentLength τ (n + m) := by
  sorry

/-- A nonzero unipotent representation contains a nonzero invariant vector. -/
theorem exists_fixed_of_unipotent [Nontrivial V] (ρ : G →* (V ≃ₗ[K] V))
    {n : ℕ} (hρ : UnipotentLength ρ n) : ∃ v : V, v ≠ 0 ∧ ∀ g, ρ g v = v := by
  sorry

end Unipotent

/-! ## Layer 3: Anabelian reconstruction -/

namespace RelativeMaps

variable {E : Type u} {F : Type v} {G : Type w}
variable [Group E] [Group F] [Group G]
variable [TopologicalSpace E] [TopologicalSpace F] [TopologicalSpace G]

/-- A relative open map is continuous, over the fixed quotient and has open image.
Geometric target conjugation is a separate quotient in the reconstruction statements. -/
structure RelativeOpenHom (qE : E →ₜ* G) (qF : F →ₜ* G) where
  hom : E →ₜ* F
  over_base : qF.comp hom = qE
  open_range : IsOpen (Set.range hom)

/-- For the identity quotient, a map over the quotient has its forced value. -/
theorem over_identity (q : E →ₜ* G)
    (f : RelativeOpenHom q (ContinuousMonoidHom.id G)) : f.hom = q := by
  sorry

/-- Over a centre-free base, a conjugator between relative maps lies in the geometric
kernel when the source projection is surjective. -/
theorem geometric_conjugator (qE : E →ₜ* G) (qF : F →ₜ* G)
    (hsurj : Function.Surjective qE) (hcenter : Subgroup.center G = ⊥)
    (f g : E →ₜ* F) (hf : qF.comp f = qE) (hg : qF.comp g = qE)
    (a : F) (hconj : ∀ x, g x = a * f x * a⁻¹) : a ∈ qF.ker := by
  sorry

end RelativeMaps

/-! ## Layer 4: Cohomology varieties and Selmer conditions -/

namespace Selmer

variable {C : Type u} {I : Type w} {L : I → Type*}

/-- The intersection of local conditions on a supplied global class carrier,
equal to `⋂ i, localization i ⁻¹' condition i`.
Its arithmetic instance uses native nonabelian H¹ and the localization maps of README.md. -/
def SelmerSet (localization : ∀ i, C → L i)
    (condition : ∀ i, Set (L i)) : Set C :=
  {x | ∀ i, localization i x ∈ condition i}

/-- Refining every local condition can only shrink the Selmer set. -/
theorem condition_mono
    (localization : ∀ i, C → L i) (A B : ∀ i, Set (L i))
    (h : ∀ i, A i ⊆ B i) : SelmerSet localization A ⊆ SelmerSet localization B := by
  sorry

/-- A finite refined Selmer locus bounds a global point set when its Kummer classes satisfy
all local conditions and localization of the global points is injective. -/
theorem finite_points_of_refined_locus {P : Type v} {X : Type*}
    (localization : ∀ i, C → L i) (condition : ∀ i, Set (L i))
    (kummer : P → C) (embed : P → X) (locus : Set X)
    (hcontain : ∀ x i, localization i (kummer x) ∈ condition i)
    (hglobal : ∀ x, kummer x ∈ SelmerSet localization condition → embed x ∈ locus)
    (hinj : Function.Injective embed) (hfinite : locus.Finite) : Finite P := by
  sorry

end Selmer

/-! ## Layer 5: Albanese maps and Chabauty–Kim finiteness -/

namespace Period

variable {U : Type u} [Group U]

/-- In a chosen group frame the admissible period is the source ratio I⁻¹γ.
The geometric construction takes its right homogeneous coset by F⁰U. -/
def periodRatio (frobeniusPath hodgePath : U) : U := frobeniusPath⁻¹ * hodgePath

/-- This ratio solves the source-translation equation. -/
theorem translate_periodRatio (I γ : U) : I * periodRatio I γ = γ := by
  sorry

/-- Equality in the right homogeneous quotient uses the right Hodge difference;
no normality of the Hodge subgroup is required. -/
theorem periodRatio_coset_eq_iff (H : Subgroup U) (I γ γ' : U) :
    QuotientGroup.leftRel H (periodRatio I γ) (periodRatio I γ') ↔ γ⁻¹ * γ' ∈ H := by
  sorry

/-- Right Hodge translation preserves the period coset for every subgroup,
including nonnormal Hodge subgroups. -/
example (H : Subgroup U) (I γ : U) (h : H) :
    QuotientGroup.leftRel H (periodRatio I γ) (periodRatio I (γ * h)) := by
  rw [QuotientGroup.leftRel_apply]
  simp [periodRatio, mul_assoc]

end Period

/-!
The analytic Coleman algebra, normalized primitives and polylogarithms are supplied by
ColemanIntegration L1–L2. The README's colemanFunctions, colemanPrimitive and colemanDilogarithm
interfaces transport those objects to the tensor-path realization, with the coefficient field,
logarithm branch, tangential normalization and outermost-letter order identified there.
RestrictedPowerSeries supplies the native series, evaluation, rescaling and Strassmann theorem;
the residue-chart comparison and Chabauty zero-set application are targets of Layer 5 here.
-/

/-! ## Layer 6: Quadratic Chabauty and height equations -/

namespace Heights

/-- On the symplectic plane, a tensor u ⊗ v acts by w ↦ ⟨u,w⟩v.
This is the trace-equals-cup convention of the divisor correspondence target. -/
def symplecticTensorAction (u v : ℚ × ℚ) : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ :=
  (u.1 • LinearMap.snd ℚ ℚ ℚ - u.2 • LinearMap.fst ℚ ℚ ℚ).smulRight v

/-- The trace of the simple-tensor correspondence equals the symplectic cup pairing,
with the first tensor factor in the first pairing slot. -/
theorem symplecticTensorAction_trace (u v : ℚ × ℚ) :
    LinearMap.trace ℚ (ℚ × ℚ) (symplecticTensorAction u v) =
      u.1 * v.2 - u.2 * v.1 := by
  sorry

variable {K : Type u} [Field K]
variable {C : Type v} [AddCommGroup C] [Module K C]
variable {N : Type w} [AddCommGroup N] [Module K N]

/-- The linear predicate for a correspondence: symmetry modulo pullbacks, zero trace and a
nonzero primitive class. Geometric cycle realization supplies these particular maps. -/
def IsNiceCorrespondence (P : Submodule K C) (swap : C →ₗ[K] C)
    (trace : C →ₗ[K] K) (cl : C →ₗ[K] N) (Z : C) : Prop :=
  swap Z - Z ∈ P ∧ trace Z = 0 ∧ cl Z ≠ 0

/-- Adding a pullback preserves niceness when all three maps have the prescribed pullback
behavior; this does not identify every p-adic class with a lattice correspondence. -/
theorem nice_add_pullback (P : Submodule K C) (swap : C →ₗ[K] C)
    (trace : C →ₗ[K] K) (cl : C →ₗ[K] N)
    (hP : ∀ z ∈ P, swap z - z ∈ P) (htrace : P ≤ trace.ker) (hcl : P ≤ cl.ker)
    {Z d : C} (hZ : IsNiceCorrespondence P swap trace cl Z) (hd : d ∈ P) :
    IsNiceCorrespondence P swap trace cl (Z + d) := by
  sorry

variable {V : Type v} [AddCommGroup V] [Module K V]

/-- The preheight has both negative splitting corrections. The geometric projections are
complementary; the displayed scalar expression is defined for arbitrary supplied linear maps. -/
def HeightPrevalue (s1 s2 : V →ₗ[K] V) (α : V)
    (βφ βFil : Module.Dual K V) (γφ γFil : K) : K :=
  γφ - γFil - βφ (s1 α) - βFil (s2 α)

/-- Changing the central Frobenius coordinate by t changes the preheight by t. -/
theorem preheight_central_variation (s1 s2 : V →ₗ[K] V) (α : V)
    (βφ βFil : Module.Dual K V) (γφ γFil t : K) :
    HeightPrevalue s1 s2 α βφ βFil (γφ + t) γFil =
      HeightPrevalue s1 s2 α βφ βFil γφ γFil + t := by
  sorry

variable {I : Type w} [Fintype I]

/-- Complete independent local height upper bounds give the negative away-place sum set. -/
def AwayHeightConstants (Γ : I → Set K) : Set K :=
  {a | ∃ t : I → K, (∀ i, t i ∈ Γ i) ∧ a = -(∑ i, t i)}

/-- Finite local height sets give a finite correction set. -/
theorem away_constants_finite (Γ : I → Set K) (hΓ : ∀ i, (Γ i).Finite) :
    (AwayHeightConstants Γ).Finite := by
  sorry

/-- The global sum identity places the corrected local height in the negative sum set. -/
theorem height_sum_correction (Γ : I → Set K) (t : I → K) (ht : ∀ i, t i ∈ Γ i)
    (hp globalHeight : K) (hsum : globalHeight = hp + ∑ i, t i) :
    hp - globalHeight ∈ AwayHeightConstants Γ := by
  sorry

variable {X : Type v} {m : ℕ}

/-- Candidate and anchor height corrections occupy separate entries of the first column. -/
def HeightDeterminantMatrix (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K) (x : X) :
    Matrix (Option (Fin m)) (Option (Fin m)) K
  | none, none => θ x - α
  | none, some j => ψ x j
  | some i, none => θ (anchors i) - anchorα i
  | some i, some j => ψ (anchors i) j

/-- The height determinant uses Mathlib's determinant on the displayed square matrix. -/
noncomputable def HeightDeterminant (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K) (x : X) : K :=
  (HeightDeterminantMatrix ψ θ anchors α anchorα x).det

/-- A basis hypothesis for the anchor features makes determinant vanishing equivalent to
the residual height equation. A singular anchor matrix can give an identically zero determinant. -/
theorem determinant_equation (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K)
    (L : (Fin m → K) →ₗ[K] K)
    (hanchors : ∀ i, θ (anchors i) - anchorα i = L (ψ (anchors i)))
    (hbasis : Matrix.det (fun i j => ψ (anchors i) j) ≠ 0) (x : X) :
    HeightDeterminant ψ θ anchors α anchorα x = 0 ↔ θ x - L (ψ x) = α := by
  sorry

/-- Evaluating the corrected determinant at an anchor repeats its row and gives zero. -/
theorem determinant_duplicate_row (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (anchorα : Fin m → K) (i : Fin m) :
    HeightDeterminant ψ θ anchors (anchorα i) anchorα (anchors i) = 0 := by
  sorry

end Heights

/-! ## Layer 7: Sections and the conjectural frontier -/

namespace Frontier

variable {E : Type u} {G : Type v} [Group E] [Group G]
variable [TopologicalSpace E] [TopologicalSpace G]

/-- A continuous section is a continuous homomorphism splitting the fixed arithmetic quotient.
The conjugacy relation of README.md uses only the geometric kernel. -/
structure GaloisSection (q : E →ₜ* G) where
  hom : G →ₜ* E
  splits : q.comp hom = ContinuousMonoidHom.id G

/-- Bijectivity of a supplied map from rational points to section classes.
The geometric instance uses classes modulo conjugation by the geometric kernel. -/
def SectionConjectureFor {P : Type u} {S : Type w} (κ : P → S) : Prop :=
  Function.Bijective κ

/-- Bijectivity of the interior-point and cuspidal-packet decomposition of a supplied
section-class set. The sigma type retains every class in each packet. -/
def CuspidalSectionConjecture {P : Type u} {D : Type v} {S : Type w}
    (κ : P → S) (packet : D → Set S) : Prop :=
  Function.Bijective (fun t : P ⊕ (Σ y : D, packet y) =>
    match t with
    | .inl x => κ x
    | .inr c => c.2.1)

/-- The decomposition asserts distinct interior classes, separation of all components,
and exhaustion by the interior image and the cuspidal packets. -/
theorem cuspidalSectionConjecture_iff {P : Type u} {D : Type v} {S : Type w}
    (κ : P → S) (packet : D → Set S) :
    CuspidalSectionConjecture κ packet ↔
      Function.Injective κ ∧
      (∀ x y, κ x ∉ packet y) ∧
      (∀ y z, y ≠ z → Disjoint (packet y) (packet z)) ∧
      (∀ s, (∃ x, κ x = s) ∨ ∃ y, s ∈ packet y) := by
  sorry

/-- A class in two cuspidal packets determines the same cusp under the decomposition. -/
theorem cuspidalSectionConjecture_cusp_unique {P : Type u} {D : Type v} {S : Type w}
    {κ : P → S} {packet : D → Set S} (h : CuspidalSectionConjecture κ packet)
    {s : S} {y z : D} (hy : s ∈ packet y) (hz : s ∈ packet z) : y = z := by
  sorry

/-- An empty boundary reduces the packet decomposition to the proper section proposition. -/
theorem cuspidalSectionConjecture_empty_boundary {P : Type u} {D : Type v} {S : Type w}
    [IsEmpty D] (κ : P → S) (packet : D → Set S) :
    CuspidalSectionConjecture κ packet ↔ SectionConjectureFor κ := by
  sorry

/-- The numeric part of Kim's dimension condition asserts a strict inequality at some positive
depth. In its geometric application the two functions are dimensions of the stated schemes. -/
def KimDimensionCondition (selmerDimension deRhamDimension : ℕ → ℕ) : Prop :=
  ∃ n, 0 < n ∧ selmerDimension n < deRhamDimension n

/-- Lowering the Selmer dimensions preserves a strict inequality at a positive depth. -/
theorem kimDimensionCondition_mono {selmerDimension selmerDimension' deRhamDimension : ℕ → ℕ}
    (h : ∀ n, selmerDimension' n ≤ selmerDimension n)
    (hcondition : KimDimensionCondition selmerDimension deRhamDimension) :
    KimDimensionCondition selmerDimension' deRhamDimension := by
  obtain ⟨n, hn, hlt⟩ := hcondition
  exact ⟨n, hn, lt_of_le_of_lt (h n) hlt⟩

/-- Summing an eventual H² bound retains the full finite initial H² contribution.
The Euler characteristic identities and tail estimates give this bound at every depth. -/
theorem sum_h1_le_with_initial_h2 (h1 h2 negative error : ℕ → ℕ)
    (k₀ : ℕ) (hk₀ : 1 ≤ k₀)
    (hEuler : ∀ k, 1 ≤ k → h1 k = negative k + h2 k)
    (hbound : ∀ k, k₀ ≤ k → h2 k ≤ error k) (n : ℕ) :
    (∑ k ∈ Finset.Icc 1 n, h1 k) ≤
      (∑ k ∈ Finset.Icc 1 n, negative k) +
        (∑ k ∈ Finset.Ico 1 k₀, h2 k) +
        ∑ k ∈ Finset.Icc k₀ n, error k := by
  sorry

/-- Eventual equality keeps its tail quantifier; an intersection equality is weaker. -/
def EventualEquality {X : Type*} (loci : ℕ → Set X) (points : Set X) : Prop :=
  ∃ N, ∀ n, N ≤ n → loci n = points

/-- Eventual equality implies the intersection statement for a decreasing containing family. -/
theorem intersection_of_eventual_equality {X : Type*} (loci : ℕ → Set X) (points : Set X)
    (hmono : Antitone loci) (hcontain : ∀ n, points ⊆ loci n)
    (heventual : EventualEquality loci points) : (⋂ n, loci n) = points := by
  sorry

/-- For decreasing loci containing the global points, one reverse inclusion gives eventual equality. -/
theorem eventualEquality_iff_exists_subset {X : Type*} (loci : ℕ → Set X) (points : Set X)
    (hmono : Antitone loci) (hcontain : ∀ n, points ⊆ loci n) :
    EventualEquality loci points ↔ ∃ n, loci n ⊆ points := by
  sorry

/-- Decreasing loci can have exactly the global-point intersection without attaining equality. -/
theorem intersection_not_eventual_equality :
    let loci : ℕ → Set ℕ := fun n => {x | x = 0 ∨ n ≤ x}
    Antitone loci ∧ (∀ n, ({0} : Set ℕ) ⊆ loci n) ∧
      (⋂ n, loci n) = {0} ∧ ¬ EventualEquality loci {0} := by
  sorry

end Frontier

/-!
README.md specifies the geometric arithmetic path torsor, finite-coefficient étale K(π,1)
predicate and raw étale pro-space; equivariant topological torsors and their isomorphisms;
good and symmetric paths; relative outer Hom and Isom; stable log-admissible covers;
cyclotomic degree; Jacobian-geometric and formal Kummer disc sections, nondegenerate sections
and canonical relations; two-fibre-functor tensor torsors and the unipotent specialization;
completed path algebra, universal pointed object, finite path module, filtered path and tangential fibre; algebra-valued Galois
cohomology family, filtered affine torsor and Selmer variety; admissible period and Albanese
maps; exact, period-image and closed-image Kim loci; geometric nice correspondences,
admissible de Rham Tate classes, depth-two height quotient and module, relative-cycle mixed
extensions and quadratic Chabauty pairs; section classes, the section conjecture, geometric
Kim dimension and eventual equality conjectures, and strict Selmer-tensor vanishing. It also
specifies the comparison from continuous fundamental-group cohomology to étale cohomology,
tangential fibre functors, admissible coverings of pointed stable curves, relative Hodge–Tate
inputs over small logarithmic bases, homogeneous quotients of unipotent groups, the Bloch–Kato
subgroups, Coleman charts on proper curves, mixed extensions with Nekovář's local and global
heights, including the adjacent-finite construction on semistable mixed extensions, and the
action of divisor correspondences on H¹ ⊗ H¹.
Their sites, comparison functors, completions and representing schemes are constructions of
the corresponding layers of README.md.
-/

/-!
The README specifies the following further API and Checks on its stated carriers.
These names refer to those mathematical targets.

Shared abelian-logarithm API:
abelianLog.add, abelianLog.derivative, abelianLog.kernel, abelianLog.functorial,
abelianLog.formal, abelianLog.baseChange, abelianLog.cp, abelianLog.pairing, abelianLog.unique;
colemanAbelian.integral, colemanAbelian.basepoint, colemanAbelian.depthOne.

Arithmetic higher-K and Chern API:
arithmeticK.finiteGeneration, arithmeticK.evenFinite, arithmeticK.oddRank; higherChern.map, higherChern.surjective,
higherChern.h1_finiteKernel, higherChern.rationalIso, higherChern.transfer,
higherChern.changeRamification; rationalTate.changeRamification.

ArithmeticPath:
galoisAction_val, restrict_id, rightMul_val.

AwayHeightConstants:
all_zero, height_sum.

GaloisSection:
diff_mul.

HeightDeterminant:
duplicate_row, matrix_first.

HeightPrevalue:
character_smul, gamma_add, local_height, zero_alpha.

IsNiceCorrespondence:
add_pullback.

TauCeti.NonabelianCohomology.H1:
changeRepresentative_apply, changeRepresentative_comp, changeRepresentative_eq_map,
changeRepresentative_gauge, changeRepresentative_id, changeRepresentative_one,
changeRepresentative_symm, changeRepresentative_twistEquiv, embeddedKernelEquiv_inclusion,
embeddedKernelEquiv_mk, embeddedKernelEquiv_one, embeddedKernelInclusion_fibre_range_iff,
embeddedKernelInclusion_injective, embeddedKernelInclusion_mapped_range_iff,
embeddedKernelInclusion_mk, embeddedKernelInclusion_quotient_range_iff,
embeddedKernelInclusion_range, embeddedKernel_fibre_existsUnique, equivContCohomology_one,
existsUnique_inflate_of_restrict_eq_one, exists_twistedKernelInclusion_of_map_eq_one,
exists_twistedKernelInclusion_of_quotient_eq_one, finiteQuotientColimitEquiv_one,
finiteQuotientColimitEquiv_symm_inflate, finiteQuotientColimitEquiv_ι, inflateNeutralEquiv_apply,
inflateNeutralEquiv_apply_symm, inflateNeutralEquiv_one, inflateNeutralEquiv_symm_inflate,
inflate_eq_one_iff, inflate_injective, inflate_mk, inflate_one, inflate_transition,
inflationCocone_app, inflationCocone_naturality, inflationCocone_pt, kernelInclusion_range_iff,
kernelInvariantAction_fibre_iff, kernelInvariantAction_inclusion,
kernelInvariantAction_injective_iff, kernelInvariantAction_lift,
kernelInvariantAction_lift_independent, kernelInvariantAction_mk,
kernelMap_injective_of_fixed_trivial, kernelMap_injective_of_stabilizer_lifts,
kernelOrbitImageEquiv_choice_independent, kernelOrbitImageEquiv_mk, kernelOrbitImageEquiv_symm_mk,
kernelOrbitImageEquiv_symm_projection, kernelOrbitNeutralFibreEquiv_inverse,
kernelOrbitNeutralFibreEquiv_mk, kernelOrbitNeutralFibreEquiv_one,
kernelOrbitNeutralFibreEquiv_symm_mk, kernelPreimageAction_kernel, kernelPreimageAction_mk,
kernelPreimageAction_perm_kernel, map_comp, map_id, map_mk, map_one, mk_eq_mk_iff, mk_eq_one_iff,
mk_smul, mk_surjective, namedKernelEquiv_inclusion, namedKernelEquiv_mk, namedKernelEquiv_one,
namedKernelEquiv_symm_mk, namedKernelInclusion_fibre_range_iff,
namedKernelInclusion_mapped_range_iff, namedKernelInclusion_quotient_range_iff,
namedKernelInclusion_range, quotientDiagram_map_apply, quotientDiagram_map_id, quotientDiagram_obj,
res_comp, res_id, res_injective, res_map, res_mk, res_one, res_subgroup, restrict_inflate,
restrict_mk, restrict_mk_eq_one_iff, restrict_one, transition_injective, transition_mk,
transition_one, transition_refl, transition_trans, twistEquiv_eq_class_iff, twistEquiv_gaugeMap,
twistEquiv_map, twistEquiv_mk, twistEquiv_one, twistNeutralFibreEquiv_apply,
twistNeutralFibreEquiv_basepoint, twistNeutralFibreEquiv_symm_apply, twistRes_comp_translation,
twistRes_identity_translation, twistRes_injective, twistRes_mk, twistRes_one,
twistRes_representative, twistRes_translation, twistedKernelInclusion_fibre,
twistedKernelInclusion_fibre_range_iff, twistedKernelInclusion_image,
twistedKernelInclusion_injective, twistedKernelInclusion_mk, twistedKernelInclusion_one,
twistedKernelInclusion_range_iff, twistedKernelInvariantAction_fibre_iff,
twistedKernelInvariantAction_inclusion, twistedKernelInvariantAction_injective_iff,
twistedKernelInvariantAction_mk, twistedKernelOrbitFibreEquiv_basepoint,
twistedKernelOrbitFibreEquiv_choice_independent, twistedKernelOrbitFibreEquiv_left_inv,
twistedKernelOrbitFibreEquiv_mk, twistedKernelOrbitFibreEquiv_right_inv,
twistedKernelOrbitFibreEquiv_symm_mk, twistedQuotientEquiv_mk, twistedQuotientEquiv_one,
twistedQuotientEquiv_projection, twistedQuotientEquiv_symm_mk, twistedQuotientEquiv_translation,
twistedQuotient_fibre, twistedQuotient_kernel, twistedQuotient_mk, twistedQuotient_one,
twistedQuotient_range_iff.

TauCeti.NonabelianCohomology.Z1:
descendEquiv_apply, descendEquiv_left_inv, descendEquiv_one, descendEquiv_right_inv,
descendEquiv_symm_apply, descend_apply, descend_gauge_iff, descend_inflate, descend_one,
descend_proof_independent, descend_unique, gaugeTransporterEquiv_apply,
gaugeTransporterEquiv_continuous, gaugeTransporterEquiv_symm_apply,
gaugeTransporterEquiv_symm_continuous, gauge_transporter_iff, gauge_witness_fixed,
gauge_witness_unique_iff, inflate_apply, inflate_descend, inflate_gauge_iff, inflate_injective,
inflate_one, inflate_smul, inflate_transition, inflate_trivialOn, kernelGauge_apply,
kernelGauge_gauge, kernelGauge_inclusion, kernelGauge_mul, kernelGauge_one,
kernel_gauge_projects_fixed, map_apply, map_comp, map_id, map_inv, map_one, map_smul, map_trivial,
mem_iff, mem_oneFibre, normalize_trivialOn, oneFibre_eq_ker, oneFibre_eq_top, oneFibre_isClopen,
res_apply, res_comp, res_id, res_injective, res_map, res_one, res_smul, res_subgroup,
restrict_apply, restrict_inflate, restrict_one, restrict_smul, transition_apply,
transition_injective, transition_one, transition_refl, transition_trans, twistEquiv_apply,
twistEquiv_gaugeMap, twistEquiv_map, twistEquiv_smul, twistEquiv_symm_apply, twistRes_apply,
twistRes_injective, twistRes_one, twistRes_smul, twistRes_translation, twistedKernelLift_apply,
twistedKernelLift_gauge, twistedKernelLift_inclusion, twistedKernelLift_injective,
twistedKernelLift_one, twistedQuotientEquiv_apply, twistedQuotientEquiv_gauge,
twistedQuotientEquiv_one, twistedQuotientEquiv_projection, twistedQuotientEquiv_symm_apply,
twistedQuotient_apply, twistedQuotient_gauge, twistedQuotient_one.

Unqualified API:
eventualEquality_iInter, eventualEquality_iff_exists_subset, gauge_transporter_continuous_roundtrip,
gauge_transporter_inverse, gauge_transporter_right_order, gauge_witness_nonunique,
gauge_witness_unique, pathCocycle_apply, pathCocycle_changePoint,
pathCocycle_changed_representative, pathCocycle_distinct_sections, pathCocycle_mul,
pathCocycle_same_sections.

-/

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty
