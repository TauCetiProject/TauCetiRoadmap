import Mathlib
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.TopologicallyFiniteType.Basic
import TauCeti.RingTheory.Huber.Uniform
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.Topology.Algebra.Module.Compact
import TauCetiRoadmap.AdicEtaleGeometry.Suggested
import TauCetiRoadmap.PerfectoidSpaces.Suggested

/-!
# Foundations of adic spaces, Part IV: representative target signatures

This file is a set of suggested forms, not an exhaustive checklist: the README is definitive.

Huber rings and pairs, adic spectra, rational localisations, Tate algebras and the category
`TauCeti.AdicSpace` are Tau Ceti's; AdicSpacesPartII supplies affinoid charts and Huber's
morphism classes, PerfectoidSpaces the perfectoid Tate-ring predicate, AdicEtaleGeometry open subspaces, the étale morphisms by local description and fibre products. RigidAnalyticGeometry Layers 3–4 supply reducedness of rational affinoid subdomains;
the plus-ring comparison belongs to R5.6's `rational-integral-compatibility` in the README.
Completeness includes the Hausdorff property. This file states the parts that are a few lines
over these carriers:

* R4: strict normal crossings charts of rings, of complete affinoid algebras and of smooth schemes;
* R5: BHW's sousperfectoid product of a perfectoid space with a smooth space, profinite flat modules,
  small `ℤ_p`-algebras and the integral mixed completed tensor product;
* F1: overconvergent power series, dagger algebras and their completions, weak completions,
  algebras of Monsky–Washnitzer type and universally finite differentials.

The étale and pro-étale sites on these carriers, smooth pairs as global objects, the boundary
complement functors, coefficient sheaves, dagger spaces, their de Rham cohomology with supports
and compact supports, duality and finiteness are README targets. F1.10's
*dagger-projection-fringe-comparison* supplies the relative coherent comparison for proper
product projections and their relative differential sheaves, and constructs the dagger-valued
trace from rigid traces on larger affinoid bases over a complete discretely valued
mixed-characteristic field. Its completion and restriction compatibilities supply
*dagger-proper-projection-trace* and its supported and embedding-independence applications.
-/

noncomputable section

namespace TauCetiRoadmap.AdicSpacesPartIV

open TauCeti

/-! ## Headline R5.5: products with smooth spaces (*perfectoid-times-smooth-fibre-product*) -/

namespace AdicSpace

open CategoryTheory TauCeti.Huber
open TauCetiRoadmap.AdicSpacesPartII.AdicSpace (Affinoid Chart Smooth)
open TauCetiRoadmap.AdicEtaleGeometry.AdicSpace (FibreProduct)
open TauCetiRoadmap.PerfectoidSpaces.Perfectoid (IsPerfectoidTateRing)

