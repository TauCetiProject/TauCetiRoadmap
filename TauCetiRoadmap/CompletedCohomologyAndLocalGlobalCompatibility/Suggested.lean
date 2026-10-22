import Mathlib

/-!
# CompletedCohomologyAndLocalGlobalCompatibility: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It fixes inverse translation on functions,
contragredient weights, kernel containment for pro-modularity, and tensor evaluation using
Mathlib's intertwining maps. Arithmetic completed towers, local Langlands families and patched
modules have their definitive specifications in README.md. Its local correspondence contracts
use the shared `GL2Block`, `MontrealFunctor` and `WDTypeRing` carriers; the crystalline completion
includes the all-prime nonspecial exceptional case. Patched projectivity uses the uniformizer
algebra `Λ ≅ O[[S]]`, and fixed central characters are specialized over the full central algebra
`Λ_Z` in the category with compact character `ξ` and smooth-dual character `ξ⁻¹`.
-/

noncomputable section
open TensorProduct

namespace TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

/-! ## Layer 1: towers and completed cohomology -/
namespace DefiniteQuaternion

section DefiniteQuaternion
variable (O : Type*) [CommRing O]
variable (X : Type*) [TopologicalSpace X]
variable (M : Type*) [TopologicalSpace M] [AddCommGroup M] [Module O M] [IsTopologicalAddGroup M]
  [ContinuousConstSMul O M]

variable {D : Type*} [Group D] [MulAction D X] [ContinuousConstSMul D X]

/-- Translation by `d ∈ D` on `C(X, M)`. -/
def translate (d : D) : C(X, M) →ₗ[O] C(X, M) where
  toFun f := f.comp ⟨fun x => d⁻¹ • x, continuous_const_smul _⟩
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

variable {Z : Type*} [CommGroup Z] (ι : Z →* D)

/-- `withCentralCharacter`: functions with `f(ι z • x) = ψ(z) f(x)`, Pan's `S_ψ(U^p, M)`. -/
def withCentralCharacter (ψ : Z →* Oˣ) : Submodule O C(X, M) where
  carrier := {f | ∀ z x, f (ι z • x) = (ψ z : O) • f x}
  add_mem' := by
    intro f g hf hg z x
    simp [hf z x, hg z x, smul_add]
  zero_mem' := by intro z x; simp
  smul_mem' := by
    intro c f hf z x
    simp [hf z x, smul_comm c]

omit [ContinuousConstSMul D X] in
/-- For Hausdorff coefficients the central-character submodule is closed: it is an intersection
of evaluation equalizers. -/
theorem withCentralCharacter_isClosed [T2Space M] (ψ : Z →* Oˣ) :
    IsClosed (withCentralCharacter O X M ι ψ : Set C(X, M)) := by
  have h : (withCentralCharacter O X M ι ψ : Set C(X, M)) =
      ⋂ z, ⋂ x, {f : C(X, M) | f (ι z • x) = (ψ z : O) • f x} := by
    ext f
    simp only [Set.mem_iInter]
    rfl
  rw [h]
  exact isClosed_iInter fun z => isClosed_iInter fun x =>
    isClosed_eq (ContinuousEvalConst.continuous_eval_const _)
      ((ContinuousEvalConst.continuous_eval_const x).const_smul _)

/-- Translation by `ι z` acts on the `ψ`-equivariant functions by the scalar `ψ(z)⁻¹`. -/
theorem translate_central_of_mem (ψ : Z →* Oˣ) {f : C(X, M)}
    (hf : f ∈ withCentralCharacter O X M ι ψ) (z : Z) :
    translate O X M (ι z) f = ((ψ z⁻¹ : Oˣ) : O) • f := by
  ext x
  have h := hf z⁻¹ x
  simp only [map_inv] at h
  simpa [translate] using h

/-- Translation uses the inverse, as required for a left action on functions. -/
example (d : D) (f : C(X, M)) (x : X) :
    translate O X M d f (d • x) = f x := by
  simp [translate]

/-- The discrete two-point permutation action has continuous translations. -/
local instance twoPointAction_continuous : ContinuousConstSMul (Equiv.Perm Bool) Bool where
  continuous_const_smul _ := continuous_of_discreteTopology

/-- Translation by the transposition moves the indicator from one point to the other. -/
example :
    translate ℤ Bool ℤ (Equiv.swap false true)
      ⟨fun b => if b then 0 else 1, continuous_of_discreteTopology⟩ true = 1 := by
  simp [translate]

/-- A trivial character cuts out precisely the centre-invariant functions. -/
example (f : C(X, M)) : f ∈ withCentralCharacter O X M ι 1 ↔
    ∀ z x, f (ι z • x) = f x := by
  simp [withCentralCharacter]

