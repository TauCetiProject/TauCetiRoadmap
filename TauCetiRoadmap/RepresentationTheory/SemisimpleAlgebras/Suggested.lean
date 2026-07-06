import Mathlib

/-!
# Semisimple algebras, Artin-Wedderburn, and central simple algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib already has the general structure theory: `IsSimpleModule`/`IsSemisimpleModule`/
`IsSemisimpleRing`, Schur's lemma (`Module.End.instDivisionRing`), the isotypic decomposition, the
**Artin-Wedderburn theorem** in the existence direction (`IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`
and the algebra / algebraically-closed forms), the Jacobson radical with
`IsArtinianRing.isSemisimpleRing_iff_jacobson`, the module density theorem
(`Module.Finite.toModuleEnd_moduleEnd_surjective`), little Wedderburn, the central-simple predicates
`Algebra.IsCentral`/`Algebra.IsCentralSimple`, the Brauer setoid, and the Azumaya map
`AlgHom.mulLeftRight` (see `README.md` for the file-by-file map).

What is missing, and what these targets pin, is the **API and assembly**: the invariance of the
Wedderburn data (`card_blocks_eq`, the dimension counts), the finite-dimensional **double-centralizer /
density** theorem (`toModuleEnd_bijective`), **central simple algebra** theory (tensor products stay
simple, `finrank` is a square, `A ⊗ Aᵒᵖ ≅ Mₙ(K)`), **Skolem-Noether** and the **centralizer theorem**,
and the **Brauer group as a group** with **splitting fields**. `README.md` remains definitive.
-/

namespace TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

open scoped TensorProduct

universe u v

/-! ## Layer 0: the Jacobson radical and the semisimplicity criterion -/

/-- **Semisimplicity criterion for finite-dimensional algebras**: `A` is semisimple iff its Jacobson
radical vanishes. Specializes `IsArtinianRing.isSemisimpleRing_iff_jacobson` through
`FiniteDimensional → IsArtinianRing`. -/
theorem isSemisimpleRing_iff_jacobson_eq_bot {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [FiniteDimensional K A] : IsSemisimpleRing A ↔ Ring.jacobson A = ⊥ := sorry

/-- **The radical is nilpotent** for a finite-dimensional algebra (from
`IsArtinianRing.isNilpotent_jacobson_bot` via the `IsSemiprimaryRing` instance). -/
theorem isNilpotent_jacobson {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [FiniteDimensional K A] : IsNilpotent (Ring.jacobson A) := sorry

/-- **The radical quotient is semisimple**: the semisimple quotient of a finite-dimensional algebra. -/
theorem isSemisimpleRing_quotient_jacobson {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [FiniteDimensional K A] : IsSemisimpleRing (A ⧸ Ring.jacobson A) := sorry

/-! ## Layer 1: simple modules, Schur, and isotypic components -/

/-- **Schur, the vanishing half**: a homomorphism between simple modules with no linear equivalence
between them is zero (packaging `bijective_or_eq_zero`). -/
theorem hom_eq_zero_of_isEmpty_linearEquiv {R : Type u} [Ring R] {M N : Type v}
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    [IsSimpleModule R M] [IsSimpleModule R N] (h : IsEmpty (M ≃ₗ[R] N)) (f : M →ₗ[R] N) :
    f = 0 := sorry

/-- **Schur over an algebraically closed field**: a finite-dimensional division algebra over an
algebraically closed field is the field itself. This is the fact that forces the Wedderburn blocks over
`k` to be honest matrix algebras `Matₙ(k)`. -/
theorem algEquiv_self_of_finiteDimensional_divisionRing {k D : Type u} [Field k] [IsAlgClosed k]
    [DivisionRing D] [Algebra k D] [FiniteDimensional k D] : Nonempty (D ≃ₐ[k] k) := sorry

/-! ## Layer 2: Artin-Wedderburn, assembled with uniqueness -/

/-- **Invariance of the block count**: two Wedderburn presentations of the same semisimple ring have
the same number of blocks. The base case of Wedderburn uniqueness; the degrees and division rings are
invariants read off the same isotypic decomposition. -/
theorem card_blocks_eq {R : Type u} [Ring R] [IsSemisimpleRing R]
    {m n : ℕ} {D : Fin m → Type u} {D' : Fin n → Type u}
    [∀ i, DivisionRing (D i)] [∀ i, DivisionRing (D' i)] {d : Fin m → ℕ} {d' : Fin n → ℕ}
    (e : R ≃+* Π i, Matrix (Fin (d i)) (Fin (d i)) (D i))
    (e' : R ≃+* Π i, Matrix (Fin (d' i)) (Fin (d' i)) (D' i)) : m = n := sorry

/-- **The dimension count** for a finite-dimensional semisimple algebra:
`finrank K A = ∑ᵢ nᵢ² · finrank K Dᵢ`. -/
theorem finrank_eq_sum_sq_finrank {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [IsSemisimpleRing A] [FiniteDimensional K A] {n : ℕ} {D : Fin n → Type u}
    [∀ i, DivisionRing (D i)] [∀ i, Algebra K (D i)] {d : Fin n → ℕ}
    (e : A ≃ₐ[K] Π i, Matrix (Fin (d i)) (Fin (d i)) (D i)) :
    Module.finrank K A = ∑ i, (d i) ^ 2 * Module.finrank K (D i) := sorry

/-- **The dimension count over an algebraically closed field**: `finrank k A = ∑ᵢ nᵢ²`. This is the
identity `∑ nᵢ² = |G|` consumed by `../CharacterTheory/README.md`. -/
theorem finrank_eq_sum_sq_of_isAlgClosed {k A : Type u} [Field k] [IsAlgClosed k] [Ring A]
    [Algebra k A] [IsSemisimpleRing A] [FiniteDimensional k A] {n : ℕ} {d : Fin n → ℕ}
    (e : A ≃ₐ[k] Π i, Matrix (Fin (d i)) (Fin (d i)) k) :
    Module.finrank k A = ∑ i, (d i) ^ 2 := sorry

/-! ## Layer 3: the double-centralizer (density) theorem -/

/-- **The double-centralizer / density theorem**: for a simple module `M` over a simple ring `R` that
is finite over its endomorphism ring, the natural map `R → End_D M` (`D = End R M`) is a **bijection**,
sharpening `Module.Finite.toModuleEnd_moduleEnd_surjective` from surjective to bijective. This recovers
Wedderburn for a simple ring intrinsically as `R ≃ Matₙ(D)`. -/
theorem toModuleEnd_bijective {R : Type u} [Ring R] [IsSimpleRing R] {M : Type v}
    [AddCommGroup M] [Module R M] [IsSimpleModule R M] [Module.Finite (Module.End R M) M] :
    Function.Bijective (Module.toModuleEnd (Module.End R M) (S := R) M) := sorry

/-! ## Layer 4: central simple algebras and their tensor products -/

/-- **Tensor product of central simple algebras is simple.** Mathlib proves centrality of `A ⊗[K] B`
(`Algebra.Central.TensorProduct`); this supplies the missing simplicity, so central simple algebras are
closed under `⊗[K]`. -/
instance tensorProduct_isSimpleRing {K A B : Type u} [Field K] [Ring A] [Ring B] [Algebra K A]
    [Algebra K B] [Algebra.IsCentral K A] [IsSimpleRing A] [Algebra.IsCentral K B] [IsSimpleRing B]
    [FiniteDimensional K A] [FiniteDimensional K B] : IsSimpleRing (A ⊗[K] B) := sorry

/-- **The dimension of a central simple algebra is a perfect square** (its degree squared). Proved by
base change to the algebraic closure and the algebraically-closed Wedderburn decomposition. -/
theorem finrank_isSquare {K A : Type u} [Field K] [Ring A] [Algebra K A] [Algebra.IsCentral K A]
    [IsSimpleRing A] [FiniteDimensional K A] : IsSquare (Module.finrank K A) := sorry

/-- **The opposite isomorphism** `A ⊗[K] Aᵒᵖ ≃ₐ[K] Mₙ(K)` (`n = finrank K A`), packaging the Azumaya
map `AlgHom.mulLeftRight`. This is what makes `[Aᵒᵖ]` the Brauer inverse of `[A]`. -/
theorem tensorOp_algEquiv_matrix {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] :
    Nonempty (A ⊗[K] Aᵐᵒᵖ ≃ₐ[K]
      Matrix (Fin (Module.finrank K A)) (Fin (Module.finrank K A)) K) := sorry

/-! ## Layer 5: Skolem-Noether and the centralizer theorem -/

/-- **Skolem-Noether**: two `K`-algebra homomorphisms from a simple algebra `B` into a central simple
algebra `A` are conjugate by a unit of `A`. In particular every automorphism of a central simple algebra
is inner. Proved via the module density of Layer 3. -/
theorem skolemNoether {K A B : Type u} [Field K] [Ring A] [Ring B] [Algebra K A] [Algebra K B]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] [IsSimpleRing B]
    [FiniteDimensional K B] (f g : B →ₐ[K] A) :
    ∃ u : Aˣ, ∀ x : B, g x = (u : A) * f x * (↑u⁻¹ : A) := sorry

/-- **The centralizer of a simple subalgebra is simple.** -/
theorem centralizer_isSimpleRing {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] (B : Subalgebra K A)
    [IsSimpleRing B] : IsSimpleRing (Subalgebra.centralizer K (B : Set A)) := sorry

/-- **The centralizer theorem (dimension form)**: `dim_K B · dim_K C_A(B) = dim_K A` for a simple
subalgebra `B` of a central simple algebra `A`. Together with `C_A(C_A(B)) = B` (a further target). -/
theorem finrank_mul_finrank_centralizer {K A : Type u} [Field K] [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] (B : Subalgebra K A)
    [IsSimpleRing B] :
    Module.finrank K B * Module.finrank K (Subalgebra.centralizer K (B : Set A))
      = Module.finrank K A := sorry

/-! ## Layer 6: the Brauer group and splitting fields -/

/-- **The Brauer group is a commutative group**, with multiplication induced by `⊗[K]` (well-defined by
Layer 4 simplicity and matrix absorption), identity `[K]`, and inverse `[Aᵒᵖ]` (the opposite
isomorphism). Mathlib currently provides only the underlying `Quotient`. -/
noncomputable instance brauerCommGroup {K : Type u} [Field K] :
    CommGroup (BrauerGroup (K := K)) := sorry

/-- **A splitting field**: `L` splits `A` when `L ⊗[K] A` is a matrix algebra over `L`. (Namespaced to
avoid Mathlib's polynomial `IsSplittingField`.) -/
def IsSplittingField (K A L : Type u) [Field K] [Field L] [Ring A] [Algebra K A] [Algebra K L] :
    Prop :=
  ∃ n : ℕ, Nonempty (L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L)

/-- **Every central simple algebra is split by an algebraically closed extension** (from the
algebraically-closed Wedderburn decomposition after base change). -/
theorem isSplittingField_of_isAlgClosed {K A L : Type u} [Field K] [Field L] [IsAlgClosed L]
    [Ring A] [Algebra K A] [Algebra K L] [Algebra.IsCentral K A] [IsSimpleRing A]
    [FiniteDimensional K A] : IsSplittingField K A L := sorry

/-! ### Worked example: the Hamilton quaternions over `ℝ` (the summit) -/

/-- `ℍ[ℝ]` is central over `ℝ`. -/
theorem quaternion_isCentral : Algebra.IsCentral ℝ (Quaternion ℝ) := sorry

/-- `ℍ[ℝ]` has dimension `4` over `ℝ` (degree `2`). -/
theorem quaternion_finrank : Module.finrank ℝ (Quaternion ℝ) = 4 := sorry

/-- `ℍ[ℝ] ⊗ ℍ[ℝ] ≃ M₄(ℝ)`, so the Brauer class `[ℍ]` has order `2` (using `ℍ ≃ ℍᵒᵖ`); `[ℍ]` generates
`BrauerGroup ℝ ≃ ℤ/2`. -/
theorem quaternion_tensor_self :
    Nonempty (Quaternion ℝ ⊗[ℝ] Quaternion ℝ ≃ₐ[ℝ] Matrix (Fin 4) (Fin 4) ℝ) := sorry

end TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras
