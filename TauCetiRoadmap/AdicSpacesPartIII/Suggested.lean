import Mathlib
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Monoidal
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Dualizable
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafForEveryPresentation
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Modules.GlobalSections
import TauCeti.RingTheory.Huber.Adic
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.StronglyNoetherian
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.Topology.PureDimension
import TauCetiRoadmap.AdicSpacesPartII.Suggested

/-!
# Foundations of adic spaces, Part III: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. README.md is the definitive
specification.

Formal schemes, coherent formal modules, admissible formal models and their generic fibres,
Raynaud's theorem, flattening, Hasse domains, coherent sheaves on adic spaces, Kiehl-properness,
the GAGA comparison maps and the traces of finite locally free morphisms are README targets. This
file states the parts that are a few lines over the pinned carriers:

* F0: completed localisations and completed tensor products of the adic rings supplied by
  AdicSpacesPartII R0.1a–R0.1b, finite modules as adic systems, the first-order ideal of a
  square-zero tower,
  and on schemes proper over an adic noetherian ring the theorem on formal functions and
  Grothendieck's existence theorem of SchemeAndStackFoundations (§4.9, §4.10) in quotient-system
  form, with the thickenings `Xₙ` encoded as universal quotients `F ⧸ I^{n+1} F` of
  `𝒪_X`-modules;
* R2: algebras topologically of finite presentation over a complete rank-one valuation ring, the
  comparison of the Krull dimension, reducedness and pure dimension of their generic and special
  fibres, and the fractional valuation bounds behind Hasse domains;
* R3: glueing squares and Kiehl's glueing theorem for finite projective modules, descent of
  finite modules along strongly noetherian Laurent covers, acyclicity of finite modules on
  Laurent covers of rings of noetherian type, exactness of dense Banach inverse sequences,
  the trace of a finite projective module and of a finite locally free algebra, its
  base change and geometric-point formula, and
  the Gel'fand spectrum of a Banach ring.

The R3.6 Banach targets (*completely-continuous-map*,
*strictly-completely-continuous-closed-target*, *completely-continuous-finite-cokernel*,
*restriction-strictly-completely-continuous*, *almost-noetherian-integral-affinoid-modules*)
are README-only targets of this roadmap. They use CompactOperators §0.1's complete
continuity and scalar lattice norms, and PadicFunctionalAnalysis §§2.1–2.2's model-space
surjections; Part III supplies their affinoid adapters, the strict predicate, closed-target
and restriction theorems, and the series criterion. R3.6 also transports
PadicFunctionalAnalysis §2.4's countable-type splitting to Part II's completed tensor and
RigidAnalyticGeometry §7.5's formal functions to adic coherent cohomology.
R3.7a supplies the README-only analytic genus-one projective embedding
(*rigid-genus-one-projective-embedding*), projective Hilbert/Hom comparison
(*rigid-projective-hilbert-hom*), Artinian genus-one GAGA
(*rigid-artinian-genus-one-gaga*) and local algebraicity preserving group, action and level
(*rigid-generalised-elliptic-local-algebraicity*). These follow R3.6–R3.7 and provide
*rigid-generalised-elliptic-level-classification* and *hasse-loci-admissible-opens*.
R2 retains algebraic moduli and the formal Hasse-section domains.
The Hasse comparison uses the cotangent frame `dX` of `ω = e*Ω̂¹` along the identity and
its coordinate functional `τ_X = (dX)∨ : ω → O`, with `τ_X(dX) = 1`.
Modulo `p`, `Ha = ā(dX)^{⊗(p−1)}` and `τ_X^{⊗(p−1)}(Ha) = ā`, where `ā` is the
reduction of the coefficient of `X^p` in `[p]*(X)`. An integral coordinate change
`X′ = uX + O(X²)`, `u` a unit, gives `ā′ = ū^{1−p}ā` and `dX′ = u dX` along
the identity, preserving the section and its Hasse domains for `0 ≤ ε < 1`.
R2.11's README-only full level over `ℤ[1/N]` is a commutative group-scheme isomorphism
`((ℤ/N)²)_S ≅ E^sm[N]` meeting every geometric component. Its labels preserve zero and
addition; the cyclic Drinfeld divisor condition is specified there.
R3's Čech applications use DerivedModuleAlgebra §S.1's
`DoubleComplex.totalCohomology_of_exact_rows`, its transpose and canonical edge naturality,
with total differential `d′ + (−1)^p d″`.
The README-only Berthelot mapping functor uses the locally power-bounded sheaf,
continuous chart maps preserving topological nilpotence, and local evaluation maps to
integral residue fields. Its composite into the analytic stalk need not be local.
The README-only rational-cover Čech reduction first establishes separatedness and the
sheaf condition. Its positive-degree induction property is augmented exactness for the
specified covering after every rational pullback. Localized Laurent exactness supplies
the base case, and vanishing on the empty open supplies the empty-cover case.
F0's ordinary projective-bundle, tensor-power and ampleness interfaces are supplied by
StableReduction Layer 2; F0 supplies their formal-thickening adapters.
F0 uses the generic tower calculus and Mittag-Leffler criteria of
DerivedModuleAlgebra §§1.T.1 and 1.1, including the six-term sequence and vanishing of
`lim¹` for a Mittag-Leffler kernel tower. Its integral-module adapter preserves the maps.
R3.4's dense Banach inverse-sequence theorem has separate topological hypotheses.
The README-only local-algebraicity input on an open with `n ≥ 1` sides in every singular
geometric fibre gives `D = E^sm[n]` finite locally free of rank `n²` over the base and an
ample relative effective Cartier divisor in `E`, compatibly with rigid base change.
On the standard `2`-gon over `ℚ₃`, the kernel has rank `4` over the base, whereas
multiplication on the whole smooth locus has target-component ranks `4` and `0`.
The README-only coefficient-ideal fibre test requires the extended ideal to be zero on
the fibre, including nonreduced fibres; its dual-number Check separates this from point sets.
R2.7's README-only dévissage interfaces distinguish pull-back of finite module and
basis data from pull-back of a pointed chain. Literal pointed pull-back requires a
single point in every distinguished finite fibre; after a splitting base change,
`FormalScheme.devissage_exists_baseChange_local` reconstructs a chain on elementary
étale neighbourhoods. Cokernel dimension drops concern the distinguished fibre,
using the neighbourhood-based `FormalScheme.fibreSupportDim`.
`Devissage.truncateAtDimension` gives a prefix above a threshold with terminal
cokernel of smaller fibre dimension; a complete chain can terminate above that
threshold. The flatness-in-dimension criterion uses this terminal bound, and
`IsFlatInDim.baseChange` transports the upper flatness bound to reconstructed chains.

The general-Tate small-perturbation theorem
(*surjection-small-perturbation*) is also a README target.

Completeness includes the Hausdorff property.
-/

namespace TauCetiRoadmap.AdicSpacesPartIII

open TauCeti TauCetiRoadmap.AdicSpacesPartII TensorProduct

universe u

noncomputable section

/-! ## Layer F0: formal geometry -/

/-! ### F0.1 Constructions on adic rings (*completed-localization*,
*restricted-power-series-adic*, *completed-tensor-product-adic*) -/

/-! AdicSpacesPartII R0.1a–R0.1b supplies the imported `IsAdicRing`, its chosen ideal and
Huber instance, and the noetherian completion criteria. -/

namespace IsAdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]

/-- Over an adic noetherian ring the restricted power series ring `A⟨T₁, …, T_r⟩` is noetherian
(EGA I, Ch. 0, 7.5.4(ii), p. 71). -/
theorem isNoetherianRing_restrictedMvPowerSeriesCompletion [IsAdicRing A] [IsNoetherianRing A]
    (r : ℕ) : IsNoetherianRing (Huber.restrictedMvPowerSeriesCompletion r A) := sorry

end IsAdicRing

namespace AdicRing

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]

/-- The completed localisation `A_{f}`: the completion of `A_f` along `I·A_f` for the chosen ideal
of definition `I`, with the `I·A_{f}`-adic topology (EGA I, Ch. 0, 7.6.1–7.6.2, 7.6.15). -/
def CompletedAway (f : A) : Type _ :=
  AdicCompletion ((IsAdicRing.ideal A).map (algebraMap A (Localization.Away f)))
    (Localization.Away f)

namespace CompletedAway

variable (f : A)

instance : CommRing (CompletedAway A f) :=
  inferInstanceAs (CommRing (AdicCompletion _ (Localization.Away f)))

instance : Algebra A (CompletedAway A f) :=
  inferInstanceAs (Algebra A (AdicCompletion _ (Localization.Away f)))

instance : WithIdeal (CompletedAway A f) :=
  ⟨(IsAdicRing.ideal A).map (algebraMap A (CompletedAway A f))⟩

/-- `A_{f}` is an adic ring. -/
theorem isAdicRing : IsAdicRing (CompletedAway A f) := sorry

/-- `A_{f}` is noetherian and flat over `A` when `A` is noetherian (EGA I, Ch. 0, 7.6.11 and
7.6.13, p. 74). -/
theorem isNoetherianRing_flat [IsNoetherianRing A] :
    IsNoetherianRing (CompletedAway A f) ∧ Module.Flat A (CompletedAway A f) := sorry

/-- Universal property: a continuous `u : A → B` into a complete separated linearly topologised
ring with `u f` a unit factors uniquely through a continuous map out of `A_{f}`
(EGA I, Ch. 0, 7.6.6, p. 73). -/
theorem existsUnique_lift {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsLinearTopology B B] [CompleteSpace B] [T2Space B]
    (u : A →+* B) (hu : Continuous u) (hf : IsUnit (u f)) :
    ∃! v : CompletedAway A f →+* B, Continuous v ∧ v.comp (algebraMap A _) = u := sorry

end CompletedAway

section CompletedTensorProduct

variable (A B C : Type*) [CommRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
  [IsAdicRing B] [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [IsAdicRing C]
  [Algebra A B] [Algebra A C]

/-- The ideal of `B ⊗[A] C` generated by `I_B ⊗ 1` and `1 ⊗ I_C`. -/
def CompletedTensorProduct.tensorIdeal : Ideal (B ⊗[A] C) :=
  (IsAdicRing.ideal B).map Algebra.TensorProduct.includeLeftRingHom ⊔
    (IsAdicRing.ideal C).map (Algebra.TensorProduct.includeRight : C →ₐ[A] B ⊗[A] C).toRingHom

variable [TopologicalSpace A] [IsTopologicalRing A]

/-- The completed tensor product `B ⊗̂_A C` of adic rings along adic structure maps: the adic
completion of `B ⊗[A] C` along the tensor ideal, with its adic topology (EGA I, Ch. 0, 7.7.1). -/
def CompletedTensorProduct [IsAdicRing A] [Huber.IsAdicHom (algebraMap A B)]
    [Huber.IsAdicHom (algebraMap A C)] : Type _ :=
  AdicCompletion (CompletedTensorProduct.tensorIdeal A B C) (B ⊗[A] C)

variable [IsAdicRing A] [Huber.IsAdicHom (algebraMap A B)] [Huber.IsAdicHom (algebraMap A C)]

namespace CompletedTensorProduct

instance : CommRing (CompletedTensorProduct A B C) :=
  inferInstanceAs (CommRing (AdicCompletion _ (B ⊗[A] C)))

instance : Algebra (B ⊗[A] C) (CompletedTensorProduct A B C) :=
  inferInstanceAs (Algebra (B ⊗[A] C) (AdicCompletion _ (B ⊗[A] C)))

instance : Algebra A (CompletedTensorProduct A B C) :=
  inferInstanceAs (Algebra A (AdicCompletion _ (B ⊗[A] C)))

instance : IsScalarTower A (B ⊗[A] C) (CompletedTensorProduct A B C) :=
  inferInstanceAs (IsScalarTower A (B ⊗[A] C) (AdicCompletion _ (B ⊗[A] C)))

instance : WithIdeal (CompletedTensorProduct A B C) :=
  ⟨(tensorIdeal A B C).map (algebraMap (B ⊗[A] C) (CompletedTensorProduct A B C))⟩

/-- `b ↦ b ⊗ 1`. -/
def inl : B →ₐ[A] CompletedTensorProduct A B C :=
  (IsScalarTower.toAlgHom A (B ⊗[A] C) _).comp Algebra.TensorProduct.includeLeft

/-- `c ↦ 1 ⊗ c`. -/
def inr : C →ₐ[A] CompletedTensorProduct A B C :=
  (IsScalarTower.toAlgHom A (B ⊗[A] C) _).comp Algebra.TensorProduct.includeRight

/-- `B ⊗̂_A C` is an adic ring (EGA I, Ch. 0, 7.7.1). -/
theorem isAdicRing : IsAdicRing (CompletedTensorProduct A B C) := sorry

/-- Universal property: continuous `A`-algebra maps `B → D`, `C → D` into a complete separated
linearly topologised `A`-algebra induce a unique continuous map out of `B ⊗̂_A C`
(EGA I, Ch. 0, 7.7.6). -/
theorem existsUnique_lift {D : Type*} [CommRing D] [UniformSpace D] [IsUniformAddGroup D]
    [IsTopologicalRing D] [IsLinearTopology D D] [CompleteSpace D] [T2Space D] [Algebra A D]
    (β : B →ₐ[A] D) (γ : C →ₐ[A] D) (hβ : Continuous β) (hγ : Continuous γ) :
    ∃! ψ : CompletedTensorProduct A B C →ₐ[A] D,
      Continuous ψ ∧ ψ.comp (inl A B C) = β ∧ ψ.comp (inr A B C) = γ := sorry

/-- If `A` is adic noetherian, `B` a topological quotient of some `A⟨T₁, …, T_r⟩` and `C`
noetherian, then `B ⊗̂_A C` is noetherian (EGA I, 10.13.5). -/
theorem isNoetherianRing [IsNoetherianRing A] [IsNoetherianRing C]
    (hB : ∃ (r : ℕ) (π : Huber.restrictedMvPowerSeriesCompletion r A →+* B),
      IsOpenQuotientMap π ∧ π.comp (algebraMap A _) = algebraMap A B) :
    IsNoetherianRing (CompletedTensorProduct A B C) := sorry

end CompletedTensorProduct

end CompletedTensorProduct

end AdicRing

/-! ### F0.1 Finite modules over an adic noetherian ring (*finite-module-inverse-limit*) -/

/-- Finite modules over an adic noetherian ring are adic systems: if `Mₙ` are finite modules killed
by `I^{n+1}` and `tₙ : M_{n+1} → Mₙ` are surjective with kernel `I^{n+1} M_{n+1}`, then
`L = lim Mₙ` is finite and each projection `L → Mₙ` is surjective with kernel `I^{n+1} L`
(EGA I, Ch. 0, 7.2.9, p. 65). -/
theorem IsAdicRing.finite_limit {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsAdicRing A] [IsNoetherianRing A]
    (M : ℕ → Type*) [∀ n, AddCommGroup (M n)] [∀ n, Module A (M n)]
    [∀ n, Module.Finite A (M n)] (t : ∀ n, M (n + 1) →ₗ[A] M n)
    (ht : ∀ n, Function.Surjective (t n))
    (hann : ∀ n, (IsAdicRing.ideal A ^ (n + 1)) • (⊤ : Submodule A (M n)) = ⊥)
    (hker : ∀ n, LinearMap.ker (t n) = (IsAdicRing.ideal A ^ (n + 1)) • ⊤) :
    let L : Submodule A (∀ n, M n) :=
      ⨅ n, LinearMap.ker (LinearMap.proj n - (t n).comp (LinearMap.proj (n + 1)))
    Module.Finite A L ∧ ∀ n,
      Function.Surjective ((LinearMap.proj n : (∀ n, M n) →ₗ[A] M n).comp L.subtype) ∧
        LinearMap.ker ((LinearMap.proj n : (∀ n, M n) →ₗ[A] M n).comp L.subtype) =
          (IsAdicRing.ideal A ^ (n + 1)) • ⊤ := sorry

/-! ### F0.3 The first-order ideal of a square-zero tower (*formal-scheme-carrier-comparison*)

A marked formal scheme `(X, 𝒥)` with `𝒥` of finite type has first-order ideal
`ker(O_{X_1} → O_{X_0}) = 𝒥/𝒥²` of finite type. For the square-zero tower
`Spec k → Spec(k ⊕ V) = Spec(k ⊕ V) = ⋯` this ideal is `V`, the kernel of `k ⊕ V → k`. -/

/-- The boundary Check of *formal-scheme-carrier-comparison*: for `V = ⊕_{i ∈ ℕ} k`, the
first-order ideal `V` of `k ⊕ V` is not finitely generated. Its square-zero tower cannot come
from a formal scheme marked by an ideal of definition of finite type. -/
theorem firstOrderIdeal_not_fg (k : Type*) [Field k] :
    ¬ (RingHom.ker (TrivSqZeroExt.fstHom k k (ℕ →₀ k))).FG := sorry

/-! ### F0.7 Formal functions and Grothendieck's existence theorem
(*pow-quotient-formal-module-comparison*, *theorem-on-formal-functions*, *grothendieck-existence*)

For a scheme `X` over `Spec A` and an ideal `J ⊆ A`, the restriction of an `𝒪_X`-module `F` to
the thickening `Xₙ = V(J^{n+1} 𝒪_X)` is encoded by the universal quotient `F ⧸ J^{n+1} F`, which
is `F → iₙ_* iₙ^* F` for the closed immersion `iₙ : Xₙ → X`. SchemeAndStackFoundations owns,
on the coherent formal modules of `Formal.Scheme.formalCompletion X (J𝒪_X)`, the theorem on formal
functions (§4.9, `Scheme.Modules.Cohomology.formalFunctionsIso`) and Grothendieck's existence
theorem (§4.10, `Formal.grothendieck_existence`); the statements below are their forms on
quotient systems, transported along the identification of such systems with coherent formal
modules and of their cohomology towers. -/

section FormalFunctions

open AlgebraicGeometry CategoryTheory Opposite
open scoped ZeroObject

variable (A : Type u) [CommRing A] {X : Scheme.{u}} [X.Over (Spec (CommRingCat.of A))]

/-- `q : F ⟶ G` exhibits `G` as `F ⧸ J^{n+1} F`: it is killed by every element of `J^{n+1}`
and every morphism out of `F` killed by `J^{n+1}` factors uniquely through it. Such a `q` is the
unit `F → iₙ_* iₙ^* F` of the closed immersion `iₙ : V(J^{n+1} 𝒪_X) → X`, up to unique
isomorphism under `F`. -/
def IsPowQuotient (J : Ideal A) (n : ℕ) {F G : X.Modules} (q : F ⟶ G) : Prop :=
  (∀ a ∈ J ^ (n + 1), Scheme.Modules.globalSectionsSmul F
      (Scheme.Modules.baseRingToGlobalSections A X a) ≫ q = 0) ∧
    ∀ (H : X.Modules) (g : F ⟶ H),
      (∀ a ∈ J ^ (n + 1), Scheme.Modules.globalSectionsSmul F
        (Scheme.Modules.baseRingToGlobalSections A X a) ≫ g = 0) →
      ∃! h : G ⟶ H, q ≫ h = g

/-- The theorem on formal functions: for `X` proper over a noetherian ring `A`, a coherent
`𝒪_X`-module `F` and an ideal `J`, `Hⁱ(X, F)` is finite and its `J`-adic completion is the
module of compatible families in `Hⁱ(Xₙ, F ⧸ J^{n+1} F)`, through the natural maps
(EGA III₁, Ch. III, 4.1.7 (4.1.7.1); Stacks, Tag 02OC, Theorem 30.20.5). This is the
quotient-system form of SchemeAndStackFoundations' `Scheme.Modules.Cohomology.formalFunctionsIso`
(§4.9, file `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`), which owns the theorem:
an `IsPowQuotient` system `F → Qₙ` is `F → F ⧸ J^{n+1} F` up to unique isomorphism. -/
theorem formalFunctions [IsNoetherianRing A] [IsLocallyNoetherian X]
    [IsProper (X ↘ Spec (CommRingCat.of A))] (F : X.Modules)
    [SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F] (J : Ideal A)
    (Q : ℕ → X.Modules) (q : ∀ n, F ⟶ Q n) (hq : ∀ n, IsPowQuotient A J n (q n))
    (t : ∀ n, Q (n + 1) ⟶ Q n) (ht : ∀ n, q (n + 1) ≫ t n = q n) (i : ℕ) :
    let V : Submodule A (∀ n, Scheme.Modules.Cohomology (Q n) i) :=
      ⨅ n, LinearMap.ker
        ((LinearMap.proj n : (∀ m, Scheme.Modules.Cohomology (Q m) i) →ₗ[A] _) -
          (Scheme.Modules.cohomologyMapBaseLinear A X (t n) i).comp
            (LinearMap.proj (n + 1) : (∀ m, Scheme.Modules.Cohomology (Q m) i) →ₗ[A] _))
    Module.Finite A (Scheme.Modules.Cohomology F i) ∧
      ∃ E : AdicCompletion J (Scheme.Modules.Cohomology F i) ≃ₗ[A] V, ∀ a n,
        (E (AdicCompletion.of J (Scheme.Modules.Cohomology F i) a)).val n =
          Scheme.Modules.cohomologyMapBaseLinear A X (q n) i a := sorry

variable [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A] [IsNoetherianRing A]

/-- Grothendieck's existence theorem, essential surjectivity: for `X` proper over an adic
noetherian ring `A` with ideal of definition `I`, every adic system of coherent modules on the
thickenings (`Qₙ` coherent with `Q_{n+1} ⧸ I^{n+1} Q_{n+1} = Qₙ`) is the system of quotients
of a coherent `𝒪_X`-module (EGA III₁, Ch. III, 5.1.4 and 5.1.7, p. 150; Stacks, Tag 088F,
Remark 30.27.2). This is SchemeAndStackFoundations' `Formal.grothendieck_existence` (§4.10), which
owns the theorem, for the completion along `I𝒪_X`: such a system is the pushforward to `X` of a
`Formal.Scheme.CoherentFormalModule` on `Formal.Scheme.formalCompletion X (I𝒪_X)`. -/
theorem grothendieckExistence {I : Ideal A} (hI : IsAdic I) [IsLocallyNoetherian X]
    [IsProper (X ↘ Spec (CommRingCat.of A))] (Q : ℕ → X.Modules)
    [∀ n, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) (Q n)]
    (t : ∀ n, Q (n + 1) ⟶ Q n) (ht : ∀ n, IsPowQuotient A I n (t n)) :
    ∃ (F : X.Modules) (_ : SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F)
      (q : ∀ n, F ⟶ Q n), (∀ n, IsPowQuotient A I n (q n)) ∧ ∀ n, q (n + 1) ≫ t n = q n :=
  sorry

/-- Grothendieck's existence theorem, full faithfulness: compatible morphisms between the
quotient systems of two coherent modules come from a unique morphism (EGA III₁, Ch. III, 5.1.4
and 5.1.7, p. 150; Stacks, Tag 0883, Lemma 30.24.1). This is the full-faithfulness clause of
SchemeAndStackFoundations' Grothendieck existence theorem (§4.10), which owns it, read on the
quotient systems of `F` and `G`, i.e. on the morphisms of their completions along `I𝒪_X`. -/
theorem grothendieckExistence_hom {I : Ideal A} (hI : IsAdic I) [IsLocallyNoetherian X]
    [IsProper (X ↘ Spec (CommRingCat.of A))] (F G : X.Modules)
    [SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F]
    [SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) G]
    (QF QG : ℕ → X.Modules) (qF : ∀ n, F ⟶ QF n) (qG : ∀ n, G ⟶ QG n)
    (hqF : ∀ n, IsPowQuotient A I n (qF n)) (hqG : ∀ n, IsPowQuotient A I n (qG n))
    (φ : ∀ n, QF n ⟶ QG n) (tF : ∀ n, QF (n + 1) ⟶ QF n) (tG : ∀ n, QG (n + 1) ⟶ QG n)
    (htF : ∀ n, qF (n + 1) ≫ tF n = qF n) (htG : ∀ n, qG (n + 1) ≫ tG n = qG n)
    (hφ : ∀ n, φ (n + 1) ≫ tG n = tF n ≫ φ n) :
    ∃! ψ : F ⟶ G, ∀ n, ψ ≫ qG n = qF n ≫ φ n := sorry

end FormalFunctions

end

/-! ## Layer R2: formal schemes, generic fibres and Hasse domains -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R2.1 Algebras topologically of finite presentation
(*topologically-finitely-presented-algebra*, *flat-tft-is-tfp*, *tfp-algebra-coherent*,
*formal-localization-flatness*) -/

/-- Standing data on a valuation ring `O` (the instance `[ValuationRing O]` is separate): rank
one (Krull dimension one), a pseudouniformiser `ϖ` (nonzero, not a unit), and the `ϖ`-adic
topology, for which `O` is complete and separated. -/
class IsCompleteRankOneBase (O : Type*) [CommRing O] [TopologicalSpace O] (ϖ : O) : Prop where
  ringKrullDim_eq_one : ringKrullDim O = 1
  ne_zero : ϖ ≠ 0
  not_isUnit : ¬ IsUnit ϖ
  isAdic : IsAdic (Ideal.span {ϖ})
  isAdicComplete : IsAdicComplete (Ideal.span {ϖ}) O

/-- `A` is *topologically of finite presentation* over `O`: a quotient of some `O⟨ξ₁, …, ξₙ⟩` by a
finitely generated ideal (Bosch–Lütkebohmert I, §1). -/
def IsTopologicallyFinitePresentation (O : Type*) [CommRing O] [TopologicalSpace O]
    [NonarchimedeanRing O] (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  ∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A),
    Function.Surjective π ∧ (RingHom.ker π).FG

/-- `A` is *admissible*: topologically of finite presentation and without `ϖ`-torsion
(Bosch–Lütkebohmert I, §1). -/
def IsAdmissibleAlgebra {O : Type*} [CommRing O] [TopologicalSpace O] [NonarchimedeanRing O]
    (ϖ : O) (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  IsTopologicallyFinitePresentation O A ∧ Submodule.torsionBy O A ϖ = ⊥

section TFP

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] (ϖ : O) [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A]
  [Algebra O A]

include ϖ

/-- Topological finite presentation does not depend on the presentation: every surjection
`O⟨ξ⟩ → A` onto a topologically finitely presented algebra has finitely generated kernel
(Bosch–Lütkebohmert I, §1, p. 293). -/
theorem IsTopologicallyFinitePresentation.iff_of_surjective {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A) (hπ : Function.Surjective π) :
    IsTopologicallyFinitePresentation O A ↔ (RingHom.ker π).FG := sorry

/-- A flat `O`-algebra topologically of finite type is topologically of finite presentation
(Bosch–Lütkebohmert I, §1, Proposition 1.1(c), p. 293; Fujiwara–Kato, Ch. I, §2.3,
Corollary 2.3.2, p. 288). -/
theorem isTopologicallyFinitePresentation_of_flat [Module.Flat O A] {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A) (hπ : Function.Surjective π) :
    IsTopologicallyFinitePresentation O A := sorry

/-- Admissible means topologically of finite presentation and flat over `O`
(Bosch–Lütkebohmert I, §1, p. 293). -/
theorem isAdmissibleAlgebra_iff_flat :
    IsAdmissibleAlgebra ϖ A ↔ IsTopologicallyFinitePresentation O A ∧ Module.Flat O A := sorry

/-- An algebra topologically of finite presentation is coherent: finitely generated ideals are
finitely presented (Bosch–Lütkebohmert I, §1, Proposition 1.3, p. 294). -/
theorem IsTopologicallyFinitePresentation.finitePresentation_of_fg
    (hA : IsTopologicallyFinitePresentation O A) (J : Ideal A) (hJ : J.FG) :
    Module.FinitePresentation A J := sorry

/-- An algebra topologically of finite presentation is `ϖ`-adically complete and separated
(Bosch–Lütkebohmert I, §1, Proposition 1.1(b), p. 293). -/
theorem IsTopologicallyFinitePresentation.isAdicComplete
    (hA : IsTopologicallyFinitePresentation O A) : IsAdicComplete (Ideal.span {ϖ}) A := sorry

/-- Reduction of completed localisation is ordinary localisation of the reduction, with
the canonical maps from `A` identified (Bosch–Lütkebohmert I, §1, p. 296). -/
theorem IsTopologicallyFinitePresentation.completedAway_quotient
    [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    (hA : IsTopologicallyFinitePresentation O A)
    (hϖ : IsAdic (Ideal.span {algebraMap O A ϖ})) (f : A) (m : ℕ) (hm : 1 ≤ m) :
    let B := AdicRing.CompletedAway A f
    let J : Ideal B := Ideal.span {(algebraMap A B (algebraMap O A ϖ)) ^ m}
    let Q := A ⧸ Ideal.span {(algebraMap O A ϖ) ^ m}
    let fbar : Q := Ideal.Quotient.mk _ f
    ∃ e : (B ⧸ J) ≃+* Localization.Away fbar, ∀ a : A,
      e (Ideal.Quotient.mk J (algebraMap A B a)) =
        algebraMap Q (Localization.Away fbar) (Ideal.Quotient.mk _ a) := sorry

/-- Completed localisation of a tfp valuation-ring algebra is flat, by reduction modulo all
positive powers of the pseudouniformiser (Bosch–Lütkebohmert I, §1, Lemma 1.6, pp. 295–296).
The algebra may have pseudouniformiser torsion and the valuation base may be nondiscrete. -/
theorem IsTopologicallyFinitePresentation.completedAway_flat
    [TopologicalSpace A] [IsTopologicalRing A] [IsAdicRing A]
    (hA : IsTopologicallyFinitePresentation O A)
    (hϖ : IsAdic (Ideal.span {algebraMap O A ϖ})) (f : A) :
    Module.Flat A (AdicRing.CompletedAway A f) := sorry

end TFP

/-! ### R2.6 Generic and special fibres of algebras topologically of finite presentation
(*formal-model-fibre-comparison*) -/

section FibreComparison

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] (ϖ : O) [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A]
  [Algebra O A]

/-- The generic fibre `A[1/ϖ]` of an `O`-algebra topologically of finite presentation has Krull
dimension at most that of its special fibre `A ⧸ 𝔪A`, without any flatness hypothesis (Conrad,
*Modular curves and rigid-analytic spaces*, Appendix A.2, proof of Theorem A.2.1(1), p. 39). -/
theorem IsTopologicallyFinitePresentation.ringKrullDim_genericFibre_le
    (hA : IsTopologicallyFinitePresentation O A) :
    ringKrullDim (Localization.Away (algebraMap O A ϖ)) ≤
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) := sorry

/-- For a flat `O`-algebra topologically of finite presentation, the generic fibre `A[1/ϖ]` and
the special fibre `A ⧸ 𝔪A` have the same Krull dimension (Conrad, *Modular curves and
rigid-analytic spaces*, Appendix A.2, proof of Theorem A.2.1(1), equation (A.2.2), pp. 39–40). -/
theorem IsTopologicallyFinitePresentation.ringKrullDim_genericFibre_eq [Module.Flat O A]
    (hA : IsTopologicallyFinitePresentation O A) :
    ringKrullDim (Localization.Away (algebraMap O A ϖ)) =
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) := sorry

/-- If a flat `O`-algebra topologically of finite presentation has reduced special fibre
`A ⧸ 𝔪A` with spectrum of pure dimension `d`, then its generic fibre `A[1/ϖ]` is reduced with
spectrum of pure dimension `d` (Conrad, *Modular curves and rigid-analytic spaces*, Appendix A.2,
Lemma A.2.2 and proof of Theorem A.2.1(2), pp. 40–41). -/
theorem IsTopologicallyFinitePresentation.isReduced_isPureDimensional_genericFibre
    [Module.Flat O A] (hA : IsTopologicallyFinitePresentation O A) {d : ℕ}
    (hred : IsReduced (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)))
    (hpure : TauCeti.IsPureDimensional d
      (PrimeSpectrum (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)))) :
    IsReduced (Localization.Away (algebraMap O A ϖ)) ∧
      TauCeti.IsPureDimensional d (PrimeSpectrum (Localization.Away (algebraMap O A ϖ))) :=
  sorry

end FibreComparison

/-- The flatness boundary Check of *formal-model-fibre-comparison*: `O⟨T⟩ ⧸ (ϖT)` is not flat.
Its generic fibre `K` has Krull dimension `0` and its special fibre `k[T]` has Krull dimension `1`,
so the bound `ringKrullDim_genericFibre_le` is strict. -/
theorem formalModelFibre_torsion {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O]
    [TopologicalSpace O]
    [NonarchimedeanRing O] (ϖ : O) [IsCompleteRankOneBase O ϖ] :
    let P := restrictedMvPowerSeriesCompletion 1 O
    let T : P := ((weightedX (fun _ : Fin 1 ↦ ({1} : Set O)) isWeightFamily_one_weight 0 :
      weightedRestrictedSubring _ _) : P)
    let A := P ⧸ Ideal.span {algebraMap O P ϖ * T}
    ringKrullDim (Localization.Away (algebraMap O A ϖ)) = 0 ∧
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) = 1 := sorry

end Huber

/-! ### R2.9 Frobenius lifts (*frobenius-lift-etale-over-torus*) -/

/-- If `A → R` is a map of `p`-adically complete rings that is étale modulo every `p^{m+1}`, a
Frobenius lift of `A` extends uniquely to a Frobenius lift of `R`; for `A` the formal torus over
`W(κ)` with `Tᵢ ↦ Tᵢ^p` this gives the Frobenius lift of a formal scheme étale over the torus
(Tan–Tong, §2.3, Remark 2.20, p. 19). -/
theorem exists_unique_frobeniusLift_of_etale (p : ℕ) [Fact p.Prime] {A R : Type*} [CommRing A]
    [CommRing R] [Algebra A R] [IsAdicComplete (Ideal.span {(p : A)}) A]
    [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hét : ∀ m : ℕ, Algebra.Etale (A ⧸ Ideal.span {(p : A) ^ (m + 1)})
      (R ⧸ (Ideal.span {(p : A) ^ (m + 1)}).map (algebraMap A R)))
    (φA : A →+* A) (hφA : ∀ a, φA a - a ^ p ∈ Ideal.span {(p : A)}) :
    ∃! φR : R →+* R, φR.comp (algebraMap A R) = (algebraMap A R).comp φA ∧
      ∀ r, φR r - r ^ p ∈ Ideal.span {(p : R)} := sorry

/-! ### R2.10 Fractional valuation bounds (*fractional-valuation-bound*) -/

namespace ValuationSpectrum

open TauCeti.ValuationSpectrum

variable {A : Type*} [CommRing A]

/-- `{|f| ≤ |g|^q}` for `q = a/b` in lowest terms: the valuations with `v(f^b) ≤ v(g^a)`; no root
of `g` is used. -/
def fracPowLE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (f ^ q.den) (g ^ q.num)}

/-- `{|f| ≥ |g|^q}`: the valuations with `v(g^a) ≤ v(f^b)` for `q = a/b` in lowest terms. -/
def fracPowGE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (g ^ q.num) (f ^ q.den)}

/-- Any representative `q = a/b`, `b > 0`, may be used. -/
theorem mem_fracPowLE_iff {f g : A} {q : ℚ≥0} {a b : ℕ} (hb : 0 < b) (hq : q = a / b)
    {v : Spv A} : v ∈ fracPowLE f g q ↔ v.toValuativeRel.vle (f ^ b) (g ^ a) := sorry

/-- For a unit `g`, the bounds cut out rational subsets of `Spa(A, A⁺)`:
`{|f| ≤ |g|^{a/b}} = R(f^b, g^a / g^a)` and `{|f| ≥ |g|^{a/b}} = R(g^a, f^b / f^b)` (the shape of
the Hasse domains of Scholze15, §III.2, Definition III.2.12, p. 38, and BHW, §2.1). -/
theorem fracPow_inter_spa [TopologicalSpace A] [DecidableEq A] (Aplus : Subring A) (f : A)
    {g : A} (hg : IsUnit g) (q : ℚ≥0) :
    fracPowLE f g q ∩ spa Aplus = rationalSubset Aplus {f ^ q.den, g ^ q.num} (g ^ q.num) ∧
      fracPowGE f g q ∩ spa Aplus =
        rationalSubset Aplus {g ^ q.num, f ^ q.den} (f ^ q.den) := sorry

end ValuationSpectrum

end

/-! ## Layer R3: coherent sheaves and finite traces -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R3.1–R3.2 Rational completions, glueing squares and Kiehl's theorem
(*tate-acyclicity-finite-modules*, *glueing-square*, *glueing-square-finite-projective-descent*,
*simple-laurent-glueing-square*, *strongly-noetherian-laurent-gluing*) -/

section RationalCompletion

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]

/-- `B` is the rational completion `A⟨T/s⟩` for the pair of definition `P`: a homeomorphic ring
isomorphism from Tau Ceti's completed localisation intertwining the structure maps. -/
def IsRationalCompletion (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hT : IsOpen (Ideal.span (T : Set A) : Set A))
    (B : Type*) [CommRing B] [TopologicalSpace B] [Algebra A B] : Prop :=
  let S := Localization.Away s
  let hden := P.hasDenominatorPower_of_isOpen_span T s S hT
  letI := P.locUniformSpace T s S hden
  letI := P.isUniformAddGroup_locUniformSpace T s S hden
  letI := P.isTopologicalRing_locUniformSpace T s S hden
  ∃ e : UniformSpace.Completion S ≃+* B, Continuous e ∧ Continuous e.symm ∧
    e.toRingHom.comp (P.toCompletionLoc T s S hden) = algebraMap A B

/-- Huber's acyclicity for finite modules on a Laurent cover: for a complete ring of noetherian
type, the cover `{|f| ≤ 1}`, `{|f| ≥ 1}` with intersection `{|f| = 1}` and a finite module `M`,
`0 → M → B₁ ⊗ M × B₂ ⊗ M → B₁₂ ⊗ M → 0` is exact (Huber 1994, §2, Theorem 2.5, p. 525, both
cases; rational covers reduce to Laurent covers by KL15, Proposition 2.4.20). -/
theorem laurent_exact_of_finite [Huber.IsHuberRing A] [CompleteSpace A] [T2Space A]
    [Huber.IsNoetherianType A] [DecidableEq A] (P : PairOfDefinition A) (f : A)
    {B₁ B₂ B₁₂ : Type*} [CommRing B₁] [CommRing B₂] [CommRing B₁₂]
    [TopologicalSpace B₁] [TopologicalSpace B₂] [TopologicalSpace B₁₂]
    [Algebra A B₁] [Algebra A B₂] [Algebra A B₁₂]
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) B₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) B₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) B₁₂)
    (ρ₁ : B₁ →ₐ[A] B₁₂) (ρ₂ : B₂ →ₐ[A] B₁₂) (hc₁ : Continuous ρ₁) (hc₂ : Continuous ρ₂)
    (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] :
    Function.Injective (fun m : M ↦ ((1 : B₁) ⊗ₜ[A] m, (1 : B₂) ⊗ₜ[A] m)) ∧
      Function.Exact (fun m : M ↦ ((1 : B₁) ⊗ₜ[A] m, (1 : B₂) ⊗ₜ[A] m))
        (fun x : (B₁ ⊗[A] M) × (B₂ ⊗[A] M) ↦
          ρ₁.toLinearMap.rTensor M x.1 - ρ₂.toLinearMap.rTensor M x.2) ∧
      Function.Surjective (fun x : (B₁ ⊗[A] M) × (B₂ ⊗[A] M) ↦
          ρ₁.toLinearMap.rTensor M x.1 - ρ₂.toLinearMap.rTensor M x.2) := sorry

end RationalCompletion

section GlueingSquare

variable (R R₁ R₂ R₁₂ : Type*) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]
  [UniformSpace R₁] [IsUniformAddGroup R₁] [IsTopologicalRing R₁] [IsTateRing R₁]
  [CompleteSpace R₁] [T2Space R₁]
  [UniformSpace R₂] [IsUniformAddGroup R₂] [IsTopologicalRing R₂] [IsTateRing R₂]
  [CompleteSpace R₂] [T2Space R₂]
  [UniformSpace R₁₂] [IsUniformAddGroup R₁₂] [IsTopologicalRing R₁₂] [IsTateRing R₁₂]
  [CompleteSpace R₁₂] [T2Space R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] [Algebra R R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]

/-- A *glueing square* of complete Tate rings `R → R₁, R₂ → R₁₂` (KL15, §2.7, Definition 2.7.3,
with its condition (c), surjectivity of `M(R₁ ⊕ R₂) → M(R)`, replaced by the consequence used in
the proof of Proposition 2.7.5):
continuous maps with `0 → R → R₁ × R₂ → R₁₂ → 0`, `(r₁, r₂) ↦ r₁ − r₂`, strict exact,
`R₂ → R₁₂` of dense range, and every maximal ideal of `R` the contraction of a prime of
`R₁ × R₂`. -/
structure GlueingSquare : Prop where
  continuous_algebraMap₁ : Continuous (algebraMap R R₁)
  continuous_algebraMap₂ : Continuous (algebraMap R R₂)
  continuous_algebraMap₁₂ : Continuous (algebraMap R₁ R₁₂)
  continuous_algebraMap₂₁₂ : Continuous (algebraMap R₂ R₁₂)
  injective : Function.Injective fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  exact_sub : Function.Exact (fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r))
    fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  surjective_sub :
    Function.Surjective fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  isInducing : Topology.IsInducing fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  isStrictMap_sub :
    Topology.IsStrictMap fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  denseRange : DenseRange (algebraMap R₂ R₁₂)
  exists_prime_comap_eq : ∀ m : Ideal R, m.IsMaximal → ∃ p : Ideal (R₁ × R₂), p.IsPrime ∧
    p.comap ((algebraMap R R₁).prod (algebraMap R R₂)) = m

end GlueingSquare

section GlueingDatum

variable {R₁ R₂ R₁₂ : Type*} [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  {M₁ M₂ M₁₂ : Type*} [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

variable (R₁ R₂ R₁₂ M₁ M₂ M₁₂) in
/-- A *glueing datum* on `R₁, R₂ → R₁₂`: modules `Mᵢ` over `Rᵢ`, `M₁₂` over `R₁₂` and isomorphisms
`ψᵢ : R₁₂ ⊗_{Rᵢ} Mᵢ ≅ M₁₂` (KL15, Definition 2.7.3). -/
structure GlueingDatum where
  /-- `R₁₂ ⊗_{R₁} M₁ ≅ M₁₂`. -/
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  /-- `R₁₂ ⊗_{R₂} M₂ ≅ M₁₂`. -/
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

/-- The module of sections `{(m₁, m₂) | ψ₁(1 ⊗ m₁) = ψ₂(1 ⊗ m₂)}` of a glueing datum, over a ring
`R` mapping compatibly to `R₁`, `R₂`, `R₁₂`. -/
def GlueingDatum.sections (R : Type*) [CommRing R] [Algebra R R₁] [Algebra R R₂]
    [Algebra R R₁₂] [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂] [Module R M₁]
    [Module R M₂] [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Submodule R (M₁ × M₂) where
  carrier := {x | D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)}
  add_mem' {x y} hx hy := by
    simp only [Set.mem_ofPred_eq, Prod.fst_add, Prod.snd_add, TensorProduct.tmul_add,
      map_add] at hx hy ⊢
    rw [hx, hy]
  zero_mem' := by simp
  smul_mem' r x hx := by
    simp only [Set.mem_ofPred_eq, Prod.smul_fst, Prod.smul_snd] at hx ⊢
    rw [← algebraMap_smul R₁ r x.1, ← algebraMap_smul R₂ r x.2, TensorProduct.tmul_smul,
      TensorProduct.tmul_smul, ← algebraMap_smul R₁₂ (algebraMap R R₁ r),
      ← algebraMap_smul R₁₂ (algebraMap R R₂ r), map_smul, map_smul,
      ← IsScalarTower.algebraMap_apply, ← IsScalarTower.algebraMap_apply, hx]

variable (R₁ R₂ R₁₂) in
/-- The glueing datum `(R₁ ⊗_R N, R₂ ⊗_R N, R₁₂ ⊗_R N)` of an `R`-module `N`. -/
def GlueingDatum.ofModule (R : Type*) [CommRing R] [Algebra R R₁] [Algebra R R₂]
    [Algebra R R₁₂] [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
    (N : Type*) [AddCommGroup N] [Module R N] :
    GlueingDatum R₁ R₂ R₁₂ (R₁ ⊗[R] N) (R₂ ⊗[R] N) (R₁₂ ⊗[R] N) where
  ψ₁ := AlgebraTensorModule.cancelBaseChange R R₁ R₁₂ R₁₂ N
  ψ₂ := AlgebraTensorModule.cancelBaseChange R R₂ R₁₂ R₁₂ N

end GlueingDatum

section GlueingModules

variable {R R₁ R₂ R₁₂ : Type*} [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]
  [UniformSpace R₁] [IsUniformAddGroup R₁] [IsTopologicalRing R₁] [IsTateRing R₁]
  [CompleteSpace R₁] [T2Space R₁]
  [UniformSpace R₂] [IsUniformAddGroup R₂] [IsTopologicalRing R₂] [IsTateRing R₂]
  [CompleteSpace R₂] [T2Space R₂]
  [UniformSpace R₁₂] [IsUniformAddGroup R₁₂] [IsTopologicalRing R₁₂] [IsTateRing R₁₂]
  [CompleteSpace R₁₂] [T2Space R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] [Algebra R R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
  {M₁ M₂ M₁₂ : Type*} [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂] [Module R M₁] [IsScalarTower R R₁ M₁]
  [Module R M₂] [IsScalarTower R R₂ M₂]

/-- Kiehl's glueing theorem for finite projective modules on a glueing square: the sections of a
finite projective glueing datum form a finite projective `R`-module `M` with `Rᵢ ⊗_R M ≅ Mᵢ`
(KL15, §2.7, Proposition 2.7.5, p. 57). -/
theorem GlueingDatum.projective_sections (h : GlueingSquare R R₁ R₂ R₁₂)
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂] [Module.Finite R₁₂ M₁₂]
    [Module.Projective R₁₂ M₁₂] :
    Module.Finite R (D.sections R) ∧ Module.Projective R (D.sections R) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) :=
  sorry

/-- A simple Laurent cover `{|f| ≤ 1}`, `{|f| ≥ 1}` of a complete Tate ring that is sheafy for
every presentation is a glueing square (KL15, §2.4, Lemma 2.4.22, p. 46, and proof of
Theorem 2.4.23, p. 47). -/
theorem GlueingSquare.of_simpleLaurent [DecidableEq R] (P : PairOfDefinition R)
    (S : Huber.Pair R) (hs : IsSheafyForEveryPresentation S.plus) (f : R)
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) R₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) R₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) R₁₂)
    (hc₁ : Continuous (algebraMap R₁ R₁₂)) (hc₂ : Continuous (algebraMap R₂ R₁₂)) :
    GlueingSquare R R₁ R₂ R₁₂ := sorry

/-- Kiehl's theorem for finite modules on a strongly noetherian Laurent cover: the sections of a
finite glueing datum form a finite `R`-module `M` with `Rᵢ ⊗_R M ≅ Mᵢ`; neither the pieces nor
`M` need be projective (Diao–Lan–Liu–Zhu, Appendix A, Lemma A.3 and Theorem A.8, pp. 95–97). -/
theorem GlueingDatum.finite_sections_of_simpleLaurent [IsStronglyNoetherian R]
    [DecidableEq R] (P : PairOfDefinition R) (f : R)
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) R₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) R₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) R₁₂)
    (hc₁ : Continuous (algebraMap R₁ R₁₂)) (hc₂ : Continuous (algebraMap R₂ R₁₂))
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    [Module.Finite R₁ M₁] [Module.Finite R₂ M₂] [Module.Finite R₁₂ M₁₂] :
    Module.Finite R (D.sections R) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) :=
  sorry

end GlueingModules

/-! ### R3.4 Dense inverse sequences (*dense-banach-inverse-system-exactness*) -/

/-- The difference map on the product of a countable inverse sequence of Banach spaces
with continuous dense transitions is surjective (Kiehl-AB, proof of Satz 2.4.2, p. 272). -/
theorem denseBanach_inverseSystem_exact (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (V : ℕ → Type*)
    [∀ n, NormedAddCommGroup (V n)] [∀ n, NormedSpace K (V n)] [∀ n, CompleteSpace (V n)]
    (t : ∀ n, V (n + 1) →L[K] V n) (ht : ∀ n, DenseRange (t n)) :
    Function.Surjective (fun x : ∀ n, V n ↦ fun n ↦ x n - t n (x (n + 1))) := sorry

/-! ### R3.5 Uniform Banach rings (*uniform-iff-power-bound*) -/

/-- For a complete Tate ring with a submultiplicative norm, the norm is equivalent to a
power-multiplicative seminorm iff it is equivalent to the spectral seminorm iff
`c ‖x‖² ≤ ‖x²‖` for some `c > 0` (KL15, Definition 2.8.1, as corrected in KL16, Appendix A;
KL15, Remark 2.4.4). -/
theorem isUniform_tfae {A : Type*} [NormedCommRing A] [CompleteSpace A] [IsTateRing A] :
    List.TFAE
      [∃ ν : RingSeminorm A, IsPowMul ν ∧ ∃ c > 0, ∃ C > 0, ∀ x, c * ‖x‖ ≤ ν x ∧ ν x ≤ C * ‖x‖,
        ∃ c > 0, ∀ x, c * ‖x‖ ≤ smoothingFun (normRingSeminorm A) x,
        ∃ c > 0, ∀ x : A, c * ‖x‖ ^ 2 ≤ ‖x ^ 2‖] := sorry

/-! ### R3.9 The Gel'fand spectrum of a Banach ring (*gelfand-spectrum-banach-ring*) -/

/-- The Gel'fand spectrum `M(A)` of a normed commutative ring: multiplicative seminorms bounded by
a constant multiple of the norm, with the topology of pointwise convergence
(Berkovich, §1.2; KL15, §2.3, Definition 2.3.2). -/
def GelfandSpectrum (A : Type*) [NormedCommRing A] :=
  {α : MulRingSeminorm A // ∃ C > 0, ∀ x, α x ≤ C * ‖x‖}

namespace GelfandSpectrum

variable {A : Type*} [NormedCommRing A]

instance : TopologicalSpace (GelfandSpectrum A) :=
  TopologicalSpace.induced (fun α : GelfandSpectrum A ↦ (α.val : A → ℝ)) inferInstance

/-- The spectrum of a Banach ring is compact, and nonempty when the ring is nonzero
(Berkovich, Theorem 1.2.1; KL15, Theorem 2.3.4, p. 34). -/
theorem compactSpace_nonempty [CompleteSpace A] :
    CompactSpace (GelfandSpectrum A) ∧ (Nontrivial A → Nonempty (GelfandSpectrum A)) := sorry

/-- Berkovich's formula: the spectral seminorm `lim ‖xⁿ‖^{1/n}` is the maximum of `α(x)` over the
spectrum, attained when `A ≠ 0`; for `A = 0` both sides are `0` (Berkovich, Theorem 1.3.1;
KL15, Theorem 2.3.10, p. 35, and Remark 2.3.11(b), p. 36). -/
theorem smoothingFun_eq_sSup [CompleteSpace A] (x : A) :
    smoothingFun (normRingSeminorm A) x =
        sSup (Set.range fun α : GelfandSpectrum A ↦ α.val x) ∧
      (Nontrivial A → ∃ α : GelfandSpectrum A,
        α.val x = smoothingFun (normRingSeminorm A) x) := sorry

/-- The spectrum of `ℚ_p` is the `p`-adic norm alone. -/
theorem test_padic (p : ℕ) [Fact p.Prime] (α : GelfandSpectrum ℚ_[p]) (x : ℚ_[p]) : α.val x = ‖x‖ :=
  sorry

/-- The zero ring has empty spectrum, since `α(1) = 1 ≠ 0 = α(0)`. -/
theorem test_zero_ring [Subsingleton A] : IsEmpty (GelfandSpectrum A) := sorry

/-- The dual-number Check of *gelfand-spectrum-banach-ring*: the nilpotent has norm one and
spectral value zero, and the ambient norm is not multiplicative. -/
theorem test_dualNumbers (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] :
    let ε : TrivSqZeroExt K K := TrivSqZeroExt.inr 1
    ‖ε‖ = 1 ∧ smoothingFun (normRingSeminorm (TrivSqZeroExt K K)) ε = 0 ∧
      sSup (Set.range fun α : GelfandSpectrum (TrivSqZeroExt K K) ↦ α.val ε) = 0 ∧
      ‖ε * ε‖ ≠ ‖ε‖ * ‖ε‖ ∧
      ¬ ∃ α : GelfandSpectrum (TrivSqZeroExt K K), ∀ x, α.val x = ‖x‖ := sorry

/-- Points of the spectrum annihilate square-zero elements. -/
example (α : GelfandSpectrum A) (x : A) (hx : x ^ 2 = 0) : α.val x = 0 := by
  have h : (α.val x) ^ 2 = 0 := by rw [← map_pow, hx, map_zero]
  exact (pow_eq_zero_iff (by decide : (2 : ℕ) ≠ 0)).mp h

end GelfandSpectrum

end Huber

/-! ### R3.8 Traces of finite projective modules and finite locally free algebras
(*projective-module-trace*, *projective-trace-realization*, *finite-locally-free-algebra-trace*,
*algebra-trace-base-change*, *algebra-trace-transitivity*, *etale-iff-trace-pairing-perfect*) -/

namespace LinearMap

variable (R M : Type*) [CommSemiring R] [AddCommMonoid M] [Module R M] [Module.Finite R M]
  [Module.Projective R M]

/-- Trace by contraction on a finite projective semimodule. Over rings this realizes
PivotalSpherical's symmetric categorical trace by evaluation at `1` on endomorphisms of `R`. -/
def projectiveTrace : (M →ₗ[R] M) →ₗ[R] R :=
  contractLeft R M ∘ₗ (dualTensorHomEquiv R M M).symm.toLinearMap

variable {R M}

open CategoryTheory MonoidalCategory in
/-- *projective-trace-realization*: the symmetric categorical trace on a finite projective
module, evaluated at `1` in the unit module, is its scalar contraction trace
(Stacks, Tag 02DU; Mathlib's exact-pairing evaluation and coevaluation). -/
theorem projectiveTrace_eq_categoricalTrace (R : Type u) [CommRing R]
    (M : (TauCeti.finiteProjectiveModules R).FullSubcategory) (f : M.obj ⟶ M.obj) :
    (ExactPairing.coevaluation M.obj (HasRightDual.rightDual (X := M.obj)) ≫
      f ▷ (HasRightDual.rightDual (X := M.obj)) ≫
      (β_ M.obj (HasRightDual.rightDual (X := M.obj))).hom ≫
      ExactPairing.evaluation M.obj (HasRightDual.rightDual (X := M.obj))).hom 1 =
        projectiveTrace R M.obj f.hom := sorry

/-- On free modules the projective trace is Mathlib's trace. -/
theorem projectiveTrace_eq_trace [Module.Free R M] :
    projectiveTrace R M = LinearMap.trace R M := sorry

/-- The projective trace commutes with base change. -/
theorem projectiveTrace_baseChange (R' : Type*) [CommSemiring R'] [Algebra R R']
    (f : M →ₗ[R] M) :
    projectiveTrace R' (R' ⊗[R] M) (f.baseChange R') = algebraMap R R' (projectiveTrace R M f) :=
  sorry

/-- Cyclicity across finite projective semimodules, realizing categorical cyclicity over rings. -/
theorem projectiveTrace_cyclic {N : Type*} [AddCommMonoid N] [Module R N]
    [Module.Finite R N] [Module.Projective R N] (f : M →ₗ[R] N) (g : N →ₗ[R] M) :
    projectiveTrace R M (g.comp f) = projectiveTrace R N (f.comp g) := sorry

/-- The nonfree Check of *projective-trace-realization*: `ℚ × 0 ⊆ ℚ × ℚ` is projective and
not free. Its identity has trace `(1, 0)`, while the pinned Mathlib trace gives `0`. -/
theorem projectiveTrace_nonfree [Module.Finite (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})]
    [Module.Projective (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})] :
    projectiveTrace (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))}) LinearMap.id = (1, 0) ∧
      LinearMap.trace (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))}) LinearMap.id = 0 := sorry

end LinearMap

namespace Algebra

variable (R B : Type*) [CommRing R] [CommRing B] [Algebra R B] [Module.Finite R B]
  [Module.Projective R B]

/-- The trace `Tr_{B/R}(b) = tr(m_b)` of a finite projective (finite locally free) algebra. -/
def projectiveTrace : B →ₗ[R] R :=
  LinearMap.projectiveTrace R B ∘ₗ (Algebra.lmul R B).toLinearMap

/-- The trace form `(x, y) ↦ Tr_{B/R}(xy)`. -/
def projectiveTraceForm : LinearMap.BilinForm R B :=
  (Algebra.lmul R B).toLinearMap.compr₂ (projectiveTrace R B)

variable {R B}

/-- *algebra-trace-base-change*: extension of scalars carries the trace of `b` to the trace
of `1 ⊗ b` for every finite projective algebra (Stacks, Tags 02DU and 0BJF). -/
theorem projectiveTrace_baseChange (R' : Type*) [CommRing R'] [Algebra R R'] (b : B) :
    projectiveTrace R' (R' ⊗[R] B) (1 ⊗ₜ[R] b) =
      algebraMap R R' (projectiveTrace R B b) := sorry

/-- *trace-geometric-point-formula*: a finite étale algebra over a field has as many geometric
points as its dimension, and its scalar trace is the sum of their values
(Stacks, Tags 03SH and 0BIL; Mathlib's `Algebra.trace_eq_sum_embeddings` for field factors). -/
theorem projectiveTrace_eq_sum_geometricPoints (k B Ω : Type*) [Field k] [CommRing B]
    [Algebra k B] [Module.Finite k B] [Algebra.Etale k B] [Field Ω] [IsAlgClosed Ω]
    [Algebra k Ω] [Fintype (B →ₐ[k] Ω)] (b : B) :
    Fintype.card (B →ₐ[k] Ω) = Module.finrank k B ∧
      algebraMap k Ω (projectiveTrace k B b) = ∑ σ : B →ₐ[k] Ω, σ b := sorry

/-- Transitivity in a tower `R → B → C` of finite projective algebras:
`Tr_{C/R} = Tr_{B/R} ∘ Tr_{C/B}` (the free case is Mathlib's `Algebra.trace_trace`; the finite
projective case follows by localising at primes, using the finite-projective scalar trace
and its cyclicity from R3.8). -/
theorem projectiveTrace_trans {C : Type*} [CommRing C] [Algebra B C] [Algebra R C]
    [IsScalarTower R B C] [Module.Finite B C] [Module.Projective B C] :
    ∃ (_ : Module.Finite R C) (_ : Module.Projective R C), ∀ c : C,
      projectiveTrace R C c = projectiveTrace R B (projectiveTrace B C c) := sorry

/-- A finite projective algebra is étale iff its trace pairing `B → Hom_R(B, R)` is bijective
(KL15, §1.2, p. 13; Stacks, Tag 0BJF, Lemma 49.3.1). -/
theorem etale_iff_projectiveTraceForm_bijective :
    Algebra.Etale R B ↔ Function.Bijective (projectiveTraceForm R B) := sorry

end Algebra

end

end TauCetiRoadmap.AdicSpacesPartIII