/-- BHW's product: for perfectoid fields `L → L'` (as affinoids `Spa(L, O_L)`, `Spa(L', O_{L'})`),
a perfectoid space `X` over `L` and a smooth `Y` over `L'`, the fibre product `X ×_L Y` exists and
is sousperfectoid, as in *perfectoid-times-smooth-fibre-product* (BHW, Cor. 3.4, pp. 1724–1725). -/
theorem perfectoidTimesSmooth_exists (p : ℕ) [Fact p.Prime] (L L' : Affinoid)
    (hL : IsField L.ring) (hL' : IsField L'.ring) [IsTateRing L.ring] [IsTateRing L'.ring]
    [IsPerfectoidTateRing p L.ring] [IsPerfectoidTateRing p L'.ring]
    (hLplus : L.pair.plus = powerBoundedSubring L.ring)
    (hLplus' : L'.pair.plus = powerBoundedSubring L'.ring) (σ : L'.spa ⟶ L.spa)
    (X Y : TauCeti.AdicSpace) (f : X ⟶ L.spa) (g : Y ⟶ L'.spa)
    (hX : ∀ x : X.obj, ∃ (c : Chart X) (_ : IsTateRing c.affinoid.ring),
      IsPerfectoidTateRing p c.affinoid.ring ∧ x ∈ Set.range c.ι.hom.base)
    (hg : Smooth g) :
    ∃ P : FibreProduct f (g ≫ σ),
      PerfectoidSpaces.AdicSpace.IsSousperfectoid p P.space := sorry

end AdicSpace

/-! ## Layer R4: étale sites, smooth pairs and boundary complements -/

/-! ### R4.7 Strict normal crossings charts (*smooth-pair*, *analytification-of-smooth-pair*) -/

namespace SmoothPair

open MvPolynomial

section Algebraic

variable (K : Type*) [Field K]

/-- A relative strict normal crossings chart of an ideal `I` of a `K`-algebra `R` (structure map
`σ`): integers `r ≤ n` and an étale ring map `coord : K[T₁, …, Tₙ] → R` over `K` with
`I = (coord (T₁ ⋯ T_r))`; `r = 0` gives `I = R`, the empty boundary (DLLZ-A, Ex. 2.3.17,
pp. 16–17). -/
structure AlgebraicChart {R : Type*} [CommRing R] (σ : K →+* R) (I : Ideal R) where
  /-- The dimension of the target affine space. -/
  n : ℕ
  /-- The number of coordinates cutting out the boundary. -/
  r : ℕ
  le : r ≤ n
  /-- The coordinate map `Tᵢ ↦ coord Tᵢ`. -/
  coord : MvPolynomial (Fin n) K →+* R
  coord_comp_C : coord.comp MvPolynomial.C = σ
  etale : coord.Etale
  ideal_eq : I = Ideal.span {coord (∏ i : Fin r, X (Fin.castLE le i))}

/-- The identity chart of `K[T₁, …, Tₙ]` with boundary ideal `(T₁ ⋯ T_r)`. -/
def modelAlgebraicChart (n r : ℕ) (hr : r ≤ n) :
    AlgebraicChart K (C : K →+* MvPolynomial (Fin n) K)
      (Ideal.span {∏ i : Fin r, X (Fin.castLE hr i)}) where
  n := n
  r := r
  le := hr
  coord := RingHom.id _
  coord_comp_C := rfl
  etale := RingHom.Etale.of_bijective Function.bijective_id
  ideal_eq := rfl

variable {K}

/-- In a chart the generator `coord (T₁ ⋯ T_r)` is a non-zero-divisor (étale maps are flat) and
the ideal is radical (étale over the reduced `K[T]/(T₁ ⋯ T_r)`): the boundary is a reduced
effective Cartier divisor. -/
theorem AlgebraicChart.isCartier {R : Type*} [CommRing R] {σ : K →+* R} {I : Ideal R}
    (c : AlgebraicChart K σ I) :
    c.coord (∏ i : Fin c.r, X (Fin.castLE c.le i)) ∈ nonZeroDivisors R ∧ I.IsRadical := sorry

end Algebraic

/-- The boundary case of *smooth-pair*: the zero ideal has no chart over a
nonzero ring, the generator of a chart being a non-zero-divisor. -/
theorem AlgebraicChart.no_full_boundary (K : Type*) [Field K] {R : Type*} [CommRing R]
    [Nontrivial R] (σ : K →+* R) :
    IsEmpty (AlgebraicChart K σ ⊥) := sorry

section SchemePair

open AlgebraicGeometry CategoryTheory

universe u

/-- An algebraic strict normal crossings pair over a field `K`: a scheme smooth over `K` with an
ideal sheaf `D` admitting a relative chart (`AlgebraicChart`) on an affine open neighbourhood of
every point, over the `K`-algebra structure induced by the structure morphism. Its local branches
and their partial intersections are smooth over `K` of the expected codimensions. For a complete
nonarchimedean `K`, dagger analytification of this pair requires the structure morphism to be
separated and of finite type. -/
structure AlgebraicSmoothPair (K : Type u) [Field K] where
  /-- The underlying scheme. -/
  X : Scheme.{u}
  /-- The structure morphism to `Spec K`. -/
  toSpec : X ⟶ Spec (CommRingCat.of K)
  smooth : Smooth toSpec
  /-- The ideal sheaf of the boundary. -/
  D : X.IdealSheafData
  exists_chart : ∀ x : X, ∃ U : X.affineOpens, x ∈ U.1 ∧
    Nonempty (AlgebraicChart K
      ((Scheme.ΓSpecIso (CommRingCat.of K)).inv ≫ toSpec.appLE ⊤ U.1 (by simp)).hom
      (D.ideal U))

end SchemePair

section Affinoid

open TauCeti.Huber TauCetiRoadmap.AdicSpacesPartII.Huber

universe u

variable (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsTateRing K]

/-- An affinoid strict normal crossings chart of the ideal `I` of a complete Huber pair `(A, A⁺)`
over `K`: a morphism of Huber pairs `(K⟨T₁, …, Tₙ⟩, K⟨T⟩°) → (A, A⁺)` over `K`, topologically of
finite type and étale in Huber's lifting sense (AdicSpacesPartII `Etale_affinoid`), with
`I = (h(T₁ ⋯ T_r))` as an equality of ideals (DLLZ-A, Ex. 2.3.17, pp. 16–17; Huber96,
Def. 1.6.5). -/
structure AffinoidChart {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [Algebra K A]
    (S : Pair A) (I : Ideal A) where
  /-- The dimension of the polydisc. -/
  n : ℕ
  /-- The number of boundary coordinates. -/
  r : ℕ
  le : r ≤ n
  /-- The coordinate map. -/
  coord : Pair.Hom (Pair.powerBounded (restrictedMvPowerSeriesCompletion n K)) S
  scalars : coord.toRingHom.comp (algebraMap K _) = algebraMap K A
  finiteType : IsTopologicallyFiniteType coord.toRingHom
  etale : AdicSpacesPartII.AdicSpace.Etale_affinoid.{u, u, u} coord
  ideal_eq : I = Ideal.span {(coord.toRingHom
    (TateAlgebra.ofMvPolynomial K n (∏ i : Fin r, X (Fin.castLE le i))))}

variable {K}
variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A] [Algebra K A] {S : Pair A} {I : Ideal A}

/-- The boundary of an affinoid chart is a reduced effective Cartier divisor. -/
theorem AffinoidChart.isCartier (c : AffinoidChart K S I) :
    c.coord.toRingHom (TateAlgebra.ofMvPolynomial K c.n
      (∏ i : Fin c.r, X (Fin.castLE c.le i))) ∈ nonZeroDivisors A ∧ I.IsRadical := sorry

/-- On a chart the boundary complement is the locus where every boundary coordinate has nonzero
valuation; for `r = 0` it is everything (Huber96, §1.1, pp. 38–39). -/
theorem AffinoidChart.mem_complement_iff (c : AffinoidChart K S I)
    (v : ValuationSpectrum.spa S.plus) :
    ¬ I ≤ v.1.supp ↔ ∀ i : Fin c.r, c.coord.toRingHom (TateAlgebra.ofMvPolynomial K c.n
      (X (Fin.castLE c.le i))) ∉ v.1.supp := sorry

end Affinoid

/-- The boundary case of *smooth-pair*: a doubled origin `(T²)` in `K⟨T⟩` admits no
chart, in every characteristic. -/
theorem AffinoidChart.no_doubled_origin (K : Type) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] [Huber.IsTateRing K] :
    IsEmpty (AffinoidChart K
      (Huber.Pair.powerBounded (Huber.restrictedMvPowerSeriesCompletion 1 K))
      (Ideal.span {(AdicSpacesPartII.Huber.TateAlgebra.ofMvPolynomial K 1 (X 0)) ^ 2})) := sorry

end SmoothPair

/-! ## Layer R5: coefficient algebras -/

namespace Huber

open TauCeti.Huber

universe u v

/-! ### R5.6 Coefficient algebras
(*profinite-flat-module*, *profinite-flat-pseudobasis*, *small-coefficient-algebra*,
*mixed-completed-tensor*, *mixed-completed-tensor-product-formula*,
*mixed-completed-tensor-exactness*) -/

section ProfiniteFlat

variable (O : Type u) [CommRing O] [TopologicalSpace O] (M : Type v) [AddCommGroup M] [Module O M]
  [TopologicalSpace M]

/-- A *profinite flat* `O`-module: a compact totally disconnected topological `O`-module (Tau Ceti
`IsCompactModule`, hence Hausdorff and linearly topologised over a compact `O`) that is flat
(CHJ, Def. 6.1, p. 46). -/
structure IsProfiniteFlat : Prop where
  isCompactModule : IsCompactModule O M
  flat : Module.Flat O M

variable {O} in
/-- Pseudobases: over a DVR with a compact Hausdorff ring topology, `M` is profinite flat iff it is
isomorphic to some `∏_{i ∈ I} O` as a topological module (CHJ, Prop. 6.2, p. 46). -/
theorem IsProfiniteFlat.iff_exists_pseudobasis [IsDomain O] [IsDiscreteValuationRing O]
    [IsTopologicalRing O] [CompactSpace O] [T2Space O] :
    IsProfiniteFlat O M ↔ ∃ I : Type v, Nonempty (M ≃L[O] (I → O)) := sorry

/-- A profinite flat module is `𝔪`-adically complete and separated. -/
theorem IsProfiniteFlat.isAdicComplete [IsDomain O] [IsDiscreteValuationRing O]
    [IsTopologicalRing O] [CompactSpace O] [T2Space O] (h : IsProfiniteFlat O M) :
    IsAdicComplete (IsLocalRing.maximalIdeal O) M := sorry

end ProfiniteFlat

section Small

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra ℤ_[p] R]

/-- A *small* `ℤ_p`-algebra: reduced, `p`-torsion-free and finite over some `ℤ_p⟦X₁, …, X_d⟧`
(CHJ, §1.4, p. 7). -/
class IsSmallZpAlgebra : Prop where
  isReduced : IsReduced R
  isSMulRegular_p : IsSMulRegular R (p : R)
  exists_finite : ∃ (d : ℕ) (φ : MvPowerSeries (Fin d) ℤ_[p] →ₐ[ℤ_[p]] R), φ.toRingHom.Finite

/-- The canonical topology of a small `ℤ_p`-algebra: the adic topology of its Jacobson radical
(an ideal of definition). -/
@[instance_reducible]
def IsSmallZpAlgebra.topology [IsSmallZpAlgebra p R] : TopologicalSpace R :=
  (⊥ : Ideal R).jacobson.adicTopology

/-- Small `ℤ_p`-algebras are noetherian. -/
theorem IsSmallZpAlgebra.isNoetherianRing [IsSmallZpAlgebra p R] : IsNoetherianRing R := sorry

/-- With its canonical topology a small `ℤ_p`-algebra is a profinite flat `ℤ_p`-module, and it is
`p`-adically complete. -/
theorem IsSmallZpAlgebra.isProfiniteFlat [IsSmallZpAlgebra p R] :
    (letI := IsSmallZpAlgebra.topology p R; IsProfiniteFlat ℤ_[p] R) ∧
      IsAdicComplete (Ideal.span {(p : R)}) R := sorry

end Small

section MixedTensor

open TensorProduct

variable (O : Type u) [CommRing O]

/-- `V₀ ⊆ V` is an *open bounded lattice* for `ϖ`: open, bounded (every neighbourhood of `0`
contains some `ϖⁿ V₀`) and `V₀[1/ϖ] = V`. -/
def IsOpenBoundedLattice {V : Type*} [AddCommGroup V] [Module O V] [TopologicalSpace V] (ϖ : O)
    (V₀ : Submodule O V) : Prop :=
  IsOpen (V₀ : Set V) ∧ (∀ U ∈ nhds (0 : V), ∃ n : ℕ, ∀ v ∈ V₀, ϖ ^ n • v ∈ U) ∧
    ∀ v : V, ∃ n : ℕ, ϖ ^ n • v ∈ V₀

/-- The integral mixed completed tensor product `X ⊗̂ M := lim_N X ⊗_O M/N` over the open
submodules `N` of `M`, as the compatible families (CHJ, Def. 6.3, p. 46). For coefficient
algebras with a basis of open ideals, this construction includes non-adic `O`-structure maps;
comparison with Part III's adic completed tensor requires both structure maps to be adic. -/
def mixedTensorInt (X : Type*) [AddCommGroup X] [Module O X] (M : Type*) [AddCommGroup M]
    [Module O M] [TopologicalSpace M] :
    Submodule O ((N : {N : Submodule O M // IsOpen (N : Set M)}) → X ⊗[O] (M ⧸ N.1)) where
  carrier := {f | ∀ (N N' : {N : Submodule O M // IsOpen (N : Set M)}) (h : N'.1 ≤ N.1),
    (Submodule.factor h).lTensor X (f N') = f N}
  add_mem' {f g} hf hg N N' h := by
    simp only [Pi.add_apply, map_add, hf N N' h, hg N N' h]
  zero_mem' N N' h := by simp
  smul_mem' c f hf N N' h := by
    simp only [Pi.smul_apply, map_smul, hf N N' h]

/-- The rational mixed completed tensor product `V ⊗̂ M := (V₀ ⊗̂ M)[1/ϖ]` for a lattice
`V₀ ⊆ V` (CHJ, Def. 6.6, p. 47). -/
abbrev mixedTensorOfLattice (ϖ : O) {V : Type*} [AddCommGroup V] [Module O V] (V₀ : Submodule O V)
    (M : Type*) [AddCommGroup M] [Module O M] [TopologicalSpace M] :=
  LocalizedModule (Submonoid.powers ϖ) (mixedTensorInt O V₀ M)

variable {O}
variable {M : Type*} [AddCommGroup M] [Module O M] [TopologicalSpace M]

/-- The pure tensor `x ⊗ m`, with component `x ⊗ (m mod N)` at every open `N`. -/
def mixedTensorInt.tmul {X : Type*} [AddCommGroup X] [Module O X] (x : X) (m : M) :
    mixedTensorInt O X M :=
  ⟨fun N ↦ x ⊗ₜ[O] (Submodule.mkQ N.1 m), by
    intro N N' h
    simp⟩

/-- The map `X ⊗̂ M → Y ⊗̂ M` induced by `f : X → Y`, acting by `f ⊗ id` on every component. -/
def mixedTensorInt.map {X Y : Type*} [AddCommGroup X] [Module O X] [AddCommGroup Y] [Module O Y]
    (f : X →ₗ[O] Y) : mixedTensorInt O X M →ₗ[O] mixedTensorInt O Y M where
  toFun z := ⟨fun N ↦ f.rTensor (M ⧸ N.1) (z.1 N), by
    intro N N' h
    change (Submodule.factor h).lTensor Y (f.rTensor _ (z.1 N')) = f.rTensor _ (z.1 N)
    rw [← z.2 N N' h, ← LinearMap.comp_apply, ← LinearMap.comp_apply,
      LinearMap.lTensor_comp_rTensor, LinearMap.rTensor_comp_lTensor]⟩
  map_add' z t := by ext N; simp
  map_smul' c z := by ext N; simp

/-- The product formula: for a pseudobasis `e : M ≃ ∏_I O` over a compact Hausdorff DVR, the
mixed tensor `X ⊗̂ M` is `∏_I X̂` (`X̂` the `𝔪`-adic completion), with `x ⊗ m ↦ (e(m)ᵢ x)ᵢ`
(CHJ, Prop. 6.4, p. 46). -/
theorem mixedTensorInt.nonempty_piEquiv [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O] (X : Type*)
    [AddCommGroup X] [Module O X] {I : Type*} (e : M ≃L[O] (I → O)) :
    ∃ E : mixedTensorInt O X M ≃ₗ[O] (I → AdicCompletion (IsLocalRing.maximalIdeal O) X),
      ∀ (x : X) (m : M) (i : I),
        E (mixedTensorInt.tmul x m) i = AdicCompletion.of _ X (e m i • x) := sorry

/-- Exactness: for profinite flat `M`, `− ⊗̂ M` is exact on short exact sequences of
`𝔪`-adically complete modules (CHJ, Cor. 6.5(1), p. 47). -/
theorem mixedTensorInt.exact_of_isAdicComplete [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O]
    (hM : IsProfiniteFlat O M) {X Y Z : Type*} [AddCommGroup X] [Module O X] [AddCommGroup Y]
    [Module O Y] [AddCommGroup Z] [Module O Z]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) X]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) Y]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) Z]
    (f : X →ₗ[O] Y) (g : Y →ₗ[O] Z) (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g) :
    Function.Injective (mixedTensorInt.map (M := M) f) ∧
      Function.Exact (mixedTensorInt.map (M := M) f) (mixedTensorInt.map (M := M) g) ∧
        Function.Surjective (mixedTensorInt.map (M := M) g) := sorry

/-- Lattice independence: two open bounded lattices of a space on which `ϖ` acts bijectively give
isomorphic `V ⊗̂ M`, compatibly with pure tensors (CHJ, Cor. 6.5(2) and after Def. 6.6, p. 47). -/
theorem mixedTensorOfLattice.nonempty_equiv [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O]
    (hM : IsProfiniteFlat O M) {ϖ : O} (hϖ : Irreducible ϖ) {V : Type*} [AddCommGroup V]
    [Module O V] [TopologicalSpace V] (hV : Function.Bijective fun v : V ↦ ϖ • v)
    (V₀ V₁ : Submodule O V) (h₀ : IsOpenBoundedLattice O ϖ V₀)
    (h₁ : IsOpenBoundedLattice O ϖ V₁) (hc : IsAdicComplete (Ideal.span {ϖ}) V₀) (hle : V₀ ≤ V₁) :
    ∃ E : mixedTensorOfLattice O ϖ V₀ M ≃ₗ[O] mixedTensorOfLattice O ϖ V₁ M,
      ∀ (x : V₀) (m : M), E (LocalizedModule.mk (mixedTensorInt.tmul x m) 1) =
        LocalizedModule.mk (mixedTensorInt.tmul (Submodule.inclusion hle x) m) 1 := sorry

end MixedTensor

end Huber

/-! ## Layer F1: dagger algebras and overconvergent differentials -/

namespace Dagger

open Filter Topology

/-! ### F1.1 Overconvergent power series
(*radius-tate-algebra-affinoid*, *overconvergent-tate-algebra*,
*overconvergent-tate-algebra-properties*, *overconvergent-faithful-flatness*) -/

section Radius

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- The constant-polyradius specialisation of RestrictedPowerSeries §0.1 on the native carrier.
The `K`-subalgebra of restricted series at the constant polyradius `ρ`, used to define `W_n`.
The coefficient construction does not require completeness of `K`. -/
def radiusTate (ρ : ℝ) : Subalgebra K (MvPowerSeries (Fin n) K) :=
  { MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ ρ) with
    algebraMap_mem' := fun c ↦ by
      change MvPowerSeries.IsRestricted _ _
      rw [MvPowerSeries.algebraMap_apply, Algebra.algebraMap_self, RingHom.id_apply]
      exact MvPowerSeries.isRestricted_C _ c }

/-- The constant-polyradius specialisation of RestrictedPowerSeries §1.1's native Gauss norm.
The Gauss-norm function at the constant polyradius `ρ`, used at radius `1` in the unit criterion
for `W_n`; its norm interpretation applies only to series restricted at `ρ > 0`. -/
def radiusGaussNorm (ρ : ℝ) (f : MvPowerSeries (Fin n) K) : ℝ :=
  MvPowerSeries.gaussNorm (fun a : K ↦ ‖a‖) (fun _ : Fin n ↦ ρ) f

end Radius

section Washnitzer

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- The Monsky–Washnitzer algebra `W_n = K⟨X₁, …, Xₙ⟩† = ⋃_{ρ > 1} T_n(ρ)` of overconvergent
power series (GK00, §1, 1.2, p. 3). -/
def washnitzerAlgebra : Subalgebra K (MvPowerSeries (Fin n) K) :=
  ⨆ ρ : {ρ : ℝ // 1 < ρ}, radiusTate n K ρ

/-- The variable `Xᵢ ∈ W_n`. -/
def washnitzerAlgebra.X (i : Fin n) : washnitzerAlgebra n K :=
  ⟨MvPowerSeries.X i, le_iSup (fun ρ : {ρ : ℝ // 1 < ρ} ↦ radiusTate n K ρ)
    ⟨2, by norm_num⟩ (MvPowerSeries.isRestricted_monomial _ _ _)⟩

variable {n K}

/-- `f ∈ W_n` iff `|a_ν| ≤ C ρ^{-|ν|}` for some `ρ > 1` and `C`. -/
theorem mem_washnitzerAlgebra_iff {f : MvPowerSeries (Fin n) K} :
    f ∈ washnitzerAlgebra n K ↔ ∃ ρ > (1 : ℝ), ∃ C : ℝ, ∀ ν : Fin n →₀ ℕ,
      ‖MvPowerSeries.coeff ν f‖ ≤ C * (ρ ^ Finsupp.degree ν)⁻¹ := sorry

/-- An element of `W_n` is a unit iff `|f − f(0)| < |f(0)|` for the Gauss norm. -/
theorem isUnit_washnitzerAlgebra_iff (f : washnitzerAlgebra n K) :
    IsUnit f ↔ radiusGaussNorm n K 1 ((f : MvPowerSeries (Fin n) K) -
        MvPowerSeries.C (MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K))) <
      ‖MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K)‖ := sorry

/-- `W_n` lies in the restricted series at trivial weights, whose completion is Tau Ceti's Tate
algebra `K⟨X₁, …, Xₙ⟩`. -/
theorem washnitzerAlgebra_le_weightedRestrictedSubring [NonarchimedeanRing K] :
    (washnitzerAlgebra n K).toSubring ≤
      Huber.weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set K))
        Huber.isWeightFamily_one_weight := sorry

variable (n K) in
/-- The inclusion `W_n → T_n` into Tau Ceti's Tate algebra. -/
def washnitzerAlgebra.toTate [NonarchimedeanRing K] :
    washnitzerAlgebra n K →+* Huber.restrictedMvPowerSeriesCompletion n K :=
  UniformSpace.Completion.coeRingHom.comp
    (Subring.inclusion (washnitzerAlgebra_le_weightedRestrictedSubring (n := n) (K := K)))

variable [CompleteSpace K]

/-- `W_n` is noetherian, factorial and Jacobson, with finite residue fields over `K` (GK00, §1,
1.4). -/
theorem washnitzerAlgebra.isNoetherianRing :
    IsNoetherianRing (washnitzerAlgebra n K) ∧ UniqueFactorizationMonoid (washnitzerAlgebra n K) ∧
      IsJacobsonRing (washnitzerAlgebra n K) := sorry

/-- `W_n` is regular of Krull dimension `n` (GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.isRegularRing :
    IsRegularRing (washnitzerAlgebra n K) ∧ ringKrullDim (washnitzerAlgebra n K) = n := sorry

/-- `W_n → T_n` is faithfully flat (GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.faithfullyFlat [NonarchimedeanRing K] :
    letI := (washnitzerAlgebra.toTate n K).toAlgebra
    Module.FaithfullyFlat (washnitzerAlgebra n K) (Huber.restrictedMvPowerSeriesCompletion n K) :=
  sorry

/-- Contraction `m ↦ m ∩ W_n` is a bijection from maximal ideals of `T_n` to those of `W_n`
(GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.existsUnique_isMaximal_comap [NonarchimedeanRing K]
    (m' : Ideal (washnitzerAlgebra n K)) (hm' : m'.IsMaximal) :
    ∃! m : Ideal (Huber.restrictedMvPowerSeriesCompletion n K),
      m.IsMaximal ∧ m.comap (washnitzerAlgebra.toTate n K) = m' := sorry

end Washnitzer

/-! ### F1.2 Dagger algebras
(*dagger-algebra*, *dagger-noether-normalisation*, *dagger-completion-comparison*,
*dagger-weak-completeness*, *dagger-finite-extension*) -/

section DaggerAlgebra

/-- A `K`-*dagger algebra*: a `K`-algebra admitting a surjection `W_n ↠ A` (GK00, §1, 1.2). -/
class IsDaggerAlgebra (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (A : Type*)
    [CommRing A] [Algebra K A] : Prop where
  exists_surjective : ∃ (n : ℕ) (φ : washnitzerAlgebra n K →ₐ[K] A), Function.Surjective φ

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  {A : Type*} [CommRing A] [Algebra K A]

instance IsDaggerAlgebra.washnitzerAlgebra (n : ℕ) :
    IsDaggerAlgebra K (Dagger.washnitzerAlgebra n K) :=
  ⟨⟨n, AlgHom.id K _, Function.surjective_id⟩⟩

instance IsDaggerAlgebra.quotient [IsDaggerAlgebra K A] (J : Ideal A) :
    IsDaggerAlgebra K (A ⧸ J) := by
  obtain ⟨n, φ, hφ⟩ := IsDaggerAlgebra.exists_surjective (K := K) (A := A)
  exact ⟨⟨n, (Ideal.Quotient.mkₐ K J).comp φ, (Ideal.Quotient.mkₐ_surjective K J).comp hφ⟩⟩

variable (K A) [IsDaggerAlgebra K A]

/-- The least number of variables of a presentation `W_n ↠ A`. -/
def presentationDim : ℕ := by
  classical
  exact Nat.find (IsDaggerAlgebra.exists_surjective (K := K) (A := A))

/-- A chosen presentation `W_n ↠ A` with `n = presentationDim K A`. -/
def presentation : washnitzerAlgebra (presentationDim K A) K →ₐ[K] A := by
  classical
  exact (Nat.find_spec (IsDaggerAlgebra.exists_surjective (K := K) (A := A))).choose

theorem presentation_surjective : Function.Surjective (presentation K A) := by
  classical
  exact (Nat.find_spec (IsDaggerAlgebra.exists_surjective (K := K) (A := A))).choose_spec

variable [NonarchimedeanRing K]

/-- The completion `Â = T_n / I T_n` of `A = W_n / I`, a `K`-affinoid algebra independent of the
presentation up to unique isomorphism under `A` (GK00, §1, 1.2 and Thm 1.7). -/
abbrev completion : Type _ :=
  Huber.restrictedMvPowerSeriesCompletion (presentationDim K A) K ⧸
    Ideal.map (washnitzerAlgebra.toTate (presentationDim K A) K) (RingHom.ker (presentation K A))

/-- The completion map `τ : A → Â`. -/
def toCompletion : A →+* completion K A :=
  (Ideal.quotientMap _ (washnitzerAlgebra.toTate (presentationDim K A) K) Ideal.le_comap_map).comp
    ((Ideal.quotientKerAlgEquivOfSurjective (presentation_surjective K A)).symm : A →+* _)

/-- The integral subring `A^int = τ⁻¹(Â°)`: the elements of supremum norm `≤ 1`. -/
def intSubring : Subring A :=
  (Huber.powerBoundedSubring (completion K A)).comap (toCompletion K A)

variable {K A} [CompleteSpace K]

/-- Dagger algebras are noetherian and Jacobson, with residue fields finite over `K` (GK00, §1,
1.4). -/
theorem IsDaggerAlgebra.isNoetherianRing :
    IsNoetherianRing A ∧ IsJacobsonRing A ∧
      ∀ m : Ideal A, m.IsMaximal → Module.Finite K (A ⧸ m) := sorry

/-- Noether normalisation: a nonzero dagger algebra is finite over an injectively embedded `W_d`
(GK00, §1, 1.4(2)). -/
theorem exists_finite_injective_washnitzer [Nontrivial A] :
    ∃ (d : ℕ) (φ : washnitzerAlgebra d K →ₐ[K] A), Function.Injective φ ∧ φ.toRingHom.Finite :=
  sorry

/-- The faithful-flatness statement of *dagger-completion-comparison*: `Â` is `K`-affinoid
and `τ : A → Â` is faithfully flat (GK00, §1, Thm 1.7(1)). -/
theorem completion_isAffinoid :
    Huber.IsStrictlyTopologicallyFiniteType (algebraMap K (completion K A)) ∧
      (letI := (toCompletion K A).toAlgebra; Module.FaithfullyFlat A (completion K A)) := sorry

/-- The point comparison of *dagger-completion-comparison*: every maximal ideal of a dagger
algebra is the contraction of exactly one maximal ideal of its completion (GK00, Thm 1.7(1)). -/
theorem completion_existsUnique_isMaximal_comap (m : Ideal A) (hm : m.IsMaximal) :
    ∃! m' : Ideal (completion K A), m'.IsMaximal ∧ m'.comap (toCompletion K A) = m := sorry

/-- The regularity comparison of *dagger-completion-comparison*: a dagger algebra is regular
exactly when its completion is regular, in every characteristic (GK00, Thm 1.7(2)–(3)). -/
theorem completion_isRegular_iff : IsRegularRing A ↔ IsRegularRing (completion K A) := sorry

/-- In characteristic zero, the completion of a reduced dagger algebra is reduced
(GK00, §1, Thm 1.7(3), using the excellence supplied by `dagger-algebra-excellent`). -/
theorem completion_isReduced [CharZero K] [IsReduced A] : IsReduced (completion K A) := sorry

/-- A reduced affinoid completion is uniform: its power-bounded subring is bounded. This is
the boundedness input for `fringe-plus-compactification` (Vezzani, Appendix A, proof of
Prop. A.14); reducedness of the completion is an explicit hypothesis in every characteristic. -/
theorem completion_isUniform [IsReduced (completion K A)] :
    Huber.IsUniform (completion K A) := sorry

/-- `a ∈ A` is a unit iff `τ a` is a unit of `Â` (GK00, §1, Thm 1.7(1): `τ` is faithfully flat,
which reflects units). -/
theorem isUnit_iff_isUnit_completion (a : A) : IsUnit a ↔ IsUnit (toCompletion K A a) := sorry

/-- Finite algebras over dagger algebras are dagger algebras (GK00, §1, Lem. 1.10). Each
generator can be rescaled so that its monic equation has power-bounded coefficients at a fringe
stage. -/
theorem IsDaggerAlgebra.of_finite {B : Type*} [CommRing B] [Algebra K B] [Algebra A B]
    [IsScalarTower K A B] [Module.Finite A B] : IsDaggerAlgebra K B := sorry

/-- The completion of `W_n` is `T_n`, compatibly with `W_n → T_n`. -/
theorem completion_washnitzerAlgebra (n : ℕ) :
    ∃ e : completion K (washnitzerAlgebra n K) ≃+* Huber.restrictedMvPowerSeriesCompletion n K,
      ∀ f, e (toCompletion K (washnitzerAlgebra n K) f) = washnitzerAlgebra.toTate n K f := sorry

end DaggerAlgebra

/-! ### F1.5 Weak completions and Monsky–Washnitzer type
(*integral-overconvergent-tate-algebra*, *integral-overconvergent-noetherian*, *weak-completion*,
*weak-completion-presentation*, *weak-completion-universal-property*,
*weak-completion-generic-fibre*, *mw-type-dagger-algebra*) -/

section IntegralWashnitzer

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [NonarchimedeanRing K]

/-- The integral Monsky–Washnitzer algebra `O_K⟨X₁, …, Xₙ⟩† = W_n ∩ O_K⟦X⟧` (vdP, §2, p. 35). -/
def intWashnitzerAlgebra (n : ℕ) : Subring (MvPowerSeries (Fin n) K) :=
  (washnitzerAlgebra n K).toSubring ⊓
    (MvPowerSeries.map (Huber.powerBoundedSubring K).subtype).range

/-- For `K` discretely valued with uniformiser `π`, `O_K⟨X⟩†` is noetherian (Kedlaya06, §2.4;
vdP, (2.2), p. 36). -/
theorem intWashnitzerAlgebra.isNoetherianRing [CompleteSpace K] (n : ℕ) (π : K)
    (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k) :
    IsNoetherianRing (intWashnitzerAlgebra K n) := sorry

end IntegralWashnitzer

section WeakCompletion

open TensorProduct

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O) (S : Type*) [CommRing S] [Algebra O S]

/-- The `π`-adic completion `Ŝ = lim_m S/πᵐS`. -/
abbrev piAdicCompletion : Type _ := AdicCompletion (Ideal.span {algebraMap O S π}) S

variable {S} in
/-- For `x : ι → S`, the elements `∑_j π^j P_j(x)` of `Ŝ` with `P_j ∈ O[X]` of total degree
`≤ c (j + 1)` for some `c` (Monsky–Washnitzer growth). -/
def weakCompletionSet {ι : Type*} [Fintype ι] (x : ι → S) : Set (piAdicCompletion π S) :=
  {z | ∃ (c : ℕ) (P : ℕ → MvPolynomial ι O), (∀ j, (P j).totalDegree ≤ c * (j + 1)) ∧
    ∀ k : ℕ, AdicCompletion.eval _ S k z = Submodule.Quotient.mk
      (∑ j ∈ Finset.range k, algebraMap O S π ^ j * MvPolynomial.aeval x (P j))}

/-- The weak completion `S† ⊆ Ŝ` of a finitely generated `O`-algebra: generated by
`weakCompletionSet` for a chosen finite generating set, which is already a subalgebra
(`coe_weakCompletion`) (Kedlaya01, §2, p. 2). -/
def weakCompletion [Algebra.FiniteType O S] : Subalgebra O (piAdicCompletion π S) :=
  Algebra.adjoin O (weakCompletionSet π
    (fun x : ((Algebra.FiniteType.out (R := O) (A := S)).choose : Set S) ↦ (x : S)))

variable {S}

/-- For every finite generating family `x`, `S†` is exactly `weakCompletionSet π x`: it is a
subalgebra and does not depend on the generators. -/
theorem coe_weakCompletion [Algebra.FiniteType O S] {n : ℕ} (x : Fin n → S)
    (hx : Algebra.adjoin O (Set.range x) = ⊤) :
    (weakCompletion π S : Set (piAdicCompletion π S)) = weakCompletionSet π x := sorry

/-- `S† ⊆ Ŝ` contains the image of `S`. -/
theorem algebraMap_mem_weakCompletion [Algebra.FiniteType O S] (s : S) :
    algebraMap S (piAdicCompletion π S) s ∈ weakCompletion π S := sorry

variable (S) in
/-- The map `S → S†`. -/
def weakCompletion.of [Algebra.FiniteType O S] : S →ₐ[O] weakCompletion π S :=
  ((Algebra.ofId S (piAdicCompletion π S)).restrictScalars O).codRestrict _
    (algebraMap_mem_weakCompletion π)

/-- With `π` a uniformiser, `S†` is noetherian and `S†/πᵐ ≅ S/πᵐ` (vdP, §2, (2.1)–(2.2),
pp. 35–36). -/
theorem weakCompletion.isNoetherianRing [Algebra.FiniteType O S] (hπ : Irreducible π) :
    IsNoetherianRing (weakCompletion π S) ∧ ∀ m : ℕ,
      Nonempty ((weakCompletion π S ⧸ Ideal.span {algebraMap O (weakCompletion π S) π ^ m}) ≃ₐ[O]
        (S ⧸ Ideal.span {algebraMap O S π ^ m})) := sorry

/-- `B` is *weakly complete finitely generated*: `B ≅ O[Y₁, …, Y_m]† / J` (vdP, §2, (2.1)). -/
def IsWeaklyCompleteFG (B : Type*) [CommRing B] [Algebra O B] : Prop :=
  ∃ (m : ℕ) (J : Ideal (weakCompletion π (MvPolynomial (Fin m) O))),
    Nonempty (B ≃ₐ[O] (weakCompletion π (MvPolynomial (Fin m) O) ⧸ J))

/-- Universal property: `S†` is weakly complete finitely generated and every `O`-algebra map
`S → B` into such a `B` extends uniquely to `S†` (MW68, §2). -/
theorem weakCompletion.existsUnique_lift [Algebra.FiniteType O S] (hπ : Irreducible π)
    {B : Type*} [CommRing B] [Algebra O B] (hB : IsWeaklyCompleteFG π B) (φ : S →ₐ[O] B) :
    IsWeaklyCompleteFG π (weakCompletion π S) ∧
      ∃! φ' : weakCompletion π S →ₐ[O] B, φ'.comp (weakCompletion.of π S) = φ := sorry

variable (S) in
/-- The generic fibre `A† = S† ⊗_O K`. -/
abbrev weakCompletion.genericFibre [Algebra.FiniteType O S] (K : Type*) [Field K] [Algebra O K] :
    Type _ :=
  K ⊗[O] weakCompletion π S

/-- `S† ⊗ K` is a `K`-dagger algebra when `O` is the unit ball of `K` (GK02, Introduction). -/
theorem weakCompletion.isDaggerAlgebra_genericFibre [Algebra.FiniteType O S] (hπ : Irreducible π)
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [Algebra O K]
    (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) :
    IsDaggerAlgebra K (weakCompletion.genericFibre π S K) := sorry

end WeakCompletion

/-! ### F1.9 Differentials (*dagger-differentials*, *dagger-polyannulus-de-rham-cohomology*) -/

section Differentials

variable (K : Type*) [CommRing K] (A : Type*) [CommRing A] [Algebra K A]

/-- `Ω¹_{A/K}`: Mathlib's Kähler differentials modulo the intersection of the submodules with
finite quotient (the universally finite differentials; GK00, §4, 4.1, p. 19). -/
abbrev Omega : Type _ :=
  KaehlerDifferential K A ⧸
    ⨅ N : {N : Submodule A (KaehlerDifferential K A) //
      Module.Finite A (KaehlerDifferential K A ⧸ N)}, N.1

/-- The universal derivation `d : A → Ω¹_A`. -/
def Omega.d : Derivation K A (Omega K A) :=
  (Submodule.mkQ _).compDer (KaehlerDifferential.D K A)

end Differentials

section DaggerDifferentials

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- For a dagger algebra `Ω¹_A` is finite, and `d` is universal among `K`-derivations into finite
`A`-modules (Kedlaya06, §3.1, Def. 3.1.2). -/
theorem Omega.existsUnique_lift {M : Type*} [AddCommGroup M] [Module A M] [Module K M]
    [IsScalarTower K A M] [Module.Finite A M] (D : Derivation K A M) :
    Module.Finite A (Omega K A) ∧ ∃! u : Omega K A →ₗ[A] M, ∀ a, u (Omega.d K A a) = D a := sorry

/-- `Ω¹_{W_n}` is free on `dX₁, …, dXₙ`. -/
theorem Omega.washnitzerBasis (n : ℕ) :
    ∃ b : Module.Basis (Fin n) (washnitzerAlgebra n K) (Omega K (washnitzerAlgebra n K)),
      ∀ i, b i = Omega.d K _ (washnitzerAlgebra.X n K i) := sorry

/-- In characteristic zero, `Ω¹_A` is projective for regular `A` (Kedlaya06, §3.1, after
Def. 3.1.2, p. 19: regular ⇒ locally free; GK02, §1, 1.2, p. 5, for the universal property). -/
theorem Omega.projective_of_isRegularRing [CharZero K] [IsRegularRing A] :
    Module.Projective A (Omega K A) := sorry

/-- The dagger Poincaré lemma in degrees `0` and `1` on the polydisc: in characteristic zero a
function on `Sp W_n` with `d f = 0` is constant, and every `1`-form on the dagger disc `Sp W_1` is
exact (GK02, §2, Lem. 2.1(a), p. 15, by coefficientwise integration with a smaller radius).
This holds in residue characteristic zero as well: over `ℚ((t))` with the `t`-adic norm,
division by a nonzero integer preserves coefficient norms. The rigid closed disc also has
vanishing first de Rham cohomology over that field; over `ℚ_p` its first cohomology is
infinite-dimensional. -/
theorem Omega.poincare_washnitzer [CharZero K] (n : ℕ) :
    (∀ f : washnitzerAlgebra n K, Omega.d K _ f = 0 ↔ f ∈ Set.range (algebraMap K _)) ∧
      ∀ ω : Omega K (washnitzerAlgebra 1 K), ∃ f, Omega.d K _ f = ω := sorry

end DaggerDifferentials

/-- The boundary case of *dagger-polyannulus-de-rham-cohomology*: `[CharZero K]` cannot be
dropped: in characteristic `p`, `X^{p−1} dX` is not exact on the dagger disc. -/
theorem Omega.not_exact_charP (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K]
    (p : ℕ) [Fact p.Prime] [CharP K p] :
    ¬ ∃ f, Omega.d K (washnitzerAlgebra 1 K) f =
      washnitzerAlgebra.X 1 K 0 ^ (p - 1) • Omega.d K _ (washnitzerAlgebra.X 1 K 0) := sorry

section MWType

open TensorProduct

variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [Algebra O K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] [Algebra O A] [IsScalarTower O K A]

/-- `A` is of *Monsky–Washnitzer type*: `O` is the unit ball of `K`, `A` is regular and the
reduction `k ⊗_O A^int` is a smooth `k`-algebra, `k` the residue field of `O` and `A^int` taken as
an `O`-algebra (equal to `A^int`, `O` mapping into the unit ball of `K`). Regularity is part of the
definition (Kedlaya06, §3.2, Def. 3.2.1, with its errata). -/
structure IsMWType : Prop where
  /-- `O` is the unit ball of `K`. -/
  hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x
  /-- `A` is a regular ring. -/
  isRegularRing : IsRegularRing A
  /-- The reduction `k ⊗_O A^int` is smooth over the residue field `k` of `O`. -/
  smooth : Algebra.Smooth (IsLocalRing.ResidueField O)
    (IsLocalRing.ResidueField O ⊗[O] Algebra.adjoin O (intSubring K A : Set A))

variable {O K A}

/-- For `A` of MW-type, `Ω¹_A` is finite projective. -/
theorem IsMWType.projective_differentials (h : IsMWType O K A) :
    Module.Projective A (Omega K A) := sorry

/-- For `S` smooth and finitely generated over `O`, with `O` the unit ball of `K`, `S† ⊗ K` is of
MW-type with reduction `S/πS` (GK02, Introduction; Kedlaya06, §3.2). -/
theorem IsMWType.of_smooth [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (π : O) (hπ : Irreducible π) (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (S : Type*) [CommRing S] [Algebra O S] [Algebra.FiniteType O S] [Algebra.Smooth O S] :
    haveI := weakCompletion.isDaggerAlgebra_genericFibre π hπ K hO (S := S)
    IsMWType O K (weakCompletion.genericFibre π S K) := sorry

end MWType

/-- The boundary case of *mw-type-dagger-algebra*: the regularity clause is not implied by the
reduction: `W_1/(X²)` has smooth reduction `k`
(the nilpotent `X` is divisible by every power of `π` in `A^int`) but is not regular. -/
theorem IsMWType.not_dualNumbers (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] [Algebra O K] (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] [Algebra O A]
    [IsScalarTower O K A]
    (e : A ≃ₐ[K] washnitzerAlgebra 1 K ⧸ Ideal.span {washnitzerAlgebra.X 1 K 0 ^ 2}) :
    ¬ IsMWType O K A := sorry

end Dagger

end TauCetiRoadmap.AdicSpacesPartIV
