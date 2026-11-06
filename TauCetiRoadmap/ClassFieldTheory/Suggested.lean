import Mathlib
import TauCeti.NumberTheory.ClassFieldTheory.Formation.AbelianLayer
import TauCeti.NumberTheory.ClassFieldTheory.Global.LocalInvariant
import TauCeti.NumberTheory.ClassFieldTheory.Local.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.NormSubgroup
import TauCeti.NumberTheory.ClassFieldTheory.MuNRep
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Relative
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic

/-!
# Class field theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two small
definitions they need (`characterConductorExp` and `quaternionNormForm`).

Tate's theorem for a class formation, the abstract Artin map, the local class formation, finite
local reciprocity, the absolute local Artin map, the local invariant `invMap`, the local
invariants `finiteInvAt` and `infiniteInvAt` of a global Brauer class, and local Tate duality for
finite modules killed by an integer invertible in the field are proved in Tau Ceti at the pin
(`TauCeti/NumberTheory/ClassFieldTheory/`), so none of them is restated here.

The headline theorems stated below are:

* local existence, in mixed characteristic and in the prime-to-residue-characteristic range
  (Layer 8);
* Tate's local Euler-characteristic formula over finite extensions of `ℚ_p` (Layer 5);
* `cd_ℓ G_K = scd_ℓ G_K = 2` for finite extensions of `ℚ_p` (Layer 6);
* the upper-numbering theorem and the local conductor–discriminant formula (Layer 7);
* the Albert–Brauer–Hasse–Noether exact sequence for the Brauer group of a number field
  (Layer 10);
* global Artin reciprocity on the idele class group, with its Frobenius normalization
  (Layer 11);
* global existence and the order-reversing class-field correspondence (Layer 12);
* the Hasse norm theorem for cyclic extensions, the Hilbert class field and the Kronecker–Weber
  theorem (Layer 13);
* Hilbert reciprocity (Layer 14).

The following headline theorems are not statable at the pins:

* the local Weil group and its reciprocity isomorphism `Kˣ ≃ W_K^ab` (Layer 9): no Weil-group
  carrier with its own topology, finer than the subspace topology from `G_K`, exists in Mathlib or
  Tau Ceti;
* the global conductor–discriminant formula and the description of class fields by admissible
  moduli and ray class groups (Layers 12 and 13): the conductor of an abelian extension needs the
  global Artin map as a carrier, and that map is a construction of this roadmap, available here
  only through the existence statement `exists_globalArtinMap`.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open IsDedekindDomain NumberField TauCeti TauCeti.ClassFieldTheory TauCeti.GlobalNumberFields
open scoped nonZeroDivisors ValuativeRel

/-! ## Layer 5: local coefficients, the Brauer group, the local invariant, and duality -/

/-- **Tate's local Euler-characteristic formula** (Milne, *Arithmetic Duality Theorems*, I
Theorem 2.8, where `χ(G, M) = (R : mR)⁻¹` for `m = #M`). Let `F` be a finite extension
of `ℚ_p` and `A` a finite discrete `G_F`-module, killed by `n ≠ 0` and with open point
stabilizers. Then `#H¹(G_F, A) = #H⁰(G_F, A) · #H²(G_F, A) · p^([F : ℚ_p] · v_p(#A))`, the
cardinality form of `χ(A) = ‖#A‖_F`. -/
theorem eulerCharacteristic_mixed (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F) [Finite A.V] [DiscreteTopology A.V]
    (_hA : IsSmoothDiscrete (ZMod n) A) :
    Nat.card (continuousCohomology 1 A) =
      Nat.card (continuousCohomology 0 A) * Nat.card (continuousCohomology 2 A) *
        p ^ (Module.finrank ℚ_[p] F * padicValNat p (Nat.card A.V)) :=
  sorry

/-! ## Layer 6: the local class formation and finite local reciprocity -/

/-- **The `ℓ`-cohomological dimension of the absolute Galois group of a `p`-adic field is `2`**,
for every prime `ℓ`: it is at most the strict cohomological dimension `2`, and
`H²(G_K, μ_ℓ)` is dual to `H⁰(G_K, ℤ/ℓ) = ℤ/ℓ` (Milne, *Arithmetic Duality Theorems*, I
Remark 1.12 and Corollary 2.3). -/
theorem cohomologicalDimensionAt_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    cohomologicalDimensionAt.{0} ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-- **The strict `ℓ`-cohomological dimension of the absolute Galois group of a `p`-adic field is
`2`**, for every prime `ℓ` (Milne, *Arithmetic Duality Theorems*, I Remark 1.12, Brumer's
criterion applied to the class formation of I Example 1.6(b)). -/
theorem strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    strictCohomologicalDimensionAt.{0} ℓ (Field.absoluteGaloisGroup K) = 2 :=
  sorry

/-! ## Layer 7: the absolute local Artin map, its normalizations, and conductors -/

/-- **The upper-numbering theorem** (Neukirch, *Algebraic Number Theory*, V Theorem 6.2; Serre,
*Local Fields*, XV §2). For
a finite abelian extension `L/K` of nonarchimedean local fields and `n ≥ 0`, the norm residue
isomorphism `Kˣ / N(Lˣ) ≃ Gal(L/K)^ab` maps the image of the unit group `U_K^(n)` onto the image of
the upper ramification group `G^n` (Serre's numbering, `upperRamificationGroup`). At `n = 0` it
says that the units go onto inertia. -/
theorem normResidue_map_unitFiltration
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [IsMulCommutative (L ≃ₐ[K] L)] (n : ℕ) :
    (unitFiltration K n).map
        ((normResidue K L).toMonoidHom.comp (QuotientGroup.mk' (normGroup K L))) =
      (LocalFieldsRamification.upperRamificationGroup K L
          ⟨n, Nat.cast_mem_ramificationIndexDomain n⟩).map Abelianization.of :=
  sorry

/-- **The conductor exponent of a character** `χ : Gal(L/K) → ℂˣ` of a finite Galois extension of
nonarchimedean local fields: the least `n` such that the unit group `U_K^(n)` lies in the kernel of
`χ` read on `Kˣ` through the norm residue isomorphism. It is `0` exactly for unramified `χ`. -/
noncomputable def characterConductorExp
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [Algebra K L] [Module.Finite K L] [IsGalois K L]
    (χ : (L ≃ₐ[K] L) →* ℂˣ) : ℕ :=
  sInf {n : ℕ | unitFiltration K n ≤
    ((Abelianization.lift χ).comp
      ((normResidue K L).toMonoidHom.comp (QuotientGroup.mk' (normGroup K L)))).ker}

/-- **The local conductor–discriminant formula** (Serre, *Local Fields*, IV §1 and VI §2, with
the upper-numbering theorem identifying the class-field conductor of a character with its Artin
conductor). For a finite abelian extension `L/K` of nonarchimedean local fields, the exponent
`δ(L/K) = f · d` of the discriminant ideal of `L/K` in `𝒪[K]` is the sum of the conductor
exponents of the characters of `Gal(L/K)`. -/
theorem discriminantExponent_eq_finsum_characterConductorExp
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [IsMulCommutative (L ≃ₐ[K] L)] :
    discriminantExponent K L = ∑ᶠ χ : (L ≃ₐ[K] L) →* ℂˣ, characterConductorExp K L χ :=
  sorry

/-! ## Layer 8: separate arithmetic local existence and the local class-field correspondence -/

/-- **Local existence for finite extensions of `ℚ_p`** (Milne, *Class Field Theory*, III
Theorem 5.1, proved there in characteristic zero; I Theorem 1.4): every open subgroup of finite index of
`Kˣ` is the norm subgroup `localNormSubgroup K V` of a finite abelian layer `V` of `G_K`. -/
theorem localAbelianExistence (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (N : Subgroup Kˣ) (_hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (AbsoluteGaloisGroup K),
      V.IsAbelianClassFieldLayer ∧ localNormSubgroup K V = N :=
  sorry

/-- **Local existence in the prime-to-residue-characteristic range**, in every characteristic:
an open subgroup of `Kˣ` whose finite index is prime to the residue characteristic `p` is the norm
subgroup of a finite abelian layer of `G_K` (Milne, *Class Field Theory*, I Theorem 1.4, the case
of index prime to `p`); the class field is a tamely ramified Kummer extension of an unramified
extension. -/
theorem localAbelianExistence_primeToResidueCharacteristic (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CharP 𝓀[K] p]
    (N : Subgroup Kˣ) (_hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex]
    (_hindex : Nat.Coprime (Nat.card (Kˣ ⧸ N)) p) :
    ∃ V : OpenNormalSubgroup (AbsoluteGaloisGroup K),
      V.IsAbelianClassFieldLayer ∧ localNormSubgroup K V = N :=
  sorry

/-! ## Layer 10: global carriers, the Brauer sequence, and the sum of local invariants -/

/-- **Reciprocity for the Brauer group of a number field** (Milne, *Class Field Theory*, VIII
Theorem 4.2, exactness in the middle): a class `x ∈ Br K` has
nonzero local invariant at only finitely many finite places, and the sum of all its local
invariants, finite and infinite, is `0` in `ℚ/ℤ`. -/
theorem finite_support_finiteInvAt_and_sum_localInv_eq_zero
    (K : Type) [Field K] [NumberField K] (x : Br K) :
    (Function.support fun v : HeightOneSpectrum (𝓞 K) => finiteInvAt K v x).Finite ∧
      (∑ᶠ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x) +
          ∑ w : InfinitePlace K, infiniteInvAt K w x = 0 :=
  sorry

/-- **The Albert–Brauer–Hasse–Noether theorem** (Milne, *Class Field Theory*, VIII Theorem 4.2): a
class of `Br K` whose local invariants all vanish is zero. -/
theorem eq_zero_of_forall_localInv_eq_zero (K : Type) [Field K] [NumberField K] (x : Br K)
    (_hf : ∀ v : HeightOneSpectrum (𝓞 K), finiteInvAt K v x = 0)
    (_hi : ∀ w : InfinitePlace K, infiniteInvAt K w x = 0) :
    x = 0 :=
  sorry

/-- **Surjectivity onto the sum-zero families** (Milne, *Class Field Theory*, VIII Theorem 4.2):
every finitely supported family of local invariants that vanishes at the complex places, is
killed by `2` at the real places and sums to `0` is the family of a class of `Br K`. -/
theorem exists_br_of_sum_eq_zero (K : Type) [Field K] [NumberField K]
    (f : HeightOneSpectrum (𝓞 K) → AddCircle (1 : ℚ)) (g : InfinitePlace K → AddCircle (1 : ℚ))
    (_hf : (Function.support f).Finite)
    (_hreal : ∀ w : InfinitePlace K, w.IsReal → g w ∈ AddSubgroup.torsionBy (AddCircle (1 : ℚ)) 2)
    (_hcomplex : ∀ w : InfinitePlace K, w.IsComplex → g w = 0)
    (_hsum : (∑ᶠ v, f v) + ∑ w, g w = 0) :
    ∃ x : Br K, (∀ v, finiteInvAt K v x = f v) ∧ ∀ w, infiniteInvAt K w x = g w :=
  sorry

/-! ## Layer 11: the global class formation and global Artin reciprocity -/

/-- **Global Artin reciprocity on the idele class group** (Milne, *Class Field Theory*, V
Theorem 5.3(b), with the Frobenius normalization of V Theorem 3.5). For a finite abelian extension `L/K` of number fields there is a surjective homomorphism
`φ : C_K → Gal(L/K)` whose kernel is the norm group `N_{L/K} C_L`, and which sends the idele class
of a uniformizer `π` of `K_v` to the arithmetic Frobenius of every prime `Q` of `𝓞 L` above `v`,
for every finite place `v` unramified in `L`. The Frobenius values at the unramified places and
the kernel determine `φ`, so the statement pins the arithmetic, not the geometric, normalization. -/
theorem exists_globalArtinMap (K : Type) [Field K] [NumberField K]
    (L : Type) [Field L] [NumberField L] [Algebra K L] [IsAbelianGalois K L] :
    ∃ φ : IdeleClassGroup (𝓞 K) K →* (L ≃ₐ[K] L),
      Function.Surjective φ ∧
        φ.ker = (ideleClassNormMap K L).toMonoidHom.range ∧
        ∀ (v : HeightOneSpectrum (𝓞 K)) (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
          Algebra.IsUnramifiedAt (𝓞 K) Q →
          ∀ (π : v.adicCompletionIntegers K) (hπ : (π : v.adicCompletion K) ≠ 0), Irreducible π →
            IsArithFrobAt (𝓞 K)
              (φ (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v (Units.mk0 _ hπ))) Q :=
  sorry

/-! ## Layer 12: separate arithmetic global existence, the norm index, and the global
correspondence -/

/-- **Global existence** (Milne, *Class Field Theory*, V Theorem 5.5): every open subgroup of
finite index of the idele class group `C_K` of a number field is the norm group `Nm(C_L)` of a
finite abelian extension `L/K`. -/
theorem globalAbelianExistence (K : Type) [Field K] [NumberField K]
    (N : Subgroup (IdeleClassGroup (𝓞 K) K)) (_hN : IsOpen (N : Set (IdeleClassGroup (𝓞 K) K)))
    [N.FiniteIndex] :
    ∃ (L : Type) (_ : Field L) (_ : NumberField L) (_ : Algebra K L),
      IsAbelianGalois K L ∧ (ideleClassNormMap K L).toMonoidHom.range = N :=
  sorry

/-- **The global class-field correspondence reverses inclusions** (Milne, *Class Field Theory*,
V Corollary 5.6): for finite abelian extensions `L₁` and `L₂` of a number field
`K`, the norm group of `L₂` lies in that of `L₁` exactly when `L₁` embeds in `L₂` over `K`. In
particular two finite abelian extensions with the same norm group are isomorphic over `K`. -/
theorem ideleClassNormMap_range_le_iff (K : Type) [Field K] [NumberField K]
    (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra K L₁] [IsAbelianGalois K L₁]
    (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra K L₂] [IsAbelianGalois K L₂] :
    (ideleClassNormMap K L₂).toMonoidHom.range ≤ (ideleClassNormMap K L₁).toMonoidHom.range ↔
      Nonempty (L₁ →ₐ[K] L₂) :=
  sorry

/-! ## Layer 13: norm theorems and class fields -/

/-- **The Hasse norm theorem** (Milne, *Class Field Theory*, VIII Theorem 3.1): in a cyclic extension `L/K` of number fields an element of `Kˣ` is a norm from `Lˣ`
exactly when its principal idele is the norm of an idele of `L`, that is, when it is a local norm
at every place. -/
theorem cyclicHasseNorm (K : Type) [Field K] [NumberField K]
    (L : Type) [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      IdeleGroup.unitEmbedding (𝓞 K) K x ∈ (ideleNormMap K L).toMonoidHom.range :=
  sorry

/-- **The Hilbert class field** (Milne, *Class Field Theory*, V Example 3.9, the reciprocity law V
Theorem 3.5 for the modulus `1`, and the existence theorem V Theorem 3.6). A number field `K` has a finite abelian extension
`H`, unramified at every prime and every infinite place, with an isomorphism from the class group
of `𝓞 K` onto `Gal(H/K)` sending the class of every nonzero prime `𝔭` to the arithmetic Frobenius
of every prime of `𝓞 H` above `𝔭`; and every finite abelian extension of `K` unramified at every
prime and every infinite place embeds in `H` over `K`. -/
theorem exists_hilbertClassField (K : Type) [Field K] [NumberField K] :
    ∃ (H : Type) (_ : Field H) (_ : NumberField H) (_ : Algebra K H) (_ : IsAbelianGalois K H),
      IsUnramifiedAtInfinitePlaces K H ∧
      (∀ (Q : Ideal (𝓞 H)) [Q.IsPrime], Q ≠ ⊥ → Algebra.IsUnramifiedAt (𝓞 K) Q) ∧
      (∃ φ : ClassGroup (𝓞 K) ≃* (H ≃ₐ[K] H),
        ∀ (P : (Ideal (𝓞 K))⁰) (Q : Ideal (𝓞 H)) [Q.IsPrime] [Q.LiesOver (P : Ideal (𝓞 K))],
          (P : Ideal (𝓞 K)).IsPrime → IsArithFrobAt (𝓞 K) (φ (ClassGroup.mk0 P)) Q) ∧
      ∀ (L : Type) [Field L] [NumberField L] [Algebra K L] [IsAbelianGalois K L],
        IsUnramifiedAtInfinitePlaces K L →
        (∀ (Q : Ideal (𝓞 L)) [Q.IsPrime], Q ≠ ⊥ → Algebra.IsUnramifiedAt (𝓞 K) Q) →
        Nonempty (L →ₐ[K] H) :=
  sorry

/-- **The Kronecker–Weber theorem** (Milne, *Class Field Theory*, I Theorem 4.16): every finite abelian extension of `ℚ` embeds in a cyclotomic
field. -/
theorem kroneckerWeber (E : Type) [Field E] [NumberField E] [IsAbelianGalois ℚ E] :
    ∃ n : ℕ, n ≠ 0 ∧ Nonempty (E →ₐ[ℚ] CyclotomicField n ℚ) :=
  sorry

/-! ## Layer 14: Hilbert reciprocity -/

/-- The norm form `x² − a y² − b z² + a b w²` of the quaternion algebra `(a, b)_F`. Over a field
of characteristic different from `2` it is anisotropic exactly when `(a, b)_F` is a division
algebra, that is, when the Hilbert symbol `(a, b)_F` is `−1`. -/
def quaternionNormForm (F : Type) [Field F] (a b : F) : QuadraticForm F (Fin 4 → F) :=
  QuadraticMap.weightedSumSquares F ![1, -a, -b, a * b]

/-- **Hilbert reciprocity** (Milne, *Class Field Theory*, V Example 5.4, and VIII Theorem 4.2
applied to the class of the quaternion algebra `(a, b)`, whose local invariant is `1/2` exactly
where its norm form is anisotropic): for `a, b ∈ Kˣ`, the quaternion algebra `(a, b)`
ramifies at finitely many places, and at an even number of them; equivalently, the product of the
Hilbert symbols `(a, b)_v` over all places is `1`. -/
theorem hilbertReciprocity (K : Type) [Field K] [NumberField K] (a b : Kˣ) :
    {v : HeightOneSpectrum (𝓞 K) |
        (quaternionNormForm (v.adicCompletion K) (algebraMap K _ a) (algebraMap K _ b)).Anisotropic
      }.Finite ∧
      Even ({v : HeightOneSpectrum (𝓞 K) |
          (quaternionNormForm (v.adicCompletion K) (algebraMap K _ a)
            (algebraMap K _ b)).Anisotropic}.ncard +
        {w : InfinitePlace K |
          (quaternionNormForm w.Completion (algebraMap K _ a) (algebraMap K _ b)).Anisotropic}.ncard) :=
  sorry

end TauCetiRoadmap.ClassFieldTheory
