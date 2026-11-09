# Roadmap: arithmetic of quaternion algebras, their orders, and the Shimura curves of the LMFDB

**Summary.** A quaternion algebra over a number field `F` is determined up to isomorphism by the finite set of
noncomplex places at which it does not split, and every finite set of even cardinality occurs.
Inside such an algebra `B` sit its orders: maximal orders, Eichler orders of a given level, and the
Gorenstein and Bass orders that organize the rest. Their right ideal classes form a finite set
`Cls O`; when `B` is definite that set is counted, with weights, by the Eichler mass formula and,
exactly, by the Eichler class number formula, and it carries the Brandt matrices, which are the
Hecke operators the LMFDB uses to compute Hilbert modular forms. When `B` is indefinite over `ℚ`
the norm-one units of an Eichler order of level `N` in a division algebra of discriminant `D > 1` form a
cocompact Fuchsian group, and the quotient `X_0(D;N)` is a Shimura curve whose area, elliptic
points and genus are read off the same embedding numbers that enter the class number formula.
The LMFDB indexes its Shimura curves by subgroups `H` of an *enhanced group*
`Aut_{±μ}(O) ⋉ (O/NO)^×` attached to a *polarized order* `(O, μ)`; this roadmap defines all of
these objects and proves the formulas by which the LMFDB computes their invariants.

The book this roadmap follows is Voight, *Quaternion Algebras* (GTM 288), cited below by its
numbering (`[V, 15.5.5]` is Theorem 15.5.5 there); theorem numbers follow the 2021 author
edition v0.9.28.

**Carrier.** The algebra is Mathlib's symbol algebra `ℍ[F,a,b] = QuaternionAlgebra F a 0 b` with
`a b : Fˣ`, over a field `F` of characteristic `0`: `i² = a`, `j² = b`, `ji = -ij`. Orders are
`R`-subalgebras of it that are `R`-lattices, for `R` a Dedekind domain with fraction field `F`
(`R = 𝓞 F` for a number field, `R = ℤ` for `F = ℚ`). An abstract central simple algebra of
dimension four enters only through a presentation `B ≃ₐ[F] ℍ[F,a,b]`, and every invariant defined
here is proved independent of the presentation. The Shimura-curve layers are over `F = ℚ`.

Suggested home: `TauCeti/NumberTheory/Quaternion/`, with subdirectories `Ramification/`,
`Order/` (lattices, discriminants, maximal and Eichler orders, Gorenstein and Bass orders),
`Ideal/` (class sets, types, the idelic dictionary), `Indefinite/` (Eichler's theorems),
`Mass/`, `Embedding/`, `Brandt/`, `ShimuraCurve/` and `Polarized/`.

## Scope and ownership

### Owned here

- **Ramification data of a symbol algebra** (Layer 0): the local ramification predicates at the
  finite and real places of a number field, read off Tau Ceti's Hilbert symbol; the finite
  ramification set and the discriminant ideal `disc B`; over `ℚ` the integer `D`; definite and
  indefinite; and the comparison of these predicates with the abstract local division criterion.
- **Lattices and orders in `ℍ[F,a,b]`** (Layer 1): the comparison with generic multiplier orders, the trace discriminant and
  determinant reduced discriminant of a lattice, and the cubic discriminant of an order, the trace dual and codifferent, maximal orders and the
  criterion `discrd O = disc B`, the discriminant data of local maximal orders, the statements on
  Eichler orders beyond their consumed local and local–global form (locality over every Dedekind
  base, the normalizer of `O_0(𝔭^e)`, superorders, the genus, local norm-maximality, the vertex
  path of 1.11), hereditary orders, the unit group `O^×` and the norm-one group `O¹`, products of
  lattices and the definitions of principal and invertible lattices, and the Hurwitz order of
  `ℍ[ℚ,-1,-1]` with its maximality, its unit group of order `24` and the principality of its
  right ideals (1.13).
- **Gorenstein, Bass and the ternary form** (Layer 2): the even Clifford correspondence between
  ternary quadratic modules and orders, Gorenstein orders, the Gorenstein saturation and
  conductor, Bass orders, the Eichler symbol and the local unit counts.
- **Ideals, class sets and types** (Layer 3): invertible and locally principal lattices, the right
  class set `Cls O`, the type set `Typ O`, connecting ideals and genera, the quaternion reading of
  the idelic dictionary for every order (`Cls O` as the idele double cosets of classical arithmetic
  completion 7.78, with the reduced-norm identity and the comparisons with the two definite class
  sets), the transport of class sets under isomorphism and level change (3.9), finiteness
  of class and type sets, the class number one of the Hurwitz order (3.8), two-sided ideals,
  `Pic_R(O)`, the normalizer and the Atkin–Lehner group `AL(O)`.
- **Eichler's theorems for indefinite algebras** (Layer 4), as stated theorems whose
  strong-approximation input is consumed.
- **The Eichler mass formula** (Layer 5) in its absolute form, over `ℚ` and over totally real
  fields, and the class number one theorems.
- **Optimal embeddings and embedding numbers** (Layer 6): the trace formula, the local embedding
  numbers for maximal and Eichler orders, the Eichler class number formula, and the type number
  formula of Deuring.
- **Brandt matrices** (Layer 7): `T(𝔫)` for every order and every nonzero integral ideal `𝔫`,
  their arithmetic, multiplicativity, the Hecke algebra with its commutativity and semisimplicity,
  the adjoint identity, the Eichler trace formula, and the theta-series interpretation over `ℚ`.
- **Shimura curves `X_0(D;N)` over `ℚ`** (Layer 8): the index `ψ(N)` and area of the Eichler-order
  group, its elliptic points as embedding numbers, the genus formula, the Atkin–Lehner involutions
  and the quotients `X_0(D;N)/⟨w_m⟩` and `X_0^*(D;N)`, and CM points as optimal embeddings.
- **Polarized orders and enhanced groups** (Layer 9): polarizations and their degree,
  `Aut_μ(O)` and `Aut_{±μ}(O)`, the enhanced group `Aut_{±μ}(O) ⋉ (O/NO)^×`, the curve `X_H`
  of a subgroup `H`, and every group-theoretic invariant the LMFDB computes from `H` (level,
  index, Fuchsian index, gerbiness, coarseness, elliptic points of orders `2, 3, 4, 6`, genus,
  torsion invariants, their comparison for marked QM surfaces (§§9.7–9.8), Atkin–Lehner content, the named families `X(D;N)` and `X^*(D;N)` of full level `N` and
  `X(D,M;1)`).
- **The LMFDB dictionary** (Layer 10): the intrinsic label prefix `D.d.δ.N.i.g` and the coverage
  table of the Shimura-curve page.

### Not owned here

- **The classification of quaternion algebras by ramification** (existence and uniqueness) is
  R17.1.5 of the GL₂ transfer roadmap; the Brauer-group inputs are class field theory Layer 10 and
  the Hilbert symbol is quadratic form invariants 6C. Layer 0 consumes all three.
- **Strong approximation and reduction theory** are adelic algebraic groups
  AA.3.4, AA.4.2 and, for `SL₁` of an algebra satisfying Eichler's condition, classical arithmetic
  completion 7.44; **the idele double-coset description of locally free rank-one lattices** over
  an arithmetic order and **the reduced-norm images of maximal orders** are classical arithmetic
  completion 7.78 and 7.60.
- **Arithmetic Fuchsian groups over a totally real field** are ArithmeticFuchsianGroups: real
  splittings and the lattice `Γ(O)` of an order with its discreteness, finite covolume and
  cocompactness criterion, and the local structure of maximal orders at the finite places (§1.1);
  the finite ramification set with its finiteness and parity, the covolume formula for maximal
  orders with its local volumes and Haar-to-area normalization, the positive normalizer `N_B⁺(O)`
  of a maximal order with `N_B⁺(O)/Γ(O)` an elementary abelian `2`-group, the finiteness of
  `[Γ(O) : Γ(O′)]`, and the local order-to-tree adapter at split places with its stabilizers
  (§1.2); the finiteness of maximal-order types (§1.4). Layers 0, 1, 3, 4 and 8 consume these and
  add what is specific to an arbitrary number field, to an arbitrary Dedekind base, to Eichler
  orders and to `F = ℚ`: the Hilbert-symbol description of the ramification set and its invariant
  reading (0.3), the ramification index and reduced discriminant of a local maximal order (1.6),
  Eichler orders of level `𝔭^e` as intersections of vertices at distance `e` (1.11), the finiteness
  of class and type sets of every order (3.5), the reading `N⁺/(ℚ^×O¹) ≅ AL(O) ≅ (ℤ/2)^{ω(DN)}` for
  an Eichler order over `ℚ` (4.6), and the Eichler index `ψ(N)` with the area `(π/3)φ(D)ψ(N)` of
  `X_0(D;N)` (8.2). The lattice tree, adjacency, tree theorem and group action belong to
  ReductiveGroupsPartII RG2.2.4, “sl2-tree”.
- **Eichler orders, their right ideal classes and the neighbour Brandt matrices** are Hilbert
  modular varieties and Shimura curves §§R18.5.16a–R18.5.16c: the local form of an Eichler order
  over every discrete valuation ring (conjugate to `O_0(𝔭^e)` for a unique `e`, iff it contains a
  conjugate of the diagonal, and the intersection of a unique pair of maximal orders, the ends of a
  path of length `e`), its local–global form over a number field with the level `𝔐` prime to `disc B` and
  `discrd O = disc B·𝔐`, the completed levels with the local indices
  `[GL₂(O_v) : O_0(𝔭_v^e)^×] = q_v^{e−1}(q_v + 1)`, the identification of the idele double cosets
  with the locally principal right ideals, the left orders, their unit groups as stabilizers and the
  definite weights (§R18.5.16a); the fibres `Γ_x\U/U′` of the refinement maps of double-coset
  spaces (§R18.5.16b); and, at a place `v` where `B` splits and which does not divide the level, the
  `v`-neighbours of a right ideal and the Brandt matrix `B(v)` with its independence of
  representatives, row sums `q_v + 1`, commutativity and weighted symmetry (§R18.5.16c). Layers 1,
  3, 5 and 7 consume these and add: locality of the Eichler property over every Dedekind base, the
  normalizer of `O_0(𝔭^e)`, superorders and the hereditary criterion (1.8); the genus and local
  norm-maximality of an Eichler order (1.9); the converse and superorder statements of the vertex
  path (1.11); the idelic dictionary for every order and the transport of class sets (3.4, 3.9); the
  mass of every order (5.1); and `T(𝔫)` for composite `𝔫`, for `𝔫` meeting the level and for orders
  that are not Eichler, with the element count, multiplicativity, the Hecke algebra and its
  semisimplicity (7.1–7.3). In the column convention of this roadmap `T(𝔭) = B(v)ᵗ`.
- **Quaternionic modular forms**: the coefficient modules, level forms and classical forms in
  weight with their Hecke operators are GL₂ transfer R17.3.8a–R17.3.8d and Hilbert modular
  varieties and Shimura curves R18.3; slopes and families are AutomorphicGaloisRepresentations
  §§0.2c–0.2e. **Jacquet–Langlands**: GL₂ transfer R17.1–R17.3.
- **Canonical models, integral models, the auxiliary PEL bridge, Čerednik–Drinfeld**: Hilbert
  modular varieties and Shimura curves R18.1, R18.2, R18.5. **Models, gonality and rational points**
  of Shimura curves: the sibling `CanonicalModelsAndGonality` roadmap; the Jacobian decomposition,
  conductor and analytic rank of `X_H` are the modular-forms data reached through R17.3 and are not
  milestones here.
- **Labels and ordering.** The intrinsic prefix `D.d.δ.N.i.g` is Layer 10; the Gassmann-class
  letter `c`, the index `n` within a class, the canonical generators of `H` and the completeness
  of any stored list are not targets. Gassmann equivalence of two subgroups `H, H'` of the
  enhanced group (the relation the letter indexes) is the sibling `FiniteGroupInvariants` 7.1,
  applied to that finite group. The isomorphism invariants of the abstract group `H` are
  `FiniteGroupInvariants`' and its label is not a target; here `H` is a subgroup and its
  isomorphism type is an object, never a string.
- **Quaternionic hermitian lattices of rank `≥ 1` over an order and their masses** are geometry of
  numbers §2.8 and §3.3 and the orthogonal Tamagawa roadmap; this roadmap supplies the orders they
  take as coefficients.
- **Gorenstein and Bass orders in a commutative étale `ℚ`-algebra** (the Frobenius orders
  `ℤ[π, q/π]` of abelian varieties over finite fields): the sibling
  `AbelianVarietiesOverFiniteFields` 8.4. Its `IsGorenstein` (trace dual invertible) and 2.2 here
  (codifferent invertible) are the two instances of one definition for orders in a
  finite-dimensional semisimple algebra, which no roadmap states in that generality; each roadmap
  owns its instance and the laws special to its algebra.
- **Selectivity** (the optimal selectivity condition of Voight ch. 31) is not developed: every
  embedding-number formula below is stated either for `F = ℚ` or in the form of the trace formula
  summed over the class set, where selectivity does not enter.

## Conventions

Integer levels and congruence moduli are positive, and ideal norms in the counting formulas are nonzero. Numerical local unit counts and λ factors require a finite residue field k, with q = #k ≥ 2; the residue-algebra definitions do not require finiteness. The exponent e in a local level pᵉ may be zero.

| Object | Convention |
| --- | --- |
| Base | `R` a Dedekind domain, `F = Frac R` of characteristic `0`; `[IsDedekindDomain R] [IsFractionRing R F]`. For number fields `R = 𝓞 F`; for the Shimura-curve layers `R = ℤ`, `F = ℚ`. |
| Algebra | `B = ℍ[F,a,b]` with `a b : Fˣ`; `k = ij`. The reduced trace is `trd x = x + star x = 2·re x` and the reduced norm is `nrd = QuaternionAlgebra.normForm a 0 b`, `nrd x = x·star x = (x * star x).re`. `nrd ≅ ⟨1,-a,-b,ab⟩` and the trace-zero form is `⟨-a,-b,ab⟩`. |
| Presentation independence | Every invariant of `B` or of an order is proved invariant under `AlgEquiv`; an abstract central simple algebra of dimension four is handled by choosing a presentation. No second carrier. |
| Local algebra | `B_v = ℍ[F_v, a, b]` with `F_v = v.adicCompletion F` at a finite place and `ℝ` at a real place; `B_v ≃ F_v ⊗_F B` is `baseChangeTwoParams`. |
| Ramified | `B` is **ramified at `v`** when `(a_v, b_v)_v = -1`, where `(·,·)_v` is `TauCeti.hilbertSymbol` over `F_v`; equivalently `B_v` is a division algebra; equivalently `B_v ≄ M₂(F_v)` (0.2). Complex places are never ramified. `Ram B` is the set of ramified places, `Ram_f B` its finite part. |
| Discriminant of `B` | `disc B = ∏_{v ∈ Ram_f B} 𝔭_v`, an ideal of `𝓞 F`; over `ℚ` the squarefree positive integer `D = ∏_{p ∈ Ram_f B} p`. `D = 1` for `M₂(ℚ)`. |
| Definite, indefinite | `B` is **totally definite** when `F` is totally real and every real place is ramified; otherwise `B` is **indefinite** and is said to satisfy the **Eichler condition** (`[V, 17.8.1]`). Over `ℚ`: definite iff `(a,b)_ℝ = -1` iff `a < 0` and `b < 0`. |
| Order | An `R`-order is `O : Subalgebra R B` whose underlying submodule satisfies `Submodule.IsLattice F`. Orders are ordered by inclusion of subalgebras. |
| Discriminant of a lattice | For an `R`-lattice `I ⊆ B`, `disc I` is the `R`-submodule of `F` generated by `det(trd(α_i α_j))` over quadruples in `I` (`[V, 15.2.2]`), and its determinant reduced discriminant is the fractional ideal `δ(I) = (4ab) det(I)` in the basis `1,i,j,k`. The cubic ideal `cubic(I)` is generated by `m(α₁,α₂,α₃) = trd((α₁α₂ − α₂α₁)α₃)` over triples (`[V, 15.4.4]`). For orders only, `discrd O = cubic(O) = δ(O)`; for a general lattice `δ(I) = (I ∩ F) cubic(I)` (1.5). Over `ℤ` both are principal, generated by positive integers `disc O`, `discrd O`, and the LMFDB's `discO` is `discrd O`. |
| Codifferent | `O^♯ = {α ∈ B : trd(αO) ⊆ R}`; `codiff O = O^♯`. |
| Maximal, Eichler, level | `O` is maximal when no order properly contains it. `O` is **Eichler** when it is the intersection of two maximal orders (`[V, 23.4.1]`). Its **level** is the ideal `𝔐 = discrd(O)·(disc B)^{-1}`, which is coprime to `disc B` (1.9); over `ℚ`, `discrd O = D·N` with `gcd(D,N) = 1` and `N` the level. |
| Right class set | `Cls O` is the set of classes of **proper invertible** right fractional `O`-ideals (right multiplier order exactly O) under `I ∼ J ⟺ ∃ α ∈ B^×, αI = J` (`[V, 17.3.4]`); left classes are reached through `I ↦ star I`. The **class number** is `# Cls O`. Over a Dedekind domain invertible means locally principal (3.1). |
| Type set, genus | Orders of the same type are `B^×`-conjugate, equivalently `R`-algebra isomorphic (`[V, 17.4.2]`); the genus of `O` is the set of orders locally isomorphic to `O`, and `Typ O` its set of types (`[V, 17.4.8]`). |
| Mass | For a totally definite `B`, `mass(Cls O) = ∑_{[J] ∈ Cls O} [O_L(J)^× : R^×]^{-1}` (`[V, 26.1.4]`); over `ℚ` the weight is `w_J = #O_L(J)^× / 2 = #(O_L(J)^×/{±1})`. |
| Eichler symbol | `(O | 𝔭) ∈ {1, 0, -1, ∗}` according as `O_𝔭/rad O_𝔭` is `k × k`, `k`, a quadratic field extension of `k`, or a quaternion algebra over `k` (`[V, 24.3.2, 24.3.13]`); `λ(O,𝔭) = 1 + 1/q, 1 − 1/q², 1 − 1/q` in the first three cases, `q = #k` with k finite. |
| Optimal embedding | For a quadratic `R`-order `S` in a quadratic field `K ⊇ F`, an `F`-algebra map `φ : K → B` is **optimal for `S`** when `φ(K) ∩ O = φ(S)` (`[V, 30.3.2]`). `Emb(S,O;Γ)` is its set of `Γ`-conjugacy classes for `O¹ ≤ Γ ≤ N_{B^×}(O)`, acting on the right by `φ ↦ γ^{-1}φγ`, and `m(S,O;Γ) = # Emb(S,O;Γ)` (`[V, 30.3.11–12]`). For `F = ℚ` the quadratic order is Tau Ceti's `NumberFieldOrder K`. |
| Brandt matrix | With representatives `I_1,…,I_h` of `Cls O`, `T(𝔫)_{ij} = #{J ⊆ I_j : nrd J = 𝔫·nrd I_j, [J] = [I_i]}` (`[V, 41.2.3]`); on the free module of classes this is T(𝔫); on functions M₂(O) = Map(Cls O, ℤ), the pullback operator A(𝔫) has `(A(𝔫)f)([I]) = ∑_{J ⊆ I, nrd J = 𝔫 nrd I} f([J])` and matrix T(𝔫)ᵗ (`[V, 41.2.6]`). Columns index the source class. |
| Real splitting | For `B` indefinite over `ℚ`, `ι_∞ : B → M₂(ℝ)` is a fixed `ℚ`-algebra embedding; `det ∘ ι_∞ = nrd`. Changing `ι_∞` conjugates every group below inside `PGL₂(ℝ)`; every invariant stated is conjugation invariant. |
| Fuchsian groups | `Γ¹(O) = ι_∞(O¹)/{±1} ≤ PSL₂(ℝ)`; `Γ¹_0(D;N) = Γ¹(O)` for `O` Eichler of level `N` in the algebra of discriminant `D`; `Γ⁺(O) = ι_∞(N_{B^×}(O)^{+})ℝ^×/ℝ^×`, the image of the positive-norm normalizer. `PSL(2,ℝ)` is Mathlib's `ProjectiveSpecialLinearGroup (Fin 2) ℝ` acting through Tau Ceti's `instMulActionPSL2`. |
| Curves | `X_0(D;N) = Γ¹_0(D;N) \ ℍ`, `X_0^*(D;N) = Γ⁺(O) \ ℍ` (the full Atkin–Lehner quotient; the LMFDB's `X^*(D;N)` of full level `N` is 9.5's); for `D > 1` these are compact Riemann surfaces (no cusps), and `genus` means the genus of the compact Riemann surface `Subgroup.CompactifiedQuotient Γ` (which is the coarse quotient itself) in the sense of Fuchsian orbifolds Layer 5. Area is hyperbolic area for `volume` on `ℍ` with density `y^{-2}dx dy`. |
| Elliptic points | `ν_q(Γ)` is the number of `Γ`-orbits of points of `ℍ` whose stabilizer in `Γ` has order `q ≥ 2`. The Gauss–Bonnet identity for a cocompact `Γ` reads `2g − 2 = area(Γ\ℍ)/(2π) − ∑_q ν_q(1 − 1/q)`. |
| Polarization | For an order `O` in an indefinite `B/ℚ`, a **polarization** is `μ ∈ B^×` with `μ² ∈ ℤ_{<0}` and `trd(μO) ⊆ ℤ`, i.e. `μ ∈ O^♯`; its **degree** `deg μ` is the unique squarefree positive integer `δ` with `nrd(μ)/discrd(O) ∈ δ·(ℚ^×)²`. `(O,μ) ≃ (O',μ')` when a conjugation carrying `O` to `O'` carries `μ` to `μ'`. Voight's *principal* polarization of a maximal order (`μ² + D = 0`, `[V, 43.6.4]`) is the degree-`1` case. |
| `Aut_{±μ}(O)` | `N_{B^×}(O) = {γ : γ^{-1}Oγ = O}`; `Aut_μ(O) = {γ ∈ N_{B^×}(O)/ℚ^× : γ^{-1}μγ = μ}` and `Aut_{±μ}(O) = {γ ∈ N_{B^×}(O)/ℚ^× : γ^{-1}μγ = ±μ}`. |
| Enhanced group | `G(O,μ,N) = Aut_{±μ}(O) ⋉ (O/NO)^×` with `w` acting on `(O/NO)^×` by `x ↦ wxw^{-1}`; `G(O,μ) = Aut_{±μ}(O) ⋉ O^×`, with the reduction `ρ_N : G(O,μ) → G(O,μ,N)`. In Lean the carrier is Mathlib's `SemidirectProduct`, whose product is `(x₁,w₁)(x₂,w₂) = (x₁·w₁x₂w₁^{-1}, w₁w₂)`; the knowls `shimcurve.enhanced_group` and `shimcurve.is_coarse` write pairs `(w,x)` and make `(w,x) ↦ w·x` a homomorphism to `N_{B^×}(O)/ℚ^×`, which forces the product `(w₁,x₁)(w₂,x₂) = (w₁w₂, w₂^{-1}x₁w₂·x₂)`. The map `(x,w) ↦ (w, w^{-1}xw)` is an isomorphism from the first group to the second (9.4); the subgroups `H` and every invariant below are the same under either convention. |
| `π` and the kernel | `π : G(O,μ) → N_{B^×}(O)/ℚ^×`, `π(x,w) = x·w` (in Mathlib's ordering), is a homomorphism; `K = ker π` is finite cyclic and contains `(−1, 1)`. `G(O,μ)^+` is the preimage of the positive-norm elements. |
| `X_H` | For `H ≤ G(O,μ,N)`, `Γ_H = π(ρ_N^{-1}(H) ∩ G(O,μ)^+) ≤ PSL₂(ℝ)` and `X_H = Γ_H \ ℍ`. This is one geometric component of the LMFDB's `X_H`; the full `X(O;N)^{big} = B^×\(ℍ^± × B̂^×)/Γ(Ô,N)` has `φ(N)` components, each isomorphic over `ℂ` to `Γ¹(O;N)\ℍ` (9.5), and `X_H` is its quotient by `H`. All invariants the LMFDB lists are invariants of the component. |
| LMFDB invariants of `H` | level `N(H)` = least `N` with `H ⊇ ker((O/N'O)^× → (O/NO)^×)` in the enhanced group at the ambient level `N'`; index `[G(O,μ,N) : H]`; Fuchsian index `[Γ_G : Γ_H]`; gerbiness `#ρ_{N(H)}(K)`, the order of the image of `K` in the enhanced group at the level of `H` (equal to `#ρ_N(K)` when `N = N(H)`); aut-gerbiness `#(image of K in Aut_{±μ}(O))`; `H` is **coarse** when `H ⊇ ρ_N(K)`. |
| Intrinsic label prefix | `D.d.δ.N.i.g` with `D = disc B`, `d = discrd O` (omitted when `O` is maximal), `δ = deg μ`, `N` the level of `H`, `i` its index, `g` the genus of `X_H`. The suffix `c.n` is not an object of this roadmap. |

## Exact supplier contracts

Every milestone names its prerequisites, each of one of four kinds: a Mathlib declaration at the
pin; a Tau Ceti declaration at the pin (module path given); an earlier milestone of this roadmap;
or a numbered layer or milestone of another roadmap in this repository, cited by its own
numbering and linked by directory. Nothing rests on a Mathlib pull request.

The roadmaps consumed are: [quadratic form invariants](../QuadraticFormInvariants/README.md)
(Layer 2 and sublayer 6C), [global quadratic forms](../GlobalQuadraticForms/README.md) (4.4, 5.5,
6.1, 6.3), [class field theory](../ClassFieldTheory/README.md) (Layers 5, 10 and 14),
[global number fields](../../Completed/GlobalNumberFields/README.md) (Layers 1, 2, 4, 6 and 11), the
[completed number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)
(Layers 1 and 5), [classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)
(Layer 7, items 7.4, 7.20, 7.21, 7.44, 7.56, 7.60, 7.72, 7.77, 7.78, 7.98),
[Fuchsian orbifolds](../FuchsianOrbifolds/README.md) (Layers 0–5), [arithmetic Fuchsian groups](../ArithmeticFuchsianGroups/README.md) (§§1.1, 1.2, 1.4), [theta series](../ThetaSeries/README.md) (Layer 7),
[adelic algebraic groups](../AdelicAlgebraicGroups/README.md) (AA.3.4, AA.4.2, AA.4.6, AA.5.3),
[GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
(R17.1.5, R17.3, R17.3.8d) and
[Hilbert modular varieties and Shimura curves](../HilbertModularVarietiesAndShimuraCurves/README.md)
(R18.1, R18.3.1, §§R18.5.16a–R18.5.16c, R18.5.17a). Each consumed object is listed with its
milestone under *Scope and ownership*.

- **From Mathlib:** `QuaternionAlgebra` and its star, `QuaternionAlgebra.Basis` and `liftHom`,
  `swapEquiv`; `Submodule.IsLattice`; `Subalgebra`; `IsDedekindDomain`, `HeightOneSpectrum`,
  `adicCompletion`; `NumberField.InfinitePlace` with `IsReal` and `IsTotallyReal`; `ClassGroup`;
  `Matrix.SpecialLinearGroup`, `ProjectiveSpecialLinearGroup`, `UpperHalfPlane` with its
  `SL(2,ℝ)` action and `volume`; `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`;
  `Nat.totient`, `legendreSym`, `jacobiSym`; `SemidirectProduct`; `MeasureTheory.covolume`;
  the unit subgroup `Submonoid.units` of a submonoid, with `Submonoid.mem_units_iff` (`x ∈ S.units`
  iff `x` and `x⁻¹` lie in `S`; `Mathlib/Algebra/Group/Submonoid/Units.lean`), which is `O^×` in 1.2;
  `Algebra.adjoin` and `IsSemisimpleRing` for the Hecke algebra of 7.3.
- **From Tau Ceti at the pin** (module paths under `TauCeti/`): the norm form
  `QuaternionAlgebra.normForm`, `pureNormForm`, `normForm_apply`, `normForm_mul`, `isUnit_iff_normForm_isUnit`,
  `anisotropic_normForm_iff` (`Algebra/Quaternion/NormForm.lean`); the four-fold splitting criterion
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` and its named faces
  (`Algebra/Quaternion/SplittingCriterion.lean`); the equivalences `oneEquivMatrix`,
  `aNegAEquivMatrix`, `rescaleJEquiv`, `normMulEquiv`, `steinbergEquivMatrix`
  (`Algebra/Quaternion/{Split,SymbolEquiv,Steinberg}.lean`); naturality of star, reduced trace and
  norm under algebra equivalences: `map_star_of_algEquiv`, `reducedTrace_eq_of_algEquiv` and
  `normForm_eq_of_algEquiv`, with 2 regular (`Algebra/Quaternion/AlgEquiv.lean`, lines 106, 93, 114); base change
  `baseChangeTwoParams` (`Algebra/Quaternion/BaseChange.lean`); centrality and simplicity
  (`Algebra/Quaternion/CentralSimple.lean`); the Brauer class `quaternionClass` with its relations
  (`Algebra/Quaternion/BrauerClass.lean`); the norm-equation Hilbert symbol `TauCeti.hilbertSymbol`
  with `hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`, `hilbertSymbol_comm`,
  `hilbertSymbol_congr_sq` (`NumberTheory/HilbertSymbol/Basic.lean`), its real value
  `hilbertSymbol_real` (`NumberTheory/HilbertSymbol/Archimedean.lean`), the localizations
  `IsDedekindDomain.HeightOneSpectrum.unitAtFinitePlace` and `TauCeti.unitAtRealPlace`
  (`NumberTheory/QuadraticForm/Global/Localization.lean`) and the finite support of the localized
  symbol `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`
  (`NumberTheory/QuadraticForm/Global/HilbertSymbol.lean`); the two-element quaternion subgroup of
  the local Brauer group `quaternionSubgroupSignEquiv` (`NumberTheory/LocalField/Quaternion/Subgroup.lean`);
  the local invariant `TauCeti.ClassFieldTheory.invMap` and the global `finiteInvAt`,
  `infiniteInvAt` (`NumberTheory/ClassFieldTheory/{Brauer/Invariant,Global/LocalInvariant}.lean`);
  orders in number fields `TauCeti.GlobalNumberFields.NumberFieldOrder` with `discr`, `index`,
  `conductor` and `Pic` (`NumberTheory/NumberField/Global/Orders/{Basic,Discriminant,Conductor,Picard}.lean`),
  which is the carrier of the quadratic orders of Layer 6 when `F = ℚ`; the `PSL(2,ℝ)` action on
  `ℍ` (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`), fundamental domains and `IsCofinite`
  (`Analysis/Complex/Fuchsian/Covolume.lean`), cyclic stabilizers (`Fuchsian/Stabilizer.lean`),
  the coarse quotient and compactified quotient as Riemann surfaces
  (`Fuchsian/CoarseQuotient.lean`, `Fuchsian/Compactification/{Basic,Manifold}.lean`; the
  topology of `Subgroup.CompactifiedQuotient Γ` is defined for discrete `Γ`), elliptic
  ramification indices (`Fuchsian/Elliptic/Ramification.lean`), the degree of a finite
  holomorphic map (`Analysis/Complex/RiemannSurface/Degree.lean`), the class `TauCeti.FiniteCWType`
  of spaces homotopy equivalent to a finite CW complex (`Topology/CWComplex/Classical/FiniteCWType.lean`)
  and the Euler characteristic `TauCeti.eulerChar` of such a space
  (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`), and the covolume scaling
  `MeasureTheory.covolume_eq_card_mul_covolume` (`MeasureTheory/Group/FundamentalDomain.lean`);
  the moduli and ray class groups `TauCeti.GlobalNumberFields.Modulus` (a nonzero finite part and a
  `Finset` of real places), `IsCongrOne` (the valuation conditions at the primes of the finite part
  and positivity at the infinite part) and `RayClassGroup`
  (`NumberTheory/NumberField/Global/RayClass/{Modulus,Basic}.lean`), whose group with finite part
  `⊤` and infinite part `Ω` is the `Cl_Ω R` of 4.1. Orders, maximal orders and left orders are, at
  Tau Ceti `2fd255d` (the three modules are absent at `358314d`), Tau Ceti's
  `TauCeti.IntegralOrder.IsOrder` (an `R`-subalgebra that is an `R`-lattice),
  `TauCeti.IntegralOrder.IsMaximalOrder` (maximal among them) and `Submodule.leftOrder`
  (`RingTheory/IntegralOrder/{Basic,Maximal,LeftOrder}.lean`), the carriers of classical
  arithmetic completion 7.4, 7.20 and 7.21: the bundle `QuatOrder` of `Suggested.lean` is a
  subalgebra with the lattice property of `IsOrder`, `IsMax` in its inclusion order is
  `IsMaximalOrder`, and `leftOrderSubalgebra I` has the carrier of `Submodule.leftOrder I`; Tau
  Ceti `2fd255d` has no right order, and `rightOrderSubalgebra` is its mirror image. At the pin,
  `TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`
  in `NumberTheory/LocalField/Quaternion/Invariant.lean` (line 79) identifies Hilbert symbol −1
  with local invariant 1/2 for a nonarchimedean local field with 2 invertible;
  `quaternionSubgroup_eq_twoTorsion` in the same file identifies the quaternion subgroup with Br(K)[2].
- **From the quadratic form invariants roadmap:** Layer 2 (presentation theory of `ℍ[K,a,b]`, the
  Tau Ceti declarations above), sublayer 6C (bimultiplicativity and nondegeneracy of the local
  Hilbert symbol, the closed formulas over `ℚ_p` and `ℚ_2`, `hilbertSymbol_eq_cohomological`,
  `hilbertSymbol_productFormula`); the trace-zero form `⟨-a,-b,ab⟩` and its invariance under
  `AlgEquiv` are its Layer 2 (`pureNormForm`, `equivalent_weightedSumSquares_of_algEquiv`).
- **From the global quadratic forms roadmap:** 4.4 (the localized product formula and the sign
  prescription `exists_hilbertSymbol_eq_neg_one_iff_pair`), 5.5 (Hasse–Minkowski isotropy), 6.1
  (scalar representation), 6.3 (Hasse–Minkowski isometry).
- **From the class field theory roadmap:** Layer 5 (`Br K`, `invMap`), Layer 10
  (`finiteInvAt`, `infiniteInvAt`, `eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`,
  `exists_br_of_sum_eq_zero`), Layer 14 (`hilbertProductFormula`).
- **From GL₂ automorphic representations and transfer, R17.1.5:** the predicate *`D` is ramified
  exactly at `S`* on an abstract quaternion algebra and the equivalence of its two local division
  tests, the realization theorem
  `existsQuaternionRamification_iff` (every even set of noncomplex places is the ramification set
  of some `B`) and the uniqueness theorem `nonempty_quaternionAlgEquiv_of_localSplitting` (two
  algebras with the same local splitting predicates are isomorphic). Layer 0 uses these through the comparison of §0.2, without restating them as targets. Its
  R17.3 (global Jacquet–Langlands) is the statement through which the Brandt matrices of Layer 7
  compute Hilbert modular forms; it is cited in Layer 7 and not restated. Its R17.3.8d supplies the
  Hecke operators `T_η φ = ∑_t φ|x_t` on quaternionic forms for a double coset `UηU = ⊔_t Ux_t`, with
  the opposite-ring law of AutomorphicFormsOnReductiveGroups §7.4; Layer 7 compares the transpose
  Brandt matrices with sums of `T(η⁻¹)` on forms with trivial coefficients, keeping the local
  double-coset types.
- **From Hilbert modular varieties and Shimura curves:** R18.1 (the canonical curve
  `Sh_U(G_B, X_B)` over `ℚ` and its complex uniformization), which is the algebraic curve whose
  complex points Layer 8 and Layer 9 describe as `Γ \ ℍ`; R18.3.1 (the central quotient of the class set `Cl(U)` by the finite ideles of the centre);
  §R18.5.16a (for an Eichler order `R` of level `𝔑` in a quaternion algebra over a number field,
  with orders and maximal orders Tau Ceti's `TauCeti.IntegralOrder.IsOrder` and
  `TauCeti.IntegralOrder.IsMaximalOrder` at Tau Ceti `2fd255d`: item 1, over every discrete valuation ring `A`, an
  `A`-order of `M₂(K)` is the intersection of two maximal orders iff it is conjugate to some
  `O_0(𝔭^e)` iff it contains a conjugate of `A × A`, with `e` and the pair of maximal orders unique,
  the ends of the path of length `e`; item 2, `R` is Eichler iff every completion is, the level is
  prime to `disc B` and `discrd R = disc B·𝔑`; items 3–4, the completed levels and the indices
  `[GL₂(O_v) : O_0(𝔭_v^e)^×] = q_v^{e−1}(q_v + 1)`; item 6, `x ↦ B ∩ xR̂` identifies
  `B^×\B̂^×/R̂^×` with the locally principal right fractional `R`-ideals modulo `B^×`; item 7, the
  left order of `B ∩ xR̂` is `B ∩ xR̂x⁻¹`, with unit group the stabilizer at `x`; item 8, for
  totally definite `B` the weight `[O_L(I)^× : O_F^×]` is finite and depends only on the class);
  §R18.5.16b (for a group `G`, a subgroup `Γ` and subgroups `U′ ≤ U`, the refinement map
  `Γ\G/U′ → Γ\G/U` is surjective and its fibre over `ΓxU` is in bijection with `Γ_x\U/U′`,
  `Γ_x = U ∩ x⁻¹Γx`, compatibly with a change of representative `x ↦ γxu`); §R18.5.16c (at a place
  `v` where `B` splits and which does not divide `𝔑`: the `v`-neighbours of a locally principal
  right ideal, `q_v + 1` of them, and the Brandt matrix `B(v)`, whose entry `B(v)_{ij}` counts the
  neighbours of `I_i` in the class of `I_j`, independent of the representatives, with rows summing
  to `q_v + 1`, `B(v)B(w) = B(w)B(v)`, and `w_j B(v)_{ij} = w_i B(v)_{j,s_v(i)}`; in the column
  convention of Layer 7, `T(𝔭_v) = B(v)ᵗ`);
  R18.5.17a (the definite class-set graph at a split prime and its integral Brandt matrices).
  R18.1.3 supplies uniformization, and R18.1.7–8 supplies an auxiliary PEL bridge. Neither
  supplies the enhanced integral Galois representation. Sections 9.7–9.8 own its comparisons
  for a polarized QM surface with the specified integral module marking.
- **From AbelianSchemesAndArithmeticModuli §§A0.1, A3.2, A3.9, A6.20:** abelian schemes, finite étale
  N-torsion in characteristic zero, the Rosati involution, and the full-level descent of
  homomorphisms (every homomorphism `A_{k̄} → B_{k̄}` of abelian varieties over `k` is defined over
  `k(A[n], B[n])` for `n ≥ 3` prime to the characteristic). Sections 9.7–9.8 use these
  with a number field, its algebraic closure and the natural Galois actions; they construct
  no moduli space and make no assertion that an arbitrary complex curve point descends.
- **From adelic algebraic groups:** §4.4 “Nested-level map on double cosets” and
  “Finite-index bound for level changes” for §3.9; AA.3.4 `class-number-finite` (`Reduction.finite_classes`),
  AA.4.2 `quaternion-norm-one-strong-approximation` (`D¹(𝔸_{F,f}) = D¹(F)·D¹(F_v)·U^{v,1}` for a
  split finite place `v`), AA.4.6 `quaternion-norm-images` (`Nrd(D^×) = F^×_{>Ω 0}`), and AA.5.3:
  *quaternion-class-sets* (the class set `Cl(U) = D^× \ D_f^× / U` of a quaternion algebra is
  finite for every compact open `U`, with representatives and surjective refinement maps),
  *definite-quaternion-stabilizers* (for totally definite `D` and compact `U` the stabilizers
  `D^× ∩ xUx⁻¹` are finite modulo `F^× ∩ U`, and finite over `ℚ`) and the volume identity under
  level change for a definite algebra over ℚ. Layer 3 identifies `Cls O` with `Cl(Ô^×)`. The Hurwitz order's maximality, its
  `24` units, its single class and its mass `1/12` are proved here (1.7, 1.13, 3.8, 5.6), not
  consumed.
- **From Fuchsian orbifolds:** Layers 0–5 supply the effective action, the elliptic points and
  coarse quotient (Layer 1), measurable fundamental domains, covolume and cofiniteness (Layer 2,
  item 1), the compactification (Layer 4), and the genus through `χ = 2 − 2g` and Riemann–Hurwitz
  (Layer 5). The scaling of covolume along a subgroup of finite index is Tau Ceti's
  `MeasureTheory.covolume_eq_card_mul_covolume` (`MeasureTheory/Group/FundamentalDomain.lean`):
  for a measure invariant under `Γ` and `Δ ≤ Γ`, with `Γ` countable and admitting a fundamental
  domain, the covolume of `Δ` is the index `[Γ : Δ]`, counted in `ℕ∞`, times that of `Γ`.
- **From ReductiveGroupsPartII RG2.2.4, “sl2-tree”:** the homothety-class lattice graph,
  its adjacency, `BTTree.isTree`, its q+1 neighbors at each vertex and the GL₂(F) action
  through PGL₂(F), for a nonarchimedean local field F. Section 1.11 compares vertices,
  stabilizers and distances with maximal and Eichler orders.
- **From ArithmeticFuchsianGroups §§1.1, 1.2, 1.4:** its real splittings `RealSplitting k a b` (a
  real place at which `ℍ[k,a,b]` splits, every other real place ramified, and a ring homomorphism
  to `M₂(ℝ)` over that place), which for a totally real `k` exist exactly when the algebra splits
  at one real place and ramifies at the others, any two differing by conjugation in `GL₂(ℝ)`; the
  lattice `Γ(O) = normOneImage S O ≤ PSL₂(ℝ)` of an order `O` with `isCofinite_normOneImage`
  (discrete, of finite covolume) and `cocompact_normOneImage_iff_anisotropic` (cocompact iff the
  norm form is anisotropic, iff the algebra is division); the local structure of maximal orders at
  the finite places of `k` (the valuation ring is the unique maximal order at a division place, with
  normalizer `B_v^×`; the maximal orders of `M₂(k_v)` are the `End(L)` of lattices `L ⊆ k_v²`); its
  finite ramification set `finiteRamification a b` (the finite places where the local norm form is
  anisotropic), finite, of cardinality of the parity of the number of ramified real places and
  invariant under multiplying `a` or `b` by a square; the covolume formula `covolume_normOneImage`
  for a maximal order, `8π |d_k|^{3/2} ζ_k(2) (4π²)^{−n} ∏_{𝔭 ∈ Ram_f}(N𝔭 − 1)`; the positive
  normalizer `N_B⁺(O) ≤ B^×/k^×` of a maximal order with `ν : N_B⁺(O) → k^×/(k^×)²`,
  `ker ν = Γ(O)` and `N_B⁺(O)/Γ(O) ≃ im ν` a finite elementary abelian `2`-group; the finiteness of
  `[Γ(O) : Γ(O′)]` for `O′ ⊆ O` with the covolume scaling; the order-to-tree adapter at a split
  finite place (`[L] ↦ End(L)` from the vertices of the tree to the maximal orders, adjacency to
  Eichler orders of level `v`, conjugation to the tree action, unit groups and normalizers to
  stabilizers); and the finiteness of maximal-order types over a totally real field. Its orders are
  Tau Ceti's `TauCeti.IntegralOrder.IsOrder k O` (at Tau Ceti `2fd255d`) on `𝓞_k`-subalgebras, which for `k = ℚ` are the
  `ℤ`-orders of 1.1 through Mathlib's `Rat.ringOfIntegersEquiv`, and its `O ∩ B¹` (`B¹` Mathlib's
  `unitary`) is the norm-one group `O¹` of 1.2. Sections 0.3, 1.2, 1.6, 1.11, 3.5, 3.6, 4.6, 8.1
  and 8.2 consume these as stated there.

- **From the theta series roadmap:** Layer 7, the Hecke–Schoeneberg theorem
  `Θ_L ∈ M_k(Γ₀(N), χ_L)`, applied in 7.7 to the quaternary lattice `(I_j I_i^{-1}, nrd)`.
- **From classical arithmetic completion, Layer 7:** 7.4 (orders in a finite-dimensional algebra
  as `Submodule.IsLattice` subalgebras, and the integrality criterion), 7.20 (left order of a
  lattice), 7.21 (maximal orders), 7.44 (strong approximation for `SL₁` of an algebra satisfying
  Eichler's condition: `J(B)′ = B^×′·(J(B)′ ∩ U(Λ))` for every arithmetic order `Λ`), 7.56 (every
  order with nondegenerate regular trace lies in a maximal order; the characteristic-zero quaternion algebra satisfies this premise), 7.60 (reduced-norm images: `nrd(B_v^×) = F_v^×` at finite `v`,
  `nrd(Λ_v^×) = R_v^×` for a maximal local order, `ℝ_{>0}` at a ramified real place, and the
  global image), 7.72 (ideles and lattice gluing), 7.77 (the locally free class group), 7.78 (the
  bijection `B^× \ J(B) / U(Λ) ≃ {locally free rank-one right Λ-lattices}/≅`), 7.98 (Jacobinski
  cancellation under Eichler's condition). The generic order, multiplier-order, local maximality and maximal-existence
  results are consumed without duplicate targets. The native bundle `QuatOrder` and the
  multiplier subalgebra predicates in Suggested.lean only make the headline statements expressible;
  Layer 1 adds the discriminant and involution theory specific to quaternion algebras; 1.9 and 4.4 read 7.60 at the maximal orders, 3.4 reads 7.78 at `Λ = O`, and 4.1
  and 4.7 read 7.44 and 7.98 for `B` indefinite.
- **From the completed number-field arithmetic roadmap:** Layer 1 (splitting of primes in a
  quadratic field, `legendreSym` dictionary) and Layer 5 (completions as local fields).
- **From global number fields:** Layer 1 (weak approximation), Layer 2 (moduli and ray class
  groups: Tau Ceti's `Modulus`, `IsCongrOne` and `RayClassGroup`, the carrier of `Cl_Ω R` in 4.1),
  Layer 4 (finite adeles and the finite-idele description of the class group, used in 3.4), Layer 6
  (ideles and the idele class group), Layer 11 (`NumberFieldOrder`, `Pic`, the conductor).

The native bundle instances `instSetLikeQuatOrder` and `instPartialOrderQuatOrder` expose order
membership and inclusion; `instNormalScalars` supplies the central scalar quotient of §9.2.

### From Mathlib: native carriers

- `Mathlib/Algebra/Quaternion.lean`: the structure `QuaternionAlgebra R c₁ c₂ c₃`, notation
  `ℍ[R,a,b]`, the basis `1, i, j, k`, `star`, `mul_star_eq_coe`, `self_add_star`, `swapEquiv`,
  the `Algebra S ℍ[R,…]` instance for `Algebra S R` and the scalar towers. `QuaternionBasis.lean`:
  `QuaternionAlgebra.Basis`, `lift`, `liftHom`.
- `Mathlib/Algebra/Module/Lattice.lean`: `Submodule.IsLattice A M` (finitely generated and
  `A`-spanning), its `Module.Finite` instance and stability under `Aˣ`.
- `Mathlib/RingTheory/DedekindDomain/`: `IsDedekindDomain`, `HeightOneSpectrum`,
  `adicCompletion`, `adicCompletionIntegers`, `FractionalIdeal`, `ClassGroup`.
- `Mathlib/NumberTheory/NumberField/`: `InfinitePlace`, `IsReal`, `IsComplex`, `IsTotallyReal`,
  `𝓞 K`, `NumberField.discr`, `classNumber`, `Units`, the regulator.
- `Mathlib/NumberTheory/Padics/`: `ℚ_[p]`, `ℤ_[p]`, their field and valuation structure.
- `Mathlib/NumberTheory/LegendreSymbol/`: `legendreSym`, `jacobiSym`, quadratic reciprocity;
  `Mathlib/Data/Nat/Totient.lean`: `Nat.totient`; `Mathlib/NumberTheory/ArithmeticFunction/`:
  `ArithmeticFunction.sigma`, multiplicativity.
- `Mathlib/LinearAlgebra/Matrix/{SpecialLinearGroup,ProjectiveSpecialLinearGroup}.lean`,
  `Mathlib/Analysis/Complex/UpperHalfPlane/`: `ℍ`, the `SL(2,ℝ)` action, `volume`, fixed points,
  proper action; `Mathlib/GroupTheory/GroupAction/`: `orbitRel.Quotient`, `stabilizer`;
  `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`: `covolume`.
- `Mathlib/GroupTheory/SemidirectProduct.lean`: `N ⋊[φ] G`; `Mathlib/GroupTheory/Subgroup/Center.lean`:
  `normal_of_le_center`.
- `Mathlib/Algebra/BrauerGroup/`: `BrauerGroup K`, which Tau Ceti's `quaternionClass` lands in.

The arithmetic constructions below use these native algebra, module and group carriers.

### From Tau Ceti: quaternion and analytic carriers

Listed under *From Tau Ceti at the pin* above, with module paths. Three points deserve emphasis.
First, the whole field-theoretic layer (norm form, splitting criterion, symbol relations,
naturality under equivalences, base change) is supplied by the pinned modules, so Layer 0 is a specialization and never
reproves a splitting statement. Second, the Hilbert symbol has its localizations at the
finite and real places of a number field and with the finiteness of its support, so the finite
ramification set of 0.3, which is ArithmeticFuchsianGroups §1.2's, is finite by the finite-support theorem at the pin as well. Third, the Fuchsian
quotient `Γ \ ℍ` and its compactification are Riemann surfaces in the pinned modules, with cyclic stabilizers and
elliptic ramification indices; what Layers 8–9 add is arithmetic: which `Γ` and which numbers.

## How to read the build

Everything under *Owned here*: the ramification predicates on the symbol carrier and the
discriminant ideal; orders, discriminants, maximal and Eichler orders, levels; the even Clifford
correspondence, Gorenstein and Bass orders, the Eichler symbol; invertible ideals, class sets,
types, the quaternion reading of the idelic dictionary and the finiteness of class and type sets;
Eichler's theorems; the mass formula; optimal embeddings, embedding numbers, the trace formula
and the class and type number formulas; Brandt matrices and the Eichler trace formula; the
arithmetic Fuchsian groups over `ℚ` with their areas, elliptic points, genera and Atkin–Lehner
quotients; polarized orders, `Aut_{±μ}(O)`, enhanced groups and the invariants of `X_H`.

The build runs from ramification and order arithmetic through ideals, mass and embeddings,
then Brandt correspondences, arithmetic curves and polarized level structures. Suggested.lean
states headline theorems on native carriers and the simple definitions needed by them; the
module docstring identifies constructions needed for the other headlines. The README supplies
the complete APIs and examples. A proof of one acceptance theorem does not replace its layer's
basic theory.

## Layer 0: quaternion algebras over a number field, local invariants and the discriminant

Throughout, `F` is a number field unless the item says otherwise, and `B = ℍ[F,a,b]`.

### 0.1 Reduced trace and norm on the symbol carrier

The signatures use `trd` for this trace and `nrd` for the native norm form.

Define `trd x = 2·re x` and specialize the native norm form as `nrd`. The additional
arithmetic input is the trace pairing on the symbol basis: for a characteristic-zero field
and nonzero a,b, prove its Gram matrix is diag(2,2a,2b,−2ab), with determinant −16a²b²,
hence it is nondegenerate ([V, 15.2.10], p. 236).

Its API:

- Identify the trace pairing with this Gram matrix and its induced dual-lattice pairing.
- Transport this pairing along an algebra equivalence using the trace-naturality contract.

**Checks.**

- At (a,b) = (3,−1), the Gram diagonal is (2,6,−2,6), determinant −144.
- At (−1,−1), it is (2,−2,−2,−2), determinant −16.
- At (1,1), it is (2,2,2,−2), determinant −16, although the algebra is split.
- At (3,−1), nrd(i)nrd(j) = (−3)·1 = −3 = nrd(ij), pinning the native norm convention.

*Needs:* Mathlib `QuaternionAlgebra`; the native trace, norm, unit and equivalence identities
in the supplier contracts.

### 0.2 Local ramification predicates

The rational local predicate is IsRamifiedAtPrime, with its primality instance explicit; over a
number field the finite-place predicate of the signatures is `IsRamifiedAt a b v`.

For a finite place `v` of `F` write `a_v = v.unitAtFinitePlace a : (F_v)ˣ`, and for a real place
`w` write `a_w = TauCeti.unitAtRealPlace w a : ℝˣ`. Define `IsRamifiedAt a b v` :⟺ `(a_v, b_v)_v = -1`
and IsRamifiedAtReal B w :⟺ (a_w, b_w)_ℝ = -1. Prove:

- `IsRamifiedAt a b v` ↔ ¬ Nonempty (ℍ[F_v, a_v, b_v] ≃ₐ[F_v] Matrix (Fin 2) (Fin 2) F_v), from
  `hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`, and `↔ ∀ x ≠ 0 in ℍ[F_v,a_v,b_v], IsUnit x`
  (`forall_isUnit_or_nonempty_algEquiv_matrix`);
- IsRamifiedAtReal B w ↔ a_w < 0 ∧ b_w < 0 (`hilbertSymbol_real`);
- both predicates are invariant under replacing `(a,b)` by `(b,a)`, by `(c²a, b)`, or by the
  parameters of an equivalent presentation (`hilbertSymbol_comm`, `hilbertSymbol_congr_sq`, and
  naturality of the splitting predicate under `AlgEquiv`);
- for an abstract quaternion algebra `D` with a presentation `e : D ≃ₐ[F] ℍ[F,a,b]`, the GL₂
  transfer roadmap's predicate *`D` is ramified exactly at `S`* holds exactly when `S` is the set of places at which
  `ℍ[F,a,b]` is ramified by these predicates. This is the only point of contact with that
  predicate, and it is a comparison, not a second definition.

*Needs:* 0.1; Tau Ceti `HilbertSymbol/{Basic,Archimedean}`, `QuadraticForm/Global/Localization`,
`SplittingCriterion`, `BaseChange`; GL₂ transfer R17.1.5 for the comparison clause.

Its API:

- The finite and real predicates agree with nonsplitting and are invariant under changes of symbol presentation.
- For an abstract quaternion algebra, a presentation transports these predicates to the supplier’s exact ramification predicate.

**Checks.**

- For Hamilton symbols over ℚ, the symbols at 2 and ∞ are −1 and at 3 are +1: precisely the first two predicates hold.
- For (1,7), every finite symbol and the real symbol is +1; the ramification predicates all fail.
- Replacing (3,−1) by (12,−1) leaves the symbols at 2,3,∞ equal to −1,−1,+1.

### 0.3 The ramification set is finite of even cardinality

Define `Ram_f B = {v | IsRamifiedAt a b v}` and `Ram_∞ B = {w real | IsRamifiedAtReal B w}`. Prove
the comparison `IsRamifiedAt a b v ↔ v ∈ finiteRamification a b` with ArithmeticFuchsianGroups
§1.2's set (the norm form of `ℍ[F_v, a_v, b_v]` is anisotropic iff every nonzero element is a unit,
`anisotropic_normForm_iff`, iff the local symbol is `−1`, 0.2), so that `Ram_f B` is that set; its
finiteness and the parity `#Ram_f B + #Ram_∞ B ≡ 0 (mod 2)` are ArithmeticFuchsianGroups §1.2's,
consumed. Prove the Hilbert-symbol description owned here: the explicit bound, a finite place at
which `2`, `a` and `b` are units is unramified (`hilbertSymbol_unitAtFinitePlace_eq_one`), so that
`Ram_f B` lies in the multiplicative support of the localized symbol
(`hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace a b` gives its finiteness a second time, at
the pin); and the parity read as the localized product formula of global quadratic forms 4.4,
`∏_v (a_v,b_v)_v = 1`, whose cohomological form is class field theory's `hilbertProductFormula`.
Prove the local invariant reading: `IsRamifiedAt a b v` ↔ finiteInvAt F v [B] = 1/2
and IsRamifiedAtReal B w ↔ infiniteInvAt F w [B] = 1/2, where `[B] ∈ Br F` is the class of
Tau Ceti's `quaternionClass a b` under the comparison `brauerGroupEquivBr`; Tau Ceti's
`TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` in
`NumberTheory/LocalField/Quaternion/Invariant.lean` supplies the nonarchimedean identification at the pin. *Needs:* 0.2; ArithmeticFuchsianGroups §1.2; Tau Ceti
`QuadraticForm/Global/HilbertSymbol`, `anisotropic_normForm_iff`; global quadratic forms 4.4; class field theory Layers 10, 14.

Its API:

- The finite ramification set is the supplier's `finiteRamification a b`, and it excludes the places where 2, a, b are units.
- The union with the real ramification set has even cardinality, and membership agrees with invariant 1/2.

**Checks.**

- Hamilton has one finite and one real ramified place: 1+1 = 2 is even.
- For (3,−1), the finite set is {2,3} and the real set is empty: 2+0 = 2.
- For (1,7), both sets are empty: 0+0 = 0; the support bound may include unramified primes.

### 0.4 The discriminant of `B`

For the rational acceptance statements, `ramificationBound` is the nonzero integer bound above and `discNat` is the finite product defining D.
Over a number field `disc B` is `discIdeal a b`, the `Finset` product of the `v.asIdeal` over the
ramified places inside the finite support of the localized Hilbert symbol
(`hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`).

Define `disc B = ∏_{v ∈ Ram_f B} v.asIdeal`, a product over the finite set of 0.3 (a `Finset`
product, never `∏ᶠ`), and prove: `disc B` is squarefree; `disc B = 1 ↔ Ram_f B = ∅`; `disc` is
invariant under `AlgEquiv`. Over `ℚ` define `D = ∏_{p ∈ Ram_f B} p ∈ ℕ`, prove it squarefree,
prove `p ∣ D ↔ (a,b)_{ℚ_p} = -1`, and prove `p ∣ D → p ∣ 2·num(a)·den(a)·num(b)·den(b)`, so that
`D` is a `Finset` product over the divisors of that integer. *Needs:* 0.3.

Its API:

- The discriminant is squarefree and equals the unit ideal exactly when the finite ramification set is empty.
- Over ℚ, its prime divisors are precisely the ramified primes and lie among the prime divisors of the nonzero ramification bound.

**Checks.**

- Hamilton gives D = 2; its ramification bound is 2.
- For (3,−1), D = 6 and the bound is 6; both primes 2 and 3 occur once.
- For (1,7), the bound is 14 but D = 1, excluding the mistaken definition as the radical of the bound.

### 0.5 Definite and indefinite

The rational predicate in the signatures is `IsDefinite`; over a number field it is
`IsTotallyDefinite a b`.

Define `IsTotallyDefinite a b` :⟺ IsTotallyReal F ∧ ∀ w real, IsRamifiedAtReal B w and
IsIndefinite B :⟺ ¬ `IsTotallyDefinite a b`. Prove: over `ℚ`, definite iff `a < 0 ∧ b < 0`, and
then `D` has an odd number of prime factors; indefinite iff `D` has an even number of prime
factors; if `F` has a complex place then every `B` is indefinite; `B` totally definite implies
`nrd` is positive definite at every real embedding and `B` is a division algebra. *Needs:*
0.2, 0.3; Mathlib `IsTotallyReal`.

Its API:

- Over ℚ, the real signs and the parity of the finite ramification set distinguish the two predicates.
- Total definiteness implies division and positive-definite real norm forms; a complex place excludes total definiteness.

**Checks.**

- Hamilton is definite with D = 2 and one finite ramified prime.
- For (3,−1), B is indefinite with D = 6 and two finite ramified primes.
- For the split algebra, D = 1 has zero prime factors and the norm represents −1; indefinite does not mean division.

### 0.6 Quadratic subfields

For a quadratic field extension K/F, prove that an F-algebra embedding K → B exists iff
no ramified place of B splits in K ([V, 14.6.7]). The local criterion uses the abstract
ramification classification through §0.2's comparison.
*Needs:* 0.2–0.5; GL2AutomorphicRepresentationsAndTransfer R17.1.5; GlobalNumberFields Layer 1.

### 0.7 Worked symbol algebras

Prove, as named examples: `ℍ[ℚ,-1,-1]` has `D = 2` and is definite; `ℍ[ℚ,-1,-3]` has `D = 3`;
`ℍ[ℚ,-2,-5]` has `D = 5`; `ℍ[ℚ,-1,-7]` has `D = 7`; `ℍ[ℚ,-1,-11]` has `D = 11`; `ℍ[ℚ,-1,-13]` has
`D = 2`, not `13`; `ℍ[ℚ,3,-1]` has `D = 6` and is indefinite; `ℍ[ℚ,-2,5]` has `D = 10`;
`ℍ[ℚ,-3,5]` has `D = 15`; `ℍ[ℚ,5,5]` and `ℍ[ℚ,1,7]` have `D = 1`. The dyadic values come from
quadratic form invariants 6C items 10 and 12 (`(−1,−1)_2 = -1`, `(2,5)_2 = -1`, `(5,5)_2 = 1`,
`(3,−1)_2 = -1`) and the odd ones from item 9. *Needs:* 0.4, 0.5; QFI 6C.

### Examples

Hamilton symbols give D = 2; the split symbol (1,7) gives D = 1; (3,−1) gives D = 6.

### Dependencies

Pinned quaternion/Hilbert-symbol theory; ArithmeticFuchsianGroups §1.2; QuadraticFormInvariants Layer 6C, GlobalQuadraticForms §4.4 and GL2AutomorphicRepresentationsAndTransfer R17.1.5.

## Layer 1: lattices and orders

`R` is a Dedekind domain with fraction field `F` of characteristic `0`, and `B = ℍ[F,a,b]`.

### 1.1 Lattices, left and right orders

The acceptance bundle `QuatOrder` carries the native subalgebra and lattice property; `QuatOrder.toSubmodule` is its underlying module. The predicates `leftOrderSubalgebra` and `rightOrderSubalgebra` express the two multiplier orders on native subalgebras. The lattice property is Tau Ceti's `TauCeti.IntegralOrder.IsOrder`, maximality in the inclusion order of the bundle is `TauCeti.IntegralOrder.IsMaximalOrder`, and `leftOrderSubalgebra I` has the carrier of `Submodule.leftOrder I`, all at Tau Ceti `2fd255d` (supplier contracts).

Using the generic lattice-order and multiplier-order carriers in the supplier contracts, prove
the quaternion-specific comparison O_L(star I) = star O_R(I) and its right-handed version
(`[V, 16.6.7]`, p. 261), with conjugation acting by α on the left order of αI, O_L(αI) =
αO_L(I)α⁻¹ for α ∈ Bˣ (`[V, Exercise 10.14(b)]`, p. 158, is the case I = O). Prove
that `R⟨i,j⟩ = R ⊕ Ri ⊕ Rj ⊕ Rk` is an order when `a, b ∈ R` (`[V, 10.2.4]`), that its elements have trd α, nrd α ∈ R (`[V, 10.3.3, 10.3.6]`); conversely a spanning subring all of whose elements
have `trd, nrd ∈ R` is an order (`[V, 10.3.7]`). Orders are stable under `star`
(`star α = trd α − α`). *Needs:* 0.1; Mathlib `Submodule.IsLattice`; CAC 7.4, 7.20.

Its API:

- The order bundle exposes membership, inclusion and its full lattice; its elements have integral trace and norm.
- Conjugation exchanges left and right multiplier orders, and multiplication by an invertible element transports them.

**Checks.**

- (boundary) For an order `O`, `O_L(O) = O_R(O) = O`: `α ∈ O_L(O)` gives `α = α·1 ∈ O`, and
  `O·O ⊆ O` gives the converse.
- (reject) The zero submodule is not a lattice, and its left order is all of `B`, which is not an
  order: the lattice hypothesis cannot be dropped.
- (comparison) For every `R`-submodule `I` the left multiplier set `O_L(I)` is an `R`-subalgebra of
  `B`, with no lattice hypothesis; the generic multiplier-order contract supplies its lattice
  property when `I` is a lattice, and for `I = 0` it is all of `B`.

### 1.2 Unit groups

The signature definitions `units` and `normOne` realize these two groups as subgroups of Bˣ;
`units O` is Mathlib's `Submonoid.units` of the order, not a new construction.

Define `O^×` (the units of the subalgebra, Mathlib's `Submonoid.units`) and `O¹ = {γ ∈ O^× : nrd γ = 1}`, a subgroup of `Bˣ`
(closure under products is `normForm_mul`, inverses are `star`); `O¹` is ArithmeticFuchsianGroups
§1.1's norm-one group `O ∩ B¹` (`B¹` Mathlib's `unitary`), realized here as a subgroup of `Bˣ`. Prove
that `γ ∈ O` is a unit of `O` iff `nrd γ ∈ R^×` (`[V, Exercise 10.15]`, p. 158), so `nrd(O^×) ⊆ R^×`, that
`O¹ ⊴ O^×` with `O^×/O¹ ↪ R^×`, and that for `R = ℤ`, `O^×/O¹` has order `1` or `2` according
as `O` has no unit of norm `−1` or has one. *Needs:* 1.1; ArithmeticFuchsianGroups §1.1 for the comparison.

Its API:

- Reduced norm maps Oˣ to Rˣ, with kernel O¹ and an injective induced map Oˣ/O¹ → Rˣ.
- Over ℤ the quotient has order two exactly when a unit of norm −1 exists; otherwise it is trivial.

**Checks.**

- For the Hurwitz order, all 24 units have norm 1, so Oˣ/O¹ has size 1.
- In O₆ the element 1+i+j has norm −1, with inverse −1+i+j; Oˣ/O¹ has size 2.
- The scalar 2 has norm 4 and inverse 1/2 in B, but 1/2 is not in an integral order: neither unit subgroup contains 2.

### 1.3 Discriminants

Define the trace discriminant, determinant reduced discriminant and cubic ideal as in Conventions and prove: all three are fractional ideals (finitely
generated, nonzero, `[V, 15.2.14]`); `disc I = [J : I]_R² disc J` for lattices `I ⊆ J`, where
`[J : I]_R` is the module index, so `I ⊆ J` with `disc I = disc J` forces `I = J`
(`[V, 15.2.15]`); `disc` is invariant under `AlgEquiv` (`[V, 15.2.9]`); `disc R⟨i,j⟩ = (4ab)²·R`
and `discrd R⟨i,j⟩ = 4ab·R` (`[V, 15.2.10]`); `disc M₂(R) = R`. *Needs:* 1.1.

Its API:

- The trace discriminant, determinant reduced discriminant and cubic ideal are nonzero fractional ideals.
- The trace discriminant transforms by the square of the lattice index and is invariant under algebra isomorphism.

**Checks.**

- The Lipschitz trace Gram determinant is −16, giving trace ideal (16), reduced ideal (4), cubic ideal (4).
- For 2L these three ideals are (4096), (64), (32), so the cubic ideal cannot replace the reduced ideal for arbitrary lattices.
- M₂(ℤ) has trace determinant −1 and all three ideals equal (1); the unit ideal is a valid discriminant.

### 1.4 Trace dual and codifferent

The signature definitions are `traceDual` and its specialization `codiff`.

Define `I^♯ = {α : trd(αI) ⊆ R}` and prove it is a lattice with `(I^♯)^♯ = I`, `(βI)^♯ = I^♯β^{-1}`,
`O_L(I^♯) = O_R(I)`, and `I^♯ ≅ Hom_R(I, R)` by `β ↦ (α ↦ trd(αβ))` (`[V, 15.6.4–15.6.7]`). Define
`codiff O = O^♯`, prove `O ⊆ codiff O`, `O_L(codiff O) = O_R(codiff O) = O`, and
`disc O = [codiff O : O]_R` (`[V, 15.6.16–15.6.17]`). Over `ℤ`: `disc O = #(O^♯/O)`.
*Needs:* 1.1, 1.3.

Its API:

- Trace duality is an involution on full lattices and identifies the dual with Hom_R(I,R).
- For β ∈ Bˣ it sends βI to I♯β⁻¹ and exchanges the two multiplier orders.
- The codifferent contains O, has both multiplier orders O, and its index over O equals the trace discriminant.

**Checks.**

- For Lipschitz L, the trace Gram matrix diag(2,−2,−2,−2) gives L♯ = (1/2)L and codiff(L) = (1/2)L; the quotient has 16 elements.
- For M₂(ℤ), E₁₂ and E₂₁ are trace-dual to each other, so its trace dual and codifferent both equal M₂(ℤ); the quotient has 1 element.
- For 2L, the trace dual is (1/4)L, and dualizing again gives 2L; scaling the dual in the same direction would incorrectly give L.

### 1.5 Reduced discriminant

In the acceptance statements `discrd` takes an order, and `discrdNat` is its positive integer generator over ℤ.

For a lattice I define its determinant ideal by the fourth exterior power in the symbol basis,
and its scalar ideal as the inverse image of I under F → B. Prove that the determinant reduced
discriminant δ(I) is independent of the presentation, that disc(I) = δ(I)², and that
δ(I) = [J : I] δ(J) for I ⊆ J. The alternating cubic form descends to B/F, so the exact sequence
0 → I ∩ F → I → image(I → B/F) → 0 gives δ(I) = (I ∩ F)cubic(I).
For an order O, integrality and integral closedness of R give O ∩ F = R; hence
its reduced discriminant is cubic(O), with disc(O) = discrd(O)² and the index law for orders.
These statements use the determinant transformation law and the alternating form
([V, 15.2.6, 15.2.15, 15.4.2–15.4.7], pp. 234–239); the cubic formula alone does not give
index multiplicativity for arbitrary lattices. Over ℤ take the positive generator.
*Needs:* 1.3, 1.4; exterior powers of finite projective modules.

Its API:

- The determinant ideal transforms by the lattice index; the scalar ideal corrects the cubic ideal for arbitrary lattices.
- For orders, the scalar ideal is R and the reduced discriminant squares to the trace discriminant.
- Over ℤ the positive generator is invariant under algebra isomorphism and obeys the same index law.

**Checks.**

- For the Lipschitz order L, the trace determinant is −16, cubic(L) = (4), and δ(L) = (4).
- For 2L, the determinant is −4096, cubic(2L) = (32), the scalar ideal is (2), and δ(2L) = (64); 64² = 4096 whereas 32² = 1024.
- For L inside the Hurwitz order H, [H : L] = 2 and 4 = 2·2. In Mathlib this index is the relative index of L's additive subgroup in H's, never the reverse.
- Over a field R = F, all three nonzero fractional ideals equal F; the zero submodule is excluded by the lattice hypothesis.

### 1.6 Local structure at split and division places

At the finite places `v` of a number field the local structure of maximal orders is
ArithmeticFuchsianGroups §§1.1–1.2, consumed: in `M₂(F_v)` the maximal orders are the `End_{R_v}(L)`
of lattices `L ⊆ F_v²`, so all are conjugate to `M₂(R_v)`, and when `B_v` is division its valuation
ring `{x : nrd(x) ∈ R_v}` is the unique maximal order, with normalizer `B_v^×`. What is proved here
is the supplement over a general discrete valuation ring and the discriminant data. For a DVR `R`
with fraction field `F` and `B = M₂(F)`, an order is maximal iff its trace discriminant is `R`
(`[V, 15.5.3]`), and the maximal orders are the conjugates of `M₂(R)` (`[V, 10.5.5]`, for `R` a
principal ideal domain). For a complete DVR `R`, whose residue field need not be finite,
and `B` division, the unique extension of the valuation gives the unique maximal order
`O = {x : nrd(x) ∈ R}`, `N_{B^×}(O) = B^×`, and `B^×/(F^×O^×)` is the quotient of the value groups,
cyclic of order the ramification index `e(B/F) ∈ {1, 2}` (`[V, §13.3]`, pp. 197–201); `e = 1`
occurs (the Check below), so the supplier's statement at a local field is the case `e = 2`. When
the residue field is finite, `F` is a nonarchimedean local field: `e(B/F) = 2`, `discrd(O) = 𝔭`,
and a division uniformizer generates the quotient of order two (`[V, 13.3.11, 15.5.4, 23.3.14]`).
*Needs:* 1.3; ArithmeticFuchsianGroups §§1.1–1.2; classical arithmetic completion §§7.21, 7.56;
completed NFA Layer 5.

**Checks.**

- M₂(R) has trace determinant −1 and reduced discriminant R, including residue characteristic two.
- For Hamilton(ℝ)((t)), O = Hamilton(ℝ)[[t]] has trace determinant −16, a unit; e = 1 and the normalizer quotient has one element.
- For the quaternion division algebra over ℚ₂, the maximal ideal P has P² = 2O; e = 2, discrd(O) = (2), and the normalizer quotient has two elements.

### 1.7 The maximality criterion

The acceptance theorem `isMax_iff_discrd_eq_discIdeal` states the criterion over `𝓞 F`, comparing
the integral ideal `discrd O` of `𝓞 F` with `discIdeal a b` (0.4); its integer form over `ℤ`, in the
generators `discrd O` and `D` that the level of 1.9 uses, is `isMax_iff_discrdNat_eq`.

For `R = 𝓞 F`: `O` is maximal iff `discrd O = disc B` (`[V, 15.5.5]`, p. 241). Corollaries: maximal orders
form one genus; two maximal orders have the same reduced discriminant; the maximal orders of the
examples of 0.7: the Hurwitz order `ℤ⟨i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,-1,-1]` (construct the displayed lattice as an order and prove maximality by its discriminant) and, for `ℍ[ℚ,3,-1]`,
`O = ℤ⟨1, i, j, (1+i+j+k)/2⟩` with `discrd O = 6`. The Lipschitz order `ℤ⟨i,j⟩ ⊂ ℍ[ℚ,-1,-1]` has
`discrd = 4` and is not maximal. *Needs:* 0.4, 1.5, 1.6.

**Checks.**

- The Lipschitz order `ℤ⟨i,j⟩ = ℤ ⊕ ℤi ⊕ ℤj ⊕ ℤk ⊂ ℍ[ℚ,-1,-1]` has `discrd = 4 ≠ 2 = D` and is
  not maximal: it lies in the Hurwitz order.
- The Hurwitz order `ℤ⟨i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,-1,-1]` has `discrd = 2 = D` and is maximal.
- `O_6 = ℤ⟨1, i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,3,-1]` has `discrd = 6 = D` and is maximal.
- (reject) `ℤ + 2O_6`, with basis `1, 2i, 2j, 1+i+j+k`, has `discrd = 48 = 2³·6` and is not
  maximal, as 1.10's `discrd(ℤ + fO) = f³ discrd O` predicts.

### 1.8 Eichler orders

The predicate `IsEichler` records precisely this intersection property.

Define Eichler orders as pinned. The local form is Hilbert modular varieties §R18.5.16a item 1,
consumed: over a DVR with `B = M₂(F)`, `O` is Eichler iff it is conjugate to the standard order
`O_0(𝔭^e) = [[R, R],[𝔭^e, R]]` for a unique `e ≥ 0`, iff it contains a conjugate of the diagonal
`R × R`; the standard order has `discrd = 𝔭^e` and is the intersection of the two maximal orders
`M₂(R)` and `[[R,𝔭^{-e}],[𝔭^e,R]]` and of no other pair (`[V, 23.4.2–23.4.3]`). Over a number field, being
Eichler is local by item 2 of the same section. Prove here: being Eichler is local over every
Dedekind domain `R` of this layer (`[V, 23.4.2]`); for `e ≥ 1`,
`N_{B^×}(O_0(𝔭^e))/(F^×O^×) ≅ ℤ/2` generated by `[[0,1],[ϖ^e,0]]` (`[V, 23.4.14]`); every
superorder of an Eichler order is Eichler (`[V, 23.4.10]`); hereditary orders are Eichler; an
order is hereditary iff `discrd O` is squarefree (`[V, 23.3.18]`). *Needs:* 1.6, 1.7;
HilbertModularVarietiesAndShimuraCurves §R18.5.16a.

Its API:

- Eichler membership is local and is preserved on passing to a superorder.
- At a split DVR, the level exponent classifies conjugacy classes; positive exponent gives the displayed normalizer generator.
- The hereditary criterion is squarefreeness of the reduced discriminant in the number-field setting.

**Checks.**

- M₂(ℤ₂) is the intersection with itself: exponent 0, reduced discriminant (1), trivial local normalizer quotient.
- O₀(2) is the intersection at distance 1: exponent 1, reduced discriminant (2), normalizer quotient of order 2.
- O₀(4) has exponent 2 and reduced discriminant (4); it is Eichler but not hereditary, distinguishing squarefree discriminant from arbitrary level.

### 1.9 Level, and the genus of an Eichler order

The signature definition `level` is discrdNat(O)/D; D is positive and divides discrdNat(O) for Eichler orders. The arithmetic function `psi` is used only at positive levels.

For `R = 𝓞 F` and `O` Eichler, the local–global form, the level and the local unit indices are
Hilbert modular varieties §R18.5.16a items 2–4, consumed: at `𝔭 | disc B`, `O_𝔭` is the unique
maximal order; at `𝔭 ∤ disc B`, `O_𝔭 ≅ O_0(𝔭^e)` with `e = ord_𝔭 discrd O`; `discrd O = disc B · 𝔐`
with the **level** `𝔐` coprime to `disc B`; and `[GL₂(R_𝔭) : O_0(𝔭^e)^×] = N𝔭^{e-1}(N𝔭 + 1)` for
`e ≥ 1`, so that for a maximal `O(1) ⊇ O` the local indices `[O(1)_𝔭^× : O_𝔭^×]`, `𝔭 | 𝔐`,
multiply to `ψ(𝔐) = N𝔐 ∏_{𝔭|𝔐}(1 + 1/N𝔭)`; these are local indices, and in a definite algebra
the global index `[O(1)^× : O^×]` can be smaller (Off-hypothesis checks). Prove here: the pair `(disc B, 𝔐)` determines the genus of `O`
(`[V, 23.4.19]`); over `ℚ`, `discrd O = DN` with `gcd(D,N) = 1`; the local indices of the norm-one
groups equal the local unit indices, `[O(1)_𝔭¹ : O_𝔭¹] = [O(1)_𝔭^× : O_𝔭^×]`, so their product is
again `ψ(𝔐)`, by the norm-maximality below. Prove that every Eichler order is locally norm-maximal:
`nrd(O_𝔭^×) = R_𝔭^×` for all `𝔭` (`[V, 28.5.16]`) — at the `𝔭` where `O_𝔭` is maximal this is
classical arithmetic completion 7.60, consumed, and what is proved here is the case `𝔭 | 𝔐`,
`O_𝔭 ≅ O_0(𝔭^e)` with `e ≥ 1`. *Needs:* 1.6–1.8; HilbertModularVarietiesAndShimuraCurves
§R18.5.16a; CAC 7.60.

Its API:

- The level is coprime to the algebra discriminant and determines the genus of an Eichler order.
- The local unit and norm-one indices are ψ of the local level, and every Eichler order is locally norm-maximal.

**Checks.**

- For a maximal order the level is 1 and ψ(1) = 1.
- At local level 2², ψ(4) = 2·3 = 6, agreeing with the index in the maximal local norm-one group.
- ψ(0) = 1 as the empty product over the prime factors of 0; zero is not a congruence modulus and no finite-index theorem uses it.

### 1.10 Orders over `ℤ`: bases and the index

For R = ℤ, prove that an order has a ℤ-basis beginning with 1. Indeed O ∩ ℚ = ℤ by
integrality and integral closedness; if nx ∈ ℤ for n ≠ 0 and x ∈ O, then x ∈ ℚ ∩ O = ℤ.
Thus O/ℤ is torsion-free of rank three and free, and a basis lifts to a basis of O with first
vector 1 ([V, 10.3.2–3], p. 154, and the finite torsion-free module theorem over ℤ).
Then `disc O = |det(trd(x_i x_j))|`; for `O' ⊆ O`, `discrd O' = [O : O']·discrd O`;
for f ≥ 1, `ℤ + fO` has `discrd = f³ discrd O` ([V, 15.2.2, 15.2.15, 15.4.7],
pp. 234, 237, 239). The mathematical order-discriminant datum is the positive square root
of the absolute trace determinant; its database correspondence is the `discO` row of §10.2.
*Needs:* 1.3–1.5.

**Checks.**

- For O₆ the basis in §1.7 has trace determinant −36 and reduced discriminant 6.
- The basis 1,2i,2j,1+i+j+k of ℤ+2O₆ has index 8 in O₆, trace determinant −2304,
  and reduced discriminant 48 = 8·6.
- At f = 1 the index is 1 and the reduced discriminant stays 6; f = 0 gives the rank-one
  module ℤ, not an order, so the positive-index formula does not apply.

### 1.11 Eichler orders of level `𝔭^e` and vertices at distance `e`

For `R` the valuation ring of a nonarchimedean local field `F` with uniformizer `ϖ`, the
order-to-tree adapter is ArithmeticFuchsianGroups §1.2, consumed: `[L] ↦ End_R(L)` is a bijection
from the vertices of the lattice tree of ReductiveGroupsPartII RG2.2.4, “sl2-tree”, to the maximal
orders of `M₂(F)`, equivariant for the `GL₂(F)` action and conjugation; adjacent vertices meet in
an Eichler order of level `𝔭`; the stabilizer of `L` is `End_R(L)^×`, the stabilizer of `[L]` is
the normalizer `F^×End_R(L)^×`, and the setwise stabilizer of an edge is the normalizer of its
Eichler order (`[V, 23.5.2, 23.5.5]`, pp. 376–377, are the source statements). That every
Eichler order of level `𝔭^e` is the intersection of the maximal orders of exactly one unordered
pair of vertices, the ends of a path of length `e`, is Hilbert modular varieties §R18.5.16a
item 1, consumed. Prove here the converse and the path: two vertices at distance `e` have
intersection an Eichler order of level `𝔭^e`; the vertices whose maximal order contains that
order are exactly the vertices of the path between them; and the maximal orders of the path's
vertices cut out, with a fixed endpoint, its superorders of levels `𝔭^{e−1}, …, 𝔭, 1`
(`[V, 23.5.15]`, p. 379).

Its API:

- Distance `e` and level `𝔭^e` determine each other; the two endpoints are the two maximal orders
  of 1.8's intersection, and reversing the pair gives the same order.
- Distance zero gives a maximal order, and distance one gives local level `𝔭`, in agreement with
  the supplier's adjacency statement.

*Needs:* 1.6, 1.8, 1.9; ArithmeticFuchsianGroups §1.2; HilbertModularVarietiesAndShimuraCurves
§R18.5.16a; ReductiveGroupsPartII RG2.2.4, “sl2-tree”.

**Checks.**

- The vertices of `R²` and `R ⊕ ϖ²R` have distance two and intersect in `O₀(𝔭²)`, of reduced
  discriminant `𝔭²`; the intermediate vertex `R ⊕ ϖR` gives the superorder `O₀(𝔭)` of level `𝔭`.
- Distance `e = 0` gives a maximal order and level `1`; distance `e = 2` gives level `𝔭²`, not `𝔭³`:
  the level counts the edges of the path, not its vertices.
- (reject) The vertices `R ⊕ ϖR` and `ϖR ⊕ R` are both adjacent to `R²` and have distance two
  from each other; their intersection `[[R, 𝔭],[𝔭, R]]` is conjugate to `O₀(𝔭²)` by `diag(1, ϖ)`
  and has level `𝔭²`: the level is the distance between the endpoints, not the distance to a
  reference vertex.

### 1.12 Products of lattices, principal and invertible lattices

The signature predicate `IsInvertible` records both inverse-product equalities and both lattice conditions.

For lattices `I, J ⊆ B` define the product `IJ` (the `R`-span of the products, Mathlib's
`Submodule.mul`), **compatible** (`O_R(I) = O_L(J)`), **principal** (`I = O_L(I)α = αO_R(I)` for
some `α ∈ B^×`), **locally principal** (`I_𝔭` principal for every `𝔭`), and **invertible**: there
is a lattice `I'` with `II' = O_L(I)` and `I'I = O_R(I)` (`[V, 16.2.1, 16.2.4–16.2.5, 16.5.1]`). Define
`nrd(I)` (in the signatures `latticeNrd I`) as the `R`-submodule of `F` generated by
`{nrd α : α ∈ I}` (`[V, 16.3.1]`, p. 253). Prove `IJ` is a lattice
with `O_L(IJ) ⊇ O_L(I)`, `O_R(IJ) ⊇ O_R(J)`, that a principal lattice is invertible with
`I' = α^{-1}O_L(I)`, and that invertibility is invariant under `AlgEquiv` and under `I ↦ star I`.
Right fractional O-ideals are lattices I with IO ⊆ I; proper means O_R(I) = O.
In the class, type, norm-index and Brandt constructions, “invertible right O-ideal” means
a proper invertible lattice, equivalently locally free of rank one over O; integral means I ⊆ O. *Needs:* 1.1, 1.4.

Its API:

- Products of full lattices are full lattices; their left and right orders contain the outer multiplier orders.
- A principal lattice has the stated two-sided inverse; invertibility is preserved by conjugation and algebra isomorphism.
- Compatibility requires equality of the middle multiplier orders, and the norm module is generated by the norms of lattice elements.

**Checks.**

- For I = 2O, the inverse is (1/2)O and both inverse products are O; nrd(I) = (4).
- For I = 2O and J = 3O, compatibility holds, IJ = 6O and nrd(IJ) = (36) = (4)(9).
- The zero submodule has product zero with every module and norm module zero; it is not a full or invertible lattice.

### 1.13 The Hurwitz order

Let `B = ℍ[ℚ,-1,-1]`, `ω = (−1+i+j+k)/2` and `O_H = ℤ + ℤi + ℤj + ℤω = ℤ⟨i, j, (1+i+j+k)/2⟩`,
the Hurwitz order of 1.7. Prove:

- **Order and maximality.** `O_H` is an order containing the Lipschitz order `ℤ⟨i,j⟩` with index
  `2`, and it is the unique order properly containing `ℤ⟨i,j⟩` (`[V, 11.1.2]`). Route: an element
  `t + xi + yj + zk` of an order containing `ℤ⟨i,j⟩` has `2t, 2x, 2y, 2z ∈ ℤ` by integrality of
  `trd(α)`, `trd(αi)`, `trd(αj)`, `trd(αk)` (1.1), and `t² + x² + y² + z² ∈ ℤ` forces the four
  coordinates to lie all in `ℤ` or all in `½ + ℤ`. Maximality follows, and agrees with 1.7's
  criterion `discrd O_H = 2 = D` (0.7).
- **Units.** `O_H^× = O_H¹` (`nrd` is positive on the definite `B` and `nrd(O_H^×) ⊆ ℤ^×` by 1.2),
  and `O_H^× = {±1, ±i, ±j, ±k} ∪ {(±1 ± i ± j ± k)/2}` has order `24`: the solutions of
  `t² + x² + y² + z² = 1` with all coordinates in `ℤ` or all in `½ + ℤ`. Reduction modulo `3`,
  `O_H/3O_H ≃ M₂(𝔽₃)` by `i ↦ [[0,−1],[1,0]]`, `j ↦ [[1,1],[1,−1]]`, maps `O_H^×` into `SL₂(𝔽₃)`;
  it is injective because `γ ≡ 1 mod 3O_H` forces `9 ∣ nrd(γ − 1) = 2 − trd γ ∈ {0, 1, 2, 3, 4}`,
  so `γ = 1`. Hence `O_H^× ≃ SL₂(𝔽₃)` (`[V, 11.2.1]`), with `1 → {±1} → O_H^× → A₄ → 1`
  (`[V, (11.2.3)]`).
- **Euclidean property and principal ideals.** For every `γ ∈ B` there is `μ ∈ O_H` with
  `nrd(γ − μ) ≤ 1/2`: translating by `ℤ⁴ ⊂ O_H` puts the four coordinates `x_ι` of `γ` in
  `[−1/2, 1/2]`, and the reduced norms of the differences from `0` and from the point
  `(±1 ± i ± j ± k)/2` whose signs match those of the `x_ι` add up to
  `∑ (x_ι² + (1/2 − |x_ι|)²) ≤ 4 · 1/4 = 1`. Hence `O_H` is right norm-Euclidean (`[V, 11.3.1–11.3.2]`):
  for `α, β ∈ O_H` with `β ≠ 0` there are `μ, ρ ∈ O_H` with `α = βμ + ρ` and `nrd ρ < nrd β`.
  Every right ideal `I ⊆ O_H` is principal, `I = βO_H` for an element `β ∈ I` of least nonzero
  reduced norm (`[V, 11.3.4]`), and every maximal order of `B` is `α⁻¹O_Hα` for some `α ∈ B^×`
  (`[V, 11.3.7]`).

*Needs:* 0.7, 1.1, 1.2, 1.7, 1.12.

**Checks.**

- `#O_H^× = 8 + 16 = 24 = #SL₂(𝔽₃)`; `−1` is the only element of order `2`, and the unit traces are
  `−2, −1, 0, 1, 2`.
- (bound attained) `γ = (1+i)/2` has distance `1/2` from `O_H`: its distances to `0`, `1`, `i`,
  `1+i` and to the nearest half-integral points are all `1/2`.
- (reject) In the Lipschitz order `ℤ⟨i,j⟩` the right ideal `2O_H = 2ℤ⟨i,j⟩ + (1+i+j+k)ℤ⟨i,j⟩` is
  not principal (`[V, 11.3.8]`): a generator would have reduced norm `4` and would give
  `2O_H = 2ℤ⟨i,j⟩`. The Euclidean property needs the half-integral points.

### Examples

Lipschitz and Hurwitz have reduced discriminants 4 and 2; O₆ has 6. Distance-two lattice vertices yield level 𝔭².

### Dependencies

Layer 0; the generic orders of ClassicalArithmeticCompletion §§7.4, 7.20, 7.21, 7.56; ArithmeticFuchsianGroups §§1.1–1.2; HilbertModularVarietiesAndShimuraCurves §R18.5.16a (Eichler orders in 1.8, 1.9, 1.11); ReductiveGroupsPartII RG2.2.4, “sl2-tree”; elementary divisors over a DVR.

## Layer 2: Gorenstein and Bass orders, the ternary form, the Eichler symbol

### 2.1 The even Clifford correspondence

For a nondegenerate ternary quadratic module `Q : M → 𝔩` over `R` (a quadratic form on a rank-`3`
lattice with values in a fractional ideal), the even Clifford algebra `Clf⁰(Q)` is an `R`-order in
the quaternion algebra `Clf⁰(Q_F)` (`[V, 22.3.22]`); `Q ↦ Clf⁰(Q)` is a discriminant-preserving
bijection from nondegenerate ternary quadratic modules up to twisted similarity to quaternion
orders up to isomorphism (`[V, 22.5.7]`; over a PID, forms up to similarity, `[V, 22.4.1]`). The
inverse sends `O` with `discrd O = (N)` to `N·nrd^♯` on the trace-zero part of `O^♯`
(`[V, 22.4.12]`), and `O = R + discrd(O)·(O^♯)⁰(O^♯)⁰` (`[V, 22.4.15]`). The LMFDB's
`ShimuraCurveLattice`, the trace-zero sublattice `O⁰` of an Eichler order with the form `nrd`, is
not this form (`[V, 22.4.19]`): the correspondence preserves discriminants, while `(O⁰, nrd)` has
discriminant `(discrd O)²` (Hurwitz order: `(O⁰, nrd) = ⟨1,1,1⟩` of discriminant `4`, and the
Clifford form `2·nrd^♯` on `(O^♯)⁰` is `(x·x)/2` on the `A₃` lattice, of discriminant `2`). Prove, for Eichler O,
`disc(O⁰, nrd) = (discrd O)²`, and that the Clifford form determines `(O⁰, nrd)` through
`O = R + discrd(O)·(O^♯)⁰(O^♯)⁰`. The genus of `O` corresponds to the genus of `Q` with
`Cl Q ↔ Typ O` (`[V, 22.5.12]`). *Needs:* 1.3–1.5;
quadratic form invariants Layer 2 for the trace-zero form; Mathlib `CliffordAlgebra`, `evenOdd`.

Its API:

- The even Clifford construction and the codifferent construction are inverse on the stated isomorphism classes.
- Twisted similarity preserves the order discriminant and transports genera; the Eichler trace-zero norm has discriminant equal to its square.

**Checks.**

- For the Hurwitz order, the trace-zero form is x²+y²+z² with ternary discriminant 4, while its Clifford form has discriminant 2.
- For M₂(ℤ), the trace-zero norm is −x²−yz, with discriminant 1, equal to the square of the reduced discriminant.
- The Lipschitz order has the same trace-zero form as the Hurwitz order but reduced discriminant 4: 4 ≠ 4². It is not Eichler, so the trace-zero discriminant identity requires that hypothesis.

### 2.2 Gorenstein orders

The signature predicate is `IsGorenstein`.

`O` is **Gorenstein** when `codiff O` is invertible (`[V, 24.2.1]`). Prove it is local, and
equivalent to: every sated (`O_L(I) = O`) left or right fractional `O`-ideal is invertible
(`[V, 24.2.3]`); `nrd(codiff O)·discrd O = R` (`[V, 24.2.5]`, with `⊆` always); the ternary form
of 2.1 is primitive (`[V, 24.2.10]`). Maximal and Eichler orders are Gorenstein. *Needs:*
1.4, 1.12, 2.1.

Its API:

- The Gorenstein condition is local and equivalent to the invertibility, norm and primitivity criteria above.
- Maximal and Eichler orders satisfy it, while a nonprimitive corresponding ternary form excludes it.

**Checks.**

- For M₂(ℤ), the codifferent is O and its norm ideal is (1), so the Gorenstein norm product is (1).
- For Lipschitz L, codiff(L) = (1/2)L has norm ideal (1/4); multiplying by discrd(L) = (4) gives (1).
- For ℤ+2O₆ the conductor product is (2), not (1); it is not Gorenstein.

### 2.3 Gorenstein saturation and conductor

The acceptance theorem is `existsUnique_gorenstein_saturation`, over every characteristic-zero
Dedekind fraction field. There is a unique nonzero ideal `𝔣(O) ⊆ R` and Gorenstein order `Gor(O)` with `O = R + 𝔣(O)·Gor(O)`, and
`𝔣(O) = discrd(O)·nrd(O^♯)` (`[V, 24.2.15]`); `O ≅ O'` iff `Gor O ≅ Gor O'` and `𝔣(O) = 𝔣(O')`
(`[V, 24.2.22]`). Over `ℤ` write `O = ℤ + f(O)Gor(O)` with `f(O) ∈ ℕ`, f(O) > 0 (`[V, 24.1.4]`). Example:
`ℤ + 2O_6` for the maximal order `O_6` of discriminant `6` has `f = 2`, `discrd = 48`, and is not
Gorenstein. *Needs:* 2.2.

Its API:

- The conductor is nonzero and the conductor-saturation pair is unique.
- Isomorphisms preserve the conductor and transport the saturation; together they determine the isomorphism class.

**Checks.**

- `ℤ + 2O_6`: `f = 2`, `Gor = O_6`, `discrd = 48`, not Gorenstein.
- (boundary) A Gorenstein order has `𝔣(O) = R` and `Gor(O) = O`, since `nrd(codiff O)·discrd O = R`
  (2.2); so `f(O_6) = 1` and the Lipschitz order (Gorenstein by 2.7) has `f = 1`.
- (reject) `ℤ + 2O_6` and `O_6` have the same Gorenstein saturation and different conductors, so
  they are not isomorphic (`[V, 24.2.22]`).

### 2.4 The Eichler symbol and local unit counts

For a complete DVR R, define the Eichler symbol from O/rad(O) as in Conventions
([V, 24.3.1–2], pp. 388–389), and define its global version by completion at a nonzero prime
([V, 24.3.13], p. 391). For the numerical formulas assume k = R/𝔭 is finite and put q = #k.
Define λ(O,𝔭) by the three rational expressions in Conventions in the non-∗ cases.

Its API:

- The symbol is invariant under order isomorphism; O is Eichler iff it is maximal or
  residually split ([V, 24.3.6], p. 389).
- Reduction identifies Oˣ/(1+𝔭O) with (O/𝔭O)ˣ. If k is finite, its cardinality in the
  ∗, 1, −1, 0 cases is respectively q(q−1)²(q+1), q²(q−1)², q²(q²−1), q³(q−1).
- The map (O/𝔭O)ˣ → (O/rad O)ˣ is onto, with kernel of cardinality
  q^(4−dim_k(O/rad O)) when k is finite ([V, 24.3.12], pp. 390–391).
- For finite k, λ is invariant under isomorphism and positive: q ≥ 2 excludes every
  zero denominator ([V, 25.3.19], p. 411).

**Checks.**

- For q = 2 the four unit counts are 6, 4, 12, 8; λ in the 1, −1, 0 cases is 3/2, 1/2, 3/4: the Lipschitz order at 2 has symbol 0 and λ = 3/4, so that 5.4 gives the unit index [H₂ˣ : L₂ˣ] = 2·(3/4)·2 = 3 = 12/4.
- For q = 3 the counts are 48, 36, 72, 54; the corresponding λ values are 4/3, 2/3, 8/9; a ramified maximal order has symbol −1 and λ = 2/3, which makes 5.2's (N/12)∏λ equal φ(3)/12 = 1/6 for D = 3.
- M₂(ℝ[[t]]) has symbol ∗, but reduction gives GL₂(ℝ), an infinite group: it has no
  numerical q or λ factor. Its residue-algebra and order theory remain in scope.

*Needs:* 1.6, 1.8, 2.2.

### 2.5 Bass orders

The predicate `IsBass` quantifies over every superorder; `IsEichler.isBass` is the acceptance theorem in characteristic zero.

`O` is **Bass** when every superorder is Gorenstein (`[V, 24.5.1]`). Prove: local; Eichler orders
are Bass; over a complete DVR, Bass iff every `O`-ideal is generated by two elements iff every
`O`-lattice is a direct sum of ideals (`[V, 24.5.3]`); residually inert orders are Bass
(`[V, 24.5.4]`); the radical idealizer `O^♮ = O_L(rad O) ∩ O_R(rad O)` of a non-maximal residually
inert order is its unique minimal superorder, with `[O^♮ : O]_R = 𝔭²` (`[V, 24.4.7]`).
*Needs:* 2.2–2.4.

Its API:

- The Bass condition is local and quantifies over all superorders.
- Over a complete DVR it is equivalent to the two-generator condition and the decomposition of lattices into ideals.
- For a nonmaximal residually inert order, the radical idealizer is the unique minimal superorder and has index 𝔭².

**Checks.**

- Lipschitz L has reduced discriminant 4 and is Bass but not hereditary; its only strict superorder is Hurwitz, of discriminant 2.
- O₀(4) is Eichler, hence Bass, with reduced discriminant 4; the two-generator criterion does not require squarefree level.
- ℤ+2O₆ is its own superorder and has conductor 2 rather than 1, so the universal Gorenstein condition fails.

### 2.6 Classification of local orders by their symbol

Let `R` be a complete discrete valuation ring with residue field `k`. Every `R`-order `O` has
exactly one Eichler symbol `(O|𝔭) ∈ {∗, 1, −1, 0}` (2.4; `[V, 24.3.1–24.3.2]`, p. 388). Prove
what each value says about `O`:

- `(O|𝔭) = ∗` iff `rad O = 𝔭O`, and when `k` is finite iff `O ≅ M₂(R)` (`[V, 24.3.5]`, p. 389).
- `(O|𝔭) = 1` iff `O` is Eichler and not maximal, that is `O ≅ O_0(𝔭^e)` with `e ≥ 1`: an order
  is Eichler iff it is maximal or residually split (`[V, 24.3.6]`, p. 389), a maximal order has
  symbol `∗` or `−1`, and the local form is 1.8's.
- `(O|𝔭) = −1` implies that `O` is Bass (`[V, 24.5.4]`, p. 394).
- An order that is not Bass has `(O|𝔭) = 0` (`[V, 24.5.5]`, p. 395); the symbol `0` decides
  neither the Bass nor the Gorenstein property.
- Separately from the symbol, `O` is hereditary iff `discrd O` is squarefree (`[V, 23.3.18]`; 1.8).

*Needs:* 1.8, 2.2–2.5.

**Checks.**

- `M₂(ℤ₂)`: `rad = 2M₂(ℤ₂)`, symbol `∗`, reduced discriminant `(1)`, hereditary.
- `O_0(4) ⊂ M₂(ℤ₂)`: the quotient by its radical is `𝔽₂ × 𝔽₂`, symbol `1`; Eichler, hence Bass;
  reduced discriminant `(4)`, so not hereditary.
- In `M₂(ℤ₂)`, the order `ℤ₂[ω] + 2M₂(ℤ₂)` (with `ω ↦ [[0,−1],[1,−1]]`, a root of `x² + x + 1`)
  has radical `2M₂(ℤ₂)` and quotient `𝔽₄`, symbol `−1`; it is Bass by 24.5.4, has index `4` in
  `M₂(ℤ₂)`, hence reduced discriminant `(4)`, and is neither maximal, Eichler nor hereditary: the
  symbol `−1` does not force maximality.
- At `2`, the Lipschitz order `ℤ₂⟨i,j⟩` and the order `ℤ₂ + 2O` (`O` the maximal order of the
  division algebra over `ℚ₂`) both have symbol `0`, with residue quotients `𝔽₂`; the first is Bass
  (2.5), the second has conductor `(2)` (2.3) and is not Gorenstein.

### 2.7 Worked orders

Prove: the Lipschitz order is Gorenstein and Bass, with Eichler symbol `(O|2) = 0`; the maximal
order of discriminant `6` is Eichler of level `1` with `(O|2) = (O|3) = -1`; `ℤ + 2O_6` is not
Gorenstein with `Gor = O_6`, `f = 2`; the Eichler order of level `5` in discriminant `6` has
`discrd = 30`, `(O|5) = 1`. *Needs:* 2.2–2.6.

**Checks.**

- Lipschitz order: Gorenstein and Bass, `(O|2) = 0`.
- O₆ has residue division fields 𝔽₄ and 𝔽₉ at 2 and 3, hence symbol −1 at both. The unit counts modulo pO are 2²(2²−1) = 12 and 3²(3²−1) = 72; the split-symbol counts 6 and 48 are wrong here.
- At 5, O₆ is split maximal: symbol ∗ and unit count 5·4²·6 = 480.
- `ℤ + 2O_6`: not Gorenstein, hence not Bass; `Gor = O_6`, `f = 2`.
- The Eichler order of level `5` in discriminant `6`: `discrd = 30`, `(O|5) = 1`.

### Examples

O₆ is Gorenstein, while ℤ+2O₆ has conductor 2 and reduced discriminant 48.

### Dependencies

Layer 1; Clifford algebras and the trace-zero norm form of QuadraticFormInvariants Layer 2.

## Layer 3: ideals, class sets, types, and the idelic dictionary

### 3.1 Invertible and locally principal lattices

The acceptance carrier `RightIdeal` bundles right stability, invertibility and equality of the full right multiplier order with O.

With the products, principal, locally principal and invertible lattices and the norm `nrd(I)`
of 1.12, prove `nrd(I)` is a fractional ideal; for `R = ℤ` and integral `I`, `nrd I` is generated by
`nrd(I) ∈ ℕ` with [O : I] = nrd(I)² for I locally principal over O (in particular O_R(I) = O). Prove: invertible iff locally
principal (`[V, 16.1.3]` over `ℤ`; over a Dedekind domain `[V, 16.6.1]` with the standard
involution); a lattice whose left or right order is maximal is locally principal
(`[V, 17.2.3]`); `nrd(IJ) = nrd(I)nrd(J)` for compatible invertible `I, J` and
`I^{-1} = star I / nrd I` for invertible `I`. *Needs:* 1.1, 1.4, 1.12.

Its API:

- Properness identifies the full right multiplier order; invertibility is equivalent to local principality.
- Compatible invertible products multiply norm ideals; conjugation divided by the norm gives the inverse.

**Checks.**

- For 2O₀(2), the right order is O₀(2), the norm ideal is (4), and the index is 16 = 4².
- The right-stable lattice M₂(ℤ) over O₀(2) has multiplier order M₂(ℤ), so it is not a proper ideal of O₀(2).
- For 2O and 3O, norms multiply as 4·9 = 36 and the inverse norm of 2O is 1/4.

### 3.2 The right class set

The signatures call the equivalence relation `ClassRel`, its quotient `ClassSet`, and its cardinality `classNumber`.

Define `Cls O` as pinned, as a `Quot` of invertible right fractional `O`-ideals by left
multiplication by `Bˣ`, and prove `I ∼ J` iff `I ≅ J` as right `O`-modules (`[V, 17.3.3]`). Define
the left class set and `star : Cls_L O ≃ Cls_R O`. Prove that `[I] ↦ [O_L(I)]` is a well-defined
surjection `Cls O → Typ O` (`[V, 17.4.13]`) and that a connecting ideal `J` induces a bijection
`Cls O ≃ Cls O'` by `[I] ↦ [IJ]` (`[V, 17.4.11]`). *Needs:* 3.1.

Its API:

- The relation is equivalence by right-module isomorphism; conjugation identifies left and right class sets.
- The left-order map surjects onto types and connecting ideals induce class-set bijections.

**Checks.**

- Hurwitz order: one class and one type.
- For O = O₀(2), I = M₂(ℤ) is right stable but O_R(I) = M₂(ℤ) ≠ O, so I is excluded. The integral lattice 2M₂(ℤ) is likewise excluded: its index in O is 8 and its norm ideal is (4), with 8 ≠ 4².
- For I = 2O₀(2), properness holds, its index is 16 and its norm ideal is (4), giving 16 = 4².
- `D = 11`: two classes, whose left orders have unit groups of orders `4` and `6`, so of different
  types: `Cls O → Typ O` is a bijection onto two types.
- `D = 37`: three classes and two types, so `Cls O → Typ O` is surjective and not injective.
- (well defined) `[αI] ↦ [O_L(αI)] = [αO_L(I)α^{-1}] = [O_L(I)]` by 1.1.

### 3.3 Genus, type set, connecting ideals

The corresponding acceptance definitions are `TypeRel`, `TypeSet` and `typeNumber`, using the left multiplier orders of proper ideals.

Define same type, connected, locally of the same type, `Gen O`, `Typ O` as pinned; prove
connected iff locally isomorphic (`[V, 17.4.6]`), that `OO'` is a connecting ideal for maximal
`O, O'` (`[V, 17.4.7]`), and that `# Cls` is constant on a genus. *Needs:* 3.1, 3.2.

Its API:

- Connectedness agrees with local isomorphism, and a product of maximal orders gives a connecting ideal.
- The class number is constant on a genus and the type number counts conjugacy classes of orders in that genus.

**Checks.**

- Hurwitz has one genus class and one type; its product with itself is its identity connecting ideal.
- At D = 11, the two class representatives have unit orders 4 and 6, hence their left orders are not isomorphic and give two types.
- At D = 37, three classes map to two types: local isomorphism does not imply a unique global type.

### 3.4 The idelic dictionary

For `R = 𝓞 F` let `B̂ = B ⊗ 𝔸_{F,f}` and `Ô = O ⊗ ℤ̂`. The bijection `α̂ ↦ B ∩ α̂Ô` from
`B^× \ B̂^× / Ô^×` to the isomorphism classes of locally free rank-one right `O`-lattices is
classical arithmetic completion 7.78 at `Λ = O` (its `U(O)` contains the archimedean factors of
`J(B)`, so `B^× \ J(B) / U(O) = B^× \ B̂^× / Ô^×`), and the gluing `B ∩ ∏_𝔭 α̂_𝔭 O_𝔭` with its
completions is its 7.72; both are consumed. Prove the quaternion reading: a right `O`-lattice is
locally free of rank one over O iff it is a proper invertible lattice (3.1), so that 7.78 reads
`Cls O ≃ B^× \ B̂^× / Ô^×` (`[V, 27.6.8]`, bijection (27.6.9)), and the reduced-norm identity
`nrd(B ∩ α̂Ô) = F ∩ nrd(α̂)R̂`. At an Eichler order `O` this identification is Hilbert modular
varieties §R18.5.16a item 6, consumed; the statement here is for every order. This is the comparison with adelic algebraic groups AA.5.3's class
set `Cl(U)` (*quaternion-class-sets*) at `U = Ô^×` and, for totally definite `B`, with Hilbert
modular varieties R18.3.1's central quotient of `Cl(U)` by the finite ideles of the centre; this milestone states
the comparison and proves it, and it is the only place a second description of `Cls O` appears.
*Needs:* 3.1, 3.2; global number fields Layers 4, 6; CAC 7.72, 7.78; AA.5.3;
HilbertModularVarietiesAndShimuraCurves §R18.5.16a for the Eichler case.

### 3.5 Finiteness of class and type sets

The acceptance theorem `finite_classSet` is stated for the ring of integers of every number field.

Prove `Cls O` and `Typ O` finite for every order over `𝓞 F` (`[V, 17.7.1]`): through 3.4 and adelic
algebraic groups AA.3.4 `class-number-finite` for `G = B^×` with the compact open `Ô^×`, which is
AA.5.3 *quaternion-class-sets* at `U = Ô^×`. For a maximal order over a totally real field the
finiteness of `Typ O` is ArithmeticFuchsianGroups §1.4's finiteness of maximal-order types,
consumed; the statement here extends it to every order over every number field, through the
surjection `Cls O → Typ O` of 3.2. Over `ℚ` and `B` definite, prove `O^× = O¹` is finite:
`O^× = B^× ∩ Ô^×` is the stabilizer of AA.5.3 *definite-quaternion-stabilizers* at `x = 1`, and
`nrd` is positive on `B`. Prove every class is represented by an integral ideal of norm
`≤ (8/π²)·discrd O` (`[V, 17.5.6]`). *Needs:* 3.4; AA.3.4; AA.5.3; ArithmeticFuchsianGroups §1.4 for the maximal-order case.

### 3.6 Two-sided ideals, the normalizer and `Pic_R(O)`

The signature subgroup `normalizer` consists of the elements preserving O; `scalarUnits` is the subgroup FˣOˣ pulled back to it.

Define `Idl(O)` (invertible two-sided `O`-ideals), `PIdl(O)` (those `OαO` with `α ∈ N_{B^×}(O)`),
`Pic_R(O) = Idl(O)/{aO : a ∈ Fˣ}`, and prove the exact sequence
1 → Cl R → Pic_R(O) → Idl(O)/Idl(R) → 1. For a number field and B indefinite, also prove
1 → N(O)/(FˣOˣ) → Pic_R(O) → Cl(G(O),R)
(`[V, 28.9.13–28.9.14]`), where `Cl_{G(O)} R = F^×_{>Ω 0}\F̂^×/nrd(Ô^×)`. For `O` Eichler with
`discrd O = 𝔑`, prove `Idl(O)/Idl(R) ≅ ∏_{𝔭 | 𝔑} ℤ/2` (`[V, 23.4.20]`), generated at each `𝔭` by the
primitive two-sided ideal of norm 𝔭 at a division prime, and of norm 𝔭ᵉ at a level prime
𝔭ᵉ ∥ 𝔐, represented locally by J = O₀(𝔭ᵉ)[[0,1],[ϖᵉ,0]], with J² = 𝔭ᵉO₀(𝔭ᵉ). The local normalizers
entering here are ArithmeticFuchsianGroups §1.2's: `B_𝔭^×` at a division prime, and at a level
prime the setwise stabilizer of the edge, or path, of the Eichler order (1.11). *Needs:* 3.1, 3.4; 1.6, 1.8, 1.11; ArithmeticFuchsianGroups §1.2.

Its API:

- Central principal ideals form the quotient defining Pic_R(O); the central ideal classes inject with the stated quotient.
- Principal two-sided ideals recover the normalizer quotient; the Eichler local generators square to central ideals.

**Checks.**

- For R = ℤ[√−5] and O = M₂(R), Pic_R(O) = Cl R has order two, whereas Idl(O)/Idl(R) is trivial.
- For O₀(4), w = [[0,1],[4,0]] has determinant −4, w² = 4I, and the two-sided ideal has norm (4), not (2).
- At a division prime p, the radical P has norm (p) and P² = pO; at level p the matrix representative has norm ideal (p), agreeing only when e = 1.

### 3.7 The Atkin–Lehner group

Define `AL(O) = {J ∈ Idl(O) : [nrd J] ∈ (Cl_{G(O)} R)²}/Idl(R)` (`[V, 28.9.8]`) and prove: for O Eichler it is
an elementary abelian `2`-group; in that case it is `∏_{𝔭|𝔑} ℤ/2` whenever `# Cl_{G(O)} R` is
odd (`[V, 28.9.10]`). Over `ℚ` with `O` Eichler of level `N`: `Cl_{G(O)} ℤ = 1` (1.9 and
`Cl ℤ = 1`), so `AL(O) ≅ (ℤ/2)^{ω(DN)}`, and its elements are the classes `w_m` of the two-sided
ideals of reduced norm `m` for the Hall divisors `m ∥ DN`. *Needs:* 3.6.

Its API:

- For Eichler O, the Atkin–Lehner group is an elementary abelian 2-group.
- When the indicated ray class group has odd order, every local two-sided generator contributes a factor; over ℚ these are indexed by Hall divisors.

**Checks.**

- For the split maximal order over ℚ, DN = 1 gives a trivial Atkin–Lehner group.
- For O₆, the Hall divisors 1,2,3,6 give four elements, with w₂w₃ = w₆ and w₂² = 1.
- For the split order O₀(4), the Hall divisors are 1,4, so there are two elements; 2 is not a Hall divisor.

- For the non-Eichler Lipschitz order L, h = (1+i+j+k)/2 normalizes L and h³ = −1.
  The two-sided ideal Lh has order three modulo central ideals since h ∉ ℚˣLˣ;
  thus the elementary-abelian assertion requires the Eichler hypothesis.

### 3.8 Hurwitz and the class number one examples

Prove `# Cls O_H = 1` and `# Typ O_H = 1` for the Hurwitz order `O_H` of 1.13: an invertible right
fractional `O_H`-ideal `I` has `nI ⊆ O_H` for a positive integer `n`, and `nI = βO_H` by 1.13, so
`(nβ^{-1})I = O_H` and `[I] = [O_H]`; the surjection `Cls O → Typ O` of 3.2 then gives one type
(`[V, 11.3.4, 11.3.7]`). Prove `# Cls = 1` for the
maximal orders of discriminant `3, 5, 7, 13`, and `# Cls = 2` for discriminant `11` with unit
groups of orders `4` and `6`, `# Cls = 3` for `37` with all unit groups `{±1}`, by the mass and embedding formulas of 5.2 and 6.6, with the left-order unit counts retained. *Needs:* 3.2, 3.5; 1.13 for the Hurwitz order.

**Checks.**

- `# Cls = 1` for the Hurwitz order and for the maximal orders of discriminant `3, 5, 7, 13`.
- `D = 11`: two classes, left-order unit groups of orders `4` and `6`.
- `D = 37`: three classes, all left-order unit groups `{±1}`.
- (indefinite) `O_6 ⊂ ℍ[ℚ,3,-1]` has `# Cls = 1` (4.3).

### 3.9 Transport of class sets under isomorphism and under change of level

For orders over the ring of integers of a number field, prove that an algebra isomorphism
O ≅ O′ induces Cls O ≃ Cls O′. For O′ ⊆ O, extension [I] ↦ [IO] gives a surjection
Cls O′ → Cls O; under 3.4 it is the refinement map of double cosets of AdelicAlgebraicGroups §4.4,
“Nested-level map on double cosets”. Put U = Ôˣ, U′ = Ô′ˣ. The fibre description is Hilbert
modular varieties §R18.5.16b at G = B̂ˣ and Γ = Bˣ, consumed: for g ∈ B̂ˣ representing a target
class, its fibre is Γ_g\U/U′, with Γ_g = (g⁻¹Bˣg) ∩ U acting by left multiplication on U/U′, so
1 ≤ #fibre ≤ [U:U′], agreeing with AdelicAlgebraicGroups §4.4, “Finite-index bound for level
changes”; and if g′ = bgu₀ with b ∈ Bˣ and u₀ ∈ U, then Γ_g′ = u₀⁻¹Γ_g u₀ and uU′ ↦ u₀⁻¹uU′
compares the orbit sets. The local compact-open index is finite. Prove here the reading in
ideals: for I = B ∩ gÔ, whose left order has the completions g_𝔭O_𝔭g_𝔭⁻¹ (CAC 7.72),
conjugation by g carries Γ_g onto O_L(I)ˣ (for O Eichler this is §R18.5.16a item 7), so the fibre
over [I] is the set of orbits of O_L(I)ˣ on gUg⁻¹/gU′g⁻¹ ([V, 27.6.8–9], p. 457).

**Checks.**

- O′ = O gives U/U′ a single element and every fibre cardinality 1.
- For the Hurwitz order and a level-7 Eichler suborder, [U:U′] = 8; the Hurwitz units
  have two orbits of four elements, hence the only fibre has size 2, not the global unit index 4.
- For indefinite rational Eichler orders at levels 1 and 2 in the split algebra, both
  class sets have size 1, although the local coset set has size ψ(2) = 3: the single orbit has size 3.

*Needs:* 3.2, 3.4; AdelicAlgebraicGroups §4.4, the two named level-change targets;
HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16b; CAC 7.72; 1.9 for Eichler local index examples.

### 3.10 Ideals of a given norm

For `O` Eichler and an integral ideal `𝔫`, prove that the number `a_𝔫(O)` of integral invertible
right `O`-ideals of reduced norm `𝔫` is constant on the genus, multiplicative in coprime `𝔫`, and
equal to `∑_{𝔡 | 𝔫} N𝔡` for `𝔫` coprime to `discrd O`; at `𝔭 | disc B`, `a_{𝔭^e} = 1`
(`[V, 26.3.4, 26.3.9, 26.4.1]`). *Needs:* 3.1, 3.6.

Its API:

- The count is invariant on a genus and multiplicative for coprime nonzero norm ideals.
- Away from the reduced discriminant it is the ideal-divisor norm sum; at division primes
  there is one ideal of each prime-power norm.

**Checks.**

- The unit norm ideal gives the identity ideal O and count 1, equal to the divisor sum 1.
- For Hurwitz, norms 3 and 5 give 4 and 6 ideals, norm 15 gives 24 = 4·6, and norm 9
  gives 13 = 1+3+9 rather than 4².
- At the division prime 2 of Hurwitz, norms 2 and 4 each have count 1, rather than
  the unramified divisor sums 3 and 7.


### Examples

D = 11 has two ideal classes and two types; D = 37 has three classes and two types.

### Dependencies

Layer 1; ClassicalArithmeticCompletion §§7.72, 7.78; AdelicAlgebraicGroups §§3.4, 5.3; ArithmeticFuchsianGroups §§1.2, 1.4; HilbertModularVarietiesAndShimuraCurves §§R18.5.16a–R18.5.16b (3.4, 3.9); GlobalNumberFields Layers 4 and 6.

## Layer 4: indefinite algebras — Eichler's theorems from strong approximation

Here `R = 𝓞 F` and `B` is indefinite (0.5). The input is adelic algebraic groups AA.4.2:
`B¹ = ker nrd` is dense in `B̂¹` (Voight `[V, 28.5.3]`), consumed, never reproved.

### 4.1 Eichler's theorem on the class set

The acceptance theorem `classNumber_eq_card_rayClassGroup` states `# Cls O = # Cl_Ω R` for an
Eichler order `O` over `𝓞 F` in an indefinite `ℍ[F,a,b]`, with `Cl_Ω R` Tau Ceti's
`RayClassGroup` of the modulus with finite part `⊤` and infinite part `Ω`, the real places at which
the real Hilbert symbol is `−1`. Local norm-maximality needs the completed orders and is not a
definition of `Suggested.lean`, so the theorem is stated for the Eichler orders, which 1.9 proves
locally norm-maximal.

Prove that `nrd` induces a bijection `Cls O → Cl_{G(O)} R` (`[V, 28.5.5]`), and for locally
norm-maximal `O` (every Eichler order, 1.9) a bijection `Cls O → Cl_Ω R`, the ray class group of
`R` with positivity at the real ramified places `Ω` (`[V, 28.5.17]`, p. 475, `[V, 17.8.3]`). The
strong-approximation input is adelic algebraic groups AA.4.2 and, in the form
`J(B)′ = B^×′·(J(B)′ ∩ U(O))` for `B` satisfying Eichler's condition (for a quaternion algebra,
indefiniteness, 0.5), classical arithmetic completion 7.44; both are consumed. Deduce: `# Cls O = # Cl_Ω R`; if `# Cl⁺ R = 1` then every
proper invertible right ideal of an Eichler order is principal. *Needs:* 3.2, 3.4, 1.9; AA.4.2; CAC 7.44;
GNF Layer 2 (ray class groups: Tau Ceti `RayClassGroup`, `Modulus`, `IsCongrOne`).

**Checks.**

- For `F = ℚ` and `B` indefinite the real place is unramified, `Ω = ∅`, and `Cl_∅ ℤ = Cl ℤ = 1`:
  every Eichler order has one class, which is 4.3.
- For `F = ℚ(√3)` (`h = 1`, narrow class number `2`, since the fundamental unit `2 + √3` has norm
  `1`) and `B` ramified at one real place `w` and one finite prime, `Ω = {w}`; the unit `−1` is
  negative at `w`, so every principal ideal has a generator positive at `w` and `# Cls O = 1`.
  Positivity at both real places would give `2`, and that algebra would be totally definite, where
  the theorem does not apply.
- (convention) `Ω` is the set of ramified real places, not of split ones: for `F = ℚ(√3)` and `B`
  ramified at two finite primes and at no real place, `Ω = ∅` and `# Cls O = h = 1`, while
  positivity at the two split real places would give the narrow class number `2`.
- (reject) For the definite algebra of discriminant `11` over `ℚ`, `Ω = {∞}` and `Cl_Ω ℤ`, the
  narrow class group of `ℤ`, is trivial, while a maximal order has `# Cls O = 2` (5.6): the
  indefiniteness hypothesis cannot be dropped.

### 4.2 Types

Prove `Typ O ≃ Cl_{G_N(O)} R` for the normalizer-enlarged group (`[V, 28.5.10]`), and that
`Cl_{G(O)} R = 1` implies `# Typ O = 1` (`[V, 28.5.6]`). *Needs:* 4.1, 3.3.

### 4.3 Over `ℚ`

The acceptance statements are `classNumber_eq_one_of_not_isDefinite` and `exists_conj_of_level_eq`.

For `O` Eichler in an indefinite `B/ℚ`: `# Cls O = 1`, `# Typ O = 1`, and `O¹ → (O/mO)¹` is
surjective for every `m` (`[V, 28.2.11]`); more generally `O¹` is dense in `Ô¹` (`[V, 28.5.14]`).
Hence every two Eichler orders of the same level in `B` are conjugate, and `X_0(D;N)` of Layer 8
does not depend on the choice of `O`. *Needs:* 4.1, 4.2.

### 4.4 Norms of units and of elements

The rational Eichler unit theorem is `exists_unit_nrd_eq_neg_one`.

Prove Eichler's norm theorem: for nonzero n ∈ R positive at Ω there is an integral `α ∈ B^×` with
`nrd α = n` (`[V, 28.6.1]`); for `O` Eichler with `Cl_Ω R = 1`, `nrd(O^×) = R^×_{>Ω 0}` (`[V, 28.6.4]`);
over `ℚ` every locally norm-maximal order has a unit of reduced norm `−1` (`[V, 28.6.10]`), so
`[O^× : O¹] = 2`. The global norm image `nrd(B^×) = F^×_{>Ω 0}` is AA.4.6 and classical
arithmetic completion 7.60, and the local images — `nrd(B_𝔭^×) = F_𝔭^×`, `nrd(O_𝔭^×) = R_𝔭^×` for
`O_𝔭` maximal, `ℝ_{>0}` at a ramified real place — are 7.60; all consumed. The local image of an
Eichler order at `𝔭 | 𝔐` is 1.9, and this milestone proves the three global statements above.
*Needs:* 4.1, 1.9; AA.4.6; CAC 7.60.

**Checks.**

- In M₂(ℚ), diag(−1,1) is integral and invertible with norm −1; positivity at the empty ramification set imposes no sign condition.
- Zero satisfies that empty positivity condition but cannot be a norm of a unit; it is the norm of 0 ∈ B only.
- For a real division place every nonzero reduced norm is positive, so −1 is excluded there.

### 4.5 The normalizer sequence

The signature type `atkinLehnerGroup` denotes this normalizer quotient; `card_atkinLehnerGroup` states its order for indefinite rational Eichler orders.

Prove the split exact sequence `1 → (Cl R)[2]↑O → N_{B^×}(O)/(F^×O^×) → AL(O) → 1`
(`[V, 28.9.17]`). Over `ℚ` with `O` Eichler of level `N`: `N_{B^×}(O)/(ℚ^×O^×) ≅ AL(O) ≅ (ℤ/2)^{ω(DN)}`,
with a representative `w_m ∈ N_{B^×}(O)` of reduced norm `m` for every `m ∥ DN`, and
`w_m w_{m'} ∈ ℚ^× O^× w_{mm'/gcd(m,m')²}`. *Needs:* 3.7, 4.1, 4.4.

### 4.6 Positive-norm normalizer over `ℚ`

For O Eichler in an indefinite rational algebra, define `N^+_{B^×}(O) = {γ ∈ N_{B^×}(O) : nrd γ > 0}`;
its image in `B^×/ℚ^×` is, for `O` maximal, ArithmeticFuchsianGroups §1.2's positive normalizer
`N_B⁺(O)`, with `N_B⁺(O)/Γ(O) ≃ im ν` a finite elementary abelian `2`-group, consumed. Prove here, for
every Eichler `O`, `N^+/(ℚ^×_{>0}O¹) ≅ AL(O)` (so `im ν` is the set of Hall divisors `m ∥ DN` modulo
squares and `N^+/(ℚ^×O¹) ≅ (ℤ/2)^{ω(DN)}`), every
class `w_m` having a representative of positive norm `m` (the representatives of 4.5 have norm
`m > 0`), and `N_{B^×}(O) = N^+ ⊔ N^+·u` for a unit `u` of norm `−1` (4.4).
This is a corollary of the norm-image and normalizer exact sequences
([V, 28.6.10, 28.9.17], pp. 477, 486). *Needs:* 4.4, 4.5; ArithmeticFuchsianGroups §1.2.

Its API:

- The positive-norm subgroup has index two, detected by a unit of norm −1.
- Its quotient by positive rational scalars and O¹ is the Atkin–Lehner group, with a positive representative for each Hall divisor.

**Checks.**

- For O₆ the positive normalizer quotient has size 4 = 2^ω(6); the reduced norms of `w₂, w₃, w₆` give `im ν = {1, 2, 3, 6}` modulo squares, and since `−1 ∈ O¹` the quotient by `ℚ^×_{>0}O¹` equals the quotient by `ℚ^×O¹`.
- For M₂(ℤ) the quotient has size 1; diag(−1,1) has norm −1 and lies in the other coset.
- The scalar −1 has norm 1 and lies in O¹, so restricting the scalar denominator to positive rationals does not introduce an extra factor of two.

### 4.7 Jacobinski cancellation

Record that classical arithmetic completion 7.98 (cancellation for locally free lattices under
Eichler's condition) is the module-theoretic face of 4.1: a stably free locally free `O`-lattice
is free; this roadmap adds the identification of its rank-one case with 4.1 and nothing else.
*Needs:* 4.1; CAC 7.98.

### Examples

O₆ has one ideal class; diag(−1,1) in the split order has reduced norm −1.

### Dependencies

Layers 1 and 3; AdelicAlgebraicGroups §§4.2, 4.6; ArithmeticFuchsianGroups §1.2; ClassicalArithmeticCompletion §§7.44, 7.60, 7.98.

## Layer 5: definite algebras — the Eichler mass formula

Here `B` is totally definite over the totally real field `F` of degree `n`, and `O ⊂ B` an order
with `discrd O = 𝔑`.

### 5.1 The mass

Prove `O^×/R^×` finite (`[V, 26.5.1]`; over `ℚ`, `O^× = O¹` is finite, `[V, 17.7.13]`), define
`mass(Cls O)` as pinned (a finite sum over `Cls O`, finite by 3.5): over `ℤ`,
`mass(Cls O) = ∑_{[J] ∈ Cls O} 1/w_J` with `w_J = #O_L(J)^×/2`, where `J` is any representative of its
class (conjugate left orders have isomorphic unit groups, so `w_J` is a function on `Cls O`); and
prove it is constant on
the genus and that `mass(Cls O) ≤ # Cls O` with equality iff every `O_L(J)^× = R^×`. For an
Eichler order the finiteness of the weight and its independence of the representative are Hilbert
modular varieties §R18.5.16a item 8, consumed; the statements here are for every order.
*Needs:* 3.2, 3.5; HilbertModularVarietiesAndShimuraCurves §R18.5.16a for the Eichler case.

Its API:

- The weight is independent of the ideal representative, so the finite weighted sum is well defined.
- Mass is genus-invariant and at most the class number, with equality exactly when all left-order units are central.

**Checks.**

- Hurwitz order: one class, `24` units, `w = 12`, mass `1/12`.
- `D = 11`: mass `1/2 + 1/3 = 5/6 < 2 = # Cls O`.
- (equality case) `D = 13`: units `{±1}`, mass `1 = # Cls O`; `D = 37`: mass `3 = # Cls O`.
- (convention) The weight is `#O_L(J)^×/2`, not `#O_L(J)^×`: the Hurwitz order has weight `12`.

### 5.2 The Eichler mass formula over `ℚ`

The acceptance theorem `eichler_mass_formula` sums 2/#O_L(I)ˣ over any finite complete
set of proper invertible right-ideal class representatives; it is independent of that choice.

For `B/ℚ` definite of discriminant `D`: for `O` maximal, `∑_{[J]} 1/w_J = φ(D)/12`
(`[V, 25.1.1]`); for `O` Eichler of level `M`, `∑ 1/w_J = φ(D)ψ(M)/12` (`[V, 25.3.18]`); for any
`O` with `discrd O = N`, `∑ 1/w_J = (N/12)∏_{p|N} λ(O,p)` (`[V, 25.3.19]`). The proof route is the
zeta function of the order (`[V, 25.2–25.3]`, Theorem 26.2.12 applied to the norm form on a lattice
in `ℝ⁴`), or, for the passage between levels, adelic algebraic groups AA.5.3's identity
`∑_{Cls U'} 1/|Γ'_x| = ([U:U']/[ℚ^× ∩ U : ℚ^× ∩ U'])∑_{Cls U} 1/|Γ_x|`, which with 1.9's index
`ψ(M)` reduces the Eichler case to the maximal case. Either route proves the same formula. *Needs:* 5.1, 3.4, 1.9, 2.4; AA.5.3.

**Checks.**

- Maximal orders: `φ(D)/12 = 1/12, 1/6, 5/6, 3` for `D = 2, 3, 11, 37`, matching 5.6.
- Eichler order of level `3` in `D = 2`: `φ(2)ψ(3)/12 = 1/3`, one class with `w = 3`.
- Eichler orders of level `7` in `D = 2`: `φ(2)ψ(7)/12 = 2/3`, two classes with `6` units each.

### 5.3 The Eichler mass formula over a totally real field

The acceptance theorem `eichler_mass_formula_totallyReal` states the Eichler-order form below for
`O` over `𝓞 F` in a totally definite `ℍ[F,a,b]` (`IsTotallyDefinite a b`), summing
`[O_L(I)^× : (𝓞 F)^×]^{-1}` over a complete set of class representatives, with `φ(𝔇)ψ(𝔐)` written as
`N𝔑·∏_{𝔭 | 𝔑}(1 + ε_𝔭/N𝔭)` for `𝔑 = discrd O`, `ε_𝔭 = −1` where `B` ramifies (`IsRamifiedAt`) and
`ε_𝔭 = +1` elsewhere: this is the same number because `𝔑 = 𝔇𝔐` with `𝔇` squarefree and coprime to
`𝔐` (1.9).

`mass(Cls O) = (2ζ_F(2)/(2π)^{2n})·d_F^{3/2}·h_F·N𝔑·∏_{𝔭|𝔑} λ(O,𝔭)` (`[V, 26.1.5]`), and for
Eichler orders of level `𝔐` in the algebra of discriminant `𝔇`,
`mass(Cls O) = (2ζ_F(2)/(2π)^{2n})·d_F^{3/2}·h_F·φ(𝔇)ψ(𝔐)` (`[V, 26.1.12]`, p. 421), where
`φ(𝔇) = ∏_{𝔭|𝔇}(N𝔭 − 1)` and `ψ(𝔐) = N𝔐∏_{𝔭|𝔐}(1 + 1/N𝔭)`. Over `ℚ` this is 5.2. The analytic
inputs are the Dedekind zeta value `ζ_F(2)` and the residue formula; the proof route is the zeta
function of the order (`[V, 26.4–26.6]`). *Needs:* 5.1, 3.10, 2.4; the Dedekind zeta
function of Mathlib (`dedekindZeta`) and its Euler product.

Its API:

- `φ(𝔇)` and `ψ(𝔐)` are multiplicative in coprime arguments, with `φ(𝔭) = N𝔭 − 1` and
  `ψ(𝔭^e) = N𝔭^{e−1}(N𝔭 + 1)`, and `ψ(𝔐) = ∏_{𝔭 | 𝔐}[O(1)_𝔭^× : O_𝔭^×]` is the product of the
  local unit indices of 1.9; the global index `[O(1)^× : O^×]` can be smaller.
- The mass of an Eichler order of level `𝔐` is `ψ(𝔐)` times the mass of a maximal order of the
  same algebra, and over `ℚ` the formula is 5.2.

**Checks.**

- For `F = ℚ`: `d_F = 1`, `h_F = 1`, `n = 1` and `ζ(2) = π²/6` give the constant
  `2(π²/6)/(2π)² = 1/12`, so the formula reads `φ(D)ψ(M)/12`, as in 5.2.
- A prime `𝔭` of norm `4` gives `ψ(𝔭²) = 16·(1 + 1/4) = 20` and `φ(𝔭) = 3`; the rational functions
  evaluated at the integer `4` would give `ψ(4) = 6` and `φ(4) = 2`.
- In a quadratic field in which `3 = 𝔭𝔭̄` splits, `φ(𝔭𝔭̄) = (3 − 1)(3 − 1) = 4`, which is neither
  `φ(9) = 6` nor `N𝔇 − 1 = 8`; when `3` is inert, `φ((3)) = 9 − 1 = 8`.
- For `F = ℚ(√5)`, `d_F = 5`, `h_F = 1`, `ζ_F(2) = 2π⁴/(75√5)` and the algebra ramified exactly at
  the two real places, a maximal order has mass `2·(2π⁴/(75√5))·5^{3/2}/(2π)⁴ = 1/60`: one class whose
  unit group modulo `R^×` is the binary icosahedral group modulo `±1`, of order `60`.
- (local index) At `(D, M) = (2, 7)`, `ψ(7) = [GL₂(ℤ₇) : O_0(7)^×] = 8` is the local index and the
  mass is `8·(1/12) = 2/3`, while the global index is `[O(1)^× : O^×] = 24/6 = 4`: reading `ψ` as
  the global index would give mass `1/3`.
- (product form) For `F = ℚ`, `D = 2` and level `3`: `N𝔑 = 6` and `(1 − 1/2)(1 + 1/3) = 2/3` give
  `6·2/3 = 4 = φ(2)ψ(3)` and mass `4/12 = 1/3`; the sign `+` at the ramified prime would give
  `6·(3/2)(4/3) = 12` and mass `1`.

### 5.4 Level change

Prove `mass(Cls O) = [O'^×_𝔭 : O^×_𝔭]·mass(Cls O')` when `O ⊆ O'` differ only at `𝔭`
(`[V, 26.6.4]`), with `[O'^×_𝔭 : O^×_𝔭] = [O'_𝔭 : O_𝔭]λ(O,𝔭)·(1, (1 − 1/q)^{-1})` according as `𝔭`
is split or ramified in `B`, for `O'` maximal (`[V, 26.6.7]`). *Needs:* 5.1, 2.4.

### 5.5 Class number one

The maximal-order equivalence is `classNumber_eq_one_iff`.

Prove: a maximal order in a definite `B/ℚ` has `# Cls O = 1` iff `D ∈ {2, 3, 5, 7, 13}`
(`[V, 25.4.1]`, from 5.2 and `w_J ≤ 12`). State Brzezinski's theorem that exactly `24` isomorphism
classes of definite orders over `ℤ` have class number one (`[V, 25.4.3]`) as a mathematical classification. Develop the finite classification of the local order types
compatible with the mass bound φ(N)/12 ≤ 1 ([V, 25.4.5]); use the mass and optimal-embedding
contributions to determine which global types have one ideal class. The conclusion counts
isomorphism classes of orders, not just reduced discriminants. *Needs:* 2.5–2.6, 5.2, 6.4–6.6 for the classification route.

### 5.6 Worked masses

Prove the values: `D = 2`: one class, `w = 12` (for the Hurwitz order also directly from 1.13 and
3.8, mass `1/12 = φ(2)/12`); `D = 3`: one class, `w = 6`; `D = 5`: `w = 3`;
`D = 7`: `w = 2`; `D = 11`: two classes with `w = 2, 3`, mass `5/6`; `D = 13`: one class, `w = 1`;
`D = 37`: three classes with `w = 1`, mass `3`; the Eichler order of level `3` in `D = 2`: one
class with `w = 3`, mass `φ(2)ψ(3)/12 = 1/3`. *Needs:* 5.2; 1.13 and 3.8 for the Hurwitz order.

### Examples

Hurwitz has mass 1/12; D = 11 has mass 5/6; level 7 in D = 2 has mass 2/3.

### Dependencies

Layers 2 and 3; AdelicAlgebraicGroups §5.3; HilbertModularVarietiesAndShimuraCurves §R18.5.16a (the weights of Eichler orders in 5.1). The class-number classification route additionally uses §6.6, which uses the mass formula but not §5.5.

## Layer 6: optimal embeddings, embedding numbers, class and type number formulas

`K ⊇ F` is a quadratic field extension with `K ⊆ B` embedded (every embedding is conjugate to
this one by Skolem–Noether, Tau Ceti `Algebra/CentralSimple/SkolemNoether.lean`), and `S ⊆ K` a quadratic
`R`-order (for `F = ℚ`, `S : NumberFieldOrder K`; the maximal order `ℤ_K` as a `NumberFieldOrder`
is Tau Ceti's `maximalNumberFieldOrder K`, `NumberTheory/NumberField/Global/Orders/Basic.lean` at the
pin, and the statements below take `S = maximalNumberFieldOrder K`, equivalently
`S.toSubalgebra = integralClosure ℤ K`, where the maximal order is meant).

### 6.1 Optimal embeddings

The signature predicate `IsOptimalEmbedding` defines the subtype `OptimalEmbedding`; `EmbRel` takes conjugacy classes and `embeddingNumber` counts them.

Define `Emb(S,O)`, `E_{S,O} = {β ∈ B^× : β^{-1}Kβ ∩ O = β^{-1}Sβ}`, the bijection
`K^×\E ≃ Emb(S,O)`, `β ↦ (α ↦ β^{-1}αβ)` (`[V, 30.3.8]`), and for `O¹ ≤ Γ ≤ N_{B^×}(O)` the right
action of `Γ` and `Emb(S,O;Γ) ≃ K^×\E/Γ` (`[V, 30.3.13]`). Prove optimality is local
(`[V, 30.3.6]`) and the comparison `m(S,O;Γ) = m(S,O;O^×)·[nrd(O^×) : nrd(Γ)nrd(S^×)]` for
`O¹ ≤ Γ ≤ O^×` (`[V, 30.3.14]`); over `ℚ` with `S` imaginary quadratic and `O` having a unit of
norm `−1` (4.4), `m(S,O;O¹) = 2·m(S,O;O^×)`. *Needs:* 1.1,
1.2; GNF Layer 11.

Its API:

- Optimality is local, and the transporter quotient parametrizes embeddings and their conjugacy classes.
- Changing from Oˣ to an intermediate group uses the norm-index formula; over ℚ the O¹ count doubles for imaginary quadratic orders.

**Checks.**

- For D = 6 and S = ℤ[i], the Oˣ count is 2 and the O¹ count is 4.
- The embeddings i ↦ j and i ↦ −j have the same image order but opposite orientations; an unmarked image alone cannot distinguish them.
- ℤ[2i] in ℚ(i) has conductor 2 and no optimal embedding in O₆, although ℤ[i] has two Oˣ classes.

### 6.2 Finiteness and the local embedding numbers of maximal orders

Prove `m(S,O;Γ) < ∞` for `R = 𝓞 F`: for `Γ = O^×` the sum over `Cls O` of 6.4 is `h(S)` times a finite product of local embedding numbers (`[V, 30.4.7, (30.7.2)]`), and `[V, 30.3.14]` for `O¹ ≤ Γ ≤ O^×` together with the surjection `Emb(S,O;Γ) → Emb(S,O;Γ')` for `Γ ≤ Γ'` carry finiteness to every `Γ`; the local statement, for `R` a complete DVR with finite residue field (the standing hypothesis of `[V, §30.5]`), is `[V, 30.5.5]` (p. 541); without the finite residue field it fails (the first Check below). For R a complete DVR, m(S, M₂(R); GL₂(R)) = 1 for quadratic R-orders S. For the following division embedding counts assume in addition that the residue field is finite; for B
division with valuation ring `O` and `S` integrally closed, `m(S,O;N_{B^×}(O)) = 1` and
`m(S,O;O^×) = 1 − (K | 𝔭)`, where `(K|𝔭) ∈ {1, 0, −1}` is split, ramified, inert
(`[V, 30.5.3]`); for `S` not maximal in a division `B`, `Emb(S,O) = ∅`. *Needs:* 6.1, 1.6.

**Checks.**

- (reject) Over `R = ℂ[[t]]`, with `O = O_0(t²)` and `S = R[t√t]`, the matrices
  `g_s = [[ts, 1],[t²(t − s²), −ts]]`, `s ∈ R`, lie in `O`, satisfy `g_s² = t³` and give optimal
  embeddings (an element `x + y·g_s` of `O` has `y ∈ R` from its `(1,2)` entry, then `x ∈ R`).
  Conjugation by `O^×` preserves the image `(ts, −ts)` of `g_s` under the ring map
  `O_0(t²) → R/t² × R/t²` onto the diagonal entries, so `s mod t ∈ ℂ` separates infinitely many
  `O^×`-classes; the normalizer only swaps the two diagonal entries and leaves infinitely many.
  Local finiteness needs the finite residue field.
- For the division algebra over `ℚ₂` and its valuation ring: `ℤ₂[i]` (`ℚ₂(i)` ramified) gives
  `m(S,O;O^×) = 1 − 0 = 1`, `ℤ₂[ζ₃]` (`ℚ₂(ζ₃)` unramified) gives `1 − (−1) = 2`, and
  `ℤ₂[(1 + √−7)/2]` (`ℚ₂(√−7) ≅ ℚ₂ × ℚ₂`, since `−7 ≡ 1 (mod 8)`) gives `1 − 1 = 0`, no embedding.
- (reject) `ℤ₂[2i]` embeds into the valuation ring `O` of the division algebra but never optimally:
  `O` is the set of all integral elements, so every `φ(ℚ₂(i)) ∩ O` contains `φ(ℤ₂[i])`, and
  `Emb(ℤ₂[2i], O) = ∅` while `ℤ₂[i]` has one class.

### 6.3 Local embedding numbers of Eichler orders

For a complete DVR with finite residue field k of cardinality q, and `O = O_0(𝔭^e)`, `e ≥ 1`, with `S = R[γ]`, `f_γ(x) = x² − t_γ x + n_γ`, `d_γ = t_γ² − 4n_γ`:
every optimal embedding is `O^×`-conjugate to a normalized one or its `ϖ`-conjugate
(`[V, 30.6.3, 30.6.8–30.6.9]`), and with `M(s) = {x ∈ R/𝔭^s : f_γ(x) ≡ 0}`,
`m(S,O;O^×) = #M(e)` if `d_γ ∈ R^×` and `#M(e) + #img(M(e+1) → R/𝔭^e)` otherwise
(`[V, 30.6.12]`). Consequences: for `e = 1` and `S` maximal, `m = 1 + (K|𝔭)` (`[V, 30.6.16]`); for
`q` odd, `f = ord_𝔭 d_γ`: `m = 1 + (K|𝔭)` if `f = 0`, and `m = 2q^{(e−1)/2}` or `q^{e/2−1}(q+1)`
according to the parity of `e` when `e < f` (`[V, 30.6.17]`); over `ℤ_2`,
`m(ℤ_2[i], O_0(2^e); O^×) = 1` for `e ≤ 1` and `0` for `e ≥ 2` (`[V, 30.6.14]`). *Needs:*
6.1, 1.8.

Its API:

- The root sets and their reduction images determine the two cases of the local embedding formula.
- The unramified-discriminant case uses roots at exponent e alone; the other case also
  uses the image from exponent e+1, including at residue characteristic two.

**Checks.**

- At p = 3, x²+1 has no roots modulo 3 and discriminant −4 is a unit, so at level 3 the count is 0.
- At p = 3, x²−1 has two roots modulo 3 and unit discriminant 4, giving count 2 for
  the split quadratic order at level 3.
- For ℤ₂[i], x²+1 has one root modulo 2 and none modulo 4 or 8; the counts at levels
  2 and 4 are respectively 1+0 = 1 and 0+0 = 0.


### 6.4 The trace formula

Prove `∑_{[I] ∈ Cls O} m(S, O_L(I); O_L(I)^×) = h(S)·m(Ŝ, Ô; Ô^×)` with `h(S) = # Pic S` and the
adelic embedding number a finite product of local ones (`[V, 30.4.7]`, `[V, 30.7.1]`), hence
`∑_{[I]} m(S,O_L(I);O_L(I)^×) = h(S)∏_{𝔭|𝔑} m(S_𝔭,O_𝔭;O_𝔭^×)` (`[V, 30.7.3]`); for `O` Eichler of
squarefree level `𝔐` and `S` maximal this is `h(S)∏_{𝔭|𝔇}(1 − (K|𝔭))∏_{𝔭|𝔐}(1 + (K|𝔭))`
(`[V, 30.7.5]`). Existence corollary: if `Emb(S_𝔭,O_𝔭) ≠ ∅` for all `𝔭` then some order in the
genus admits an optimal embedding of `S` (`[V, 30.4.18]`). For `F = ℚ`, `h(S)` is
`Nat.card (Pic S)` for Tau Ceti's `NumberFieldOrder`. *Needs:* 6.1–6.3, 3.4, 3.5; GNF
Layer 11 `Pic`.

### 6.5 Embedding numbers over `ℚ` for `ℤ[i]` and `ℤ[ω]`

The signature function `kroneckerProduct` incorporates the conductor-square obstruction; `embeddingNumber_gaussian` and `embeddingNumber_eisenstein` state the indefinite one-class formulas.

For `O` Eichler of level `M` in `B/ℚ` of discriminant `D` (`B` definite or indefinite), with
`ω = (−1 + √−3)/2`, prove the two sums
`∑_{[I]} m(ℤ[i], O_L(I); O_L(I)^×) = ∏_{p|D}(1 − (−4|p))∏_{p|M}(1 + (−4|p))` if `4 ∤ M` and `0` if
`4 | M`, and `∑_{[I]} m(ℤ[ω], O_L(I); O_L(I)^×) = ∏_{p|D}(1 − (−3|p))∏_{p|M}(1 + (−3|p))` if
`9 ∤ M` and `0` if `9 | M` (`[V, 30.7.7]`, with `h(ℤ[i]) = h(ℤ[ω]) = 1`), where `(d|p)` is the
Kronecker symbol: Mathlib's `jacobiSym d p` for `p` odd, and at `p = 2` the value `0, 1, −1`
according as `d` is even, `d ≡ ±1`, `d ≡ ±3 (mod 8)`, so `(−4|2) = 0`, `(−3|2) = −1`, `(−3|3) = 0`
(Mathlib's `jacobiSym d 2` is `legendreSym 2 d ∈ {0, 1}` and is not the symbol at `2`;
`kroneckerSym` in `Suggested.lean` is). When `B` is indefinite the sum has one term
(4.3) and these are `m(ℤ[i],O;O^×)` and `m(ℤ[ω],O;O^×)` (`[V, 39.4.20]`). *Needs:* 6.4,
4.3; completed NFA Layer 1 for the splitting dictionary of `ℚ(i)` and `ℚ(√−3)`.

Its API:

- The Kronecker symbol uses the explicit dyadic rule and the odd-prime quadratic character.
- The product vanishes at the indicated conductor-square level and gives the sum of optimal-embedding counts.

**Checks.**

- At p = 2, the symbols for d = −4 and −3 are 0 and −1; the latter differs from the characteristic-two quadratic character.
- At D = 6, M = 1 the Gaussian and Eisenstein products are both 2.
- At D = 15, M = 4 the Gaussian product is 0 because 4 divides the level; the empty prime-factor convention at level 0 is not used.

### 6.6 The Eichler class number formula

The rational acceptance theorem is `classNumber_eq_mass_add`.

For `B` definite over `ℚ` and `O` Eichler of level `M`, `N = DM`:
`# Cls O = φ(D)ψ(M)/12 + ε₂/4 + ε₃/3`, with `ε₂ = ∏_{p|D}(1 − (−4|p))∏_{p|M}(1 + (−4|p))` if
`4 ∤ N` and `0` otherwise, `ε₃ = ∏_{p|D}(1 − (−3|p))∏_{p|M}(1 + (−3|p))` if `9 ∤ N` and `0`
otherwise (`[V, 30.1.5]`). In general over a totally real `F`,
`# Cls O = mass(Cls O) + (1/2)∑_{q ≥ 2}(1 − 1/q)∑_{[S^×:R^×] = q} h(S)m(Ŝ,Ô;Ô^×)`
(`[V, 30.8.6]`), the inner sum over the quadratic `R`-orders `S` with unit index `q`; the
key lemma is the count of `O^×/R^×` by its maximal cyclic subgroups,
`1 − 1/w_O = (1/2)∑_q(1 − 1/q)∑_{[S^×:R^×]=q} m(S,O;O^×)` (`[V, 30.8.2, 30.8.5]`). *Needs:*
5.2, 5.3, 6.4, 6.5.

### 6.7 Worked class numbers

Check 6.6 against 5.6: `D = 2`: `1/12 + 1/4 + 2/3 = 1`; `D = 11`: `5/6 + 2/4 + 2/3 = 2`; `D = 37`:
`3 + 0 + 0 = 3`; `(D,M) = (2,3)`: `1/3 + 0 + 2/3 = 1`. *Needs:* 6.6.

### 6.8 The type number

The acceptance theorem is `typeNumber_prime` for p ≥ 5, with the quadratic field degree explicitly equal to two.

Define `t(O) = # Typ O` and prove it is `# Cls O` divided out by the action of `Pic_R(O)` on
`Cls O` through two-sided ideals (`[V, 30.9.1]`). Prove Deuring's formula: for `B/ℚ` definite of
prime discriminant `p` and `O` maximal, `t = 1` for `p ∈ {2,3}` and
`t = (1/2)# Cls O + (1/4)[h(−p)] + (1/4)h(−4p)` for `p ≥ 5`, with `[h(−p)] = h(−p)` for
`p ≡ 3 (mod 4)` and `0` otherwise (`[V, 30.9.2]`). Checks: `p = 11`: `1 + 1/4 + 3/4 = 2`;
`p = 37`: `3/2 + 0 + 1/2 = 2`. *Needs:* 3.3, 3.6, 6.6.

Its API:

- The type set is the orbit set of the two-sided-ideal action on ideal classes.
- For prime rational discriminant, the displayed quadratic-order class numbers give its cardinality.

**Checks.**

- For p = 5, h = 1 and h(−20) = 2, so t = 1/2+2/4 = 1.
- For p = 11, h = 2, h(−11) = 1 and h(−44) = 3, so t = 1+1/4+3/4 = 2.
- For p = 37, h = 3 and h(−148) = 2, so t = 3/2+2/4 = 2, strictly smaller than h.

### Examples

For D = 11 the class number is 5/6+2/4+2/3 = 2 and the type number is 1+1/4+3/4 = 2.

### Dependencies

Layers 1, 3 and 5; Layer 4 for indefinite specializations; GlobalNumberFields Layer 11 and its pinned quadratic orders.

## Layer 7: Brandt matrices

`B` is totally definite over `F`, `O` an order with `discrd O = 𝔑` and class number `h`, with
representatives `I_1, …, I_h` and left orders `O_i = O_L(I_i)` (`[V, 41.2.1]`).

### 7.1 Definition

The signature definition `brandtMatrix O reps 𝔫` is the matrix `T(𝔫)` of Conventions for a family
`reps : Fin h → RightIdeal O`: its `(i, j)` entry counts the proper invertible right `O`-ideals
`J ⊆ I_j` with `latticeNrd J = 𝔫 • latticeNrd I_j` in the class of `I_i` (`[V, 41.2.3]`, p. 751).

Define T(𝔫) on the free module of classes and A(𝔫) on functions as in Conventions; prove
that A(𝔫) has matrix T(𝔫)ᵗ in the characteristic-function basis and that `T(𝔫)` does not depend on the
representatives (`[V, 41.2.5]`). Prove the element count
`T(𝔫)_{ij} = #{α ∈ I_jI_i^{-1} : nrd(α)R = 𝔫_{ij}}/O_i^×` with `𝔫_{ij} = 𝔫·nrd(I_j)/nrd(I_i)`, equal to
`(1/w_i)#{α : nrd(α)R = 𝔫_{ij}}/R^×` (`[V, 41.2.7]`). Define the `𝔫`-Brandt graph and prove
`T(𝔫)` is its adjacency matrix (`[V, 41.2.12]`). For `O` Eichler and `𝔫 = 𝔭_v` at a place `v` where
`B` splits and `𝔭_v ∤ 𝔑`, the subideals of `I_j` of norm `𝔭_v nrd(I_j)` are the `v`-neighbours of
Hilbert modular varieties §R18.5.16c, whose Brandt matrix `B(v)` counts in the class of `I_j` the
neighbours of `I_i`: so `T(𝔭_v) = B(v)ᵗ`, `A(𝔭_v)` is its operator on functions, and the
independence of the representatives and the count of `q_v + 1` neighbours at such `𝔭_v` (items
1–2) are consumed. The statements here are for every nonzero integral `𝔫` and every order.
*Needs:* 3.2, 3.5, 3.10; HilbertModularVarietiesAndShimuraCurves §R18.5.16c for the prime case.

Its API:

- Changing ideal representatives preserves the Brandt correspondence and its counts.
- The graph adjacency matrix acts on divisors; its transpose acts on class functions, with the stated element count.

**Checks.**

- `D = 2`: `T(3) = (4)`, `T(5) = (6)`.
- `D = 11`, classes ordered by `w = 2, 3`: `T(2) = [[1,3],[2,0]]`, `T(3) = [[2,3],[2,1]]`,
  `T(5) = [[4,3],[2,3]]`; the operators on class functions are the transposes.
- `D = 37`: `T(2) = [[1,1,1],[1,0,2],[1,2,0]]`.
- (convention) Columns index the source class: the column sums of `T(p)` are `p + 1`, while the row
  sums of `T(2)` for `D = 11` are `4` and `2`.
- (supplier convention) For `D = 11`, the row-indexed matrix of §R18.5.16c is
  `B(2) = T(2)ᵗ = [[1,2],[3,0]]`, with row sums `3, 3`; its weighted symmetry with weights `(2,3)`
  reads `w₂B(2)₁₂ = 3·2 = 6 = w₁B(2)₂₁ = 2·3`, whereas `w₂T(2)₁₂ = 3·3 = 9 ≠ w₁T(2)₂₁ = 2·2 = 4`.

### 7.2 Column sums and multiplicativity

The acceptance theorems `sum_brandtMatrix_col` and `brandtMatrix_mul` state the two parts of
`[V, 41.3.1]` (p. 754) over `𝓞 F` for a totally definite `ℍ[F,a,b]` and a complete set of class
representatives: for `𝔫 ≠ 0` coprime to `discrd O` every column of `T(𝔫)` sums to
`∑_{𝔡 | 𝔫} N𝔡`, and `T(𝔪𝔫) = T(𝔪)T(𝔫)` for coprime nonzero `𝔪, 𝔫`.

Prove the column sums of `T(𝔫)` are constant, equal to `∑_{𝔡|𝔫} N𝔡` for `𝔫` coprime to `𝔑`, and
`T(𝔪𝔫) = T(𝔪)T(𝔫)` for coprime `𝔪, 𝔫` (`[V, 41.3.1]`; at `𝔫 = 𝔭_v` and `O` Eichler the column
sum `q_v + 1` is §R18.5.16c item 2's row sum, consumed); for `𝔭 ∤ 𝔑`,
`T(𝔭^r)T(𝔭^s) = ∑_{i ≤ min(r,s)} N𝔭^i T(𝔭^{r+s−2i})P(𝔭)^i` with `P(𝔭)` the permutation matrix of
`[I] ↦ [I𝔭]` (`[V, 41.3.6]`). *Needs:* 7.1, 3.10; HilbertModularVarietiesAndShimuraCurves
§R18.5.16c.

**Checks.**

- `D = 11`: the column sums of `T(2)`, `T(3)`, `T(5)` are `3`, `4`, `6`.
- `D = 11`: `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]] = T(6)`, with column sums `12 = σ(6)`; on class
  functions it acts by the transpose `[[8,4],[6,6]]`.
- (reject) The row sums are not constant: `4` and `2` for `T(2)`, `D = 11`.
- (coprimality) For the Hurwitz order and `n = 2`, which divides `discrd O = 2`, the only right
  ideal of norm `2` is the two-sided prime over `2`, so `T(2) = (1)`, not `σ(2) = 3`.
- (complete representatives) Listing the class of `I_1` twice for `D = 11`, as `(I_1, I_1, I_2)`,
  counts every `J` in that class twice: the column sums of the resulting `3 × 3` matrix for `n = 2`
  are `1 + 1 + 2 = 4`, `4` and `3 + 3 + 0 = 6`, not `3`.

### 7.3 The Hecke algebra and its semisimplicity

The acceptance theorems `brandtMatrix_commute` and `isSemisimpleRing_adjoin_brandtMatrix` state,
over `𝓞 F` for a totally definite `ℍ[F,a,b]` and a complete set of class representatives, that
`T(𝔪)` and `T(𝔫)` commute for nonzero `𝔪, 𝔫` each coprime to `discrd O` (not necessarily to each
other), and that the `ℚ`-subalgebra of `M_h(ℚ)` generated by the `T(𝔫)` with `𝔫 ≠ 0` coprime to
`discrd O`, which is `𝕋(O) ⊗ ℚ`, is a semisimple ring (Mathlib's `IsSemisimpleRing`).

Define `𝕋(O) ⊆ M_h(ℤ)` generated by the `T(𝔫)` with `𝔫` coprime to `𝔑`; prove it commutative
(`[V, 41.3.6, 41.3.15]`, pp. 755–756; for coprime `𝔪, 𝔫` this is 7.2, and the recursion of 7.2
for `T(𝔭^r)T(𝔭^s)` is symmetric in `r, s`); with the divisor pairing ⟨x,y⟩ = ∑ᵢ wᵢxᵢyᵢ prove T(𝔫)* = P(𝔫⁻¹)T(𝔫). For `O`
Eichler and `𝔫 = 𝔭_v` as in 7.1, the commutativity of two such generators and the adjoint
identity, in the transposed form `w_j B(v)_{ij} = w_i B(v)_{j,s_v(i)}`, are §R18.5.16c items 3–4,
consumed.
On functions use ⟨f,g⟩ = ∑ᵢ f(Iᵢ)g(Iᵢ)/wᵢ and the transpose identity for A(𝔫),
so `T(𝔫)` is normal and self-adjoint for `𝔫` narrowly principal, and `𝕋(O) ⊗ ℚ` is semisimple with
a common eigenbasis and real eigenvalues for narrowly principal `𝔫` (`[V, 41.4.3, 41.4.10]`,
pp. 758–759): commuting operators normal for a positive definite form are simultaneously
diagonalizable over `ℂ`, so `𝕋(O) ⊗ ℂ` is reduced, and a commutative finite-dimensional
`ℚ`-algebra whose complexification is reduced is a product of fields.
*Needs:* 7.2; HilbertModularVarietiesAndShimuraCurves §R18.5.16c; Mathlib `IsSemisimpleRing`,
`Algebra.adjoin`.

Its API:

- The prime-to-discriminant operators generate a commutative algebra.
- The divisor and function pairings have reciprocal weights; the corresponding adjoint identities give normality and rational semisimplicity.

**Checks.**

- For D = 11, T(2)δ₁ = (1,2) on divisors, while A(2)δ₁ = (1,3) on functions.
- With weights (2,3), the off-diagonal divisor pairings are 2·3 = 3·2 = 6; the function pairings are 3/3 = 2/2 = 1.
- In the Hurwitz one-class case w = 12; T(3) = A(3) = (4), but the divisor and function squared basis norms are 12 and 1/12.
- (commutativity) For `D = 11`, `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]]`, and
  `T(4) = T(2)² − 2·P(2) = [[7,3],[2,6]] − 2·1 = [[5,3],[2,4]]`, with column sums `7 = σ(4)`,
  commutes with `T(2)` although `2` and `4` are not coprime.
- (semisimplicity) For `D = 11`, `T(2)` has characteristic polynomial `λ² − λ − 6 = (λ − 3)(λ + 2)`,
  `T(3)` has `λ² − 3λ − 4 = (λ − 4)(λ + 1)` and `T(4)` has `λ² − 9λ + 14 = (λ − 7)(λ − 2)`:
  `ℚ[T(2)] ≅ ℚ × ℚ`. The eigenvalues are `3, 4, 7 = σ(2), σ(3), σ(4)` on one common eigenvector
  and `−2, −1, 2 = a_2, a_3, a_4` of the weight-two newform of level `11` (7.5) on the other.
- (reject) The unipotent matrix `[[1,1],[0,1]]` generates `ℚ[x]/(x − 1)²`, which is not semisimple;
  it is normal for no positive definite form, and the adjoint identity above excludes it.

### 7.4 The Eichler trace formula

Prove: `tr T(𝔫) = 0` unless `𝔫 = nR` is narrowly principal with `n ∈ F^×_{>0}`, and then
`tr T(𝔫) = (1/2)∑_{(u,t,S)} (h(S)/w_S)·m(Ŝ,Ô;Ô^×) + [𝔫 = c²R]·mass(Cls O)`, with `w_S = [S^× : R^×]`
and the sum over the finitely many triples `(u, t, S)`: `u` in a set of representatives of
`R^×_{>0}/R^{×2}`, `t ∈ R` with `t² − 4un ∈ F^×_{<0}`, and `S` ranging over **all** quadratic
`R`-orders `S ⊇ R[x]/(x² − tx + un)` (`[V, 41.5.2]`). Over `ℚ`, for `O` maximal of discriminant `D`
and `n` coprime to `D`: `tr T(n) = ∑_{t² < 4n} h_D(t² − 4n) + [n = □]φ(D)/12`, where for a
discriminant `d' = d_K f² < 0` (`d_K` fundamental)
`h_D(d') = ∑_{g | f, gcd(g, D) = 1} (h(d_K g²)/w(d_K g²))·∏_{p|D}(1 − (d_K|p))`,
with `h(d)` the class number and `w(d) = #S_d^×` the number of units (`4`, `6` or `2`) of the
quadratic order `S_d` of discriminant `d`; the restriction `gcd(g, D) = 1` is the local embedding
number `0` of an order not maximal at a prime of `D` (6.2), so the sum runs over the `S ⊇ ℤ[γ]` with
`m(Ŝ,Ô;Ô^×) ≠ 0` (`[V, 41.5.8–41.5.10]`). The shorthand `h_D(d_K f²) = h_D(d_K)` printed in
`[V, 41.1.13]` drops the orders of conductor prime to `D` and is not this formula: for `D = 2`,
`n = 9` it gives `10`, while `tr T(9) = σ(9) = 13`. Checks for the Hurwitz order: `tr T(3) = 4`
from `t = 0, ±1, ±2, ±3` contributing `1/3, 2, 1, 2/3` (at `t = 0, ±3` the order `ℤ[√−3]` is not
maximal at `2 | D` and only `ℤ[ω]` counts, with weight `1/6`); `tr T(9) = 13` with `t = 0`
contributing `(1 − (−4|2))·(h(−36)/2 + h(−4)/4) = 5/4` and `t = ±3` contributing
`(1 − (−3|2))·(h(−27)/2 + h(−3)/6) = 4/3` each. *Needs:* 7.1, 6.2, 6.4, 5.2.

**Checks.**

- Hurwitz order, `n = 3`: `tr T(3) = 4`, from `t = 0, ±1, ±2, ±3` contributing `1/3, 2, 1, 2/3`.
- Hurwitz order, `n = 9`: `tr T(9) = 13 = σ(9)`, with `t = 0` contributing `5/4` and `t = ±3`
  contributing `4/3` each.
- (reject) The shorthand `h_D(d_K f²) = h_D(d_K)` gives `10` for `D = 2`, `n = 9`, not `13`.
- (boundary) The mass term `φ(2)/12 = 1/12` enters for `n = 9` and not for `n = 3`.

### 7.5 The interface to quaternionic modular forms and to the LMFDB

Under 3.4's class-set bijection, identify A(𝔫) with the sum of the Hecke correspondences
having the local elementary-divisor types of proper subideals of norm 𝔫. A norm ideal alone
does not specify one double coset. With U = Ôˣ, a right-coset correspondence UηU acts by
f(x) ↦ ∑ f(xηᵢ); GL₂ transfer R17.3.8d uses the inverse convention, so this is
its T(η⁻¹). At a split prime outside discrd(O), the type diag(ϖ,1) gives A(𝔭).
The integral divisor matrix is T(𝔭); compare its transpose with the function operator of
Hilbert modular varieties R18.5.17a ([V, 41.2.3–41.2.7], pp. 751–752).

For a totally real field F and a cuspidal representation π of parallel weight two, choose a
totally definite quaternion algebra B such that πᵥ is discrete series at each finite ramified
place. Global Jacquet–Langlands identifies π's transfer and its invariant vectors at a compact
open U = ∏ Uᵥ, with the local invariant spaces specified at every place, including ramified
places (GL₂ transfer R17.3.1, R17.3.3, R17.3.9; Dembélé–Voight, arXiv:1010.5727v2, Theorem 3.9 and Remark 3.10, pp. 11–12).
For squarefree conductor 𝔑 and squarefree discriminant 𝔇 dividing 𝔑, with the required parity
of all ramified places, the Eichler level is 𝔑/𝔇 and is coprime to 𝔇.
For general conductor exponents retain the transferred local representation and Uᵥ-invariants;
the Eichler-order model applies precisely to its Ôᵥˣ-invariants, and is not asserted to realize
every ramified local type. Identify the cuspidal subspace as the orthogonal complement of
all forms factoring through reduced norm, including nontrivial norm characters.
*Needs:* 7.1, 3.4; GL2AutomorphicRepresentationsAndTransfer R17.3 and R17.3.8d; HilbertModularVarietiesAndShimuraCurves R18.5.17a.

**Checks.**

- In the Hurwitz case η = 3 is central, so its single double coset acts by 1; T(9) = (13).
- At 3, the primitive type diag(9,1) contributes 12 and the central type diag(3,3) contributes 1, giving 12 + 1 = 13. At norm 3 there is one type with 4 right cosets.
- A rational weight-two newform of level 11 transfers to D = 11 and Eichler level 1, never level 11: gcd(11,1) = 1, while gcd(11,11) = 11. The class-function space has dimension two and its cuspidal complement dimension one.

### 7.6 Worked Brandt matrices

Prove: `D = 2`: `T(3) = (4)`, `T(5) = (6)`; `D = 11`: `T(2) = [[1,3],[2,0]]`, `T(3) = [[2,3],[2,1]]`,
`T(5) = [[4,3],[2,3]]` in the ordering of classes by `w = 2, 3` (so `w_1 = 2`, `w_2 = 3`, the
columns sum to `p + 1`, and `w_i T_{ij} = w_j T_{ji}` as 7.3 requires; the transposes, with row
sums `p + 1`, are the operators on class functions); `D = 37`:
`T(2) = [[1,1,1],[1,0,2],[1,2,0]]`; `(D,M) = (2,3)`: `T(5) = (6)`, `T(7) = (8)`. *Needs:*
7.1, 5.6.

### 7.7 Theta series of ideals

The acceptance theorem `exists_modularForm_qExpansion_brandtMatrix` states the case below: for
`O` Eichler and any two proper invertible right ideals `I_i, I_j`, there is a modular form of weight
`2` on `Γ₀(DM)` with `q`-expansion `1/#O_L(I_i)^× + ∑_{n ≥ 1} T(n)_{ij}qⁿ` (Mathlib's
`ModularForm` and `UpperHalfPlane.qExpansion` with period `1`).

For `B/ℚ` definite, `O` Eichler of level `M`, and invertible right ideals `I_i, I_j`, the lattice
`L_{ij} = I_jI_i^{-1}` with the quadratic form `nrd/nrd(L_{ij})` is an even positive-definite
lattice of rank `4` with `det = (DM)²` and level `DM`, and
`∑_{n ≥ 0} (2w_i)^{-1}·r_{L_{ij}}(2n) q^n = (1/2w_i)Θ_{L_{ij}}(τ)` has `n`-th coefficient `T(n)_{ij}`
for `n ≥ 1` and constant term `1/(2w_i)`; by theta series Layer 7 (`Θ_L ∈ M_k(Γ₀(N),χ_L)`) it is a
modular form of weight `2` on `Γ₀(DM)` with trivial character. *Needs:* 7.1, 3.1; theta
series Layer 7.

Its API:

- The norm scaling makes the ideal lattice integral with the stated determinant and level.
- The weighted theta coefficients at positive indices recover the Brandt entries by the
  element count of §7.1 ([V, 41.2.7], p. 752); its constant term is the reciprocal unit count.
- The theta-series supplier gives weight two and the trivial character for this lattice.

**Checks.**

- For Hurwitz, w = 12 and the norm-one elements are its 24 units: the coefficient is
  24/(2·12) = 1, agreeing with T(1).
- Its norm-three count is 96, giving 96/24 = 4 = T(3); its constant term is 1/24.
- At D = 11 the two diagonal theta series have constant terms 1/4 and 1/6, while their
  coefficients at 1 both equal 1; using reciprocal weights 1/w would double all three values.


### Examples

For D = 11, T(2) = [[1,3],[2,0]] on divisors and its transpose acts on functions.

### Dependencies

Layers 3, 5 and 6; GL2AutomorphicRepresentationsAndTransfer R17.3 and R17.3.8d; HilbertModularVarietiesAndShimuraCurves §R18.5.16c (the prime-to-level Brandt matrices of Eichler orders in 7.1–7.3) and R18.5.17a; ThetaSeries Layer 7.

## Layer 8: Shimura curves `X_0(D;N)` over `ℚ`

`B = ℍ[ℚ,a,b]` is indefinite of discriminant `D > 1`, `O` an Eichler order of level `N`, and
`ι_∞ : B → M₂(ℝ)` a real splitting. The index, area and elliptic-point statements of 8.2–8.3 hold
for `D = 1` as well, where `Γ¹(O)` is conjugate to the image of `Γ₀(N)` and they are the classical
values; the curves `X_0(1;N)` themselves, which have cusps, are the modular-forms roadmap's.

### 8.1 The arithmetic Fuchsian group

A real splitting `ι_∞ : B → M₂(ℝ)` is ArithmeticFuchsianGroups §1.1's `RealSplitting ℚ a b` with
`place` the inclusion `ℚ → ℝ` (the condition at the other real places is empty), and one exists
exactly when `B` is indefinite (0.5), consumed; so are `det(ι_∞ x) = nrd x` and the fact that two
real splittings differ by conjugation in `GL₂(ℝ)`, so that every invariant of Layers 8–9 is
independent of `ι_∞`. Define `Γ¹(O) ≤ PSL₂(ℝ)` as the image of `O¹`: it is that roadmap's
`Γ(O) = normOneImage ι_∞ O`, for `O` read as an `𝓞_ℚ`-order through `Rat.ringOfIntegersEquiv`.
The signature definition `gammaOne ι O` takes for `ι` any `ℚ`-algebra map `B → M₂(ℝ)`: it extends
to an isomorphism `B ⊗ ℝ ≃ M₂(ℝ)`, so it exists exactly when `B` is indefinite and satisfies
`det ∘ ι = nrd`, and `gammaOne ι O` is the subgroup generated by the images of `O¹`. Its
discreteness and finite covolume (`isCofinite_normOneImage`), its cocompactness exactly when `B`
is division (`cocompact_normOneImage_iff_anisotropic`; `B` is division iff `D > 1`, 0.4 and 0.5)
and the finiteness of `[Γ¹(O) : Γ¹(O')]` for `O' ⊆ O` (§1.2) are consumed. Prove here the
`ℚ`-specific comparison: the kernel of `O¹ → PSL₂(ℝ)` is `{±1}`, so `Γ¹(O) ≅ O¹/{±1}`, and
`Γ¹(O)` is the subgroup generated by the images of `O¹`, as the supplier defines it.
*Needs:* 0.4, 0.5, 1.2; ArithmeticFuchsianGroups §§1.1–1.2; Tau Ceti `Fuchsian/Covolume`.

Its API:

- The real embedding identifies O¹/{±1} with the effective Fuchsian group.
- Order inclusion gives finite-index subgroup inclusion; the division hypothesis makes the quotient compact.

**Checks.**

- (reject) `ℍ[ℚ,-1,-1]` is definite and has no real splitting (9.10).
- `ℍ[ℚ,3,-1]`: `i ↦ [[√3,0],[0,−√3]]`, `j ↦ [[0,1],[−1,0]]` is a real splitting, with
  `ι(i)² = 3`, `ι(j)² = −1`, `ι(j)ι(i) = −ι(i)ι(j)`, `det ι(i) = −3 = nrd i` and
  `det ι(j) = 1 = nrd j`.
- (boundary) For `D = 1` (`ℍ[ℚ,1,7]`, `ℍ[ℚ,5,5]`) the group of a maximal order is conjugate to
  `PSL₂(ℤ)`, which has cusps: the compactness clause needs `D > 1`.
- `−1 ∈ O¹` maps to the identity of `PSL₂(ℝ)`, so `Γ¹(O) ≅ O¹/{±1}` and not `O¹`.

### 8.2 Index and area

The acceptance theorem `relindex_normOne_eq_psi` states the norm-one subgroup index with the smaller subgroup as the first relative-index argument, and `covolume_gammaOne` states the area: the covolume of `gammaOne ι O` for Mathlib's `volume` on `UpperHalfPlane` is `(π/3)φ(D)ψ(N)` for every Eichler order `O`.

Prove `[Γ¹(O(1)) : Γ¹_0(D;N)] = ψ(N)` for a maximal `O(1) ⊇ O`, from 4.3 (surjectivity of
`O(1)¹ → (O(1)/NO(1))¹`) and the local index of 1.9. The area of the maximal-order quotient is
ArithmeticFuchsianGroups §1.2's covolume formula at `k = ℚ`, consumed: with `d_ℚ = 1`, `n = 1`,
`ζ_ℚ(2) = ζ(2) = π²/6` (Mathlib `riemannZeta_two`) and `∏_{p | D}(p − 1) = φ(D)` for squarefree `D`,
`area(Γ¹(O(1))\ℍ) = 8π·(π²/6)/(4π²)·φ(D) = (π/3)φ(D)`; the identification of Mathlib's
`dedekindZeta ℚ` with `riemannZeta` is proved here from their Dirichlet series, the ideals of `ℤ`
being the positive integers. Finite-index scaling (§1.2 of the same roadmap, through Tau Ceti's
`MeasureTheory.covolume_eq_card_mul_covolume`) with the index `ψ(N)` gives
`area(X₀(D;N)) = (π/3)φ(D)ψ(N)` (`[V, 39.1.2, 39.1.13]`; Theorem 39.1.2 includes `D = 1`).
*Needs:* 8.1, 1.9, 4.3; ArithmeticFuchsianGroups §1.2; FuchsianOrbifolds Layer 2 item 1
(covolume); Tau Ceti `MeasureTheory.covolume_eq_card_mul_covolume`; Mathlib
`riemannZeta_two` in `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` for `ζ(2) = π²/6` and
`NumberField.dedekindZeta`.

**Checks.**

- `area(X_0(6;1)) = 2π/3`.
- `area(X_0(6;5)) = (π/3)·2·6 = 4π`, with `ψ(5) = 6`.
- (boundary) `D = 1`, `N = 1`: `Γ¹(M₂(ℤ))` is `PSL₂(ℤ)`, of covolume `π/3 = (π/3)φ(1)ψ(1)`; at
  `N = 2` the image of `Γ₀(2)` has covolume `π = (π/3)·ψ(2)`.
- (reject) For `B` definite the index formula fails: in `ℍ[ℚ,-1,-1]` the Eichler orders of level
  `7` have `[O(1)¹ : O¹] = 4 ≠ ψ(7) = 8`.

### 8.3 Elliptic points are embedding numbers

The signature definition `ellipticCount Γ q` is `ν_q(Γ)` of Conventions, the number of `Γ`-orbits
in `ℍ` whose stabilizer has order `q`; `ellipticCount_gammaOne_two` and
`ellipticCount_gammaOne_three` state `ν₂(Γ¹(O)) = m(ℤ[i],O;O^×)` and `ν₃(Γ¹(O)) = m(ℤ[ω],O;O^×)`
for every Eichler order `O`.

Prove that a point `τ ∈ ℍ` with stabilizer of order `q ≥ 2` in `Γ¹(O)` gives a maximal finite
cyclic subgroup `⟨γ⟩ ≤ O¹` of order `2q`, that `ℚ(γ) = ℚ(ζ_{2q})` is imaginary quadratic (so
`q ∈ {2, 3}` over `ℚ`), and that `γ ↦ (S = ℚ(γ) ∩ O, φ_γ)` induces a two-to-one map from the
`O¹`-classes of optimal embeddings with `#S^×_{tors} = 2q` onto the elliptic orbits of order `q`
(`[V, 39.4.3–39.4.4]`). Hence `ν_q(Γ¹(O)) = (1/2)∑_S m(S,O;O¹)` and, by 6.1 and 4.4,
`ν₂(Γ¹(O)) = m(ℤ[i],O;O^×)`, `ν₃(Γ¹(O)) = m(ℤ[ω],O;O^×)`, `ν_q = 0` for `q ∉ {2,3}`; with 6.5 these
are the LMFDB's `nu2`, `nu3` of `X(D,M;1)`. *Needs:* 8.1, 6.1, 6.5, 4.4; Tau Ceti
`Fuchsian/Stabilizer`, `UpperHalfPlane/PSL/Action`.

**Checks.**

- `X_0(6;1)`: `ν₂ = ν₃ = 2`.
- `X_0(10;1)`: `ν₂ = 0`, `ν₃ = 4`.
- `X_0(6;5)`: `ν₂ = 4`, `ν₃ = 0`; X₀(15;4): ν₂ = ν₃ = 0 and genus 5; (D,N) = (6,4) is inadmissible since gcd(6,4) = 2.
- (boundary) `D = 1`, `N = 1`: `PSL₂(ℤ)` has `ν₂ = ν₃ = 1`, the orbits of `i` and of
  `ρ = e^{2πi/3}`, and `m(ℤ[i], M₂(ℤ); GL₂(ℤ)) = m(ℤ[ω], M₂(ℤ); GL₂(ℤ)) = 1`, the empty products of
  6.5; the `O¹`-count `m(ℤ[i], M₂(ℤ); SL₂(ℤ)) = 2` would double `ν₂`.
- (reject) `ν_q(Γ¹(O)) = 0` for `q ∉ {2, 3}`: stabilizers of order `4` and `6` occur only in larger
  groups (8.7).

### 8.4 The genus formula

Let `X_0(D;N) = Γ¹_0(D;N)\ℍ`, a compact Riemann surface (Tau Ceti `Fuchsian/CoarseQuotient`,
equal to its compactification since there are no cusps). Prove, from Fuchsian orbifolds' orbifold
Euler characteristic formula (Layer 4.5, 5.6) with 8.2 and 8.3,
`g(X_0(D;N)) = 1 + φ(D)ψ(N)/12 − ν₂/4 − ν₃/3` (`[V, 39.4.20]`). The acceptance theorem
`eulerChar_compactifiedQuotient_gammaOne` states it for the Euler characteristic `χ = 2 − 2g` of
`Subgroup.CompactifiedQuotient (gammaOne ι O)`, the genus of Fuchsian orbifolds Layer 5 item 1:
`χ = −φ(D)ψ(N)/6 + ν₂/2 + 2ν₃/3` with `ν₂, ν₃` the Kronecker products of 6.5, for `D > 1`. Its two
instance hypotheses are the ones the carriers require: `Γ¹(O)` is discrete, which defines the
topology of the compactified quotient and is ArithmeticFuchsianGroups §1.1's theorem; and the
compactified quotient has finite CW type, which every compact surface has (the finite CW model
consumed by Fuchsian orbifolds Layer 5 item 1). *Needs:* 8.2, 8.3, 6.5;
ArithmeticFuchsianGroups §1.1; FO Layers 1, 4, 5; Tau Ceti `TauCeti.eulerChar`,
`TauCeti.FiniteCWType`.

**Checks.**

- `g(X_0(6;1)) = 0` (`ν₂ = ν₃ = 2`), `g(X_0(10;1)) = 0` (`ν₂ = 0`, `ν₃ = 4`).
- `g(X_0(14;1)) = 1`, `g(X_0(26;1)) = 2`, `g(X_0(35;1)) = 3`.
- `g(X_0(6;5)) = 1` (`ν₂ = 4`), `g(X_0(6;11)) = 3`; in Euler-characteristic form
  `χ(X_0(6;5)) = −12/6 + 4/2 + 0 = 0` and `χ(X_0(15;4)) = −48/6 + 0 + 0 = −8`, genus `5`.
- (reject) For `D = 1`, `N = 1` the compactified quotient `X(1)` has `χ = 2`, while the formula gives
  `−1/6 + 1/2 + 2/3 = 1`: its cusp contributes the missing `1`, so the theorem needs `D > 1`.

### 8.5 Atkin–Lehner involutions

For `m ∥ DN` let `w_m ∈ N^+_{B^×}(O)` have norm `m` (4.6). Prove `w_m` normalizes `Γ¹(O)`, acts on
`X_0(D;N)` with square the identity (and has order two when m > 1), that `m ↦ w_m` is an isomorphism `(ℤ/2)^{ω(DN)} → N^+/(ℚ^×O¹) =: W`,
and define `Γ⁺(O) = ι_∞(N^+)ℝ^×/ℝ^×`, so `Γ⁺(O)/Γ¹(O) ≅ W` and `X_0^*(D;N) = Γ⁺(O)\ℍ = X_0(D;N)/W`.
For a subgroup `W' ≤ W`, define `Γ_{W'}` and `X_0(D;N)/W'`. The group structure is
`[V, 28.9.10, 28.9.17]` (pp. 485–486): for `O` Eichler of reduced discriminant `𝔑` the two-sided
ideals modulo those of `R` form `∏_{𝔭 | 𝔑} ℤ/2ℤ`, and for `B` indefinite `N_{B^×}(O)/ℚ^×O^×` is
that group (`Cl ℤ = 1`), equal to `N^+/(ℚ^×O¹)` because `O` has a unit of norm `−1` (4.4); at
`D = 6` the involutions are the `w₂, w₃, w₆` of positive norm of `[V, 43.2.15]` (p. 789).
*Needs:* 4.5, 4.6, 8.1.

Its API:

- Hall-divisor multiplication gives the normalizer quotient W, and m = 1 is its identity.
- Intermediate subgroups give intermediate curve quotients, including the full normalizer quotient.

**Checks.**

- `D = 6`, `N = 1`: `Γ⁺(O)/Γ¹(O) ≅ (ℤ/2)²`, of order `4 = 2^ω(6)`.
- `X_0^*(6;1)` has genus `0`, and so does each `X_0(6;1)/⟨w_m⟩` (8.6).
- (reject) The normalizer contains a unit of norm `−1` (4.4), whose image has negative
  determinant; `Γ⁺(O)` is built from the positive-norm part only.

### 8.6 Fixed points of Atkin–Lehner involutions

Assume m ∥ DN and m > 1 throughout this subsection. Prove that the fixed points of `w_m` on `X_0(D;N)` are the images of the fixed points in `ℍ` of
the elliptic elements `γ ∈ ℚ^× w_m O¹` (those with `ℚ(γ)` imaginary quadratic). Scale such a `γ`
into `O` with `nrd γ = m`, `trd γ = t`, `t² < 4m`; at a division prime dividing m its trace is divisible by p, and at a level prime pᵉ ∥ m the local coset representative [[0,1],[pᵉ,0]] times a unit of O₀(pᵉ) has trace divisible by pᵉ, so `m | t`,
so `t = 0` (`γ² = −m`), or `m = 2`, `t = ±2` (`γ = 1 ± i'`, `i'² = −1`), or `m = 3`, `t = ±3`
(`γ = 1 + ζ`, `ζ` a primitive sixth root of unity, `ℚ(γ) = ℚ(√−3)`). Prove that
`γ ↦ (S = ℚ(γ) ∩ O, φ_γ)` is two-to-one, exactly as in 8.3 (`φ_γ` and its conjugate `φ̄_γ` fix the
same point and are never `O¹`-conjugate for `D > 1`), from the `O¹`-classes of optimal embeddings
`φ` with `φ(K^×) ∩ ℚ^× w_m O¹ ≠ ∅` onto `Fix(w_m)`. For `N = 1` every `γ ∈ O` with `nrd γ = m ∥ D`
normalizes `O` (`Oγ` is two-sided: at `p | m` every one-sided ideal of the local division order
is two-sided, at `p ∤ m` `γ_p` is a unit), so with 6.1 and 4.4
`# Fix(w_m) = ∑_S m(S,O;O^×)`, proved here by this route from 8.3 and 6.1–6.4, the sum over `S = ℤ[√−m]`, `S = ℤ[(1+√−m)/2]` when `m ≡ 3 (mod 4)`,
and additionally `S = ℤ[i]` when `m = 2` (for `m = 3` the order `ℤ[ω] = ℤ[(1+√−3)/2]` is the second
order already), where by 6.4 and `# Cls O = 1` each `m(S,O;O^×) = h(S)∏_{p|D} m_p(S)` with
`m_p(S) = 1 − (K|p)` if `S_p` is the maximal order of `K_p` and `m_p(S) = 0` otherwise (6.2). For
squarefree `N` the same sum holds with the factors of 6.3 at `p | N` (an element `γ ∈ O` with
`γ² = −m` and `p | m`, `p ∥ N`, lies in `rad O_p`, hence normalizes); when `p² | N` the embeddings
whose image does not meet `ℚ^× w_m O¹` must be excluded, and the theorem is the count over that
subset. By Riemann–Hurwitz (FO Layer 5.3)
`g(X_0(D;N)/⟨w_m⟩) = (1/2)(g(X_0(D;N)) + 1 − # Fix(w_m)/2)`; iterate for `W'`. Checks on
`X_0(6;1)`: `# Fix(w_2) = m(ℤ[i],O;O^×) = (1 − (−4|2))(1 − (−4|3)) = 2` and `ℤ[√−2]` contributes
`h(−8)(1 − (−8|3)) = 0`; `# Fix(w_3) = m(ℤ[ω],O;O^×) = (1 − (−3|2))(1 − (−3|3)) = 2` and `ℤ[√−3]`,
not maximal at `2 | D`, contributes `0`; `# Fix(w_6) = h(−24) = 2`; so each quotient
`X_0(6;1)/⟨w_m⟩` has genus `(1/2)(0 + 1 − 1) = 0`, and `−2 = 4(2g^* − 2) + 6` gives
`g(X_0^*(6;1)) = 0`. *Needs:* 8.3–8.5, 6.1–6.4.

**Checks.**

- At D = 6, N = 1, m = 1, w₁ is the identity: its fixed locus is the entire curve,
  the quotient map has degree 1 and the genus remains 0. The embedding sum 2 is not its fixed count.
- At m = 1 the traces ±1 satisfy t² < 4m, so the trace enumeration above also requires m > 1.
- At m = 2, 3, 6 the fixed counts are 2, 2, 2 and the degree-two quotient genera are all 0.

### 8.7 Elliptic points of `Γ⁺` and of intermediate groups

For `Γ¹(O) ≤ Γ' ≤ Γ⁺(O)`, prove that the stabilizer orders of `Γ'` lie in `{2, 3, 4, 6}`
(an element of `N^+` with `γ² ∈ ℚ` has order `2` in `PSL₂(ℝ)`; `1 + i`, `1 + ζ₆` have orders `4`
and `6`), and compute `ν_q(Γ')` from the embedding numbers of the orders `ℤ[√−m]`,
`ℤ[(1+√−m)/2]`, `ℤ[i]`, `ℤ[ω]` through the orbit–stabilizer relation with `Γ¹(O)` (the elliptic
ramification indices of Tau Ceti `Fuchsian/Elliptic/Ramification`). These are proved here: an
element `γ` of finite order in `Γ'` generates an imaginary quadratic field `K = ℚ(γ)`, and
`[x] ↦ x/x̄` embeds the torsion of `K^×/ℚ^×` into the roots of unity of `K`, of orders `2`, `4` or
`6`, which bounds the stabilizer orders; the counts follow from 8.3 and 8.6 by orbit–stabilizer.
*Needs:* 8.3, 8.5, 8.6.

### 8.8 The curves as canonical models

Record the comparison: the complex points of Hilbert modular varieties R18.1.3's canonical curve
`Sh_U(G_B, X_B)` for `U = Ô^×` are `B^×_{>0}\(ℍ × B̂^×)/Ô^×`, which by 4.3 (`B̂^× = B^×Ô^×` up to
norms, class number one) is `Γ¹(O)\ℍ` when restricted to the component of the identity, with
`φ(1) = 1` component. This identifies `X_0(D;N)` with that curve's complex points; nothing about
the field of definition is proved here. *Needs:* 8.1, 4.3; R18.1.3.

### 8.9 CM points as embeddings

For a subgroup `Γ¹(O) ≤ Γ ≤ Γ⁺(O)` (the image of `O¹ ≤ Γ̃ ≤ N^+_{B^×}(O)`) and an imaginary
quadratic order `S` of discriminant `d < 0`, define the **CM points of discriminant `d`** on
`Γ\ℍ` as the image of the fixed points in `ℍ` of `ι_∞(φ(K^×))` for `φ ∈ Emb(S,O)`, and prove they
are in bijection with Emb(S,O;Γ̃) modulo precomposition by complex conjugation.
Since Γ has positive determinant, the two orientations are distinct embedding classes and
the geometric count is m(S,O;Γ̃)/2 ([V, 39.4.3–39.4.13], pp. 723–725).
Prove Emb(S,O) is nonempty iff there are optimal local embeddings at every finite prime:
at p dividing D the field must not split and Sₚ must be maximal (6.2), and at p dividing M
the full local conditions of 6.3 must hold (6.4's existence
corollary with `# Cls O = 1`). The elliptic points of 8.3 and 8.7 are the CM points of
discriminants `−4`, `−3`, `−4m`, `−m`. *Needs:* 6.1–6.4, 8.1, 8.5, 8.7.

Its API:

- An optimal embedding and its complex conjugate determine the same CM point.
- Positive-determinant conjugation keeps their two orientations distinct; the point count is half the oriented embedding count.

**Checks.**

- At D = 6, M = 1 and S = ℤ[i], m(S,O;Oˣ) = 2 and m(S,O;O¹) = 4; there are 4/2 = 2 geometric CM points.
- The two embeddings i ↦ j and i ↦ −j fix the same upper-half-plane point, but have opposite orientations.
- ℤ[2i] is not maximal at the ramified prime 2 and has no optimal embedding into O₆, although ℚ(i) embeds and the level is one.

### Examples

X₀(6;1) has area 2π/3 and genus zero; X₀(15;4) has genus five.

### Dependencies

Layers 4 and 6; ArithmeticFuchsianGroups §§1.1–1.2; FuchsianOrbifolds Layers 1, 2, 4 and 5; HilbertModularVarietiesAndShimuraCurves R18.1; Tau Ceti `MeasureTheory.covolume_eq_card_mul_covolume`, `TauCeti.eulerChar`.

## Layer 9: polarized orders, `Aut_{±μ}(O)`, enhanced groups and the curves `X_H`

`B/ℚ` is indefinite with `D > 1`, `O` an Eichler order of level `M` (so `discrd O = DM`), and
`ι_∞` fixed. Everything in this layer is an invariant of the isomorphism class of `(O, μ, H)`.

### 9.1 Polarizations and their degree

Define `IsPolarization O μ` and `deg μ` as pinned. Prove: `deg μ` is well defined
(`nrd(μ)/discrd(O) ∈ ℚ_{>0}`); `deg(cμ) = deg μ` for `c ∈ ℚ^×` whenever cμ is also a polarization; `deg μ = 1` iff
`μ² ∈ −discrd(O)·(ℚ^×)²`; a polarization of degree `δ` exists iff `ℚ(√−δ·DM)` embeds in `B`, iff
no prime `p | D` splits in `ℚ(√−δDM)` (0.6, 6.1); in particular `exists_principal_polarization` states that every maximal order in an
indefinite rational algebra (including the split algebra) has a principal polarization μ ∈ O with μ² = −D (`[V, 43.6.6]`); for such a principal polarization, `μ ∈ D·O^♯` (`[V, 43.6.7]`). Prove that
for `δ | DM` squarefree, whenever a degree-`δ` polarization exists, it can be chosen in `O` with `μ² = −δ·DM`;
then `nrd(μ)/discrd(O) = δ` is an integer, the normalization in which the LMFDB knowl
`shimcurve.nrdmu` reads the degree as the squarefree part of the integer `nrd(μ)/discrd(O)` (for
`D = 6`, `δ = 2`: `μ² = −12` and `12/6 = 2`).
Isomorphism of polarized orders is conjugation by `N_{B^×}(O)` carrying `μ ↦ μ'` (`[V, 43.6.5]`).
Prove that, with `μ` normalized by `μ² = −δ·DM`, the isomorphism classes of polarized orders
`(O, μ)` of degree `δ` with `O` fixed are the orbits of `N_{B^×}(O)/ℚ^×O^×` (4.5) on
`⊔_S Emb(S, O; O^×)`, `S` ranging over the orders of `ℚ(√−δDM)` containing `ℤ[√−δDM]`, the
stabilizer of an embedding class e being the image Wₑ of Autμₑ(O) in
W = N(O)/(ℚˣOˣ), where μₑ is the image of √−δDM under a representative of e, so that their number is
`(1/2^{ω(DM)}) ∑_S ∑_{e ∈ Emb(S,O;O^×)} #Wₑ`.
A constant factor can be taken outside the sum only if these image cardinalities are constant;
#Wₑ equals #Autμₑ(O) only if its intersection with the image of Oˣ in N(O)/ℚˣ is trivial.
This is the orbit–stabilizer formula for the conjugation action ([V, 43.6.5], p. 802),
and `μ ↦ −μ` identifies two classes exactly in the twisted case (9.2); in the untwisted case the two sign classes remain distinct. The classes of
`(O, ±μ)` are the LMFDB's objects. *Needs:* 1.4, 1.10, 6.1, 6.4, 4.5; 0.6.

Its API:

- Scaling by a nonzero rational number preserves degree whenever the scaled element is a polarization.
- Degree is the positive squarefree representative of the norm/discriminant square class; principal integral polarizations exist for maximal indefinite rational orders.
- Normalizer conjugacy classifies normalized polarizations through the stabilizer-image orbit formula.

**Checks.**

- `μ = i + 3j ∈ ℍ[ℚ,3,-1]` has `μ² = −6`, and `trd(μx)` is `0, 6, −6, 0` on the basis
  `1, i, j, (1+i+j+k)/2` of `O_6`, so `μ` is a polarization of `O_6` with `nrd μ = 6 = discrd O_6`
  and degree `1`.
- At D = 21, δ = 21, μ = 21i′ with optimal ℤ[i′] ⊆ O, Autμ has order 2 but i′ is
  an integral unit, so #Wₑ = 1. The four Gaussian embedding classes give 4·1/4 = 1 orbit;
  using the full stabilizer order would give 2. Orders of conductor 3, 7 or 21 have zero
  local embedding count at a division prime.
- At D = 6, δ = 1, the two embedding classes have #Wₑ = 2, giving 2·2/4 = 1 orbit.
- `D = 6`: degree `2` has `nrd μ = 3`, degree `6` has `nrd μ = 1`.
- (reject) The degree is the squarefree representative of the square class, not the quotient: for
  degree `2`, `nrd μ / discrd O = 1/2`.
- (invariance) `2μ = 2i + 6j` has `nrd = 24` and `24/6 = 4 ∈ (ℚ^×)²`, degree `1` again.

### 9.2 `Aut_μ(O)` and `Aut_{±μ}(O)`

In the signatures `scalars` is the central scalar subgroup, `ConjugatesPmMu` is the sign-preserving predicate and `autPmMu` its image subgroup. The theorem `card_autPmMu_general` allows the smaller groups; `card_autPmMu` additionally assumes that μ normalizes O. Both carry the division and indefiniteness hypotheses explicitly.

Define both as pinned, as subgroups of `N_{B^×}(O)/ℚ^×`. Prove: `Aut_μ(O) = (ℚ(μ)^× ∩ N_{B^×}(O))/ℚ^×`
is finite cyclic of order 1, 2, 3, 4 or 6 (`[x] ↦ x/x̄` embeds the torsion of `ℚ(μ)^×/ℚ^×` into
the roots of unity of the imaginary quadratic field `ℚ(μ)`). When μ normalizes O it contains [μ] of order two,
so its order is then 2, 4 or 6; it has order
`4` only if `ℚ(μ) ≅ ℚ(i)` (then generated by the class of an element `1 + i'` with `i'² = −1`
normalizing `O`), of order `6` only if `ℚ(μ) ≅ ℚ(√−3)` (generated by `1 + ζ₆`);
`[Aut_{±μ}(O) : Aut_μ(O)] ≤ 2`, with equality iff there is `χ ∈ N_{B^×}(O)` with `χμ = −μχ`
(**twisting**; such a `χ ∈ O` with `χ² + nrd χ = 0` is a twist of `(O, μ)` in Rotger, *Modular
Shimura varieties and forgetful maps*, §4, pp. 9–10, and conjugation by `N_{B^×}(O)` gives the
isomorphisms of polarized orders, `[V, 43.6.5]`, p. 802), and then
Aut±μ(O) is the semidirect product of that cyclic subgroup with a group of order two
acting by inversion, hence has order 2, 4, 6, 8 or 12 in the twisted case. Without twisting
it equals Aut_μ(O). Thus in general its cardinality lies in {1,2,3,4,6,8,12}; under the
additional hypothesis μ ∈ N(O) it lies in {2,4,6,8,12}; `Aut_{±μ}(O)` is finite because
`N_{B^×}(O)/(ℚ^×O^×)` is finite (4.5) and `O^× ∩ ℚ(μ)` is finite. Prove the twisting criterion:
`χ` exists iff the binary form `−nrd` on the rank-two lattice `{v ∈ O : μv = −vμ}` (positive
definite: `B` is indefinite and `nrd μ > 0`, so `nrd` is negative definite on `μ^⊥`) represents a
Hall divisor `m ∥ DM`, `m > 1`, by an element of `N_{B^×}(O)`; a primitive normalizing `χ` has
`nrd χ = −m` for such an `m` (its right ideal is two-sided), `m = 1` is impossible (`χ² = 1` is a
zero divisor), and for `O` maximal every `χ ∈ O` with `nrd χ = −m`, `m ∥ D`, normalizes `O` (8.6).
*Needs:* 9.1, 4.5, 1.2.

Its API:

- The centralizing group is cyclic with the stated possible orders; a normalizing μ contributes an element of order two.
- A sign-reversing normalizer gives the index-two extension and acts by inversion; the binary norm criterion detects its existence.

**Checks.**

- In O₆, μ = i+4j has μ² = −13 and integral trace pairings (0,6,−8,−1); at the split maximal prime 13 its norm has odd valuation, so μ does not normalize O₆.
- The split boundary O = M₂(ℤ), μ = [[1,−6],[4,−1]] has μ² = −23I and Aut±μ(O) = 1. Centralizing units are ±I; an anticommuting unit would require (8b−11c)²+23c² = 16, which has no integer solution.
- For μ = i+3j in O₆, kμ = −μk and nrd(k) = −3, so conjugation by the normalizer k identifies μ and −μ: this is twisted.
- For the degree-one untwisted polarization at D = 14 in 9.3, the sign-reversing normalizer set is empty and the two sign classes remain distinct.

### 9.3 Worked automorphism groups

Prove, for the polarizations `μ` the LMFDB stores (one representative per `(D, δ)`; when 9.1
gives several classes the others are also computed, see the worked examples): for the maximal
order of discriminant `6`, `Aut_{±μ}(O) ≅ (ℤ/2)²` of order `4` for `deg μ = 1` (the twist `χ` is a
pure element of `O` orthogonal to `μ` with `nrd χ = −2` or `−3`), dihedral of order `12` for
`deg μ = 2` (`ℚ(μ) = ℚ(√−3)`), dihedral of order `8` for `deg μ = 6` (`ℚ(μ) = ℚ(i)`); for
discriminant `10`: order `4` for `deg μ ∈ {1, 2, 5}`; for discriminant `14`: order `2` (cyclic)
for `deg 1`, `4` for `deg 7`, `8` for `deg 14`; for discriminant `26`: `2`, `4`, `4` for
`deg 1, 2, 13`; for discriminant `35`: `2` for `deg 1`, `4` for `deg 5`; for the Eichler order of
level `5` in discriminant `6` with `deg μ = 1`: order `4`; for level `11`: order `2`. These values are
evaluations of the twisting criterion of 9.2 on the stored orders and polarizations, as for the
table of the worked examples. Prove the
twisting criterion in the form used for all of these: for `deg μ = 1` and `O` maximal,
`#Aut_{±μ}(O) = 4` iff the (negative definite) binary form `nrd` on `{v ∈ O : vμ = −μv}` represents
`−m` for some `m ∣ D`, `m > 1`, and `2` otherwise. *Needs:* 9.2.

**Checks.**

- `O_6`: `#Aut_{±μ}(O) = 4, 12, 8` for degree `1, 2, 6`.
- `D = 14`, degree `1`: order `2`, cyclic; `D = 26`, degrees `1, 2, 13`: orders `2, 4, 4`.
- Eichler orders in `D = 6`, degree `1`: order `4` at level `5`, `2` at level `11`.
- (reject) `D = 21`, degree `21`: order `4`, not `8`, since `1 + i'` does not normalize `O` (9.10).

### 9.4 The enhanced groups and the map to the normalizer

Define `G(O,μ) = O^× ⋊ Aut_{±μ}(O)` and `G(O,μ,N) = (O/NO)^× ⋊ Aut_{±μ}(O)` (Mathlib's
`SemidirectProduct`, `w` acting by conjugation, which is well defined because `w` normalizes `O`
and `NO`), the reduction `ρ_N : G(O,μ) → G(O,μ,N)`, and `π : G(O,μ) → N_{B^×}(O)/ℚ^×`,
`π(x, w) = x·w`. Prove `π` is a homomorphism; `K = ker π = {(x^{-1}, [x]) : x ∈ O^×, [x] ∈ Aut_{±μ}(O)}`
is finite cyclic of order `2`, `4` or `6`, containing `(−1, 1)`; π(G(O,μ)) = image(Oˣ)·Aut±μ(O) inside N(O)/ℚˣ;
the positive-norm part `G(O,μ)^+ = π^{-1}(N^+/ℚ^×)` has index `2` and surjects onto every coset of
`Aut_{±μ}(O)` (4.4 gives a unit of norm `−1`); and that `(x, w) ↦ (w, w^{-1}xw)` is an
isomorphism onto the group of pairs `(w, x)` with the product
`(w₁,x₁)(w₂,x₂) = (w₁w₂, w₂^{-1}x₁w₂x₂)`, the pair order of the knowls `shimcurve.enhanced_group`
and `shimcurve.is_coarse`, in which `(w, x) ↦ w·x` is a homomorphism. Prove the kernel of
`G(O,μ)^+ → PSL₂(ℝ)` is `K`, so `π(G(O,μ)^+) ≅ G(O,μ)^+/K ≤ PSL₂(ℝ)` and
Γ_G := π(G(O,μ)⁺) is the positive part of image(Oˣ)·Aut±μ(O) and contains Γ¹(O) with
index `[Aut_{±μ}(O) : image of K]`. The enhanced group is the semidirect product
`Aut_{±μ}(O) ⋉ Ô^×` of the knowl `shimcurve.enhanced_group`, and `K` is the kernel of the map
`(w, x) ↦ w·x` of the knowl `shimcurve.is_coarse`. *Needs:* 9.2, 4.4, 4.6; Mathlib
`SemidirectProduct`.

Its API:

- The conjugation action defines both semidirect products and reduction is a homomorphism.
- Multiplication into the scalar normalizer quotient has the displayed finite cyclic kernel; changing pair order gives the explicit isomorphism.
- The positive subgroup has index two and its effective quotient is Γ_G.

**Checks.**

- `D = 6`, `O_6`, degree `1`: `K = {(±1, 1)}`, of order `2`.
- (boundary) At `N = 1`, `O/NO` is the zero ring, `(O/NO)^×` is trivial and
  `G(O,μ,1) = Aut_{±μ}(O)`, of order `4` for `D = 6`, degree `1`.
- G(O,μ)⁺ has index 2 since O has a unit of norm −1 (4.4).
- At D = 14, degree one, the automorphism image has order at most 2, whereas W has order 4.
- In O₆, 2+i has norm 1 and belongs to Γ_G, but conjugates i+3j to i+21j−12k, which is neither sign of i+3j.

### 9.5 Subgroups `H`, level, index, `Γ_H`, `X_H`

For `H ≤ G(O,μ,N)` define the level `N(H)`, the index `[G(O,μ,N) : H]` (knowls `shimcurve.level`,
`shimcurve.index`; the curve `X_H` and its stack are those of the knowl `shimcurve`),
`Γ_H = π(ρ_N^{-1}(H) ∩ G(O,μ)^+) ≤ PSL₂(ℝ)`, and `X_H = Γ_H\ℍ`, as pinned. Prove: `Γ_H` is a
finite-index subgroup of `Γ_G`, hence cocompact Fuchsian; the Fuchsian index
`[Γ_G : Γ_H] = [G^+/K : (H^+K)/K]` where `H^+ = ρ_N^{-1}(H) ∩ G^+`; `X_H` depends only on the
`G(O,μ,N)`-conjugacy class of `H`; replacing `N` by a multiple and `H` by its preimage does not
change `Γ_H`; `H` and `H·ρ_N(K)` give the same curve, and `H` is coarse iff `H ⊇ ρ_N(K)`, with
gerbiness `#ρ_N(K)` and aut-gerbiness as pinned. Compute the extreme subgroups: the
trivial subgroup of `G(O,μ,N)` has level `N`, index `#Aut_{±μ}(O)·#(O/NO)^×` and
`Γ_H = Γ¹(O;N) := π(O¹ ∩ (1 + NO))`, the principal congruence subgroup (and `H = 1` is not coarse
for `N > 2`, since `ρ_N(−1, 1) ≠ 1`); the subgroup `(O/NO)^× ⋊ 1`, the kernel of
`G(O,μ,N) → G(O,μ,1)` and so the preimage of the trivial subgroup of `G(O,μ,1)`, has level `1`
and `Γ_H = Γ¹(O)` (its preimage is `O^× ⋊ 1`, whose positive-norm part is `O¹ ⋊ 1`); the full
group has level `1` and `Γ_H = Γ_G`. The named families are those of the LMFDB knowls
`shimcurve.xd1`, `shimcurve.xdn`, `shimcurve.xd1_star`, `shimcurve.xdn_star` and `shimcurve.xdm1`,
read with the full level-`N` curve `X(O;N)^{big}` of the knowl `shimcurve` (the quotient by
`Γ(Ô,N)`, so the trivial subgroup at level `N`). For `O` maximal: `X(D;N)` (`H = 1 ≤ G(O,μ,N)`)
is the full level-`N` curve, of level `N`, index `#Aut_{±μ}(O)·#(O/NO)^×` and curve
`Γ¹(O;N)\ℍ`, and `X(D;1)` is its case `N = 1`, with curve `Γ¹(O)\ℍ = X_0(D;1)`; `X^*(D;N)`
(`H = {(1, w) : w ∈ Aut_{±μ}(O)}`, the complement `1 ⋊ Aut_{±μ}(O)`) is the quotient of `X(D;N)`
by `Aut_{±μ}(O)`, of level `N` and index `#(O/NO)^×`, and `X^*(D;1)` (`H = G(O,μ,1)`) has curve
`Γ_G\ℍ`, the quotient of `X_0(D;1)` by the image of `Aut_{±μ}(O)` in `W`. For `O` Eichler of level
`M`, `X(D,M;1)` is `H = 1 ≤ G(O,μ,1)`. Since a subgroup and its preimage at a multiple of the level
give the same curve and the same index, `(O/NO)^× ⋊ 1` and `G(O,μ,N)` give `X(D;1)` and `X^*(D;1)`
again at every `N`. The CM discriminants
of `X_H` are the `d` with `m(S_d, O; Γ̃_H) > 0` for the preimage `Γ̃_H ≤ N^+_{B^×}(O)` of `Γ_H`
(8.9). Caution: `X^*(D;1)` is the quotient of `X_0(D;1)` by the image of `Aut_{±μ}(O)` in `W`,
which is all of W exactly when the projection to W is surjective (as for D = 6, degree one); its
cardinality is #Aut±μ(O)/a(K), and it can be proper (for `D = 14`, `deg μ = 1`, it is the quotient
by one involution); it coincides with the full Atkin–Lehner quotient `X_0^*(D;1)` of 8.5 only in
the first case. For `N > 1`, `X^*(D;N)` (full level `N` on a maximal order) and `X_0^*(D;N)` (an
Eichler order of level `N`) are different curves. *Needs:* 9.4, 8.1, 8.5, 8.9.

Its API:

- Conjugacy of H and passage to a higher ambient modulus preserve its curve.
- Adjoining the scalar kernel preserves the curve; coarseness tests containment of that kernel image.
- The Fuchsian index is the effective subgroup index, with the three extreme subgroups as stated.

**Checks.**

- `X(6;1)`: `H = 1 ≤ G(O_6,μ,1) = Aut_{±μ}(O_6)` has index `4` and `Γ_H = Γ¹(O_6)`.
- `X(6;5)`: `H = 1 ≤ G(O_6,μ,5)`, with `(O_6/5O_6)^× ≅ GL₂(𝔽₅)` of order `480`, has level `5` and
  index `4·480 = 1920`. `Γ¹(O_6;5)` is torsion free (an element of `1 + 5O_6` has reduced trace
  `≡ 2 (mod 5)`, while the nontrivial torsion of `O_6¹` has trace `0`, `±1` or `−2`) of index
  `#SL₂(𝔽₅)/2 = 60` in `Γ¹(O_6)`, so its area is `60·(2π/3) = 40π`, `2g − 2 = 20`, the genus is
  `11` and the label prefix is `6.1.5.1920.11`.
- `X^*(6;5)`: `H = {(1, w)}` has level `5`, index `480` and Fuchsian index `120`: `Γ_H` contains
  `Γ¹(O_6;5)` with index `2` (the positive-norm classes `1`, `[μ]` of `Aut_{±μ}(O_6)`), and
  `[Γ_G : Γ¹(O_6;5)] = 4·60 = 240`.
- (reject) `(O/5O)^× ⋊ 1 ≤ G(O_6,μ,5)` is the kernel of reduction to level `1`, so it has level `1`,
  index `4`, curve `Γ¹(O_6)\ℍ` and prefix `6.1.1.4.0`, those of `X(6;1)`; it is not `X(6;5)`.
  Likewise `H = G(O,μ,N)` has level `1` and gives `Γ_G` at every `N`.
- (coarseness) `H = 1` is not coarse for `N > 2`, since `ρ_N(−1, 1) ≠ 1`; at `N = 1`, `ρ_1(K)` is
  trivial, the gerbiness is `1` for `D = 6`, and `H = 1` is coarse.
- (reject) `H` and `H·ρ_N(K)` have the same `Γ_H`, so `Γ_H` does not determine `H`.

### 9.6 Genus, elliptic points and the area formula for `X_H`

Prove `ν_q(Γ_H) ≠ 0` only for `q ∈ {2, 3, 4, 6}` (8.7), and the genus formula in the form the
LMFDB verifies:
`g(X_H) = 1 + [Γ_G : Γ_H]·(a(K)/#Aut_{±μ}(O))·φ(D)ψ(M)/12 − (1/2)∑_{q ∈ {2,3,4,6}} ν_q(Γ_H)(1 − 1/q)`,
where `a(K)` is the aut-gerbiness, since `[Γ_G : Γ¹(O)] = #Aut_{±μ}(O)/a(K)` (9.4) and
`area(Γ¹(O)\ℍ)/(4π) = φ(D)ψ(M)/12` (8.2); its second term is the area formula
`area(X_H)/(4π) = [Γ_G : Γ_H]·(a(K)/#Aut_{±μ}(O))·φ(D)ψ(M)/12`, from the finite-index scaling of
covolume (8.2) along `Γ_H ≤ Γ_G` and `Γ¹(O) ≤ Γ_G`. Prove the permutation form over an arbitrary base genus: with `e_1, …, e_r`
generators of the elliptic stabilizers of `Γ_G` and `σ_i` their images in the permutation
representation of `Γ_G` on `Γ_G/Γ_H`, `2g(X_H) − 2 = [Γ_G:Γ_H](2g(X_G) − 2) + ∑_i ∑_{cycles c of σ_i}(|c| − 1)`
(Riemann–Hurwitz, FO Layer 5.3, for `X_H → X_{G}`), and `ν_q(Γ_H)` is the number of cycles of
length `e_i/q` among the `σ_i` with `e_i` the order of the elliptic element. *Needs:* 9.5,
8.2, 8.4, 8.7; FO Layer 5.

**Checks.**

- `X(6;1)`: Fuchsian index `4`, `a(K) = 1`, `#Aut_{±μ}(O) = 4`, so
  `g = 1 + 4·(1/4)·(2/12) − (1/2)(2·(1/2) + 2·(2/3)) = 0`.
- `X^*(6;1)`: genus `0`; `X(6,5;1)`: genus `1`; `X(14;1)`: genus `1`; `X(35;1)`: genus `3`.

- For H = G the degree is 1 and all cycles are singletons, so both sides are 2g(X_G)−2; a constant −2 term would force genus zero.
- At (D,M) = (6,101), φ(6)ψ(101) = 204 and (ν₂,ν₃) = (4,0), giving g(X₀) = 17. The seven W fixed counts in Hall-divisor order 2,3,6,101,202,303,606 are 4,0,4,0,12,0,12; their sum 32 gives 32 = 8(2·1−2)+32 and genus one for X₀/W.

### 9.7 Torsion invariants and the action on `O/NO`

Define the right action of `G(O,μ,N)` on `O/NO` by y·(w,x) = w⁻¹yw·x in the LMFDB pair order, equivalently
y·(x,w) = w⁻¹(yx)w in Mathlib order (a `ℤ`-basis of `O`, 1.10, identifies `O/NO` with `(ℤ/N)⁴`
and this action with a homomorphism `G(O,μ,N) → GL₄(ℤ/N)`), and the **torsion invariants** of `H` as the
abelian group invariants of `(O/NO)^H`. Prove the action is faithful on `(O/NO)^×` and that for
H containing the residue units the fixed module is the H-fixed part of
{y : y(u−1) = 0 for every residue unit u}. Prove vanishing whenever the right ideal generated
by the u−1 is the whole ring; in particular this holds for M₂(ℤ/Nℤ).

**Integral torsion comparison.** Let k be a number field, k̄ an algebraic closure,
(A,λ)/k a polarized abelian surface, and ι : O ≃ End(A_k̄) an identification of its full
geometric endomorphism order. Assume the induced Rosati involution on B is
b ↦ μ⁻¹ star(b) μ. Let N ≥ 1 and choose a left O/NO-module isomorphism
α : O/NO → A[N](k̄). Integral freeness and this marking are hypotheses, including at primes
of DM. Construct the enhanced representation ρ : Gal(k̄/k) → G(O,μ,N): its automorphism
component w_σ induces σ's conjugation action on O, and the unit component is determined
by the image of α(1) under σ⁻¹. Prove that w_σ lies in Aut±μ(O), using Rosati compatibility,
Skolem–Noether and preservation of μ²; in Mathlib pair order the convention is
`α(y · ρ(σ)) = σ⁻¹(α(y))`, with `y · (x,w) = w⁻¹(yx)w`.
Prove ρ is a homomorphism and, for H = image(ρ), α restricts to an isomorphism
(O/NO)^H ≃ A[N](k). Changing α conjugates ρ by a residue unit and transports this
isomorphism. This is a consequence of semilinearity and Galois descent for points,
using the QM/Rosati description [V, 43.6.2–10], pp. 801–802, rather than a claim about
all points of a coarse curve.

*Needs:* 9.2, 9.4, 9.5; AbelianSchemesAndArithmeticModuli §§A0.1, A3.2, A3.9;
Skolem–Noether on B and the natural Galois action on geometric morphisms.

Its API:

- The right action restricts to a faithful action of the residue units.
- When H contains those units, its fixed module is the further H-fixed part of their common right annihilator.

**Checks.**

- In O₀(2)/2O₀(2), in coordinates E₁₁,E₁₂,2E₂₁,E₂₂, the four units are 1+bE₁₂+c(2E₂₁). Their fixed module is the span of E₁₂ and 2E₂₁, of order four, so for D = 15, M = N = 2 the unit subgroup has invariants (ℤ/2)². Under the integral torsion comparison hypotheses with this image H, A(k)[2] has exactly four elements.
- In M₂(𝔽₂), the units 1+E₁₂ and 1+E₂₁ impose yE₁₂ = yE₂₁ = 0, hence y = 0. The same computation works modulo every positive N.
- At N = 1 the quotient ring and fixed module each have one element, the zero module; faithfulness of the trivial unit group is consistent.

### 9.8 Atkin–Lehner content and the automorphism image

Define the image `H̄ ≤ Aut_{±μ}(O)` of `H` and the **Atkin–Lehner content** of `H`: the multiset of
signed squarefree integers representing the rational square classes of `nrd(w)` over one representative of each coset of `H ∩ (O/NO)^×` in `H`.
Prove both are invariants of the `G`-conjugacy class of `H`.

**Endomorphism-field comparison.** For the surface, full geometric endomorphism order,
marking and enhanced representation of §9.7, let θ : Gal(k̄/k) → Aut_ring(O) be the
conjugation action transported through ι, and let k_end be the fixed field of ker θ.
Prove that θ has finite image, that k_end is the smallest extension over which every
geometric endomorphism is defined, and that conjugation identifies H̄ with image θ,
hence with Gal(k_end/k). The action of N(O)/ℚˣ on O is faithful since O spans B and
B has centre ℚ; thus the projection has exactly this kernel, not merely the kernel of
its action on O/NO. This comparison uses the same semilinear construction as §9.7 and
faithful descent of morphisms; it does not assign an endomorphism field to an abstract H.
It is proved here from 9.7: `θ` has finite image because every geometric endomorphism is defined
over the finite extension `k(A[3])` (AbelianSchemesAndArithmeticModuli A6.20), and the descent
statement used is that a geometric endomorphism is defined over an intermediate field `L` exactly
when `Gal(k̄/L)` fixes it, the form in which A6.20 descends homomorphisms.
Define `IsSplit H` to hold when some conjugate of `H` is the internal semidirect product of its
intersections with `(O/NO)^×` and with `Aut_{±μ}(O)`. *Needs:* 9.4, 9.5, 9.7; AbelianSchemesAndArithmeticModuli §A0.1, A6.20.

Its API:

- Projection and norm square classes are invariant under enhanced-group conjugation.
- Splitting means conjugacy to the specified internal semidirect product, retaining both intersections.

**Checks.**

- Under the comparison hypotheses, H̄ = 1 gives [k_end:k] = 1, including N = 1; reduction of torsion alone cannot detect θ.
- For H = 1, the automorphism image has size 1 and its norm-content multiset is {1}; the splitting condition holds.
- For the full residue-unit subgroup, the automorphism image is again trivial and the content is {1}, regardless of its unit-group cardinality.
- For D = 6 and a principal polarization, the full enhanced group has four automorphism cosets with norm square classes 1,6,−3,−2; each is counted once, and the group is split by construction.

### 9.9 Worked curves

Prove, for `D = 6`, `O` maximal, `deg μ = 1` (`Aut_{±μ}(O) ≅ (ℤ/2)²`): `K = {(±1, 1)}`, so at
level `1` the gerbiness `#ρ_1(K)` and the aut-gerbiness are both `1`; `X(6;1)` (`H = 1`): index `4`,
Fuchsian index `4`, `ν₂ = ν₃ = 2`, genus `0`, label prefix `6.1.1.4.0`; `X^*(6;1)`
(`H = Aut_{±μ}(O)`): index `1`, Fuchsian index `1`, `(ν₂, ν₃, ν₄, ν₆) = (1, 0, 1, 1)`, signature
`(0; 2, 4, 6)`, area `(2π/3)/4 = π/6`, genus `0`, prefix `6.1.1.1.0`; `X(6,5;1)`:
index `4`, `ν₂ = 4`, genus `1`, prefix `6.30.1.1.4.1` (with `d = 30`); `X(6,11;1)`: index `2`
(`#Aut_{±μ}(O) = 2` for this Eichler order), genus `3`, prefix `6.66.1.1.2.3`; `X(10;1)`: index `4`,
`ν₃ = 4`, genus `0`; `X(14;1)`: index `2`, `ν₂ = 2`, genus `1`; `X(26;1)`: index `2`, genus `2`;
`X(35;1)`: index `2`, genus `3`. *Needs:* 9.5, 9.6, 9.3, 8.4.

**Checks.**

- `X(6;1)`: index `4`, Fuchsian index `4`, `ν₂ = ν₃ = 2`, genus `0`.
- `X^*(6;1)`: index `1`, genus `0`, `(ν₂, ν₃, ν₄, ν₆) = (1, 0, 1, 1)`; 9.6 gives
  `g = 1 + 1·(1/4)·(2/12) − (1/2)(1/2 + 3/4 + 5/6) = 1 + 1/24 − 25/24 = 0`, and the area
  `2π(−2 + 1/2 + 3/4 + 5/6) = π/6` is a quarter of `area(X_0(6;1)) = 2π/3`.
- `X(6,5;1)`: index `4`, `ν₂ = 4`, genus `1`; `X(6,11;1)`: index `2`, genus `3`.
- `X(10;1)`: index `4`, `ν₃ = 4`, genus `0`; `X(26;1)`: index `2`, genus `2`.

### 9.10 Boundary checks

Prove: the definite algebra `ℍ[ℚ,-1,-1]` admits no real splitting, so Layer 8–9 constructions
reject it; a subgroup `H` not containing `ρ_N(K)` has the same `Γ_H` as `H·ρ_N(K)` (so distinct
`H` give the same curve: `is_coarse = false` cases); `deg μ` is not `nrd(μ)/discrd(O)` (for `D = 6`,
`deg μ = 2` has `nrd μ = 3`, `nrd μ/6 = 1/2`); the full Atkin–Lehner quotient `X_0^*(14;1) = X_0(14;1)/(ℤ/2)²`
differs from the LMFDB's `X^*(14;1)` for `deg μ = 1`; the torsion of `ℚ(μ)^×/ℚ^×` is not `Aut_μ(O)`: for
`D = 21`, `deg μ = 21` (`μ = 21i'`, `i'² = −1`) the element `1 + i'` has norm `2 ∤ 21` and does not
normalize `O` (`O_2 ≅ M₂(ℤ_2)`, whose normalizer `ℚ_2^×GL₂(ℤ_2)` has norms of even valuation), so
`Aut_μ(O) = {1, [i']}` and `#Aut_{±μ}(O) = 4` (twisted by `χ² = 21`), not `8`; likewise `D = 33`,
`deg 33` gives `4`, and `D = 33`, `deg 11` (`μ' = √−3` with optimal order `ℤ[√−3]`, so `ζ₆ ∉ O` and
`1 + ζ₆ ∉ N_{B^×}(O)` although `3 ∣ 33`) gives `4`, not `12`. *Needs:* 9.1, 9.2, 9.5.

### Examples

The degree-one polarization at D = 6 is twisted; the full residue-unit subgroup at D = 15, M = N = 2 fixes four torsion elements.

### Dependencies

Layers 4, 6 and 8; native semidirect products; AbelianSchemesAndArithmeticModuli §§A0.1, A3.2, A3.9, A6.20 for the arithmetic comparisons.

## Layer 10: the LMFDB dictionary

### 10.1 The intrinsic label prefix

Define `HasLMFDBPrefix (O,μ,H) D d δ N i g :⟺ disc B = D ∧ discrd O = d ∧ deg μ = δ ∧
N(H) = N ∧ [G : H] = i ∧ g(X_H) = g`, prove each coordinate is an invariant of the isomorphism
class of `(O,μ,H)`, and prove that `d` is determined by `(D, M)` for Eichler orders (`d = DM`).
The order label `D.d` (`D` alone when `O` is maximal) is the same data; the polarized-order label
`D.d.δ` records `deg μ`, and when 9.1's count of isomorphism classes of degree `δ` exceeds one the
choice among them is a database convention, not a target. *Needs:* 0.4, 1.5, 9.1, 9.5, 9.6.

Its API:

- Every coordinate of the intrinsic prefix is invariant under isomorphism.
- For an Eichler order the stored order discriminant is the product of algebra discriminant and level.

**Checks.**

- `X(6;1)`: `(D, d, δ, N, i, g) = (6, 6, 1, 1, 4, 0)`, printed `6.1.1.4.0` since `O_6` is maximal
  and `d` is omitted.
- `X^*(6;1)`: `6.1.1.1.0`.
- `X(6,5;1)`: `6.30.1.1.4.1`, with `d = 30 = DM` printed because the order is not maximal.
- (invariance) Conjugating `H` inside `G(O,μ,N)` changes none of the six coordinates.

### 10.2 The page coverage map

The mathematical dictionary uses the LMFDB knowls
[polarized orders](https://www.lmfdb.org/knowledge/show/shimcurve.polarized_order),
[enhanced groups](https://www.lmfdb.org/knowledge/show/shimcurve.enhanced_group),
[order discriminant](https://www.lmfdb.org/knowledge/show/shimcurve.disco),
[level](https://www.lmfdb.org/knowledge/show/shimcurve.level),
[index](https://www.lmfdb.org/knowledge/show/shimcurve.index),
[labels](https://www.lmfdb.org/knowledge/show/shimcurve.label), and the named families
[`X(D;1)`](https://www.lmfdb.org/knowledge/show/shimcurve.xd1),
[`X(D;N)`](https://www.lmfdb.org/knowledge/show/shimcurve.xdn),
[`X^*(D;1)`](https://www.lmfdb.org/knowledge/show/shimcurve.xd1_star),
[`X^*(D;N)`](https://www.lmfdb.org/knowledge/show/shimcurve.xdn_star) and
[`X(D,M;1)`](https://www.lmfdb.org/knowledge/show/shimcurve.xdm1), by those exact identifiers.
The table specifies mathematical meanings; it does not certify a version of the database
schema or the contents of a stored record.

| Page datum (column) | Source | Certification |
| --- | --- | --- |
| quaternion algebra `(a,b/ℚ)` (`i_square`, `j_square`) | carrier | general |
| `discB` | 0.4 | general |
| `ℤ`-basis of `O` (`gens_numerators/denominators`), `discO` | 1.10 | general |
| `area_numerator/denominator`, read as `area(X_H)/(4π) = [Γ_G : Γ_H]·(a(K)/#Aut_{±μ}(O))·φ(D)ψ(M)/12`, which is `φ(D)ψ(M)/12` exactly when `[Γ_G : Γ_H] = [Γ_G : Γ¹(O)] = #Aut_{±μ}(O)/a(K)`, as for `Γ_H = Γ¹(O)` | 8.2, 9.6 | general; this reading is the roadmap's convention, and none of the knowls above defines the column |
| polarization `mu`, `deg_mu` (`nrdmu`) | 9.1 | general |
| `AutmuO_size`, `AutmuO_is_cyclic`, `AutmuO_generators`, `Gerby_gen` | 9.2, 9.4 | general; the generators as elements, their stored coordinates are presentation data |
| `level`, `index`, `fuchsian_index`, `gerbiness`, `aut_gerbiness`, `is_coarse` | 9.5 | general |
| `generators` of `H` | 9.5 | carrier: `H` is a subgroup; the chosen generators are labels' |
| `nu2`, `nu3`, `nu4`, `nu6`, `genus` | 9.6, 8.3, 8.4 | general |
| `torsion` | 9.7 | fixed-module invariant; rational torsion under the integral QM comparison hypotheses |
| `autmuO_norms`, `is_split`, `galEnd` (as the group `H̄`) | 9.8 | group invariants; endomorphism-field interpretation under the comparison hypotheses; no group label |
| `cm_discriminants` | 8.9, 9.5 | general |
| `name` (`X(D;1)`, `X(D;N)`, `X^*(D;1)`, `X^*(D;N)`, `X(D,M;1)`) | 9.5 (knowls `shimcurve.xd1`, `shimcurve.xdn`, `shimcurve.xd1_star`, `shimcurve.xdn_star`, `shimcurve.xdm1`; `X(D;N)` is the full level-`N` curve) | general |
| `coarse_label`, `psl2label`, `scalar_label`, `Glabel`, `c.n` | — | none: labels and ordering |
| `rank`, `genus_minus_rank`, `dims`, `mults`, `newforms`, `conductor`, `simple`, `squarefree`, `trace_hash` | — | none: Jacquet–Langlands (R17.3) and the modular-forms roadmap |
| `q_gonality`, `qbar_gonality`, `models`, `modelmaps`, `pointless`, `obstructions`, `num_known_degree1_points` | — | none: `CanonicalModelsAndGonality`, rational points |
| `parents`, `factorization`, `lattice_labels` | 9.5 (inclusions `H ≤ H'` give maps `X_H → X_{H'}` of degree the Fuchsian index ratio) | the maps and degrees general; the stored lists are labels' |

*Needs:* the layers named.

### 10.3 The worked suite

The worked objects give values for the rows of 10.2 as follows: the algebra, `discB`, the basis
and `discO` by 0.7, 1.10 and 2.7; the area of `X_H` by 8.2, 9.6 and 9.9 (`1/6` for `X(6;1)` and `1/24` for `X^*(6;1)`, in units of `4π`); the polarization and its degree by
9.1; the automorphism group by 9.3 and 9.4; the level, index, Fuchsian index, gerbiness and
coarseness by 9.5 and 9.9; `nu2`, `nu3`, `nu4`, `nu6` and the genus by 8.3, 8.4 and 9.9 (`nu4`
and `nu6` by `X^*(6;1)`); `torsion` by the fixed module of 9.7; `autmuO_norms` and `is_split` by
9.8, and `galEnd` by 9.8 under its comparison hypotheses; the CM discriminant `−4` of `X_0(6;1)`
by 8.9; the names by 9.5. The generators of `H` are presentation data and have no worked value.
These values are the Checks of the milestones named; `Suggested.lean` states only the
carriers and theorems expressible over Mathlib and the pinned Tau Ceti, and the worked objects are
specified in this README only.

### Examples

The two genus-zero degree-one components at D = 6 have intrinsic prefixes 6.1.1.4.0 and 6.1.1.1.0.

### Dependencies

Layer 9 for every invariant appearing in the prefix.

## Explicit scope exclusions

- No quaternion algebras in characteristic `2`, and no algebras over function fields; the base is
  a number field (Layers 0, 3–7) or a characteristic-zero Dedekind domain (Layers 1–2).
- No Shimura curves over totally real fields other than `ℚ`, no Shimura curves attached to
  non-Eichler orders beyond what Layer 9's `(O,μ)` with `O` Eichler covers, and no selectivity.
- No canonical models, fields of definition, integral models, Čerednik–Drinfeld uniformization,
  moduli interpretations, Heegner points, or rational points; no gonality or equations.
- No quaternionic modular forms beyond the trivial-coefficient Brandt module of Layer 7; no
  Jacquet–Langlands; no Hilbert modular forms themselves.
- No type number formula beyond Deuring's prime case and the structural description 6.8; the
  general Pizer type-number formula is not a target.
- No hermitian lattices over quaternion orders, no quaternionic Siegel/Hilbert–Siegel theory.
- Label components beyond the intrinsic prefix, orderings and normal forms fixed by convention,
  stored lists, and the completeness of database tables are not targets: Gassmann letters,
  canonical generators, the index `n` and the completeness of any enumeration (the Gassmann
  equivalence relation itself is `FiniteGroupInvariants` 7.1).

## Downstream consumers

- GrossZagierAndArithmeticHeights §0a.3 takes its classes of oriented optimal embeddings
  `O_c ↪ R₀(N)` modulo `Γ₀(N)` as the instance `B = ℍ[ℚ,1,1] ≅ M₂(ℚ)` (Tau Ceti's `oneEquivMatrix`),
  `O = R₀(N)`, `S = O_c`, `Γ = O¹ = Γ₀(N)` of 6.1's `Emb(S,O;Γ)`, refined by the choice of a complex
  CM type, with `gcd(c,N) = 1`; forgetting the CM type is not that comparison.
- AbelianVarietiesOverFiniteFields 8.4 takes 2.2 and 2.5 as the quaternion instance of the
  Gorenstein and Bass conditions, beside its commutative instance.
- LatticePackingsAndPerfectForms takes Layer 2 (the even Clifford correspondence) for the ternary
  lattices that carry an order.
- CanonicalModelsAndGonality takes Layers 1–3 and 9 for the models and gonalities of the curves
  `X_H`; AdelicImagesAndModularCurves and CurvesOverFiniteFields take Layers 8 and 9 for the
  Shimura curves `X(D;N)` and their quaternionic level structures.

## Worked examples (acceptance criteria)

Every number below is a direct evaluation of a formula stated above or a Check of the milestone
named; the class numbers of imaginary quadratic orders are those of 6.4's `Pic S`.

### `ℍ[ℚ,-1,-1]`, `D = 2`, the Hurwitz order

`(−1,−1)_2 = −1`, `(−1,−1)_p = 1` for odd `p`, `(−1,−1)_ℝ = −1`: `Ram = {2, ∞}`, `D = 2`,
definite (0.4, 0.5, 0.7). The Lipschitz order `ℤ⟨i,j⟩` has `discrd = 4` (1.7); the Hurwitz order
has `discrd = 2 = D`, is maximal (1.7, 1.13), has `24` units forming `SL₂(𝔽₃)` (1.13), `w = 12`,
`# Cls = 1` (3.8), mass `1/12 = φ(2)/12` (5.6), class number formula `1/12 + 1/4 + 2/3 = 1` (6.7), `T(3) = (4)`,
`T(5) = (6)` (7.6). Eichler order of level `3`: `discrd = 6`, `6` units, `w = 3`, mass `1/3`,
`# Cls = 1`, `T(5) = (6)`, `T(7) = (8)`. Boundary: `ℍ[ℚ,-1,-13]` also has `D = 2`, not `13`
(`(−1,−13)_{13} = 1` since `−1` is a square mod `13`).

### `D = 3, 5, 7, 11, 13, 37` definite

`ℍ[ℚ,-1,-3]`: `D = 3`, one class, `12` units (`w = 6`), mass `1/6`. `ℍ[ℚ,-2,-5]`: `D = 5`, one
class, `w = 3`. `ℍ[ℚ,-1,-7]`: `D = 7`, `w = 2`. `ℍ[ℚ,-1,-11]`: `D = 11`, two classes, unit groups of
orders `4` and `6`, mass `1/2 + 1/3 = 5/6`, `ε₂ = ε₃ = 2`, `# Cls = 2`, type number
`1 + 1/4·1 + 1/4·3 = 2`, `T(2) = [[1,3],[2,0]]` (7.6: column sums `3, 3`; the row sums `4, 2` are not
constant). `D = 13`: one class, units `{±1}`, mass `1`.
`D = 37` (`ℍ[ℚ,-2,-37]`): three classes with units `{±1}`, mass `3`, `h(−148) = 2`, type number
`3/2 + 1/2 = 2`, `T(2) = [[1,1,1],[1,0,2],[1,2,0]]`. Boundary: `D = 11` shows two classes of
different types; `D = 37` shows three classes and only two types.

### `ℍ[ℚ,3,-1]`, `D = 6`, indefinite

`(3,−1)_2 = (3,−1)_3 = −1`, `(3,−1)_5 = 1`, `(3,−1)_ℝ = 1`: `D = 6`, indefinite (0.7).
Maximal order `O = ℤ⟨1, i, j, (1+i+j+k)/2⟩`, `discrd O = 6` (1.7); `# Cls O = # Typ O = 1` (4.3);
`N(O)/ℚ^×O^× ≅ (ℤ/2)²` with `w_2, w_3, w_6` (4.5). `area(X_0(6;1)) = 2π/3` (8.2);
`ν₂ = (1−(−4|2))(1−(−4|3)) = 1·2 = 2`, `ν₃ = (1−(−3|2))(1−(−3|3)) = 2·1 = 2` (6.5, 8.3);
`g = 1 + 1/6 − 1/2 − 2/3 = 0` (8.4). `X^*(6;1)` has genus `0`. Polarizations: `deg 1`,
`μ² = −6`, `Aut_{±μ}(O) ≅ (ℤ/2)²`; `deg 2`, `nrd μ = 3`; `deg 6`, `nrd μ = 1` (9.1, 9.3). Curves:
`X(6;1) = 6.1.1.4.0.a.1` (index `4`, `ν₂ = ν₃ = 2`, `g = 0`), `X^*(6;1) = 6.1.1.1.0.a.1` (9.9).
Eichler orders: level `5`: `discrd = 30`, `ψ(5) = 6`, area `(π/3)·2·6 = 4π`, `ν₂ = 2·(1+(−4|5)) = 4`,
`ν₃ = 2·(1+(−3|5)) = 0`, `g = 1 + 1 − 1 = 1`; level `7`: `ν₂ = 0`, `ν₃ = 4`, `g = 1`; level `11`:
`ν₂ = ν₃ = 0`, `ψ(11) = 12`, `g = 1 + 2 = 3`; level `13`: `ν₂ = ν₃ = 4`, `g = 1 + 7/3 − 1 − 4/3 = 1`;
level `25`: `g = 5`, `ν₂ = 4`.

### Other indefinite discriminants, `N = 1`

| `D` | `ν₂` | `ν₃` | `g(X_0(D;1))` | `#Aut_{±μ}(O)` for the LMFDB's `D.1` |
| --- | --- | --- | --- | --- |
| 10 | 0 | 4 | 0 | 4 |
| 14 | 2 | 0 | 1 | 2 |
| 15 | 0 | 2 | 1 | 4 |
| 21 | 4 | 0 | 1 | 2 |
| 22 | 2 | 4 | 0 | 4 |
| 26 | 0 | 0 | 2 | 2 |
| 33 | 4 | 2 | 1 | 2 |
| 34 | 0 | 4 | 1 | 2 |
| 35 | 0 | 0 | 3 | 2 |
| 38 | 2 | 0 | 2 | 4 |
| 39 | 0 | 0 | 3 | 2 |

Each genus is `1 + φ(D)/12 − ν₂/4 − ν₃/3`: `D = 26`: `φ(26) = 12`, `1 + 1 = 2`; `D = 35`:
`φ(35) = 24`, `1 + 2 = 3`; `D = 10`: `φ(10) = 4`, `1 + 1/3 − 4/3 = 0`. The last column is the
LMFDB's `AutmuO_size` for its stored `μ` and the target of 9.3; each value is the twisting
criterion of 9.3 evaluated on the stored order and `μ`. The degree-one polarized maximal order is
in general not unique up to isomorphism (9.1): the `Oˣ`-classes of optimal embeddings of the
orders `S` of `ℚ(√−D)` containing `ℤ[√−D]` number `h(−4D)`, plus `h(−D)` when `D ≡ 3 (mod 4)`
(6.4 with `# Cls O = 1` and `m_p(S) = 1` for `p ∣ D`); the group `N_{B^×}(O)/ℚ^×O^× ≅ (ℤ/2)^{ω(D)}`
of 4.5 acts on them with stabilizer the image of `Aut_μ(O) = ⟨w_D⟩` (the class of `μ` itself,
order `2`), so every orbit has size `2^{ω(D)−1}` and the isomorphism classes of `(O, μ)` of degree
`1` number `c = (h(−4D) + [D ≡ 3 (4)]·h(−D))/2^{ω(D)−1}`; the involution `μ ↦ −μ` fixes the twisted
classes (`#Aut_{±μ}(O) = 4`) and pairs the untwisted ones (`#Aut_{±μ}(O) = 2`), so the classes of
`(O, ±μ)`, the LMFDB's objects, number `t + (c − t)/2` with `t` the number of twisted classes.
For `D = 6, 10, 22`: `h(−4D) = 2`, `c = 1`, twisted. For `D = 14, 33, 34`: `h(−4D) = 4`, `c = 2`,
both untwisted and paired by `μ ↦ −μ`: one class. For `D = 15`: `h(−60) = h(−15) = 2`, `c = 2`,
both twisted (an untwisted class would bring its partner): two classes. For `D = 26` and `D = 38`:
`h(−104) = h(−152) = 6`, `c = 3`, one twisted class and one untwisted pair: two classes; the
LMFDB's `26.1` is the untwisted class and its `38.1` the twisted one. For `D = 35`: `h(−140) = 6`,
`h(−35) = 2`, `c = 4`, two twisted classes and one untwisted pair: three classes, the LMFDB's
`35.1` untwisted. For `D = 21` (`21 ≡ 1 (mod 4)`, so only `S = ℤ[√−21]` occurs): `h(−84) = 4`,
`c = 2`, one untwisted pair: one class. For `D = 39`: `h(−156) = h(−39) = 4`, `c = 4`, all four
untwisted, one pair for each `S`: two classes, the LMFDB's `39.1` being the pair with
`S = ℤ[(1+√−39)/2]`.

### Off-hypothesis checks

- `ℍ[ℚ,1,7]` and `ℍ[ℚ,5,5]` are split: `D = 1`, every order is conjugate to a suborder of `M₂(ℤ)`,
  and the compactness and genus statements of Layer 8 do not apply (`X_0(1;N)` is the modular
  curve, which has cusps; it is the modular-forms roadmap's); the index, area and elliptic counts
  of 8.2–8.3 specialize to those of `Γ₀(N)`.
- A finite set of odd cardinality, such as `{5}` with `∞` split, is not a ramification set (0.3).
- `ℤ + 2O_6` is an order with `discrd = 48` that is neither Eichler nor Gorenstein (2.3, 2.7); the
  genus formula of 8.4 does not apply to it, and `Γ¹(ℤ + 2O_6)` has index `[O_6¹ : (ℤ+2O_6)¹]` in
  `Γ¹(O_6)` computed from `(O_6/2O_6)¹`.
- The global index `[O(1)¹ : O¹] = ψ(N)` of 8.2 and the normalizer quotient
  `N_{B^×}(O)/ℚ^×O^× ≅ (ℤ/2)^{ω(DN)}` of 4.5 need `B` indefinite (both rest on strong approximation,
  4.3): in `ℍ[ℚ,-1,-1]` the two Eichler orders of level `7` have `6` units each (mass
  `φ(2)ψ(7)/12 = 2/3`), so `[O(1)¹ : O¹] = 24/6 = 4 ≠ ψ(7) = 8`, and they contain no element of norm
  2, so the norm-2 two-sided class interchanges the two ideal classes. Its action is transitive;
  the stabilizer in the two-sided class group of order 4, and hence the normalizer quotient,
  has order 4/2 = 2, not 1 or 4; for `D = 37` the two-sided ideal `P_37` permutes the three classes as `(2 3)`, so the
  two maximal orders of the moved classes have trivial normalizer quotient. The local indices of
  1.9 hold in every case.
- For D = 15 and level 4, the dyadic Gaussian embedding count is zero and the Eisenstein count vanishes at 2; φ(15)ψ(4) = 8·6 = 48, so g(X₀(15;4)) = 1+48/12 = 5. There is no Eichler order with (D,N) = (6,4), since a ramified prime cannot divide the level.
- For `D = 6`, `deg μ = 2`: `nrd μ/discrd O = 1/2`, so `deg μ` is the squarefree representative of
  the square class, not the quotient itself (9.10).

## Ordering — the dependency graph

- **Layer 0** (ramification, discriminant) rests on Tau Ceti, the consumed classification and
  ArithmeticFuchsianGroups §1.2's ramification set; it is independent of the other layers and can start at once.
- **Layer 1** (orders) rests on Mathlib's `IsLattice` and 0.1; 1.6 and 1.11 consume
  ArithmeticFuchsianGroups §§1.1–1.2; 1.8, 1.9 and 1.11 consume HilbertModularVarietiesAndShimuraCurves
  §R18.5.16a; 1.7 and 1.9 need 0.4, 1.9 needs CAC 7.60; 1.11 uses elementary divisors over a DVR;
  1.13 needs 0.7, 1.7 and 1.12.
  **Layer 2** (Gorenstein, Bass) needs Layer 1 only and is independent of Layer 3.
- **Layer 3** (ideals, class sets, idelic dictionary, finiteness) needs Layer 1; 3.4 needs CAC
  7.72, 7.78, global number fields Layers 4–6 and AA.5.3; 3.5 needs AA.3.4, AA.5.3 and
  ArithmeticFuchsianGroups §1.4; 3.4 and 3.9 consume HilbertModularVarietiesAndShimuraCurves
  §§R18.5.16a–R18.5.16b; 3.6 and 4.6 consume ArithmeticFuchsianGroups §1.2; 3.8 needs 1.13.
- **Layer 4** (indefinite) needs Layer 3, AA.4.2, AA.4.6 and CAC 7.44, 7.60, 7.98. **Layer 5** (mass)
  needs Layer 3, 2.4, AA.5.3 and, for the weights of Eichler orders in 5.1,
  HilbertModularVarietiesAndShimuraCurves §R18.5.16a; Layers 4 and 5 are independent of each other.
- **Layer 6** (embeddings) needs Layers 1, 3; 6.4 needs 3.5; 6.5 needs 4.3 in the indefinite
  case; 6.6 needs Layer 5.
- **Layer 7** (Brandt) needs Layers 3, 5, 6.4, HilbertModularVarietiesAndShimuraCurves
  §R18.5.16c and, for 7.7, theta series Layer 7.
- **Layer 8** (Shimura curves) needs Layers 4, 6, ArithmeticFuchsianGroups §§1.1–1.2 and FuchsianOrbifolds Layers 1, 2, 4, 5.
- **Layer 9** (enhanced groups) needs Layers 4, 6 and 8. **Layer 10** needs 9.
- Parallel tracks: {0}, {1 → 2}, {1 → 3 → 4}, {1 → 3 → 5}, {3 → 6 → 7}, {4, 6 → 8 → 9 → 10}.

## References

- J. Voight, *Quaternion Algebras*, GTM 288, Springer 2021 ([author edition v0.9.28](https://jvoight.github.io/quat/quat-book-v0.9.28.pdf)), [DOI](https://doi.org/10.1007/978-3-030-56694-4).
  Chapters 10 (orders), 15 (discriminants), 16 (ideals and invertibility), 17 (class sets, types,
  Eichler's theorem 17.8.3), 22 (ternary forms and the even Clifford functor), 23 (Eichler orders,
  Bruhat–Tits tree), 24 (Gorenstein and Bass orders, Eichler symbol), 25–26 (Eichler mass formula),
  27 (adeles, 27.6 noncommutative adeles), 28 (strong approximation, 28.5.5, 28.9 normalizers and
  `AL(O)`), 30 (optimal embeddings, trace formula 30.4.7, local embedding numbers 30.5–30.6, class
  number formula 30.8.6, Deuring 30.9.2), 38 (quaternionic Fuchsian groups), 39 (volume and genus
  formulas 39.1.2, 39.4.20), 41 (Brandt matrices, trace formula 41.5.2), 43.6 (polarized orders).
  Every item above cites its theorem number.
- M.-F. Vignéras, *Arithmétique des algèbres de quaternions*, LNM 800, Springer 1980,
  [DOI](https://doi.org/10.1007/BFb0091027). Ch. III (local orders), Ch. V (class number and type
  number formulas, Corollaire V.2.5 as cited by Voight 30.8.8).
- M. Eichler, *Zur Zahlentheorie der Quaternionen-Algebren*, J. reine angew. Math. 195 (1955),
  [DOI](https://doi.org/10.1515/crll.1955.195.127) — the mass formula and class number formula
  for hereditary orders (Voight 30.8.8).
- A. Pizer, *On the arithmetic of quaternion algebras*, Acta Arith. 31 (1976) — the class number
  formula for Eichler orders of arbitrary level over `ℚ` (Voight 30.8.8); *An algorithm for computing
  modular forms on `Γ₀(N)`*, J. Algebra 64 (1980), [DOI](https://doi.org/10.1016/0021-8693(80)90151-9)
  — Brandt matrices as computed by the LMFDB.
- H. Shimizu, *On zeta functions of quaternion algebras*, Ann. of Math. 81 (1965),
  [DOI](https://doi.org/10.2307/1970389) — the volume formula over totally real fields (Layer 8, §8.2).
- M. Alsina and P. Bayer, *Quaternion Orders, Quadratic Forms, and Shimura Curves*, CRM Monograph
  Series 22, AMS 2004, [DOI](https://doi.org/10.1090/crmm/022) — explicit maximal orders, the
  ternary forms of Layer 2, and tables of `X_0(D;N)` of low genus.
- A. Ogg, *Real points on Shimura curves*, in *Arithmetic and Geometry I*, Progr. Math. 35,
  Birkhäuser 1983 — the fixed points of the Atkin–Lehner involutions on `X_0(D;N)`, whose count
  8.6 proves by its own route from the embedding numbers.
- V. Rotger, *Modular Shimura varieties and forgetful maps*, Trans. AMS 356 (2004),
  [author edition](https://web.mat.upc.edu/victor.rotger/docs/ModularShimura.pdf) — polarized orders and the groups
  `Aut_{±μ}(O)` (Voight 43.6.4 follows §3 there).
- L. Dembélé and J. Voight, *Explicit methods for Hilbert modular forms*, in *Elliptic Curves,
  Hilbert Modular Forms and Galois Deformations*, Birkhäuser 2013,
  [DOI](https://doi.org/10.1007/978-3-0348-0618-3_4) — the definite-algebra computation of Hilbert
  modular forms that 7.5 records.
- The LMFDB knowls `shimcurve`, `shimcurve.polarized_order`, `shimcurve.aut_pm_mu_o`,
  `shimcurve.enhanced_group`, `shimcurve.level`, `shimcurve.index`, `shimcurve.is_coarse`,
  `shimcurve.nrdmu`, `shimcurve.disco`, `shimcurve.eichler`, `shimcurve.label`, `shimcurve.xd1`,
  `shimcurve.xdn`, `shimcurve.xd1_star`, `shimcurve.xdn_star`, `shimcurve.xdm1` — the definitions
  Layer 9 and 10 formalize, used only as source definitions, restated here in independent wording.