/-- For a fixed point, a nontrivial scalar character forces the value to vanish. -/
example {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E]
    (ψ : Z →* Eˣ) (f : C(X, E)) (hf : f ∈ withCentralCharacter E X E ι ψ)
    (z : Z) (x : X) (hx : ι z • x = x) (hψ : (ψ z : E) ≠ 1) : f x = 0 := by
  have h := hf z x
  rw [hx] at h
  have hz : ((ψ z : E) - 1) * f x = 0 := by
    rw [sub_mul, one_mul, ← smul_eq_mul, ← h, sub_self]
  exact (mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hψ)

/-- Continuous functions on a compact free action with finitely many orbits decompose
continuously and equivariantly into regular representations (Dospinescu–Le Bras, Lemma 13.1). -/
theorem functions_free_finite_orbits
    (K : Type*) [Group K] [TopologicalSpace K] [CompactSpace K] [IsTopologicalGroup K]
    [MulAction K X] [ContinuousSMul K X] [CompactSpace X] [T2Space X]
    (hfree : ∀ (k : K) (x : X), k • x = x → k = 1)
    [Finite (MulAction.orbitRel.Quotient K X)] :
    ∃ s : ℕ, ∃ e : C(X, M) ≃L[O] (Fin s → C(K, M)),
      ∀ (k : K) (f : C(X, M)) (i : Fin s),
        e (translate O X M k f) i = translate O K M k (e f i) := sorry

/-- An empty space has zero regular summands, with continuous equivariant comparison. -/
theorem functions_free_finite_orbits_empty [IsEmpty X]
    (K : Type*) [Group K] [TopologicalSpace K] [ContinuousMul K]
    [MulAction K X] [ContinuousConstSMul K X] :
    ∃ e : C(X, M) ≃L[O] (Fin 0 → C(K, M)),
      ∀ (k : K) (f : C(X, M)) (i : Fin 0),
        e (translate O X M k f) i = translate O K M k (e f i) :=
  ⟨{ LinearEquiv.ofSubsingleton _ _ with
      continuous_toFun := continuous_of_const fun _ _ => Subsingleton.elim _ _
      continuous_invFun := continuous_of_const fun _ _ => Subsingleton.elim _ _ },
    fun _ _ i => i.elim0⟩

end DefiniteQuaternion

/-! ## Layer 2: classical specialisations -/
section ClassicalForms
variable (E : Type*) [NontriviallyNormedField E] [CompleteSpace E]
variable (X : Type*) [TopologicalSpace X]
variable {K : Type*} [Group K] [MulAction K X] [ContinuousConstSMul K X]
variable (W : Type*) [AddCommGroup W] [Module E W] [TopologicalSpace W] [IsTopologicalAddGroup W]
  [ContinuousSMul E W] [T2Space W] (ρ : Representation E K W)

/-- `A_K(W)`: continuous `f : X → W` with `f (k • x) = ρ k (f x)`. -/
def weightedForms : Submodule E C(X, W) where
  carrier := {f | ∀ (k : K) x, f (k • x) = ρ k (f x)}
  add_mem' := by intro f g hf hg k x; simp [hf k x, hg k x]
  zero_mem' := by intro k x; simp
  smul_mem' := by intro c f hf k x; simp [hf k x]

/-- The `K`-equivariant maps `W^* → C(X, E)`, with `K` acting on `W^*` contragrediently and on
`C(X, E)` by translation. -/
def equivariantDualMaps : Submodule E (Module.Dual E W →ₗ[E] C(X, E)) where
  carrier := {φ | ∀ (k : K) (l : Module.Dual E W),
    φ (l ∘ₗ ρ k⁻¹) = translate E X E k (φ l)}
  add_mem' := by intro φ ψ hφ hψ k l; simp [hφ k l, hψ k l]
  zero_mem' := by intro k l; simp
  smul_mem' := by intro c φ hφ k l; simp [hφ k l]

/-- Dospinescu–Le Bras Lemme 4.5, in the finite-dimensional case (the topology of `W` is the
canonical one, since `E` is complete and `W` is Hausdorff): the equivalence is given by the
pairing `ℓ (f x) = φ ℓ x`. -/
theorem weightedForms_equiv [FiniteDimensional E W] :
    ∃ e : equivariantDualMaps E X W ρ ≃ₗ[E] weightedForms E X W ρ,
      ∀ φ (l : Module.Dual E W) (x : X),
        l ((e φ : C(X, W)) x) = (φ : Module.Dual E W →ₗ[E] C(X, E)) l x := sorry

/-- For the regular action, evaluation at the identity determines every weighted value. -/
example (K : Type*) [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    (ρ : Representation E K W) (f : weightedForms E K W ρ) (k : K) :
    (f : C(K, W)) k = ρ k ((f : C(K, W)) 1) := by
  simpa using f.property k 1

/-- At a fixed point, a weight with no fixed vectors forces the form to vanish. -/
example (f : C(X, W)) (hf : f ∈ weightedForms E X W ρ) (k : K) (x : X)
    (hx : k • x = x) (hweight : ∀ w : W, ρ k w = w → w = 0) : f x = 0 := by
  apply hweight
  exact (hx ▸ hf k x).symm

/-- The inverse in the contragredient and the inverse in translation cancel at `k • x`. -/
example (φ : Module.Dual E W →ₗ[E] C(X, E))
    (hφ : φ ∈ equivariantDualMaps E X W ρ) (k : K) (l : Module.Dual E W) (x : X) :
    φ (l ∘ₗ ρ k⁻¹) (k • x) = φ l x := by
  rw [hφ k l]
  simp [translate]

end ClassicalForms


/-! ## Layer 3: Hecke and deformation actions -/
section ProModular
variable {O T : Type*} [CommRing O] [CommRing T] [Algebra O T]

/-- `eisensteinIdeal`: generated by `ϖ` and `T_v − (1 + χ(Frob_v))` for `v` outside `S`. -/
def eisensteinIdeal (ϖ : O) {V : Type*} (Tv : V → T) (χ : V → O) : Ideal T :=
  Ideal.span (insert (algebraMap O T ϖ) (Set.range fun v => Tv v - (1 + algebraMap O T (χ v))))

/-- With no away primes the Eisenstein ideal still contains exactly the coefficient relation. -/
example (ϖ : O) (Tv : Empty → T) (χ : Empty → O) :
    eisensteinIdeal ϖ Tv χ = Ideal.span {algebraMap O T ϖ} := by
  have hr : Set.range (fun v : Empty => Tv v - (1 + algebraMap O T (χ v))) = ∅ := by
    ext x
    constructor
    · rintro ⟨v, _⟩
      exact nomatch v
    · simp
  rw [eisensteinIdeal, hr]
  simp

/-- A unit trace discrepancy makes the Eisenstein ideal improper. -/
example (ϖ : O) {V : Type*} (Tv : V → T) (χ : V → O) (v : V)
    (hunit : IsUnit (Tv v - (1 + algebraMap O T (χ v)))) :
    eisensteinIdeal ϖ Tv χ = ⊤ := by
  exact Ideal.eq_top_of_isUnit_mem _
    (Ideal.subset_span (Set.mem_insert_of_mem _ (Set.mem_range_self v))) hunit

variable {R : Type*} [CommRing R]

/-- `IsProModular`: a prime of the pseudo-deformation ring containing the kernel of the map to
the localised Hecke algebra (Pan 4.1.3). -/
def IsProModular (φ : R →+* T) (q : PrimeSpectrum R) : Prop :=
  RingHom.ker φ ≤ q.asIdeal

/-- `IsProModular.of_le`: pro-modularity is closed under specialisation. -/
theorem IsProModular.of_le {φ : R →+* T} {q q' : PrimeSpectrum R} (hq : IsProModular φ q)
    (h : q ≤ q') : IsProModular φ q' :=
  le_trans hq h

/-- Along a surjection, the pro-modular primes are exactly the contractions of primes of the
Hecke quotient. -/
theorem IsProModular.iff_mem_range {φ : R →+* T} (hφ : Function.Surjective φ)
    (q : PrimeSpectrum R) : IsProModular φ q ↔ q ∈ Set.range (PrimeSpectrum.comap φ) := by
  rw [range_comap_of_surjective T φ hφ, PrimeSpectrum.mem_zeroLocus]
  rfl

/-- The zero Hecke quotient has no pro-modular prime. -/
example (φ : R →+* T) [Subsingleton T] (q : PrimeSpectrum R) : ¬ IsProModular φ q := by
  intro h
  have h1 : (1 : R) ∈ RingHom.ker φ := by
    rw [RingHom.mem_ker]
    exact Subsingleton.elim _ _
  exact q.isPrime.ne_top (Ideal.eq_top_of_isUnit_mem _ (h h1) isUnit_one)

/-- The identity Hecke quotient makes every prime pro-modular. -/
example (q : PrimeSpectrum R) : IsProModular (RingHom.id R) q := by
  intro r hr
  have hz : r = 0 := hr
  rw [hz]
  exact q.asIdeal.zero_mem

end ProModular

end DefiniteQuaternion

/-! ## Layer 4: p-adic local–global compatibility -/
section Multiplicity
variable (E : Type*) [Field E] {G : Type*} [Group G]
variable {V H : Type*} [AddCommGroup V] [Module E V] [AddCommGroup H] [Module E H]
variable (ρV : Representation E G V) (ρH : Representation E G H)

/-- Evaluation `V ⊗ Hom_G(V,H) → H` on Mathlib's intertwining-map carrier. -/
def multiplicityEvaluation : V ⊗[E] Representation.IntertwiningMap ρV ρH →ₗ[E] H :=
  TensorProduct.lift
    { toFun := fun v => { toFun := fun f => f v
                          map_add' := fun _ _ => rfl
                          map_smul' := fun _ _ => rfl }
      map_add' := fun _ _ => by ext f; simp
      map_smul' := fun _ _ => by ext f; simp }

/-- The algebraic injectivity step in Emerton Proposition 5.5.3: irreducibility and scalar
endomorphisms are retained, before making any topological or integral comparison. -/
theorem multiplicityEvaluation_injective [FiniteDimensional E V]
    (hirr : ∀ W : Submodule E V, (∀ g, W.map (ρV g) ≤ W) → W = ⊥ ∨ W = ⊤)
    (hschur : ∀ f : Representation.IntertwiningMap ρV ρV,
      ∃ c : E, f.toLinearMap = c • LinearMap.id) :
    Function.Injective (multiplicityEvaluation E ρV ρH) := sorry

/-- Irreducibility cannot be dropped: for trivial actions on `E²` and on `E`, evaluation is not
injective. -/
theorem multiplicityEvaluation_trivial_not_injective :
    ¬ Function.Injective (multiplicityEvaluation E
      (Representation.trivial E G (Fin 2 → E)) (Representation.trivial E G E)) := by
  intro hinj
  let f : Representation.IntertwiningMap (Representation.trivial E G (Fin 2 → E))
      (Representation.trivial E G E) :=
    ⟨LinearMap.proj 1, fun g => by ext; simp⟩
  have h0 : multiplicityEvaluation E _ _ ((Pi.single 0 1 : Fin 2 → E) ⊗ₜ[E] f) = 0 := by
    simp [multiplicityEvaluation, f]
  have hz : ((Pi.single 0 1 : Fin 2 → E) ⊗ₜ[E] f) = 0 :=
    hinj (by rw [h0, map_zero])
  let test : (Fin 2 → E) ⊗[E] Representation.IntertwiningMap
      (Representation.trivial E G (Fin 2 → E)) (Representation.trivial E G E) →ₗ[E] E :=
    TensorProduct.lift
      { toFun := fun v => { toFun := fun g => v 0 * g (Pi.single 1 1)
                            map_add' := fun _ _ => by simp [mul_add]
                            map_smul' := fun _ _ => by simp; ring }
        map_add' := fun _ _ => by ext; simp [add_mul]
        map_smul' := fun _ _ => by ext; simp [mul_assoc] }
  have h1 : test ((Pi.single 0 1 : Fin 2 → E) ⊗ₜ[E] f) = 1 := by
    simp [test, f]
  rw [hz, map_zero] at h1
  exact zero_ne_one h1

/-- Evaluation is equivariant: the group acts on the vector factor and on the target, not on
the multiplicity factor. -/
example (g : G) (v : V) (f : Representation.IntertwiningMap ρV ρH) :
    multiplicityEvaluation E ρV ρH (ρV g v ⊗ₜ[E] f) =
      ρH g (multiplicityEvaluation E ρV ρH (v ⊗ₜ[E] f)) :=
  Representation.IntertwiningMap.isIntertwining ρV ρH f g v
end Multiplicity

/-! ## Layer 5: patched completed modules and support -/
section Support
variable (R : Type*) [CommRing R] (M : Type*) [AddCommGroup M] [Module R M]

/-- The finite span of Iwasawa generators has the same scalar annihilator, even when the
whole module is not finite over the scalar ring (Emerton–Paškūnas, Lemma 6.2, p. 26). -/
theorem annihilator_span_eq {B : Type*} [Ring B] [Module B M] [SMulCommClass R B M]
    (S : Set M) (hS : Submodule.span B S = ⊤) :
    Module.annihilator R (Submodule.span R S) = Module.annihilator R M := sorry
end Support

/-!
The basic translation API `translate_one`, `translate_mul`, `translate_apply_smul` and
`withCentralCharacter_mem` is specified in README.md §1.6.
The remaining targets of Layers 1–6 are in README.md: modular and Shimura tower comparisons;
central-character quaternionic completed modules and their homology duals; global Serre weights
and good weights; typed finite-level modules; arithmetic Hecke and deformation actions; local
Langlands families, their integral smooth-dual comparison and multiplicity modules; canonical
and θ-family compatibility, its mod-p and homology forms, Pan's block compatibility and Scholze's
comparison on the all-p-level Shimura tower with admissible torsion coefficients; the full
Lubin–Tate period torsor; patched Jacquet and trianguline geometry on the relative Robba and
triangulation carriers of PhiGammaModulesAndIwasawaCohomology, one-place partial type and
component specialisation, typed supports and ordinary and non-ordinary component coverage;
promodularity, Böckle's R = T, the normalised global locally algebraic formula, quaternionic
globalisation and the dependency statements for the lifting theorems.
-/

end TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility
