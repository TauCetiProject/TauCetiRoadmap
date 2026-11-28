# Roadmap: quadratic Majorana Hamiltonians and the Kitaev chain

**Summary.** Take `2N` generators `c_1, …, c_2N` with `c_l² = 1` and `c_l c_m = −c_m c_l` for
`l ≠ m`, and a real skew-symmetric `2N × 2N` matrix `A`. The element

`H_A = (i/4) Σ_{l,m} A_lm c_l c_m`

is the general quadratic Hamiltonian of a system of `N` fermionic modes: with
`a_j = (c_{2j−1} + i c_{2j})/2` the `a_j` and their adjoints satisfy the canonical
anticommutation relations, and every Hamiltonian that is quadratic in them, pairing terms
included, is `H_A` plus a scalar. This roadmap proves that such a Hamiltonian is solved by linear
algebra on `A`, and works the Kitaev chain as the example.

The solution has three parts. First, `A ↦ −i H_A` is a homomorphism of Lie algebras from the real
skew-symmetric matrices, and `[H_A, c(v)] = i c(Av)` for `c(v) = Σ v_l c_l`. Second, there is a
real orthogonal `W` with `W A Wᵀ` a direct sum of blocks `[[0, ε_k], [−ε_k, 0]]`, `ε_k ≥ 0`, and
in the `2^N`-dimensional Jordan–Wigner representation the eigenvalues of `H_A` are the `2^N`
numbers `½ Σ_k σ_k ε_k`, one for each choice of signs `σ_k = ±1`. The least is `−½ Σ_k ε_k`, and
it is attained on a space of dimension `2^z`, where `z` is the number of `ε_k` equal to `0`.
Third, the parity `P = Π_j (−i c_{2j−1} c_{2j})` commutes with `H_A`, and when `A` is invertible
the ground state is unique and its parity is the sign of the Pfaffian of `A`. The Pfaffian is
built here over any commutative ring, with `Pf(B A Bᵀ) = det B · Pf A` and Cayley's identity
`det A = (Pf A)²`.

The Kitaev chain is the Hamiltonian on `N` sites with hopping `w`, chemical potential `μ` and
pairing `Δ`. The roadmap computes its matrix `A`, and then proves: at `μ = 0`, `Δ = w` the two end
generators `c_1` and `c_2N` drop out of `H`, so the ground space has dimension `2` and contains
one state of each parity; at `w = Δ = 0` the ground state is unique; a combination
`Σ_j f_j c_{2j−1}` of generators on one sublattice commutes with `H` up to a single term at the
far end, of size `(w + Δ) f_{N+1}`, when `f` solves a three-term recurrence; the closed chain has
single-particle energies `√((2w cos q + μ)² + 4Δ² sin² q)` at `q = 2πk/N`, and for `Δ ≠ 0` this
function of `q` has a zero exactly when `|μ| = 2|w|`; and the Pfaffian of the closed chain has an
explicit product formula, from which the sign of `μ² − 4w²` is the factor by which ground-state
parity fails to be multiplicative in the length of the chain.

The generators are Tau Ceti's `majorana`, in the complex Clifford algebra of
[TemperleyLiebOperatorAlgebras](../TemperleyLiebOperatorAlgebras/README.md) §1.7, with its
adjoint `cliffordAdjoint`. The normal form of `A` is Tau Ceti's normal form of a skew-adjoint
operator, and the Lie homomorphism is Tau Ceti's identification of Clifford bivectors with the
orthogonal Lie algebra. [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) D8 owns
the CAR algebra of a Hilbert space and its Bogoliubov automorphisms; this roadmap works in the
finite Clifford algebra and consumes nothing from D8.
[QuantumOptimization](../QuantumOptimization/README.md) §3.1 supplies the Pauli matrices on
`(ι → Bool)`-indexed vectors, in which the Jordan–Wigner representation is written.
[RandomMatrices](../RandomMatrices/README.md) §8.5 and
[ReductiveGroups](../ReductiveGroups/README.md) use Pfaffians and can take them from Layer 1.

## How to read the build

Layer 1 is the Pfaffian and uses no other layer. Layer 2 is the real normal form. Layer 3 is
algebra in the Clifford algebra: no representation appears, and each statement is an identity
between elements. Layer 4 introduces the Jordan–Wigner representation and proves the statements
about spectra and ground states. Layer 5 is the Kitaev chain. Each target is a bullet
`name : statement`. A *Needs:* line names the targets or supplier declarations a proof starts
from. **Checks** are numerical instances, each computed for this roadmap in the Jordan–Wigner
representation for `N = 3, 4, 5`; a check marked *false variant* is a statement that the
computation refutes.

## Conventions

- **Generators.** `Cl_m = CliffordAlgebra (cliffordForm m)` over `ℂ`, where `cliffordForm m` is
  the sum of squares on `Fin m → ℂ`, and `c_l = majorana m l`. In prose the generators are
  numbered `c_1, …, c_m`; in Lean `majorana m ⟨l − 1, _⟩`. For a site `j : Fin N` write
  `siteA j = ⟨2 * j, _⟩` and `siteB j = ⟨2 * j + 1, _⟩` in `Fin (2 * N)`; the two generators of
  the site, `c_{2j−1}` and `c_{2j}` in prose, are `majorana (2 * N) (siteA j)` and
  `majorana (2 * N) (siteB j)`.
- **Adjoint.** `x†` is `cliffordAdjoint m x`: conjugate-linear, product-reversing, with
  `c_l† = c_l`. Mathlib's `star` on a Clifford algebra is a different map (it negates `c_l`) and
  is not used.
- **Fermion operators.** `a_j = (c_{2j−1} + i c_{2j})/2` and `a_j† = (c_{2j−1} − i c_{2j})/2`, so
  `c_{2j−1} = a_j + a_j†` and `c_{2j} = (a_j − a_j†)/i` [Kit, (1)].
- **Hamiltonian.** `H_A = (i/4) Σ_{l,m} A_lm c_l c_m` for a real `m × m` matrix `A` with
  `Aᵀ = −A` [Kit, (3)]. The commutator is `[x, y] = x y − y x`.
- **Parity.** `P = Π_{j=1}^{N} (−i c_{2j−1} c_{2j})` [Kit, (9)]. The factors commute. In terms of
  the number operators, `−i c_{2j−1} c_{2j} = 1 − 2 a_j† a_j`.
- **Sublattices.** For an `N × N` matrix `M`, `bipartiteSkew M` is the `2N × 2N` skew matrix with
  `A_{2j−1, 2k} = M_jk`, `A_{2k, 2j−1} = −M_jk`, and all other entries `0`. The generators
  alternate between the two sublattices; the matrix is not in block form.
- **Pfaffian.** `pfaffian A` is the sum over perfect matchings of the index set, each arc `{x, y}`
  with `x < y` contributing `A x y`, with sign `(−1)^(number of crossings)`. On `Fin 4` it is
  `A₀₁ A₂₃ − A₀₂ A₁₃ + A₀₃ A₁₂`.
- **Kitaev chain.** `w`, `μ`, `Δ` are real, of any sign. Kitaev writes the pairing as `|Δ| e^{iθ}`
  and removes `θ` by a change of generators [Kit, (5)]; this roadmap takes `θ = 0`.
- **Jordan–Wigner.** `c_{2j−1} ↦ X_j Z_1 ⋯ Z_{j−1}` and `c_{2j} ↦ Y_j Z_1 ⋯ Z_{j−1}`
  [Kit, footnote 2], on vectors indexed by `Fin N → Bool`, with `Z_j = diagHam (spin · j)`,
  `X_j = pauliX j` and `Y_j = i X_j Z_j`. The bit `true` at `j` means that mode `j` is occupied:
  `a_j† a_j ↦ diagHam (bit · j)`.

## Layer 1: Pfaffians

**Summary.** The Pfaffian of a matrix over a commutative ring, indexed by a finite linearly
ordered type, with the rules needed to compute it: expansion along a row, congruence, Cayley's
identity, and the two block forms.

### 1.1 Definition

- `matchingCrossings (D : Equiv.Perm α) : ℕ` : the number of pairs `(x, y)` with
  `x < y < D x < D y`. For a perfect matching `D` this counts the pairs of arcs that cross.
- `pfaffian (A : Matrix α α R) : R` :
  `∑ D : PerfectMatching α, (−1) ^ matchingCrossings D * D.weight A`, where
  `D.weight A = ∏ x, if x < D x then A x (D x) else 1` is `TauCeti.PerfectMatching.weight`
  [Hab, (12)].
- `pfaffian_fin_two` : `pfaffian A = A 0 1` on `Fin 2`.
- `pfaffian_fin_four` : `pfaffian A = A 0 1 * A 2 3 − A 0 2 * A 1 3 + A 0 3 * A 1 2` on `Fin 4`
  [Kit, the example after (20)].
- `pfaffian_of_isEmpty` : `pfaffian A = 1` when `α` is empty.
  `pfaffian_eq_zero_of_odd_card` : `pfaffian A = 0` when `α` has an odd number of elements.
- `pfaffian_map` : `pfaffian (A.map f) = f (pfaffian A)` for a ring homomorphism `f`.
  `pfaffian_smul` : `pfaffian (r • A) = r ^ (Fintype.card α / 2) * pfaffian A`.
- `pfaffian_succ_row` : on `Fin (n + 2)`,
  `pfaffian A = Σ_{j=1}^{n+1} (−1)^(j−1) A 0 j * pfaffian A'_j`, where `A'_j` is `A` with rows
  and columns `0` and `j` removed and the remaining indices in increasing order.

  *Needs:* `TauCeti.PerfectMatching.sum_weight_eq_sum_mul_sum_weight`, and the count of the arcs
  that the arc `{0, j}` crosses, which is `j − 1` modulo `2`.

The definition reads only the entries above the diagonal, so it makes sense for every matrix.
The theorems of 1.2 need `A` alternating, that is `Aᵀ = −A` with zero diagonal; over a ring in
which `2` is not a zero divisor the second condition follows from the first.

**Checks.**
- The `4 × 4` skew matrix with entries `1, 2, 3` in row `0`, `4, 5` in row `1` and `6` in row `2`
  above the diagonal has Pfaffian `1·6 − 2·5 + 3·4 = 8` and determinant `64`.
- *False variant.* Dropping the sign gives `1·6 + 2·5 + 3·4 = 28`, and `28² ≠ 64`. The unsigned
  sum is the quantity that `PerfectMatching.weight` sums in Wick's formula, and it is not the
  Pfaffian.
- For random skew matrices of sizes `2, 4, 6, 8` the matching sum agrees with `pfaffian_succ_row`.

### 1.2 Congruence and Cayley's identity

- `pfaffian_mul_mul_transpose` : for alternating `A` and any square `B`,
  `pfaffian (B * A * Bᵀ) = B.det * pfaffian A` [Hab, Theorem 3; Kit, (21)].
- `pfaffian_submatrix_perm` : for alternating `A` and a permutation `σ` of the index type,
  `pfaffian (A.submatrix σ σ) = sign σ * pfaffian A`.
- `det_eq_pfaffian_sq` : for alternating `A`, `A.det = pfaffian A ^ 2` [Hab, Theorem 4].

  *Needs:* Haber proves this over `ℂ` from the normal form. Over a commutative ring, prove it for
  the generic alternating matrix over `ℤ[x_ij]`, where it follows from the case of a field, and
  specialise with `pfaffian_map`. Tau Ceti's
  `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` is the statement, over a field, that
  the determinant is some square; this target names the square root.

**Checks.**
- Sizes `2, 4, 6, 8`, random `A` and `B`: both identities hold to `10⁻¹³`.
- *False variant.* `pfaffian (B * A * Bᵀ) = |det B| * pfaffian A` fails for a `B` of negative
  determinant.

### 1.3 Block forms

- `pfaffian_fromBlocks_diagonal` : for alternating `A₁` on `α` and `A₂` on `β`, the Pfaffian of
  `Matrix.fromBlocks A₁ 0 0 A₂` on `α ⊕ₗ β` is `pfaffian A₁ * pfaffian A₂` [Hab, §2].
- `pfaffian_fromBlocks_offDiagonal` : for `M : Matrix (Fin n) (Fin n) R`, the Pfaffian of
  `Matrix.fromBlocks 0 M (−Mᵀ) 0` on `Fin n ⊕ₗ Fin n` is `(−1)^(n(n−1)/2) * M.det` [Hab, (16)].
- `bipartiteSkew (M : Matrix (Fin N) (Fin N) R) : Matrix (Fin (2 * N)) (Fin (2 * N)) R` : as in
  Conventions.
- `pfaffian_bipartiteSkew` : `pfaffian (bipartiteSkew M) = M.det`.

  *Needs:* `pfaffian_fromBlocks_offDiagonal`, and `pfaffian_submatrix_perm` for the permutation
  that sorts the indices by sublattice, whose sign is `(−1)^(n(n−1)/2)`.

**Checks.**
- `n = 2, 3, 4`, random `M`: both formulas hold.
- *False variant.* `pfaffian_fromBlocks_offDiagonal` without the sign fails for `n = 2` and
  `n = 3`; `pfaffian_bipartiteSkew` with the sign fails for `n = 2` and `n = 3`.
- `bipartiteSkew` of the `1 × 1` matrix `(m)` is `[[0, m], [−m, 0]]`, with Pfaffian `m`.

### Dependencies

Mathlib: `Matrix.det`, `Equiv.Perm.sign`, `Matrix.fromBlocks`, `MvPolynomial`. Tau Ceti:
`PerfectMatching`, `PerfectMatching.weight`, the row expansion of matching sums.

## Layer 2: the normal form of a real skew-symmetric matrix

**Summary.** A real skew-symmetric matrix of even size is orthogonally congruent to a direct sum
of `2 × 2` blocks. The moduli of the blocks are determined by the matrix, and their product is
the Pfaffian up to the sign `det W`.

### 2.1 Existence

- `IsNormalForm (A : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ) (W) (ε : Fin N → ℝ) : Prop` :
  `W ∈ Matrix.orthogonalGroup (Fin (2 * N)) ℝ`, `0 ≤ ε k` for all `k`, and
  `W * A * Wᵀ = bipartiteSkew (Matrix.diagonal ε)`.
- `exists_isNormalForm` : every `A` with `Aᵀ = −A` has `W` and `ε` with `IsNormalForm A W ε`
  [Kit, (12); Hab, Theorem 1].

  *Needs:* `TauCeti.exists_orthonormal_apply_eq_smul_of_skew` for the single operator
  `Matrix.toLin' A`, which gives an orthonormal family `q_k, p_k` with `A q_k = a_k p_k`,
  `A p_k = −a_k q_k`, `a_k ≠ 0`, spanning the orthogonal complement of the kernel. Complete it by
  an orthonormal basis of the kernel, whose dimension is even, and change the sign of `p_k` where
  needed to make every `ε_k ≥ 0`.

### 2.2 What the normal form determines

For `IsNormalForm A W ε`:

- `IsNormalForm.charpoly` : `A.charpoly = ∏ k, (X ^ 2 + C (ε k ^ 2))`. So the multiset of the
  `ε_k` depends only on `A`: the eigenvalues of `A` are `±i ε_k`.
- `IsNormalForm.pfaffian_eq` : `pfaffian A = W.det * ∏ k, ε k`, and `W.det = ±1`. So
  `|pfaffian A| = ∏ k, ε k`, and if `pfaffian A ≠ 0` then `W.det` is the sign of `pfaffian A`
  [Kit, (19) and (21)].
- `IsNormalForm.charpoly_transpose_mul_self` : if `A = bipartiteSkew M`, then
  `(Mᵀ * M).charpoly = ∏ k, (X − C (ε k ^ 2))`: the `ε_k` are the singular values of `M`
  [LSM, (A-8)].

**Checks.**
- `N = 3, 4, 5`, random `A`: `∏ ε_k = |pfaffian A|` to `10⁻⁹`. *False variant:*
  `∏ ε_k = |det A|` fails.
- `N = 3, 4, 5`, random symmetric `h` and antisymmetric `D`: the `ε_k` of `bipartiteSkew (h − D)`
  are the singular values of `h − D`. *False variant:* they are not the absolute values of the
  eigenvalues of `h`.
- `A = 0`: `W = 1`, `ε = 0`.

### Dependencies

Layer 1. Mathlib: `Matrix.orthogonalGroup`, `Matrix.charpoly`. Tau Ceti: the simultaneous normal
form of commuting skew-adjoint operators.

## Layer 3: quadratic elements of the Clifford algebra

**Summary.** The elements `H_A`, their commutators, the parity element, the action of an
orthogonal change of generators, and the translation between Majorana and fermion form. Every
statement is an identity in `Cl_m` or `Cl_2N`.

### 3.1 The quadratic Hamiltonian

- `quadraticHamiltonian (A : Matrix (Fin m) (Fin m) ℝ) : CliffordAlgebra (cliffordForm m)` :
  `(Complex.I / 4) • ∑ l, ∑ k, (A l k : ℂ) • (majorana m l * majorana m k)`.
- `majoranaVector (v : Fin m → ℝ)` : `∑ l, (v l : ℂ) • majorana m l`, written `c(v)`.
- `quadraticHamiltonian_mem_even` : `H_A` lies in `CliffordAlgebra.even (cliffordForm m)`.
  `cliffordAdjoint_quadraticHamiltonian` : if `Aᵀ = −A` then `H_A† = H_A`.
- `quadraticHamiltonian_lie_majoranaVector` : if `Aᵀ = −A` then `[H_A, c(v)] = i c(A v)`.
- `quadraticHamiltonian_lie` : if `Aᵀ = −A` and `Bᵀ = −B` then `[H_A, H_B] = i H_{AB − BA}`.
- `quadraticHamiltonian_eq_bivectorExterior` : if `Aᵀ = −A` then
  `H_A = Complex.I • bivectorExterior (cliffordForm m) ((bivectorEquivSo m ℂ).symm A)`, with `A`
  read in `LieAlgebra.Orthogonal.so (Fin m) ℂ`. The two commutator formulas are then
  `CliffordAlgebra.ι_bivectorEquivSo_mulVec` and the fact that `bivectorEquivSo` is a Lie
  equivalence.
- `quadraticHamiltonian_injective` : on skew-symmetric matrices `A ↦ H_A` is injective.

The symmetric part of a matrix contributes only a scalar: for `Aᵀ = A` the same formula gives
`(i/4)(tr A) · 1`. This is why `A` is taken skew.

**Checks.**
- `N = 3, 4, 5`, random `A`, `B`, `v`: both commutator formulas hold to `10⁻¹³`.
- *False variant.* `[H_A, c(v)] = −i c(A v)` fails, and `[H_A, H_B] = H_{AB − BA}` fails.
- `m = 2`, `A = [[0, −μ], [μ, 0]]`: `H_A = −(iμ/2) c_1 c_2 = −μ (a† a − ½)`.

### 3.2 Parity

- `parityElement (N : ℕ) : CliffordAlgebra (cliffordForm (2 * N))` : the ordered product over
  `j : Fin N` of `−i c_{2j−1} c_{2j}`.
- `parityElement_mul_self` : `P * P = 1`. `cliffordAdjoint_parityElement` : `P† = P`.
- `parityElement_mul_majorana` : `P * c_l = −(c_l * P)` for every `l`.
- `parityElement_commute_quadraticHamiltonian` : `P` commutes with `H_A`, and with every element
  of the even subalgebra.

**Checks.**
- In the Jordan–Wigner representation `P` is `Z ⊗ ⋯ ⊗ Z`, the diagonal matrix with entry
  `(−1)^(number of occupied modes)`.
- *False variant.* `c_1` does not commute with `P`.

### 3.3 Orthogonal change of generators

For `W ∈ Matrix.orthogonalGroup (Fin m) ℝ` the map `v ↦ Wᵀ v` is an isometry of `cliffordForm m`,
and `CliffordAlgebra.map` of it is an automorphism `α_W` of `Cl_m` with
`α_W(c_l) = Σ_k W_lk c_k`.

- `orthogonalMap_majorana` : there is exactly one algebra homomorphism `α` of `Cl_m` with
  `α (majorana m l) = ∑ k, (W l k : ℂ) • majorana m k` for all `l`, and it is this `α_W`.
- `orthogonalMap_quadraticHamiltonian` : `α_W(H_A) = H_{Wᵀ A W}`.
- `orthogonalMap_parityElement` : for `m = 2N`, `α_W(P) = (det W) P` [Kit, the argument for (19)].
- `orthogonalMap_cliffordAdjoint` : `α_W(x†) = α_W(x)†`.

This is the finite algebraic form of a Bogoliubov transformation. OperatorAlgebraDynamics D8
states the automorphism of the CAR algebra of a Hilbert space induced by a pair `(U, V)` and, in
Majorana form, by a real orthogonal map; the statements here are about `Cl_2N` and need no norm.

**Checks.**
- `N = 3, 4, 5`, random orthogonal `W` of each determinant: `α_W(P) = (det W) P`.
- *False variant.* `α_W(P) = −(det W) P` fails, and `α_W(H_A) = H_{W A Wᵀ}` fails.
- `W` the reflection `c_1 ↦ −c_1`: `P ↦ −P`.

### 3.4 Fermion form

- `annihilation (N) (j : Fin N)` : `(1/2) • (c_{2j−1} + i c_{2j})`. `creation (N) (j)` :
  `(1/2) • (c_{2j−1} − i c_{2j})`, which is `cliffordAdjoint` of `annihilation N j`.
- `annihilation_mul_creation_add` : `a_j a_k† + a_k† a_j = δ_jk`, and
  `a_j a_k + a_k a_j = 0` [LSM, (2.8)].
- `pairingHamiltonian (h D : Matrix (Fin N) (Fin N) ℝ)` :
  `Σ_{j,k} h_jk a_j† a_k − ½ (tr h) + ½ Σ_{j,k} D_jk (a_j† a_k† + a_k a_j)`.
- `pairingHamiltonian_eq_quadraticHamiltonian` : if `hᵀ = h` and `Dᵀ = −D` then
  `pairingHamiltonian h D = quadraticHamiltonian (bipartiteSkew (h − D))` [LSM, Appendix A,
  where the two matrices are called `A` and `B` and `(A-7)` involves `A − B` and `A + B`].

So a Hamiltonian with real coefficients couples the two sublattices only.

**Checks.**
- `N = 3, 4, 5`, random `h` and `D`: the identity holds. *False variant:* with `h + D` in place
  of `h − D` it fails.
- `N = 1`, `h = (−μ)`, `D = 0`: `−μ (a† a − ½) = H_A` with `A = [[0, −μ], [μ, 0]]`, as in 3.1.

### Dependencies

Mathlib: `CliffordAlgebra.map`, `CliffordAlgebra.even`. Tau Ceti: `majorana` and its relations,
`cliffordAdjoint`, `bivectorExterior`, `bivectorEquivSo`.

## Layer 4: the Jordan–Wigner representation and the spectrum

**Summary.** `Cl_2N` is the algebra of all `2^N × 2^N` matrices, by an explicit isomorphism under
which `†` is the conjugate transpose. In it `H_A` is a Hermitian matrix, and Layer 2 gives its
eigenvalues, the dimension of its ground space, and the parity of its ground state.

### 4.1 The representation

- `jordanWignerGen (N) (l : Fin (2 * N)) : Matrix (Fin N → Bool) (Fin N → Bool) ℂ` : for
  `l = 2j` (the generator `c_{2j−1}` of site `j`), `pauliX j * S_j`; for `l = 2j + 1`,
  `(i • (pauliX j * diagHam (spin · j))) * S_j`; here `S_j = diagHam (fun x ↦ ∏ k < j, spin x k)`
  is the string [Kit, footnote 2; LSM, (2.5)].
- `exists_unique_jordanWigner` : there is exactly one algebra homomorphism
  `ρ : Cl_2N →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ` with
  `ρ (majorana (2 * N) l) = jordanWignerGen N l`. Write `jordanWigner N` for it.
- `jordanWigner_bijective` : `ρ` is bijective.

  *Needs:* `finrank_cliffordAlgebra_cliffordForm` (the dimension is `2^(2N)`), and surjectivity:
  `X_j`, `Z_j` are in the image by induction on `j`.
- `jordanWigner_cliffordAdjoint` : `ρ (x†) = (ρ x)ᴴ`.
- `jordanWigner_parityElement` : `ρ P = diagHam (fun x ↦ ∏ j, spin x j)`.
  `jordanWigner_number` : `ρ (a_j† a_j) = diagHam (bit · j)`.

**Checks.**
- `N = 3, 4, 5`: the `2N` matrices are Hermitian, square to `1` and anticommute.
- *False variant.* Without the strings `S_j` the matrices `X_j`, `Y_k` for `j ≠ k` commute, and
  the relations fail.
- `N = 1`: `c_1 ↦ X`, `c_2 ↦ Y`, `P ↦ Z`, `a ↦ (X + iY)/2`, which sends the occupied basis vector
  to the empty one.

### 4.2 The spectrum

For `Aᵀ = −A` and `IsNormalForm A W ε`:

- `jordanWigner_quadraticHamiltonian_isHermitian` : `ρ H_A` is a Hermitian matrix.
- `charpoly_jordanWigner_quadraticHamiltonian` :
  `(ρ H_A).charpoly = ∏ σ : Fin N → Bool, (X − C (½ Σ_k (±ε_k)))`, the sign of `ε_k` being `+`
  when `σ k` is true [Kit, (11)].
- `groundEnergy_quadraticHamiltonian` : the least eigenvalue of `ρ H_A` is `−½ Σ_k ε_k`.
- `finrank_groundSpace_quadraticHamiltonian` : the eigenspace of `−½ Σ_k ε_k` has dimension
  `2 ^ #{k | ε k = 0}`. In particular the ground state is unique up to a scalar exactly when
  `A` is invertible.

  *Needs:* `orthogonalMap_quadraticHamiltonian` with `Wᵀ` reduces to
  `A = bipartiteSkew (diagonal ε)`, where `H_A = (i/2) Σ_k ε_k c_{2k−1} c_{2k}` and
  `ρ H_A = −½ Σ_k ε_k Z_k` is diagonal. The automorphism `α_W` is inner in a matrix algebra, so
  it does not change the characteristic polynomial.

**Checks.**
- `N = 3, 4, 5`, random `A`: the `2^N` eigenvalues of `ρ H_A` are the numbers `½ Σ σ_k ε_k`, and
  the least is `−½ Σ ε_k`. *False variant:* with factor `1` in place of `½` they are not.
- `N = 1`, `A = [[0, −μ], [μ, 0]]`: `ρ H_A = (μ/2) Z`, `ε = |μ|`, eigenvalues `±|μ|/2`.

### 4.3 The parity of the ground state

- `groundState_parity` : if `pfaffian A ≠ 0`, then every `ψ` with
  `ρ H_A ψ = −(½ Σ_k ε_k) ψ` satisfies `ρ P ψ = sign (pfaffian A) ψ` [Kit, (19)].

  *Needs:* `orthogonalMap_parityElement`, `IsNormalForm.pfaffian_eq`: after the change of
  generators the ground state has every `Z_k = 1`, so parity `1`, and `α_W` multiplies `P` by
  `det W = sign (pfaffian A)`.
- `excited_parity` : under the same hypothesis, an eigenvector for `½ Σ_k σ_k ε_k` obtained by
  changing `r` of the signs of the ground state has parity `(−1)^r sign (pfaffian A)`.

**Checks.**
- `N = 3, 4, 5`, twelve random `A` each, both signs of the Pfaffian occurring: the ground state
  has parity `sign (pfaffian A)`. *False variant:* `−sign (pfaffian A)` fails.
- `N = 1`, `A = [[0, −μ], [μ, 0]]`, `pfaffian A = −μ`: for `μ < 0` the ground state is the empty
  one, of parity `1`; for `μ > 0` the occupied one, of parity `−1`.

### Dependencies

Layers 1, 2, 3. Mathlib: `Matrix.charpoly`, `Matrix.IsHermitian`, `Module.End.eigenspace`.
QuantumOptimization: `diagHam`, `pauliX`, `spin`, `bit`.

## Layer 5: the Kitaev chain

**Summary.** The chain with nearest-neighbour hopping and pairing, with free ends and closed
into a ring. The targets are identities and exact formulas for a chain of any finite length.

### 5.1 The Hamiltonian

- `kitaevCoupling (N) (w μ Δ : ℝ) : Matrix (Fin N) (Fin N) ℝ` : `−μ` on the diagonal,
  `−(w + Δ)` at `(j + 1, j)`, `Δ − w` at `(j, j + 1)`, and `0` elsewhere.
  `kitaevMatrix N w μ Δ = bipartiteSkew (kitaevCoupling N w μ Δ)`, so that
  `A_{2j−1, 2j} = −μ`, `A_{2j, 2j+1} = w + Δ` and `A_{2j−1, 2j+2} = Δ − w`.
- `quadraticHamiltonian_kitaevMatrix` : `H = quadraticHamiltonian (kitaevMatrix N w μ Δ)` equals
  both

  `Σ_{j=1}^{N} −μ (a_j† a_j − ½) + Σ_{j=1}^{N−1} [−w (a_j† a_{j+1} + a_{j+1}† a_j) + Δ (a_j a_{j+1} + a_{j+1}† a_j†)]`

  [Kit, (4)] and

  `(i/2) Σ_j [−μ c_{2j−1} c_{2j} + (w + Δ) c_{2j} c_{2j+1} + (Δ − w) c_{2j−1} c_{2j+2}]`

  [Kit, (6)], the last two terms for `j ≤ N − 1`.

  *Needs:* `pairingHamiltonian_eq_quadraticHamiltonian` with `h = −μ − w (S + Sᵀ)` and
  `D = Δ (S − Sᵀ)`, `S` the matrix with ones at `(j + 1, j)`.
- `pfaffian_kitaevMatrix` : `pfaffian (kitaevMatrix N w μ Δ) = (kitaevCoupling N w μ Δ).det`, and
  for `Δ = w` this is `(−μ)^N`.

**Checks.**
- `N = 3, 4, 5`, `(w, μ, Δ) = (0.83, 0.57, −0.41)`: the three expressions agree.
- *False variant.* With the pairing term of opposite sign, or with `w + Δ` and `Δ − w`
  exchanged, they do not.
- `N = 3`, `w = Δ = μ = 1`: `pfaffian = −1`.

### 5.2 The two exactly solved points

- `kitaev_trivial` : for `w = Δ = 0`, `H = −μ Σ_j (a_j† a_j − ½)`; `ε_k = |μ|` for all `k`;
  `pfaffian = (−μ)^N`. For `μ ≠ 0` the ground state is unique, with energy `−|μ| N/2`, and the
  next eigenvalue is `|μ|` higher. Its parity is `1` for `μ < 0` and `(−1)^N` for `μ > 0`
  [Kit, case (a)].
- `kitaev_sweetSpot` : for `μ = 0` and `Δ = w`, `H = i w Σ_{j=1}^{N−1} c_{2j} c_{2j+1}`
  [Kit, (7)]. Hence `c_1` and `c_2N` commute with `H`.
- `charpoly_kitaev_sweetSpot` : for `N ≥ 1`, `μ = 0`, `Δ = w`,
  `(ρ H).charpoly = ∏_{k=0}^{N−1} (X − C (w (2k − (N − 1)))) ^ (2 * (N − 1).choose k)`. The
  `ε_k` are `0` once and `2|w|` with multiplicity `N − 1`.
- `kitaev_sweetSpot_groundSpace` : for `N ≥ 1`, `w ≠ 0`, the ground space has dimension `2`, is
  preserved by `ρ P`, and `ρ P` has eigenvalues `1` and `−1` on it; the next eigenvalue is
  `2|w|` higher [Kit, (8)].

  *Needs:* with `ã_j = (c_{2j} + i c_{2j+1})/2`, `H = 2w Σ_{j=1}^{N−1} (ã_j† ã_j − ½)`; `c_1`
  commutes with `H` and anticommutes with `P`, so it exchanges the two parity sectors of every
  eigenspace.

**Checks.**
- `N = 2`, `w = 1`: `H = i c_2 c_3`, eigenvalues `−1, −1, 1, 1`.
- `N = 3, 4, 5`, `w = 0.83`: the levels and multiplicities are as stated, and the ground space
  has one state of each parity.
- *False variant.* `c_2` does not commute with `H` at the sweet spot, and the ground space is
  not of dimension `1`.
- `N = 3, 4, 5`, `w = Δ = 0`, `μ = ±0.7`: energy, gap, parity and Pfaffian as in
  `kitaev_trivial`. *False variant:* `pfaffian = μ^N` fails for odd `N`.

### 5.3 End modes

- `kitaev_lie_left` : for any `f : ℕ → ℝ`, with `f_0` and `f_{N+1}` read as `0`,

  `[H, Σ_{j=1}^{N} f_j c_{2j−1}] = i Σ_{j=1}^{N} (μ f_j + (w + Δ) f_{j+1} + (w − Δ) f_{j−1}) c_{2j}`.
- `kitaev_lie_right` : similarly
  `[H, Σ_j g_j c_{2j}] = −i Σ_j (μ g_j + (w + Δ) g_{j−1} + (w − Δ) g_{j+1}) c_{2j−1}`.

  *Needs:* `quadraticHamiltonian_lie_majoranaVector`.
- `kitaev_lie_left_of_recurrence` : for `N ≥ 1`, if `f : ℕ → ℝ` satisfies
  `(w − Δ) f_{j−1} + μ f_j + (w + Δ) f_{j+1} = 0` for `1 ≤ j ≤ N` and `(w − Δ) f_0 = 0`, then
  `[H, Σ_{j=1}^{N} f_j c_{2j−1}] = −i (w + Δ) f_{N+1} c_{2N}`.
- `kitaev_recurrence_roots` : for `w + Δ ≠ 0`, `f_j = x^j` solves the recurrence exactly when
  `(w + Δ) x² + μ x + (w − Δ) = 0`, that is
  `x = (−μ ± √(μ² − 4w² + 4Δ²)) / (2 (w + Δ))` [Kit, (14)].
- `kitaev_edgeMode` : for `N ≥ 1`, `Δ = w ≠ 0` and `x = −μ/(2w)`,
  `[H, Σ_j x^(j−1) c_{2j−1}] = i μ x^(N−1) c_{2N}` and
  `[H, Σ_j x^(N−j) c_{2j}] = −i μ x^(N−1) c_1`.

So for `Δ = w` and `|μ| < 2|w|` the two combinations, one concentrated at each end, commute with
`H` up to a term of size `|μ| |μ/2w|^(N−1)`. Kitaev's description of the two end modes for
`2|w| > |μ|` and of their coupling `t ∝ e^{−L/l₀}` [Kit, (14)–(15)] is asymptotic; the targets
here are the exact identities behind it.

**Checks.**
- `N = 3, 4, 5`, `(w, μ, Δ) = (0.83, 0.57, −0.41)`, random `f` and `g`: both commutator formulas
  hold. *False variant:* with `w + Δ` and `w − Δ` exchanged they fail.
- `N = 3`, `w = Δ = μ = 1`: `x = −½` and `[H, c_1 − ½ c_3 + ¼ c_5] = (i/4) c_6`. The single-particle
  energies are `0.1939, 1.9032, 2.7093`.
- *False variant.* With `x = +μ/(2w)` the commutator is not a multiple of `c_2N`.
- `μ = 0`, `Δ = w`: `x = 0`, the combinations are `c_1` and `c_2N`, and the right sides vanish,
  as in 5.2.

### 5.4 The closed chain

- `kitaevCouplingPeriodic (N) (w μ Δ)` : `−μ` at `(j, j)`, plus `−(w + Δ)` at `(j + 1, j)`, plus
  `Δ − w` at `(j, j + 1)`, indices modulo `N`, contributions to the same entry being added.
  `kitaevMatrixPeriodic = bipartiteSkew (kitaevCouplingPeriodic …)`. For `N ≥ 3` its Hamiltonian
  is that of 5.1 with the sums over bonds extended to the bond from `N` to `1`.
- `dispersion (w μ Δ q : ℝ) : ℝ` : `√((2w cos q + μ)² + 4Δ² sin² q)`.
- `charpoly_kitaevMatrixPeriodic` : for `N ≥ 1`,
  `(kitaevMatrixPeriodic N w μ Δ).charpoly = ∏_{k=0}^{N−1} (X² + C (dispersion w μ Δ (2πk/N) ²))`.
  So the `ε` of the closed chain are the values of `dispersion` at `q = 2πk/N` [Kit, (13)].
- `det_kitaevCouplingPeriodic` : `det = ∏_{k=0}^{N−1} m(2πk/N)` in `ℂ`, with
  `m(q) = −μ − 2w cos q − 2iΔ sin q`; and `|m(q)| = dispersion w μ Δ q`.

  *Needs:* the coupling matrix is circulant; its eigenvectors are the characters of `ZMod N`.
- `dispersion_eq_zero_iff` : `dispersion w μ Δ q = 0` exactly when `2w cos q + μ = 0` and
  `Δ sin q = 0`.
- `exists_dispersion_eq_zero_iff` : if `Δ ≠ 0`, some real `q` has `dispersion w μ Δ q = 0`
  exactly when `|μ| = 2|w|`; the zero is at `q = 0` when `μ = −2w` and at `q = π` when `μ = 2w`.
  If `Δ = 0`, some real `q` has `dispersion w μ 0 q = 0` exactly when `|μ| ≤ 2|w|`.

So with `Δ ≠ 0` the infimum over `q` of the single-particle energy is positive on both sides of
`|μ| = 2|w|`, and vanishes there. These are Kitaev's two phases: `2|w| < |μ|`, and
`2|w| > |μ|` with `Δ ≠ 0` [Kit, after (13)].

**Checks.**
- `N = 3, 4, 5`, `(w, μ, Δ) = (0.83, 0.57, −0.41)`: the `ε` of the closed chain are the values of
  `dispersion`, and the `2^N` eigenvalues of `ρ H` are `½ Σ ±ε`. *False variant:* with
  `Δ² sin² q` in place of `4Δ² sin² q` they are not.
- `N = 1, …, 7`: the characteristic polynomial and the determinant are as stated.
- `w = 0.8`, `Δ = 0.35`: the minimum of `dispersion` over `q` is `0` at `μ = ±1.6` and positive at
  `μ = 0, 0.5, −1.1, 1.59, 1.61, 2.4, −3`. *False variant:* it does not vanish at `μ = 0` or at
  `|μ| = |w|`.
- `Δ = 0`, `w = 0.8`: zero at `q = arccos(−μ/2w)` for `μ = 0, 0.7, −1.3, 1.6`, positive for
  `μ = 1.9`.

### 5.5 The Pfaffian of the closed chain and the sign `μ² − 4w²`

- `pfaffian_kitaevMatrixPeriodic` : for `N ≥ 1`,

  `pfaffian (kitaevMatrixPeriodic N w μ Δ) = −(μ + 2w) · e_N · ∏_{0 < k < N/2} dispersion w μ Δ (2πk/N) ²`,

  where `e_N = 2w − μ` if `N` is even and `e_N = 1` if `N` is odd.

  *Needs:* `pfaffian_bipartiteSkew`, `det_kitaevCouplingPeriodic`; the factors at `q` and `−q`
  are complex conjugates, `m(0) = −(μ + 2w)` and `m(π) = 2w − μ`.
- `sign_pfaffian_kitaevMatrixPeriodic` : if no `q = 2πk/N` is a zero of `dispersion`, the sign
  of the Pfaffian is `sign (μ² − 4w²)` for even `N` and `−sign (μ + 2w)` for odd `N`
  [Kit, (24)–(25)]. By `groundState_parity` this is the parity of the unique ground state of the
  closed chain.
- `sign_pfaffian_kitaevMatrixPeriodic_add` : for `N₁, N₂ ≥ 1`, if the three Pfaffians are
  nonzero, then

  `sign Pf(N₁ + N₂) = sign (μ² − 4w²) · sign Pf(N₁) · sign Pf(N₂)`.

  Kitaev calls the factor the Majorana number `M(H)` [Kit, (17) and (26)]. It is `−1` exactly
  when `|μ| < 2|w|`, and it is `sign m(0) · sign m(π)`.

**Checks.**
- `w = Δ = 1`: `Pf = −8` at `(N, μ) = (3, 0)`, `−35` at `(3, 3)`, `−16` at `(4, 0)`, `65` at
  `(4, 3)`, `−5` at `(1, 3)` and `5` at `(2, 3)`.
- `N = 3, 4, 5` and eight parameter triples on both sides of `|μ| = 2|w|`: the formula holds, and
  the ground state of `ρ H` has the stated parity. *False variant:* the parity is not always `1`.
- `N₁, N₂ ∈ {3, 4, 5}`, four parameter triples: the sign rule holds. *False variant:* without
  the factor `sign (μ² − 4w²)` it fails when `|μ| < 2|w|`.

### Dependencies

Layers 1 to 4. Mathlib: `Real.cos`, `Real.sin`, `Real.sqrt`, `SignType.sign`, `ZMod`.

## Downstream consumers

- RandomMatrices §8.5 (Pfaffian point processes) and ReductiveGroups (the Pfaffian of `X J Xᵀ`)
  use Pfaffians and name no declaration for them; Layer 1 supplies `pfaffian`,
  `pfaffian_mul_mul_transpose` and `det_eq_pfaffian_sq`.
- OperatorAlgebraDynamics D8, once `CAR(ℂ^N) ≃ M_(2^N)(ℂ)` is in Tau Ceti, can identify that
  isomorphism with `jordanWigner N`; the comparison belongs to D8.

## Scope and ownership

This roadmap owns the Pfaffian of a matrix over a commutative ring (`pfaffian` and the theorems
of Layer 1), the matrix normal form of Layer 2, `quadraticHamiltonian`, `parityElement`,
`pairingHamiltonian`, the Jordan–Wigner representation `jordanWigner` of `Cl_2N`, the spectral
and parity theorems of Layer 4, and the Kitaev chain.

On the Pfaffian. No merged roadmap owns it. RandomMatrices §8.5 lists Pfaffian point processes
as a subject and names no Pfaffian declaration; ReductiveGroups, AbelianSchemesAndArithmeticModuli
and CharacteristicClasses use the Pfaffian of particular matrices; MatchingTheory puts Pfaffian
counting outside its scope. Tau Ceti has the determinant of an alternating matrix as a square
without naming the root, the unsigned matching sum `PerfectMatching.weight`, and one signed term
`BrauerDiagram.skewArcProd`; none of these is the Pfaffian. This roadmap needs the Pfaffian for
4.3 and 5.5, so it defines it, in the generality (a commutative ring, a finite linearly ordered
index type) that the other users need. The analytic theory of Pfaffian point processes stays
with RandomMatrices.

It does not own, and does not restate:

- `cliffordForm`, `majorana`, `cliffordAdjoint`, the even Clifford algebra and the
  Temperley–Lieb projections, which are TemperleyLiebOperatorAlgebras §1.7 and are in Tau Ceti.
  No second family of generators is introduced: `annihilation` and `creation` are defined from
  `majorana`;
- the CAR algebra `CAR(h)` of a Hilbert space, its Fock representation, quasi-free states and
  Bogoliubov automorphisms, which are OperatorAlgebraDynamics D8. `orthogonalMap` of 3.3 is
  Mathlib's `CliffordAlgebra.map`, not a new automorphism;
- the identification of Clifford bivectors with the orthogonal Lie algebra, which is in Tau
  Ceti (`CliffordAlgebra.bivectorEquivSo`); 3.1 states `H_A` in terms of it;
- the normal form of commuting skew-adjoint operators on a real inner product space, which is
  in Tau Ceti; 2.1 is its matrix form for one operator;
- `diagHam`, `pauliX`, `spin`, `bit`, which are QuantumOptimization §3.1;
- Hartree–Fock theory. The open roadmap HartreeFockTheory excludes generalised (Bogoliubov)
  Hartree–Fock theory and has no quadratic Hamiltonian with pairing;
- Courant–Fischer and singular values, which are VariationalMethods and Mathlib.

Not treated: Hamiltonians with complex coefficients beyond the form `H_A` with `A` real (a complex
Hermitian hopping matrix with pairing gives a real `A` that is not of the form `bipartiteSkew`,
and is covered by Layers 2 to 4 but not by 3.4); infinite chains and the thermodynamic limit;
bounds on the splitting of the two lowest levels of the open chain; interacting Hamiltonians.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`: `CliffordAlgebra`, `CliffordAlgebra.ι`,
  `CliffordAlgebra.lift`, `CliffordAlgebra.map`, `CliffordAlgebra.ι_sq_scalar`.
  `Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean`: `CliffordAlgebra.even`.
- `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`: `QuadraticMap.weightedSumSquares`.
- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det`.
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly`.
  `Mathlib/LinearAlgebra/UnitaryGroup.lean`: `Matrix.orthogonalGroup`.
  `Mathlib/LinearAlgebra/Matrix/Hermitian.lean`: `Matrix.IsHermitian`.
- `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.eigenspace`.
- `Mathlib/Algebra/Lie/Classical.lean`: `LieAlgebra.Orthogonal.so`.
- `Equiv.Perm`, `Equiv.Perm.sign`, `Matrix.fromBlocks`, `SignType.sign`, `Sum.Lex`.

Mathlib has no Pfaffian, no Majorana or fermion operators and no Jordan–Wigner representation.

### From Tau Ceti

All of the following are in Tau Ceti's main branch and none is at the roadmap's pin.

- `TauCeti/Algebra/TemperleyLieb/EvenClifford/Basic.lean`, namespace `TauCeti.TemperleyLieb`:
  `cliffordForm`, `majorana`, `majorana_mul_self`, `majorana_mul_majorana_add_swap_of_ne`,
  `majorana_mul_majorana_mem_even`, `ι_cliffordForm_eq_sum_majorana`,
  `finrank_cliffordAlgebra_cliffordForm`, `basis_cliffordForm_eq_prod_majorana`,
  `cliffordAdjoint`, `cliffordAdjoint_mul`, `cliffordAdjoint_majorana`,
  `cliffordAdjoint_algebraMap`, `cliffordAdjoint_cliffordAdjoint`.
- `TauCeti/Combinatorics/Enumerative/PerfectMatching.lean` and `PerfectMatching/Weight.lean`:
  `TauCeti.IsPerfectMatching`, `TauCeti.PerfectMatching`, `PerfectMatching.weight`,
  `PerfectMatching.sum_weight_eq_sum_mul_sum_weight`.
- `TauCeti/Analysis/InnerProductSpace/SkewSymmetric/NormalForm.lean`:
  `TauCeti.exists_orthonormal_apply_eq_smul_of_skew`.
- `TauCeti/LinearAlgebra/Matrix/Determinant/Skew.lean`:
  `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero`.
- `TauCeti/LinearAlgebra/CliffordAlgebra/Bivector/Basic.lean`: `CliffordAlgebra.bivector`,
  `CliffordAlgebra.bivectorExterior`, `CliffordAlgebra.bivector_lie_ι`,
  `CliffordAlgebra.bivector_eq_ι_mul_ι_of_isOrtho`.
  `TauCeti/LinearAlgebra/CliffordAlgebra/StandardBivector.lean`:
  `CliffordAlgebra.bivectorEquivSo`, `CliffordAlgebra.bivectorEquivSo_apply_ιMulti`,
  `CliffordAlgebra.ι_bivectorEquivSo_mulVec`.

`Suggested.lean` therefore carries copies of `cliffordForm` and `majorana`, unfolds
`PerfectMatching` and `PerfectMatching.weight` in the definition of `pfaffian`, and does not
state the targets that mention `cliffordAdjoint`, `bivectorExterior` or `bivectorEquivSo`.

### From TauCetiRoadmap.TemperleyLiebOperatorAlgebras

§1.7: the carriers `cliffordForm`, `majorana` and the adjoint `†`, through their Tau Ceti
implementation listed above.

### From TauCetiRoadmap.QuantumOptimization

§1.1 and §3.1: `spin`, `bit`, `diagHam`, `pauliX`. These are roadmap targets, not yet in Tau
Ceti; `Suggested.lean` carries copies of them.

## References

- [Hab] H. E. Haber, *Notes on antisymmetric matrices and the pfaffian*, lecture notes,
  University of California, Santa Cruz, `http://scipp.ucsc.edu/~haber/webpage/pfaffian2.pdf`.
  Theorem 1 and (2) (normal form), (10)–(12) (definition), Theorem 3 and (13) (congruence),
  (15)–(16) (off-diagonal block form), Theorem 4 and (18) (`det = pf²`).
- [Kit] A. Yu. Kitaev, *Unpaired Majorana fermions in quantum wires*, Physics-Uspekhi 44 (2001),
  suppl., 131–136, arXiv:cond-mat/0010440. Equations (1)–(3) (Majorana operators and the
  quadratic Hamiltonian), (4)–(8) (the chain and its two special cases), (9) (parity),
  (11)–(12) (canonical form), (13)–(15) (bulk spectrum and end modes), (17)–(26) (Majorana
  number and Pfaffians), footnote 2 (the Jordan–Wigner matrices).
- [LSM] E. Lieb, T. Schultz and D. Mattis, *Two soluble models of an antiferromagnetic chain*,
  Annals of Physics 16 (1961), 407–466. Equations (2.5)–(2.8) (the Jordan–Wigner transformation)
  and Appendix A, (A-1)–(A-12) (diagonalising a quadratic form in Fermi operators with real
  coefficients).
