# Roadmap: Clebsch–Gordan and Racah theory for SU(2), Hahn and Racah polynomials

**Summary.** The tensor product of the irreducible unitary representations of spins `j₁` and `j₂`
of SU(2) decomposes without multiplicity into the representations of spins
`j = |j₁ - j₂|, |j₁ - j₂| + 1, …, j₁ + j₂`. The entries of the unitary change of basis from the
product basis to the coupled basis are the Clebsch–Gordan coefficients
`(j₁ m₁ j₂ m₂ | j₁ j₂ j m)`, fixed by the Condon–Shortley phase; their symmetric rescaling is
Wigner's 3-j symbol. Coupling three spins in two orders gives a second orthogonal matrix, whose
entries are the 6-j symbols of Racah and Wigner. This roadmap builds the coupling theory on the
unitary model and derives from it the classical identities: orthogonality from unitarity, the
recursions from the raising and lowering operators, the symmetries, the expansion of a product of
two matrix elements and of two characters, the integral of three matrix elements over SU(2) as a
product of two 3-j symbols, the linearization and triple integral of Legendre polynomials, the
recoupling theorem, and the orthogonality, Racah and Biedenharn–Elliott sum rules of the 6-j
symbol. Read as functions of one magnetic or one intermediate spin, the coefficients are the Hahn
and the Racah polynomials, the top two discrete families of the Askey scheme: their orthogonality
is the unitarity of the coupling matrices at integral parameters and extends to real parameters by
polynomial identity, and the Hahn polynomials are a limit of the Racah polynomials. The
conventions are those of Edmonds and of DLMF Chapter 34, and the conversion to DLMF's forms of the
coefficients and the 3-j symbol is itself a target.

The roadmap rests on the roadmap SpecialFunctionsSU2MatrixElements, which supplies the unitary
model of spin `j`, its matrix elements, Schur orthogonality in coordinates, the raising and
lowering operators and the characters; and on Tau Ceti's tensor product of continuous
representations, with the inner product of the algebraic tensor product from Mathlib.
[LaguerreJacobi](../LaguerreJacobi/README.md) supplies the Legendre polynomials and their
orthogonality, and
[SpecialFunctionsGeneralizedHypergeometric](../SpecialFunctionsGeneralizedHypergeometric/README.md)
the terminating series and their transformations, which give the hypergeometric forms of the
coefficients. [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) owns the
Lie-algebra and polynomial side of `V(m) ⊗ V(n)` for `sl₂`; this roadmap works at the group level
with the orthonormal coupled basis. [QuantumGroups](../QuantumGroups/README.md) owns the
`q`-deformed Clebsch–Gordan and 6-j theory of `U_q(sl₂)`.

The roadmap is a synthesis of Edmonds, whose convention it adopts, of Vilenkin and Klimyk with
their survey, of Wawrzyńczyk, and of the DLMF for the closed forms and the normalizations of the
polynomials; it follows none of them section by section. Layer 1 couples two spins: admissible
triples, the coefficients, the coupled basis and its uniqueness, orthogonality, symmetries,
special values and recursions. Layer 2 is the 3-j symbol. Layer 3 expands products of matrix
elements and integrates them. Layer 4 identifies the coefficients with Hahn polynomials. Layer 5
couples three spins and builds the 6-j symbol. Layer 6 identifies the 6-j symbols with Racah
polynomials.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary, and Checks, which are sanity checks of the key definitions and theorems. Layer 1
is the foundation; within it, §1.3 uses the recursions of §1.7 or the entry formula of
SpecialFunctionsSU2MatrixElements, and the orthogonality of §1.4 follows from §1.3. Layer 2 uses
§§1.2, 1.4 and 1.5. Layer 3 uses §§1.3–1.4 and, from §3.2 on, the 3-j symbol of Layer 2. Layer 4
uses §§1.2, 1.4 and 1.5. Layer 5 uses Layers 1 and 2. Layer 6 uses Layer 5 and §4.1.

## Conventions

The convention is that of Edmonds [E], which is the convention of SpecialFunctionsSU2MatrixElements
and of DLMF Chapter 34.

- Spins and indices are natural numbers, doubled where needed: a spin `j = d/2` is given by
  `d : ℕ`, and a magnetic quantum number `m = i - d/2` by its index `i : ℕ`, valid for `i ≤ d`. The
  vector `e_i` of the unitary model of spin `d/2` has weight `m = i - d/2`, as in
  SpecialFunctionsSU2MatrixElements, §1.4. Edmonds's order `m = j, …, -j` is `i = d, …, 0`.
- An admissible triple (`IsTriad`) satisfies the three triangle inequalities and has
  `j₁ + j₂ + j` integral [E, (3.1.5), p. 34]; DLMF 34.2.1 states the same condition.
- The Clebsch–Gordan coefficient `clebschGordan d₁ d₂ d i₁ i₂ i` is Edmonds's
  `(j₁ m₁ j₂ m₂ | j₁ j₂ j m)` [E, (3.5.1), p. 37], with `j₁ = d₁/2`, `m₁ = i₁ - d₁/2`, and so on.
  It is defined by Racah's closed formula [E, (3.6.11), p. 45], is real, and is `0` unless
  `(j₁, j₂, j)` is an admissible triple, every index is in range and `m = m₁ + m₂`, which in
  indices is `2i + d₁ + d₂ = 2i₁ + 2i₂ + d`.
- The phase convention is Condon–Shortley: `(j₁ j₁ j₂ (j - j₁) | j₁ j₂ j j) > 0`
  [E, (3.5.11), p. 40], together with the matrices of the raising and lowering operators of
  SpecialFunctionsSU2MatrixElements, §4.1, which have nonnegative entries. Racah's formula with
  this convention reproduces the coupled vectors of the unitary model with no further sign.
- The coupled vector of spin `j` and index `i` is
  `Σ_{i₁, i₂} (j₁ m₁ j₂ m₂ | j m) e_{i₁} ⊗ e_{i₂}` in the algebraic tensor product
  `EuclideanSpace ℂ (Fin (d₁+1)) ⊗[ℂ] EuclideanSpace ℂ (Fin (d₂+1))`, on which Tau Ceti's
  `ContRepresentation.tprod` acts and which carries Mathlib's inner product with
  `TensorProduct.inner_tmul`.
- The 3-j symbol is
  `(j₁ j₂ j₃; m₁ m₂ m₃) = (-1)^{j₁ - j₂ - m₃} (2j₃ + 1)^{-1/2} (j₁ m₁ j₂ m₂ | j₁ j₂ j₃, -m₃)`
  [E, (3.7.3), p. 46]. In indices `-m₃` is `d₃ - i₃`, and `m₁ + m₂ + m₃ = 0` is
  `2(i₁ + i₂ + i₃) = d₁ + d₂ + d₃`. The exponent `j₁ - j₂ - m₃` is an integer on the support; the
  Lean form adds `2d₃` to keep it natural, which does not change the parity.
- Agreement with DLMF Chapter 34 is a pair of theorems, not a remark: DLMF 34.1.1 relates the
  coefficient and the 3-j symbol (`clebschGordan_eq_threeJ`; it is Edmonds's (3.7.3) solved for
  the coefficient), and DLMF 34.2.4 is Racah's single-sum form of the 3-j symbol
  (`threeJ_eq_racahSum`), both in §2.1.
- The 6-j symbol `sixJ a b c d e f` is `{j₁ j₂ j₃; l₁ l₂ l₃}` with doubled spins
  `(a, b, c, d, e, f) = 2(j₁, j₂, j₃, l₁, l₂, l₃)`, by Racah's formula [E, (6.3.7), p. 99], which
  is DLMF 34.4.2, and is `0` unless the four triples `(j₁ j₂ j₃)`, `(j₁ l₂ l₃)`, `(l₁ j₂ l₃)`,
  `(l₁ l₂ j₃)` are admissible. DLMF takes the four-3-j sum 34.4.1 as the definition; its
  agreement is `sixJ_eq_sum_threeJ` (§5.2). The triangle coefficient is DLMF's `Δ` (34.2.5).
- Signs `(-1)^{j₁ + j₂ + j₃}` and the like are written with the natural number `(d₁ + d₂ + d₃)/2`
  where the sum of the doubled spins is even; wherever a statement could meet an odd sum, it either
  assumes evenness or the other side vanishes there.
- The Hahn polynomial is DLMF's `Q_n(x; α, β, N)` [DLMF 18.20.5], and the Racah polynomial is
  DLMF's `R_n(λ(y); α, β, γ, δ)` with `λ(y) = y(y + γ + δ + 1)` [DLMF 18.26.3], both as functions of
  the real variable `x` or `y`, written by the terminating sum with `ascPochhammer`. The Lean
  definitions are total: a vanishing denominator gives Lean's value `0` for that term, and every
  theorem that uses them states the hypotheses that keep its denominators nonzero.
- Vilenkin and Klimyk's coefficient `C(l₁, l₂, l; j, k, m)` [VK, §8.1.2, (7), p. 500], computed by
  their formula [VK, §8.1.3, (6)–(7), pp. 502–503], is Edmonds's `(l₁ j l₂ k | l₁ l₂ l m)` with the
  same labels; Klimyk and Vilenkin's survey uses the same coefficients [KV, §2.1, p. 241]. Their
  6-j symbols and Racah coefficients [VK, §8.4.1, pp. 529–531] enter here only through the Racah
  polynomial theorem of §6.1, which is stated in Edmonds's normalization.

## Layer 1: the coupling of two spins

### 1.1 Admissible triples

Sources: [E, (3.1.5), p. 34]; [DLMF 34.2.1]; [VK, §8.1.1, p. 500]; [W, (8.7.2)–(8.7.3), p. 305].

- **Admissible triples** (`IsTriad`, `isTriad_comm`). `(j₁, j₂, j)` is admissible when
  `|j₁ - j₂| ≤ j ≤ j₁ + j₂` and `j₁ + j₂ + j ∈ ℤ`. The condition is symmetric in all three spins;
  the Lean statement records the symmetry in the first two, which the swap theorems use.
- **The dimension count** (`sum_isTriad_succ`). `Σ_j (2j + 1) = (2j₁ + 1)(2j₂ + 1)` over the
  admissible `j`. Route: the admissible `d` are `|d₁ - d₂|, |d₁ - d₂| + 2, …, d₁ + d₂`; sum the
  arithmetic progression, which is Tau Ceti's Clebsch–Gordan dimension count in its Finset Range
  module.

**Checks.**

- `IsTriad 1 1 0` and `IsTriad 1 1 2` hold: `½ ⊗ ½ = 0 ⊕ 1`.
- `IsTriad 1 1 1` fails: `j₁ + j₂ + j = 3/2` is not an integer. Dropping the parity condition
  admits it, and the dimension count at `d₁ = d₂ = 1` becomes `1 + 2 + 3 = 6 ≠ 4`.
- `IsTriad 2 4 8` fails: `4 > 1 + 2`.
- `sum_isTriad_succ 2 3`: `d ∈ {1, 3, 5}`, `2 + 4 + 6 = 12 = 3 · 4`.

### 1.2 The Clebsch–Gordan coefficients

Sources: [E, (3.6.11), p. 45; (3.1.3), p. 33; p. 38]; [VK, §8.1.2, p. 501; §8.1.3, (6)–(7),
pp. 502–503]; [DLMF 34.2.5].

- **The Clebsch–Gordan coefficient** (`clebschGordan`, with `clebschGordanTerm` and
  `clebschGordanPrefactor`). Racah's formula [E, (3.6.11), p. 45]: with `L = j₁ + j₂ - j`, the
  coefficient `(j₁ m₁ j₂ m₂ | j m)` is
  `δ_{m, m₁ + m₂} √((2j+1) Δ(j₁ j₂ j)² Π_r (j_r + m_r)!(j_r - m_r)!)` times the sum of
  `(-1)^z / (z! (L - z)! (j₁ - m₁ - z)! (j₂ + m₂ - z)! (j - j₂ + m₁ + z)! (j - j₁ - m₂ + z)!)`
  over the `z` with all six arguments nonnegative, `r` running over the three spins.
- **The triangle coefficient** (`triangleCoefficient`)
  `Δ(j₁ j₂ j₃) = √((j₁+j₂-j₃)! (j₁-j₂+j₃)! (-j₁+j₂+j₃)!/(j₁+j₂+j₃+1)!)` [DLMF 34.2.5].
- **Selection rules** (`clebschGordan_eq_zero_of_not_isTriad`, `clebschGordan_eq_zero_of_ne`).
  The coefficient vanishes for an inadmissible triple and unless `m = m₁ + m₂`; Edmonds states this
  in the text following (3.5.2), from the addition rules (3.1.3) and (3.1.5) [E, p. 38], and
  Vilenkin and Klimyk from the action of `H₃` [VK, §8.1.2, p. 501]. Route: the definition.

**Checks.**

- `clebschGordan 1 1 2 1 1 2 = 1`: `(½ ½ ½ ½ | 1 1) = 1`.
- `clebschGordan 1 1 0 1 0 0 = 1/√2` and `clebschGordan 1 1 0 0 1 0 = -1/√2`: the singlet
  `(e_↑ ⊗ e_↓ - e_↓ ⊗ e_↑)/√2`.
- `clebschGordan 2 2 2 2 1 2 = 1/√2` and `clebschGordan 2 2 2 1 1 1 = 0`:
  `(1 1 1 0 | 1 1) = 1/√2` and `(1 0 1 0 | 1 0) = 0`.
- `triangleCoefficient 0 0 0 = 1` and `triangleCoefficient 2 2 2 = √(1/24)`.
- Negative control: omitting the factor `2j + 1` under the square root gives
  `(½ ½ ½ ½ | 1 1) = 1/√3`, and the coupled vectors are no longer unit vectors.
- Negative control: `clebschGordan 1 1 2 1 1 1 = 0`, since `m₁ + m₂ = 1 ≠ 0 = m`; Racah's sum
  without the projection condition is `1/√2` here.

### 1.3 The coupled basis

Sources: [E, (3.5.1), p. 37; (3.5.2)–(3.5.4), p. 38; (3.4.1)–(3.4.2), pp. 36–37; (3.5.11),
p. 40; (3.6.5), p. 43]; [VK, §8.1.2, pp. 500–501]; [KV, §2.1, p. 241]; [W, (8.7.3)–(8.7.4),
pp. 305–306].

- **The coupled vector** (`coupledVector`). `w_{jm} = Σ (j₁ m₁ j₂ m₂ | j m) e_{m₁} ⊗ e_{m₂}`
  [E, (3.5.1), p. 37].
- **The intertwining property** (`tprod_coupledVector`). For admissible `(j₁, j₂, j)`,
  `(T^{j₁} ⊗ T^{j₂})(g) w_{jm} = Σ_{m'} D^j_{m'm}(g) w_{jm'}`. Route: the lowering recursion of
  §1.7 says that the lowering operator `J₋ = J₋^{(1)} + J₋^{(2)}` acts on `w_{jm}` as on `e_m`, the
  diagonal operator acts by the weight, and `w_{jj}` is annihilated by the raising operator by the
  raising recursion; the Lie-algebra action determines the group action on the connected group
  SU(2) (SpecialFunctionsSU2MatrixElements, §4.1). Alternatively, both sides are polynomial in the
  entries of `g` by the entry formula of SpecialFunctionsSU2MatrixElements, §2.1, and agree on the
  torus `TauCeti.SU2.torusExp` and on the middle Euler factor, which generate SU(2).
- **Orthonormality** (`inner_coupledVector`) [E, (3.5.4), p. 38]. Route: the tensor product of
  unitary representations is unitary, so by the intertwining property and Schur's lemma the
  coupled vectors of different `j` are orthogonal and the Gram matrix of those of one `j` is a
  scalar; the scalar is the norm of `w_{jj}`, whose coefficients are single terms of Racah's sum
  [E, (3.6.5), p. 43], and an identity of Vandermonde type sums their squares to `1`.
- **Completeness** (`span_coupledVector`) [E, (3.5.2), p. 38]. Route: the dimension count of §1.1,
  orthonormality, and the dimension of the tensor product.
- **The decomposition of the tensor product.** The tensor product of the unitary models of spins
  `j₁` and `j₂` is unitarily equivalent to the orthogonal direct sum of the unitary models of the
  admissible `j`, by the unitary map `e_{j,m} ↦ w_{j,m}` [VK, §8.1.1, p. 500; §8.1.2, (4)–(6),
  p. 500; KV, §2.1, p. 241; W, (8.7.3), p. 305]. Route: the three previous targets, with
  `ContRepresentation.IsUnitary.tprod`. This is the group-level, unitary form of the Clebsch–Gordan
  rule; Tau Ceti's Lie-algebra rule for `sl₂` (its Sl2 ClebschGordan module) is an alternative
  route to completeness through the differential of `Sym^d`.
- **The Condon–Shortley phase** (`clebschGordan_pos`). `(j₁ j₁ j₂ (j - j₁) | j j) > 0`
  [E, (3.5.11), p. 40]. Route: at `m₁ = j₁` only one `z` contributes to Racah's sum.
- **Uniqueness of the coupled basis** (`eq_coupledVector_of_tprod`). A family that transforms as
  the standard basis of spin `j`, whose top vector has norm `1` and a positive component along
  `e_{j₁} ⊗ e_{j - j₁}`, is the coupled basis: this is the content of the phase conventions
  [E, (3.4.1)–(3.4.2), pp. 36–37]. Route: by multiplicity one the map `e_m ↦ v_m` is a scalar
  multiple of `e_m ↦ w_{jm}`; the norm makes the scalar unimodular and the phase makes it `1`.

**Checks.**

- `coupledVector 1 1 0 0 = (e₁ ⊗ e₀ - e₀ ⊗ e₁)/√2`, with `e₁` spin up.
- `coupledVector d 0 d i = e_i ⊗ e₀`: coupling with spin zero is the identity.
- At `j₁ = j₂ = ½`, the swap `v ⊗ w ↦ w ⊗ v` fixes the triplet and negates the singlet, as the
  sign `(-1)^{j₁ + j₂ - j}` of §1.5 predicts.
- Negative control: the opposite phase convention `(j₁ (j - j₂) j₂ j₂ | j j) > 0` changes the sign
  of the singlet: `(½ ½ ½ -½ | 0 0) = +1/√2` in Edmonds's convention, `-1/√2` in the other.

### 1.4 Orthogonality

Sources: [E, (3.5.3)–(3.5.6), p. 38]; [VK, §8.1.2, (10)–(11), p. 501]; [KV, §2.1, (11)–(11a),
p. 242].

- **Orthogonality in the coupled indices** (`sum_clebschGordan_mul_clebschGordan`)
  [E, (3.5.4), p. 38]. Route: `inner_coupledVector`, expanded in the product basis by
  `TensorProduct.inner_tmul`.
- **Orthogonality in the product indices** (`sum_clebschGordan_mul_clebschGordan_right`)
  [E, (3.5.3), p. 38]. Route: the change-of-basis matrix is square by §1.1 and real, so its
  orthonormal columns make orthonormal rows.

**Checks.**

- At `d₁ = d₂ = 1`, `i₁ = 1, i₂ = 0`: `(1/√2)² + (1/√2)² = 1` over `j = 0, 1`.
- At `d₁ = d₂ = 1`, the rows `(i₁, i₂) = (1, 0)` and `(0, 1)` give
  `(1/√2)(1/√2) + (1/√2)(-1/√2) = 0`.
- Negative control: the row sum needs every admissible `j`: at `d₁ = d₂ = 1`,
  `(i₁, i₂) = (1, 0)`, dropping `j = 0` leaves `1/2`.

### 1.5 Symmetries

Sources: [E, (3.5.14), p. 41; (3.5.15)–(3.5.17), p. 42]; [VK, §8.2.2, (1), p. 506].

- **Exchange of the two spins** (`clebschGordan_swap`)
  `(j₁ m₁ j₂ m₂ | j m) = (-1)^{j₁ + j₂ - j} (j₂ m₂ j₁ m₁ | j m)` [E, (3.5.14), p. 41].
- **Reversal of the magnetic quantum numbers** (`clebschGordan_reflect`)
  `(j₁ m₁ j₂ m₂ | j m) = (-1)^{j₁ + j₂ - j} (j₁ -m₁ j₂ -m₂ | j -m)` [E, (3.5.17), p. 42].
- **Exchange of the second and the coupled spin** (`clebschGordan_rotate`)
  `(j₁ m₁ j₂ m₂ | j m) = (-1)^{j₁ - m₁} √((2j + 1)/(2j₂ + 1)) (j₁ m₁ j -m | j₂ -m₂)`
  [E, (3.5.15), p. 42]. With the swap this gives the remaining permutation [E, (3.5.16), p. 42].
- Route for all three: substitution in Racah's sum (`z ↦ L - z` and its relatives).

**Checks.**

- `clebschGordan_swap` at `(½, ½, 0)`: `1/√2 = (-1)^1 · (-1/√2)`.
- `clebschGordan_rotate` at `(1, 1, 0; 0, 0, 0)`: `-1/√3 = (-1)^1 √(1/3) · 1`.
- Negative control: without the sign, `clebschGordan_swap` fails at the singlet,
  `1/√2 ≠ -1/√2`.
- Negative control: the reversal sign is not `(-1)^{j₁ - m₁}`: at `(1 1 1 0 | 1 1)` the
  coefficient is `1/√2` and its reversal `-1/√2`, while `(-1)^{j₁ - m₁} = 1` there.

### 1.6 Special values

Sources: [E, (3.5.12)–(3.5.13), p. 40; p. 45]; [VK, §8.2.6, (3), p. 511].

- **Coupling with spin zero** (`clebschGordan_zero_right`) `(j m 0 0 | j m) = 1`
  [E, (3.5.12), p. 40].
- **Coupling to spin zero** (`clebschGordan_spin_zero`) `(j m j -m | 0 0) = (-1)^{j - m}/√(2j + 1)`
  [E, (3.5.13), p. 40].
- **The stretched coefficient** (`clebschGordan_stretched`): for `j = j₁ + j₂`,
  `(j₁ m₁ j₂ m₂ | j m)² = (2j₁)! (2j₂)! (j + m)! (j - m)! / ((2j)! Π_r (j_r + m_r)! (j_r - m_r)!)`,
  `r = 1, 2`, with positive sign [E, p. 45; VK, §8.2.6, (3), p. 511].
- **Spin one half** (`clebschGordan_spinHalf`):
  `(j₁ m₁ ½ ½ | j₁ + ½, m) = √((j₁ + m + ½)/(2j₁ + 1))`. Route: the stretched formula with
  `d₂ = 1`. The other entries of the spin-one-half table follow from the reversal of §1.5 and the
  orthogonality of §1.4.

**Checks.**

- `clebschGordan_stretched` at `(d₁, d₂, i₁, i₂) = (1, 1, 1, 0)`:
  `clebschGordan 1 1 2 1 0 1 = 1/√2`, the symmetric triplet vector.
- `clebschGordan_spinHalf` at `d = 2, i = 0`: `(1 -1 ½ ½ | 3/2 -½) = √(1/3)`.
- Negative control: `clebschGordan_spin_zero` without the sign fails at `d = 1, i = 0`:
  `clebschGordan 1 1 0 0 1 0 = -1/√2`.

### 1.7 Recursion relations

Sources: [E, (3.5.9)–(3.5.10), p. 39]; [VK, §8.2.7, p. 513].

- **The lowering recursion** (`clebschGordan_lowering`) [E, (3.5.9), p. 39], written with
  `m + 1` in place of `m` so that no index goes negative.
- **The raising recursion** (`clebschGordan_raising`) [E, (3.5.10), p. 39], shifted likewise.
- Route: substitution in Racah's sum, which gives both recursions for all indices; equivalently,
  apply `J_± = J_±^{(1)} + J_±^{(2)}` to `w_{jm}`, with the matrices of
  SpecialFunctionsSU2MatrixElements, §4.1, whose entries are `√((j ∓ m)(j ± m + 1))`.
- **Uniqueness by recursion.** The lowering recursion and the values at `m = j`, fixed by
  orthonormality and the phase of §1.3, determine all coefficients.

**Checks.**

- `clebschGordan_lowering 1 1 2 0 0 0`: `√2 · (½ -½ ½ -½ | 1 -1) = √2 = 1 · (1/√2) + 1 · (1/√2)`.
- At the top index `i = d` both sides of the lowering recursion vanish, since `d - i = 0` and
  `clebschGordan` is `0` at index `d + 1`.
- Negative control: with the left factor `√((j + m + 1)(j - m))` replaced by `j - m`, the same
  instance (`j = 1`, `m = -1`) gives `2 ≠ √2`.

## Layer 2: the 3-j symbol

### 2.1 Definition, the conversions of DLMF §34.2, and symmetries

Sources: [E, (3.7.3)–(3.7.6), pp. 46–47]; [DLMF 34.1.1, 34.2.4, 34.3.8–34.3.12].

- **The 3-j symbol** (`threeJ`) [E, (3.7.3), p. 46].
- **The Clebsch–Gordan coefficient through the 3-j symbol** (`clebschGordan_eq_threeJ`)
  [DLMF 34.1.1]: for `i ≤ d`,
  `(j₁ m₁ j₂ m₂ | j₁ j₂ j m) = (-1)^{(d₁ + d₂ - d)/2 + i + d₂} √(2j + 1) (j₁ j₂ j; m₁ m₂ -m)`, whose
  sign is DLMF's `(-1)^{j₁ - j₂ + m}` on the support. Route: invert the definition; the sign
  exponents differ by an even number on the support.
- **Racah's single-sum form** (`threeJ_eq_racahSum`) [DLMF 34.2.4]: on the support,
  `(j₁ j₂ j₃; m₁ m₂ m₃) = (-1)^{j₁ - j₂ - m₃} Δ(j₁ j₂ j₃) √(Π_r (j_r + m_r)! (j_r - m_r)!)` times
  the sum of §1.2 with `j = j₃` and `m = -m₃`, which is DLMF's sum. Route: substitute the definition
  of §1.2 into the 3-j symbol; the summation variables agree.
- **Even permutations** (`threeJ_cycle`) [E, (3.7.4), p. 46; DLMF 34.3.8]. Route: §1.5.
- **Odd permutations** (`threeJ_swap`) [E, (3.7.5), p. 47; DLMF 34.3.9]: the factor
  `(-1)^{j₁ + j₂ + j₃}`.
- **Reversal** (`threeJ_reflect`) [E, (3.7.6), p. 47; DLMF 34.3.10].
- **Regge symmetries.** The 3-j symbol is invariant under the 72-element group generated by the
  permutations, the reversal and the Regge symmetries [DLMF 34.3.11–34.3.12;
  VK, §8.2.2, p. 505]. Route: Racah's form `threeJ_eq_racahSum` and a substitution of its
  summation variable.

**Checks.**

- `threeJ 1 1 0 1 0 0 = 1/√2`, DLMF 34.3.1 at `j = ½, m = ½`.
- `threeJ 2 2 2 1 1 1 = 0`: `(1 1 1; 0 0 0)` vanishes since `1 + 1 + 1` is odd.
- `threeJ 2 2 0 1 1 0 = -1/√3`.
- `clebschGordan_eq_threeJ` at `clebschGordan 1 1 2 1 1 2 = 1`: the right side is
  `(-1)^{0 + 2 + 1} √3 · threeJ 1 1 2 1 1 0 = -√3 · (-1/√3) = 1`. Negative control: without the
  factor `√(2j + 1)` the right side is `1/√3`.
- Negative control: with the sign `(-1)^{j₁ - j₂ + m₃}` in place of `(-1)^{j₁ - j₂ - m₃}` in the
  definition, `(0 ½ ½; 0 ½ -½)` becomes `-1/√2` while `(½ ½ 0; ½ -½ 0)` stays `1/√2`, so
  `threeJ_cycle` fails; with the correct sign both are `1/√2`.

### 2.2 Orthogonality

Sources: [E, (3.7.7)–(3.7.8), p. 47]; [DLMF 34.3.16–34.3.17].

- **Orthogonality in `(j₃, m₃)`** (`sum_threeJ_mul_threeJ`) [E, (3.7.8), p. 47; DLMF 34.3.16].
- **Orthogonality in `(m₁, m₂)`** (`sum_threeJ_mul_threeJ_right`) [E, (3.7.7), p. 47;
  DLMF 34.3.17].
- Route for both: §1.4 and the definition.

**Checks.**

- At `d₁ = d₂ = 1`, `j₃ = 0`: `1 · ((1/√2)² + (-1/√2)²) = 1`.
- The right-hand side of `sum_threeJ_mul_threeJ` is `0` for an inadmissible `j₃`, where every term
  vanishes.
- Negative control: without the factor `2j₃ + 1`, the sum at `d₁ = d₂ = 1`, `j₃ = 1`, `m₃ = 0` is
  `1/3`.

### 2.3 Special values

Sources: [E, (3.7.14), p. 49; (3.7.17), p. 50]; [DLMF 34.3.1, 34.3.5].

- **Spin zero** (`threeJ_spin_zero`) [DLMF 34.3.1].
- **Vanishing magnetic numbers, odd sum** (`threeJ_zero_zero_zero_of_odd`) [E, (3.7.14), p. 49;
  DLMF 34.3.5]. Route: `threeJ_reflect` with all `m = 0`.
- **Vanishing magnetic numbers, even sum** (`threeJ_zero_zero_zero_of_even`)
  [E, (3.7.17), p. 50; DLMF 34.3.5].

**Checks.**

- `(1 1 2; 0 0 0) = √(2/15)`; `threeJ_zero_zero_zero_of_even` gives `g = 2`,
  `√(2! 2! 0!/5!) · 2!/(1! 1! 0!) = √(4/120) · 2`.
- `(2 2 2; 0 0 0) = -√(2/35)`.
- Negative control: dropping the factor `(-1)^g` gives `+√(2/35)` for `(2 2 2; 0 0 0)`.

### 2.4 Hypergeometric form and recursions

Sources: [DLMF 34.2.6, 34.3.2–34.3.3, 34.3.13–34.3.14]; [E, (3.7.12)–(3.7.13), p. 48];
[VK, §8.3.1, p. 517].

- **The `₃F₂` form** [DLMF 34.2.6; VK, §8.3.1, p. 517]. The 3-j symbol is a terminating `₃F₂`
  at `1` times a ratio of factorials. Route: Racah's form of §2.1, with the terminating series of
  SpecialFunctionsGeneralizedHypergeometric, §1.1. The denominator parameters are negative
  integers whose absolute values are at least the terminating index, so the series is defined at
  every admissible argument.
- **Recursions** [DLMF 34.3.13–34.3.14; E, (3.7.12)–(3.7.13), p. 48]. Route: §1.7 for the
  recursions in `m`; the others follow from `threeJ_mul_sixJ` of §5.2 at special arguments.
- **The explicit values for `j₃ = 1`** [DLMF 34.3.2–34.3.3]. Route: Racah's formula.

**Checks.**

- `(1 1 1; 1 -1 0) = 1/√6`.
- Negative control: continuing the `₃F₂` past its terminating index meets the zero denominator
  `(-N)_{N+1}`, so the terminating sum cannot be replaced by the full series.

## Layer 3: products of matrix elements

### 3.1 The Clebsch–Gordan series

Sources: [E, (4.3.1), p. 60; (4.3.2), p. 61]; [VK, §8.1.1, p. 500; §8.2.3, (4), p. 507];
[W, (8.7.2), p. 305; (8.7.7), p. 306]; [KV, §2.1, (12), p. 242].

- **The product of two matrix elements** (`matrixElement_mul_matrixElement`)
  `D^{j₁}_{m₁'m₁} D^{j₂}_{m₂'m₂} = Σ (j₁ m₁' j₂ m₂' | j m') D^j_{m'm} (j₁ m₁ j₂ m₂ | j m)`,
  summed over `j, m', m` [E, (4.3.1), p. 60; VK, §8.2.3, (4), p. 507; W, (8.7.7), p. 306]. Route:
  take the matrix coefficient of `ContRepresentation.tprod` between simple tensors with
  `ContRepresentation.matrixCoeff_tprod`, and expand the simple tensors in the coupled basis by
  §§1.3–1.4.
- **The inverse series.** `D^j_{m'm} = Σ (j₁ m₁' j₂ m₂' | j m') (j₁ m₁ j₂ m₂ | j m) D^{j₁}D^{j₂}`,
  summed over `m₁, m₂, m₁', m₂'` [E, (4.3.2), p. 61]. Route: orthogonality.
- **The Clebsch–Gordan series of characters** (`character_mul_character`) `χ_{j₁} χ_{j₂} = Σ_j χ_j`
  [W, (8.7.2), p. 305; VK, §8.1.1, p. 500]. Route: the trace of the product formula, or the
  Chebyshev form of the characters (SpecialFunctionsSU2MatrixElements, §5.1).

**Checks.**

- At `j₁ = j₂ = ½` and all indices at the top, `matrixElement 1 1 1 g ^ 2` and
  `matrixElement 2 2 2 g` are both `g₀₀²`: the stretched case.
- Characters at `g = -1`: `(-2)(-2) = 4 = 1 + 3` for `j₁ = j₂ = ½`.
- Negative control: summing all `d ≤ d₁ + d₂` in the character identity, admissible or not, gives
  `χ₀ + χ_{1/2} + χ₁` at `j₁ = j₂ = ½`, of dimension `6 ≠ 4`.

### 3.2 Integrals of three matrix elements

Sources: [E, (4.6.1)–(4.6.2), p. 62]; [VK, §8.2.4, (1), p. 507]; [W, (8.7.8), p. 306].

- **The integral of three matrix elements** (`integral_matrixElement_mul_mul`)
  `∫ D^{j₁}_{m₁'m₁} D^{j₂}_{m₂'m₂} D^{j₃}_{m₃'m₃} dg = (j₁ j₂ j₃; m₁' m₂' m₃')(j₁ j₂ j₃; m₁ m₂ m₃)`
  for the Haar probability measure [E, (4.6.2), p. 62], which Edmonds writes as an integral in
  Euler angles over the rotations (SpecialFunctionsSU2MatrixElements, §1.3, converts). Vilenkin and
  Klimyk and Wawrzyńczyk state the form with the third factor conjugated, a product of two
  Clebsch–Gordan coefficients over `2j₃ + 1` [VK, §8.2.4, (1), p. 507; W, (8.7.8), p. 306]. Route:
  §3.1 on the first two factors, then Schur orthogonality (SpecialFunctionsSU2MatrixElements,
  §3.3) against `D^{j₃}` written as `(-1)^{m₃' - m₃}` times the conjugate of `D^{j₃}` with
  reversed indices (from the Euler-angle form and the symmetry `d_{m'm} = (-1)^{m'-m} d_{-m',-m}` of
  SpecialFunctionsSU2MatrixElements, §§2.3 and 2.5), and the definition of the 3-j symbol.

**Checks.**

- At `j₁ = j₂ = j₃ = 0` both sides are `1`.
- At `(j₁, j₂, j₃) = (1, 1, 0)` and all indices at weight `0`: `∫ (D^1_{00})² = 1/3 = (-1/√3)²`.
- Negative control: with the third factor conjugated, the integral at `(½, ½, 1)` with all indices
  at the top is `∫ |g₀₀|⁴ = 1/3`, while the 3-j product is `0` by the projection rule.

### 3.3 Legendre polynomials and spherical harmonics

Sources: [E, (4.6.3)–(4.6.5), p. 63]; [DLMF 34.3.19–34.3.22].

- **Linearization of products of Legendre polynomials** (`jacobi_mul_jacobi`)
  `P_{l₁} P_{l₂} = Σ_l (2l + 1)(l₁ l₂ l; 0 0 0)² P_l` [DLMF 34.3.19]. Route: §3.1 at
  `m = m' = 0` with `D^l_{00}(euler 0 β 0) = P_l(cos β)` (SpecialFunctionsSU2MatrixElements,
  §2.6), and §2.1 in place of the coefficients; both sides are polynomials that agree on `[-1, 1]`.
- **The integral of three Legendre polynomials** (`integral_jacobi_mul_mul`)
  `∫_{-1}^{1} P_{l₁} P_{l₂} P_{l₃} = 2 (l₁ l₂ l₃; 0 0 0)²` [E, (4.6.4), p. 63; DLMF 34.3.21].
  Route: the linearization and Legendre orthogonality (LaguerreJacobi, §4.3).
- **The product of two spherical harmonics** [E, (4.6.5), p. 63; DLMF 34.3.20], and
  **Gaunt's integral**: `∫_{S²} Y_{l₁}^{m₁} Y_{l₂}^{m₂} Y_{l₃}^{m₃}` is
  `√((2l₁+1)(2l₂+1)(2l₃+1)/(4π)) (l₁ l₂ l₃; 0 0 0)(l₁ l₂ l₃; m₁ m₂ m₃)`
  [E, (4.6.3), p. 63; DLMF 34.3.22], for the spherical harmonics as matrix elements of
  SpecialFunctionsSU2MatrixElements, §6.1. Route: §§3.1–3.2 with those spherical harmonics.

**Checks.**

- `P₁² = (1/3) P₀ + (2/3) P₂`, the case `l₁ = l₂ = 1`.
- `∫_{-1}^{1} P₁ P₁ P₂ = 4/15`, which is `2 · (1 1 2; 0 0 0)² = 2 · 2/15`.
- Negative control: without the factor `2l + 1`, the coefficients of `P₁²` sum to `1/3 + 2/15`,
  not to `P₁(1)² = 1`.

## Layer 4: Hahn polynomials

### 4.1 Definition and the Clebsch–Gordan coefficients

Sources: [DLMF 18.20.5, Table 18.19.1]; [VK, §8.5.1, (1)–(3), (5), pp. 546–547];
[KV, §2.2, (17), p. 243].

- **The Hahn polynomial** (`hahn`) `Q_n(x; α, β, N) = ₃F₂(-n, n + α + β + 1, -x; α + 1, -N; 1)`
  [DLMF 18.20.5; VK, §8.5.1, (5), p. 547].
- **Clebsch–Gordan coefficients are Hahn polynomials** (`clebschGordan_eq_hahn`). With
  `j₁ = N/2`, `j₂ = (N + a + b)/2`, `j = n + (a + b)/2`, `m₁ = N/2 - x`, `m = (a - b)/2`, the
  coefficient is `(-1)^x N!/a!` times an explicit square root times `Q_n(x; a, b, N)`. This is
  [VK, §8.5.1, (1)–(3), pp. 546–547] and [KV, §2.2, p. 243], in Edmonds's labels. Route: Racah's
  formula of §1.2 is a terminating `₃F₂` in `x`; transform it by
  SpecialFunctionsGeneralizedHypergeometric, §4.5 (Sheppard), or match Hahn's three-term
  recurrence against the recursions of §1.7.
- **The hypergeometric form of `clebschGordan`.** Every Clebsch–Gordan coefficient is a ratio of
  factorials times a terminating `₃F₂` at `1`, by §2.4 and §2.1.

**Checks.**

- `Q_0 = 1` and `Q_n(0; α, β, N) = 1`.
- `Q_1(x; α, β, N) = 1 - (α + β + 2) x / ((α + 1) N)`.
- Negative control: `clebschGordan_eq_hahn` at `N = 1, n = 0, x = 1, a = b = 0` gives
  `(-1)^1 · 1 · √(1/2) = -1/√2 = clebschGordan 1 1 0 0 1 0`; without `(-1)^x` it gives `+1/√2`.

### 4.2 Orthogonality and reflection

Sources: [DLMF Table 18.19.1]; [VK, §8.5.1, (4)–(7), p. 547; (9), p. 548; §8.5.2, p. 549].

- **Hahn orthogonality** (`sum_hahn_mul_hahn`) for `α, β > -1`, with the weight and norm of
  DLMF Table 18.19.1 [VK, §8.5.1, (6)–(7), p. 547], multiplied through by `2n + α + β + 1` so that
  no division by it occurs. Route: at nonnegative integers `α = a`, `β = b` it is §1.4 through §4.1.
  Both sides, multiplied by `(α + 1)_n²`, are polynomials in `(α, β)` (the left side after clearing
  the factor `(α + 1)_n` in each `Q_n`); two polynomials in two variables that agree on `ℕ²` agree
  everywhere.
- **Dual orthogonality.** The orthogonality in `x` for fixed `N`, summed over `n`, is the other
  orthogonality of §1.4 through §4.1, the orthogonality of the dual Hahn polynomials
  [VK, §8.5.2, p. 549; DLMF 18.25]; it is stated here through the Clebsch–Gordan coefficients.
- **The reflection** (`hahn_reflect`)
  `(α + 1)_n Q_n(x; α, β, N) = (-1)^n (β + 1)_n Q_n(N - x; β, α, N)` [VK, §8.5.1, (9), p. 548].
  Route: §1.5 through §4.1 at integral parameters, then polynomial identity; or the Sheppard
  transformation.

**Checks.**

- At `N = 1`, `α = β = 0`: `Q₁(x) = 1 - 2x`, weights `1, 1`, `Σ Q₁² = 2`, and the right-hand side
  of `sum_hahn_mul_hahn` divided by `2n + α + β + 1 = 3` is
  `(-1) · 3! · 1 · 1/(1 · (-1) · 1 · 3) = 2`.
- Orthogonality at `N = 2`, `α = 0.3`, `β = 1.7`, `n = 1`, `m = 2`: the weighted sum is `0`.
- Negative control: the weight `(α + 1)_x (β + 1)_{N-x}` without `1/(x!(N - x)!)` breaks
  orthogonality at `N = 2`, `α = 0.3`, `β = 1.7`, `n = 0`, `m = 1`: the sum is `1.89`.

## Layer 5: recoupling and the 6-j symbol

### 5.1 Definitions

Sources: [E, (6.1.1)–(6.1.4), pp. 90–91; (6.3.7), p. 99]; [DLMF 34.4.2]; [VK, §8.4.1,
pp. 529–531].

- **The 6-j symbol** (`sixJ`, with `sixJTerm`) by Racah's formula [E, (6.3.7), p. 99;
  DLMF 34.4.2].
- **The recoupling coefficient** (`recouplingCoefficient`)
  `((j₁ j₂) j₁₂, j₃; J M | j₁, (j₂ j₃) j₂₃; J M)` [E, (6.1.4), p. 91], the inner product of the two
  coupled vectors of three spins, expanded in the product basis with four Clebsch–Gordan
  coefficients.

**Checks.**

- `sixJ 1 1 0 1 1 0 = -1/2`: `{½ ½ 0; ½ ½ 0} = (-1)^1/2`.
- `sixJ 2 2 2 2 2 2 = 1/6` and `sixJ 1 1 2 1 1 0 = 1/2`.
- Negative control: `sixJ 1 1 1 1 1 1 = 0`, since `(½ ½ ½)` is not admissible; Racah's sum alone,
  read with truncated halves, does not see the parity condition.
- `recouplingCoefficient 1 1 1 0 0 1 1 = -1/2` (all spins `½`, `j₁₂ = j₂₃ = 0`, `J = M = ½`), and
  `(-1)^2 √(1 · 1) {½ ½ 0; ½ ½ 0} = -1/2`.

### 5.2 The recoupling theorem

Sources: [E, (6.1.5), p. 92; (6.2.8), p. 95; §6.3, pp. 98–99]; [DLMF 34.4.1, 34.5.23];
[VK, §8.4.2, p. 532].

- **The recoupling theorem** (`recouplingCoefficient_eq_sixJ`) [E, (6.1.5), p. 92]: the recoupling
  coefficient is `(-1)^{j₁ + j₂ + j₃ + J} √((2j₁₂ + 1)(2j₂₃ + 1))` times the 6-j symbol, for every
  `M`, and so does not depend on `M`. Route: independence of `M` from the intertwining property
  (both coupled vectors transform as `e_M`, so their inner product is a multiple of the identity by
  Schur); the value from Racah's computation at `M = J` [E, §6.3, pp. 98–99].
- **Four 3-j symbols** (`sixJ_eq_sum_threeJ`) [DLMF 34.4.1]. Route: insert the definition of
  `recouplingCoefficient` in the recoupling theorem, sum over `M` with the factor `1/(2J + 1)`, and
  write the coefficients as 3-j symbols by §2.1.
- **A 3-j symbol times a 6-j symbol** (`threeJ_mul_sixJ`) [E, (6.2.8), p. 95; DLMF 34.5.23].
  Route: the recoupling theorem in the product basis, with the orthogonality of §2.2.

**Checks.**

- The recoupling coefficient for `j₁ = j₂ = j₃ = ½`, `J = ½`, with rows `j₁₂ = 0, 1` and columns
  `j₂₃ = 0, 1`, is the orthogonal matrix `[[-½, √3/2], [√3/2, ½]]`, at both `M = ±½`.
- `sixJ_eq_sum_threeJ` at `(0, 0, 0, 0, 0, 0)`: `1 = 1`.
- Negative control: the sign `(-1)^{k₁ + k₂ + k₃}` cannot be dropped: at
  `{0 0 0; ½ ½ ½} = -1/√2` the unsigned sum is `0`.

### 5.3 Symmetries

Sources: [E, (6.2.4), p. 94; (6.2.5), p. 95]; [DLMF 34.5.8–34.5.10]; [VK, §8.4.3, p. 533].

- **Column permutations** (`sixJ_swap_columns`, `sixJ_cycle_columns`) [E, (6.2.4), p. 94;
  DLMF 34.5.8]. Route: Racah's formula is symmetric under the corresponding permutation of the four
  triangles.
- **Exchange of upper and lower entries in two columns** (`sixJ_swap_rows`) [E, (6.2.5), p. 95;
  DLMF 34.5.8].
- **Regge symmetries** [DLMF 34.5.9–34.5.10]. Route: Racah's formula.

**Checks.**

- `sixJ 2 1 1 2 1 1 = sixJ 1 2 1 1 2 1 = 1/6`, an instance of `sixJ_swap_columns`.
- `sixJ 1 1 0 1 1 2 = sixJ 1 1 2 1 1 0 = 1/2`.
- Negative control: exchanging upper and lower entries in one column only is not a symmetry:
  `sixJ 0 0 0 1 1 1 = -1/√2` and `sixJ 1 0 0 0 1 1 = 0`.

### 5.4 Sum rules and special values

Sources: [E, (6.2.9)–(6.2.11), p. 96; (6.2.12)–(6.2.13), p. 97; (6.3.2), p. 98];
[DLMF 34.5.1, 34.5.14–34.5.16]; [VK, §8.4.8, p. 539].

- **Orthogonality** (`sum_sixJ_mul_sixJ`) [E, (6.2.9), p. 96; DLMF 34.5.14]. Route: the
  recoupling matrix is orthogonal, by §5.2 and the orthonormality of both coupled bases of three
  spins.
- **The Racah sum rule** (`sum_sixJ_racah`) [E, (6.2.11), p. 96; DLMF 34.5.15]. Route: compare
  two recouplings of three spins.
- **The Biedenharn–Elliott identity** (`sixJ_mul_sixJ_biedenharnElliott`) [E, (6.2.12), p. 97;
  DLMF 34.5.16; VK, §8.4.8, p. 539]. Route: the pentagon of recouplings of four spins.
- **A vanishing entry** (`sixJ_zero`) [E, (6.3.2), p. 98; DLMF 34.5.1].
- **Racah's `W`** `W(abcd; ef) = (-1)^{a+b+c+d} {a b e; d c f}` [E, (6.2.13), p. 97], a prose
  target with no Lean name: the 6-j symbol carries the same information.

**Checks.**

- `sum_sixJ_mul_sixJ` at `(a, b, d, e) = (1, 1, 1, 1)`, `f = f' = 0`: the terms `c = 0, 2` are
  `1 · (-½)² + 3 · (½)² = 1`.
- `sixJ_zero` at `(a, b, c) = (1, 1, 0)`: `sixJ 1 1 0 0 0 1 = -1/√2`.
- Negative control: the Racah sum rule without the factor `2j + 1` fails at
  `(a, b, c, d, e, f) = (0, 1, 0, 1, 1, 0)`: the sum is `-1/(2√2)`, the right-hand side `-1/√2`.

## Layer 6: Racah polynomials

### 6.1 Definition and the 6-j symbol

Sources: [DLMF 18.26.3]; [VK, §8.5.4, (2)–(5), pp. 552–553].

- **The Racah polynomial** (`racahPolynomial`)
  `R_n(λ(y); α, β, γ, δ) = ₄F₃(-n, n + α + β + 1, -y, y + γ + δ + 1; α + 1, β + δ + 1, γ + 1; 1)`
  [DLMF 18.26.3], as a function of `y`.
- **6-j symbols are Racah polynomials** (`sixJ_eq_racahPolynomial`). For admissible arguments,
  `{l₁ l₂ l + l₃ - x; l₃ l l₂ + l₃ - n} = C_n W_x R_n(λ(x); α, β, γ, δ)` with
  `α = -2l₃ - 1`, `β = -2l₂ - 1`, `γ = -l₁ - l₂ - l₃ - l - 2`, `δ = l₁ + l₂ - l₃ - l` and explicit
  factorial factors `C_n`, `W_x` [VK, §8.5.4, (2)–(5), pp. 552–553]. The parameters are those of
  [VK, p. 553]; the constant `C` of [VK, (2), p. 552] is corrected to `(2l₃)!` in place of the
  printed `(2l₂)!`, with the sign `(-1)^{l₁ + l₂ + l₃ + l}`, which is missing there. Route: Racah's
  formula of §5.1 is a terminating `₄F₃`; bring it to balanced form by Whipple's transformation
  (SpecialFunctionsGeneralizedHypergeometric, §4.5), or compare the three-term recurrence of `R_n`
  with the Racah sum rule.
- **The `₄F₃` form of the 6-j symbol** [DLMF 34.4.3]. Route: the same transformation.

**Checks.**

- `R_0 = 1` and `R_n(λ(0); α, β, γ, δ) = 1`.
- `R_1(λ(y)) = 1 + (α + β + 2) y (y + γ + δ + 1)/((α + 1)(β + δ + 1)(γ + 1))`.
- `sixJ_eq_racahPolynomial` at `(e₁, e₂, e₃, e, x, n) = (2, 2, 2, 2, 1, 1)`, where
  `(α, β, γ, δ) = (-3, -3, -6, 0)`: the 6-j symbol is `{1 1 1; 1 1 1} = 1/6` and
  `R_1(λ(1)) = 1/5`. Negative control: with `y + γ + δ` in place of `y + γ + δ + 1` the modified
  `R_1(λ(1))` is `0`, which cannot match `1/6`.
- Negative control: the constant `C` as printed by Vilenkin and Klimyk, with `(2l₂)!` and without
  the sign, fails on 4650 of the 5214 instances with all doubled spins at most `6`.

### 6.2 Orthogonality

Sources: [DLMF 18.25.9–18.25.12].

- **Racah orthogonality** (`sum_racahPolynomial_mul`) [DLMF 18.25.9], in the case `α + 1 = -N`
  [DLMF 18.25.10], with the weight 18.25.11 and the norm 18.25.12. The hypothesis is the
  nonvanishing of every Pochhammer symbol in a denominator, which is the condition under which the
  identity makes sense; positivity of the weights is not needed. Route: at the integral parameters
  of §6.1 it is `sum_sixJ_mul_sixJ` through §6.1; both sides are rational in `(β, γ, δ)`, and
  agreement on a Zariski-dense set of integral points gives the general identity.

**Checks.**

- `N = 0`: the sum has the single term `y = 0`, and both sides are `1`.
- `N = 2`, `(β, γ, δ) = (0.37, 1.21, 0.53)`, `n = 1`, `m = 2`: the sum is `0`.
- Negative control: the weight without the factor `(γ + δ + 1 + 2y)/(γ + δ + 1 + y)` fails
  orthogonality at `N = 1`, `n = 0`, `m = 1` with the same `(β, γ, δ)`: the sum is `0.211`.

### 6.3 Limit to the Hahn polynomials

Sources: [DLMF 18.26.10].

- **Hahn polynomials as limits of Racah polynomials** (`tendsto_racahPolynomial_hahn`)
  `lim_{δ → ∞} R_n(λ(x); α, β, -N - 1, δ) = Q_n(x; α, β, N)` [DLMF 18.26.10]. Route: termwise;
  the `k`-th term has `(x + γ + δ + 1)_k/(β + δ + 1)_k → 1`.

**Checks.**

- `n = 0`: both sides are `1` for every `δ`.
- `n = 1`, `N = 3`, `α = 0.3`, `β = 1.2`, `x = 1`: at `δ = 10⁹` the two sides differ by about
  `4·10⁻⁹`.
- Negative control: the limit `γ → ∞` with `δ` fixed does not give `Q_n`.

## Worked examples

- `½ ⊗ ½ = 0 ⊕ 1`: the singlet `(e_↑ ⊗ e_↓ - e_↓ ⊗ e_↑)/√2` and the triplet
  `e_↑ ⊗ e_↑, (e_↑ ⊗ e_↓ + e_↓ ⊗ e_↑)/√2, e_↓ ⊗ e_↓`.
- `1 ⊗ 1 = 0 ⊕ 1 ⊕ 2`, with `(1 0 1 0 | 1 0) = 0` and `(1 0 1 0 | 0 0) = -1/√3`.
- `P₁² = (1/3) P₀ + (2/3) P₂` and `P₁ P₂ = (2/5) P₁ + (3/5) P₃`.
- `{1 1 1; 1 1 1} = 1/6` and `{½ ½ 1; ½ ½ 0} = 1/2`.
- The recoupling matrix of three spins `½` to total `½` is `[[-½, √3/2], [√3/2, ½]]`.

## Downstream consumers

- A roadmap on DLMF Chapter 34 (the 9-j symbol, the asymptotics of §34.8, the generating
  functions) consumes Layers 1, 2 and 5 and the conversions of §2.1.
- A roadmap on the Askey scheme consumes the Hahn and Racah polynomials of Layers 4 and 6, with
  their orthogonality and the limit of §6.3, and adds the Wilson, continuous Hahn and dual
  families.
- A roadmap on tensor operators and the Wigner–Eckart theorem consumes Layers 1, 2 and 5.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- SpecialFunctionsSU2MatrixElements: the unitary model of spin `d/2` and its weights (§1.4), the
  matrix elements, their group law and unitarity (§§2.1–2.2), the matrix elements in Euler
  angles and their symmetries (§§2.3, 2.5), the Legendre polynomials as `D^l_{00}` (§2.6), the
  Haar measure in Euler angles (§1.3), Schur orthogonality in coordinates (§3.3), the
  infinitesimal operators (§4.1), the characters (§5.1) and the spherical harmonics (§6.1).
- Tau Ceti: the tensor product of continuous representations, its continuity and unitarity, and
  its matrix coefficients; the SU(2) models with irreducibility and exhaustion; the Haar
  probability measure and Schur orthogonality; the Lie-algebra Clebsch–Gordan rule for `sl₂`.
- Mathlib: the inner product on the algebraic tensor product of finite-dimensional inner product
  spaces and its orthonormal bases, `ascPochhammer`, finite sums.
- LaguerreJacobi: the Jacobi polynomial (§3.2), Jacobi orthogonality (§4.3), and the Legendre
  polynomials as `jacobi 0 0 l` (§6.1).
- SpecialFunctionsGeneralizedHypergeometric: the terminating series (§1.1), the Pfaff–Saalschütz
  sum (§4.3) and the Whipple and Sheppard transformations (§4.5).

Owned here:
- admissible triples, the Clebsch–Gordan coefficients by Racah's formula, the triangle
  coefficient, the coupled vectors in the tensor product of two unitary models, and their
  characterization;
- the decomposition of the tensor product of two unitary models as a unitary equivalence, the
  Clebsch–Gordan series of matrix elements and of characters;
- the 3-j symbol with the conversions to DLMF 34.1.1 and 34.2.4, the 6-j symbol by Racah's
  formula, the recoupling coefficient, and Racah's `W`;
- the integral of three matrix elements, the linearization and triple-integral formulas for
  Legendre polynomials, Gaunt's integral and the product of two spherical harmonics;
- the Hahn polynomials `Q_n(x; α, β, N)` (DLMF 18.20.5) and the Racah polynomials
  `R_n(λ(y); α, β, γ, δ)` (DLMF 18.26.3), with their orthogonality, their expression through the
  coupling coefficients and the Racah-to-Hahn limit. No other roadmap defines these two families;
  LaguerreJacobi excludes the rest of the Askey scheme.

Not owned:
- the unitary model and the matrix elements (SpecialFunctionsSU2MatrixElements, Layers 1–2), and
  the Krawtchouk polynomials (its §5.2);
- the Jacobi and Legendre polynomials (LaguerreJacobi, §§3.2 and 6.1);
- the concrete polynomial realization of `V(m) ⊗ V(n)` for `sl₂` and `GL₂`, with the Gram matrix of
  its highest-weight vectors (LieHighestWeight, §0.1);
- the `q`-Clebsch–Gordan coefficients and `q`-6-j maps of `U_q(sl₂)` (QuantumGroups, §8.5);
- the terminating hypergeometric series and their summation and transformation formulas
  (SpecialFunctionsGeneralizedHypergeometric);
- the 9-j symbol and the other topics listed under Beyond.

Boundary in one sentence: every coefficient that arises from coupling two or three irreducible
representations of SU(2), and the two polynomial families that these coefficients realize, are
here; the representations themselves and the hypergeometric machinery are the suppliers'.

## Exact supplier contracts

### From Tau Ceti

- `ContRepresentation.tprod`, the tensor product of two continuous representations on the
  algebraic tensor product, with `ContRepresentation.IsUnitary.tprod` (the tensor product of
  unitary representations is unitary) and `ContRepresentation.matrixCoeff_tprod` (matrix
  coefficients of the tensor product are products of matrix coefficients), from Tau Ceti's
  Continuous TensorProduct module.
- `TauCeti.SU2.symPower`, `TauCeti.SU2.symPowerModel`, `TauCeti.SU2.torusExp` and
  `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`, through SpecialFunctionsSU2MatrixElements,
  §1.4.
- `TauCeti.haarProb` and `ContRepresentation.schur_orthogonality`, through
  SpecialFunctionsSU2MatrixElements, §3.3.
- The Clebsch–Gordan dimension count `Σ_{k ≤ min(m, n)} (m + n - 2k + 1) = (m + 1)(n + 1)` of Tau
  Ceti's Finset Range module, for §1.1.
- The Lie-algebra Clebsch–Gordan rule for `sl₂` (Tau Ceti's Sl2 ClebschGordan module): `V(m) ⊗ V(n)`
  is the internal direct sum of copies of `V(m + n - 2k)`, `0 ≤ k ≤ min(m, n)`. §1.3 can use it,
  through the differential of `Sym^d`, as an alternative route to completeness.

### From Mathlib

- `TensorProduct.inner_tmul`, `Orthonormal.tmul` and `OrthonormalBasis.tensorProduct`: the inner
  product on `V ⊗[ℂ] W` of finite-dimensional inner product spaces, for §1.3.
- `ascPochhammer`, `Finset.sum`, `Nat.factorial`, `Real.sqrt`, `intervalIntegral` and
  `Filter.Tendsto`.

### From SpecialFunctionsSU2MatrixElements

- §1.4: `unitaryModel`, the transport of `symPowerModel d` by `monomialScale`, and its basis `e_i`
  of weight `i - d/2`. `Suggested.lean` carries verbatim local copies of `monomialNorm`,
  `monomialScale`, `unitaryModel` and `matrixElement`, whose docstrings name the owner.
- §§2.1–2.3: the matrix element, `matrixElement d i k g = ⟪e_i, T(g) e_k⟫`, its entry formula, its
  group law, unitarity, and the Euler-angle form
  `D^j_{m'm}(euler α β γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}`.
- §2.5: the symmetry `d_{m'm} = (-1)^{m'-m} d_{-m',-m}`, for §3.2.
- §2.6: `D^l_{00}(euler 0 β 0) = P_l(cos β)`.
- §1.3 and §3.3: the Haar measure in Euler angles, and Schur orthogonality in coordinates,
  `∫ D D̄ = δ/(2j + 1)`.
- §4.1: the raising and lowering matrices.
- §5.1: the characters `Σ_i D^j_{ii}` and their Chebyshev form.
- §6.1: the spherical harmonics as matrix elements, for §3.3.

### From LaguerreJacobi

- §3.2: the Jacobi polynomial, by the explicit DLMF 18.5.8 sum; `Suggested.lean` carries a
  verbatim local copy, `jacobi`, whose docstring names the owner.
- §4.3: Jacobi orthogonality at `α = β = 0`, for §3.3.
- §6.1: the Legendre polynomials `P_l = jacobi 0 0 l`.

### From SpecialFunctionsGeneralizedHypergeometric

- §1.1: the terminating generalized hypergeometric series, for §§2.4, 4.1 and 6.1.
- §4.3: the Pfaff–Saalschütz sum, and §4.5: the Whipple transformation of a balanced terminating
  `₄F₃` and the Sheppard transformation of a terminating `₃F₂`, for §§4.1 and 6.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- The 9-j symbol, its symmetries, its sum rules and the coupling of four spins [E, Chapter 6;
  DLMF §34.6].
- Tensor operators and the Wigner–Eckart theorem [E, Chapter 5].
- Clebsch–Gordan coefficients of SU(1,1) and of the Euclidean motion and oscillator groups.
- Wilson polynomials and the continuous Hahn families; addition theorems and generating functions
  of the Hahn and Racah polynomials [VK, §§8.5.5–8.5.6, pp. 556–558].
- Asymptotics of the 3-j and 6-j symbols (Ponzano–Regge) [DLMF §34.8], and the limit of
  Clebsch–Gordan coefficients to matrix elements of SU(2) [KV, §2.1, (16), p. 242].
- Generating functions of the Clebsch–Gordan coefficients and the Regge array
  [VK, §8.2.1, pp. 504–505].

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
states the targets of this roadmap with the names and statements used here, against Tau Ceti, the
SU(2) code of lean-SFVK and the lean-DLMF Wigner symbols. The following are proved there without
`sorry`, using only the standard axioms. Its modules are a cited source, not the specification.

- §1.1: `IsTriad`, `isTriad_comm`, `sum_isTriad_succ` (`SFVK/ClebschGordan/Basic/Coefficients.lean`,
  `SFVK/ClebschGordan/Coefficients.lean`).
- §1.2: `clebschGordanTerm`, `clebschGordanPrefactor`, `clebschGordan`, `triangleCoefficient`,
  `clebschGordan_eq_zero_of_not_isTriad`, `clebschGordan_eq_zero_of_ne`, and the conversion to the
  lean-DLMF coefficient (`SFVK/ClebschGordan/Basic/Coefficients.lean`,
  `SFVK/ClebschGordan/Coefficients.lean`).
- §1.3: `coupledVector` (`SFVK/ClebschGordan/Basic/Coupling.lean`) and `clebschGordan_pos`
  (`SFVK/ClebschGordan/Coefficients.lean`).
- §§1.5–1.6: `clebschGordan_swap`, `clebschGordan_reflect`, `clebschGordan_rotate`,
  `clebschGordan_zero_right`, `clebschGordan_spin_zero`, `clebschGordan_stretched`,
  `clebschGordan_spinHalf` (`SFVK/ClebschGordan/Coefficients.lean`).
- §§2.1, 2.3: `threeJ`, the conversion to the lean-DLMF 3-j symbol, `threeJ_cycle`, `threeJ_swap`,
  `threeJ_reflect`, `threeJ_spin_zero`, `threeJ_zero_zero_zero_of_odd`,
  `threeJ_zero_zero_zero_of_even` (`SFVK/ClebschGordan/ThreeJ.lean`).
- §3.1: `character_mul_character` (`SFVK/ClebschGordan/Coupling.lean`).
- §3.3: the linearization and the triple integral, stated there for the lean-DLMF Legendre
  polynomial rather than `jacobi 0 0 l` (`SFVK/ClebschGordan/ThreeJ.lean`).
- §§4.1–4.2: `hahn` (`SFVK/ClebschGordan/Basic/Polynomials.lean`), the conversion to the lean-DLMF
  Hahn polynomial, and `hahn_reflect` (`SFVK/ClebschGordan/Polynomials.lean`).
- §§5.1, 5.3, 5.4: `sixJTerm`, `sixJ`, `recouplingCoefficient`
  (`SFVK/ClebschGordan/Basic/SixJ.lean`), the conversion to the lean-DLMF 6-j symbol,
  `sixJ_swap_columns`, `sixJ_cycle_columns`, `sixJ_swap_rows`, `sixJ_zero`
  (`SFVK/ClebschGordan/SixJ.lean`).
- §§6.1, 6.3: `racahPolynomial` (`SFVK/ClebschGordan/Basic/Polynomials.lean`), the conversion to
  the lean-DLMF Racah polynomial, and `tendsto_racahPolynomial_hahn`
  (`SFVK/ClebschGordan/Polynomials.lean`).

The other theorems (the coupled basis and its uniqueness, both orthogonalities and the recursions
of Layer 1, the conversions of §2.1 to DLMF 34.1.1 and 34.2.4, the orthogonality of Layer 2, the
product and integral formulas of §§3.1–3.2, the Hahn identification and orthogonality, the
recoupling theorem and the sum rules of Layer 5, the Racah identification and orthogonality) are
stated there with `sorry`.

[lean-DLMF](https://github.com/bjbraams/lean-DLMF) (Apache-2.0), by the same author, is related
prior work on DLMF Chapter 34 and §18.26 in DLMF's own variables (half-integer spins as rationals):
`DLMF/WignerSymbols/Basic/Definitions.lean` defines the Clebsch–Gordan coefficient by 34.1.1, the
3-j symbol by 34.2.4 and the 6-j symbol by 34.4.2 without `sorry`, and
`DLMF/WignerSymbols/ThreeJ.lean`, `DLMF/WignerSymbols/SixJ.lean`,
`DLMF/WignerSymbols/ThreeJRecursion.lean`, `DLMF/WignerSymbols/SixJRecursion.lean` and
`DLMF/WignerSymbols/LegendreProducts.lean` state and partly prove the symmetries, recursions,
orthogonality, sum rules and Legendre product formulas of §§34.3 and 34.5;
`DLMF/OrthogonalPolynomials/Basic/AskeyScheme.lean` defines the Hahn and Racah polynomials by
18.20.5 and 18.26.3, and `DLMF/OrthogonalPolynomials/Wilson.lean` proves the limit 18.26.10.

## References

- [E] A. R. Edmonds, *Angular Momentum in Quantum Mechanics*, Princeton University Press, 1957
  (reprint 1996), Chapters 3, 4 and 6. Equation numbers and pages refer to the 1957 printing.
- [VK] N. Ja. Vilenkin, A. U. Klimyk, *Representation of Lie Groups and Special Functions*,
  Vol. 1, Kluwer, 1991, Chapter 8.
- [KV] A. U. Klimyk, N. Ja. Vilenkin, *Representations of Lie groups and special functions*, in
  A. A. Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*,
  Encyclopaedia of Mathematical Sciences 59, Springer, 1995, §2.
- [W] A. Wawrzyńczyk, *Group Representations and Special Functions*, Reidel, 1984, §8.7.
- [DLMF] *NIST Digital Library of Mathematical Functions*, https://dlmf.nist.gov/, Chapter 34 and
  §§18.19, 18.20, 18.25, 18.26.

The following misprint of [VK] is corrected where the README uses that formula: [VK, §8.5.4, (2),
p. 552]: the constant `C` has `(2l₂)!` for `(2l₃)!` and lacks the sign `(-1)^{l₁ + l₂ + l₃ + l}`;
the correction carries over to (6). The parameters `α, β, γ, δ` printed on p. 553 are correct.
