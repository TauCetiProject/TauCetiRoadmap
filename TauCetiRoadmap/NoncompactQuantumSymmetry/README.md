# Noncompact quantum symmetry and particle representations

Develop the measurable and unitary representation theory needed to pass from spacetime symmetry to particle models. The central theorem is the locally compact imprimitivity theorem with its correctly normalized induced Hilbert-space model; the semidirect-product theorem then classifies regular irreducibles through dual orbits, stabilizers, and their projective representations. Apply this machinery with fixed conventions to Euclidean, Galilei, Poincaré, and de Sitter examples, and prove the domain and differentiability results that connect group representations to observables.

## Scope, conventions, and suppliers

All Hilbert spaces are complex. Locally compact groups are Hausdorff; measurable Mackey theory uses second-countable locally compact groups and standard Borel spaces. Representations are strongly continuous unitary representations unless expressly projective or antiunitary. Hilbert inner products are conjugate-linear in the first variable. A left Haar measure is fixed, with modular function convention from OperatorAlgebraDynamics D1–D3. An induced representation is formed with the square-root Radon–Nikodym/modular factor dictated by that convention; no formula may silently assume a unimodular group or an invariant quotient measure. A Borel multiplier is normalized and satisfies the continuous or Borel 2-cocycle identity as specified; cohomologous multipliers give equivalent twisted data only through an explicit Borel/continuous coboundary.

Consume, without duplicating their core constructions:

- [OperatorAlgebraDynamics D1](../OperatorAlgebraDynamics/README.md#d1-covariant-representations-and-full-crossed-products) for covariant pairs, integrated forms, group C*-algebras and continuous actions; [D3](../OperatorAlgebraDynamics/README.md#d3-induction-and-imprimitivity) for Green imprimitivity, modular normalization, induction in stages and interior tensor induction.
- [HilbertModules H3](../HilbertModules/README.md#h3-tensor-products-induction-and-imprimitivity) for correspondences, interior tensor products, induction and the equivalence between module and Hilbert-space induction.
- [VonNeumannAlgebras V4](../VonNeumannAlgebras/README.md#v4-preduals-normality-and-normal-representations) for normal representations and the `C₀(X)` spectral representation; V11 for Pontryagin duality, Haar normalization and Plancherel.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) for compact little groups and Peter–Weyl; [LieGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0942b6c99c9c9baff3c962bc672bcaab81baff48/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md) and [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) for Lie groups, Lie algebras, highest weights and compact-fiber data. These are not noncompact unitary-dual classifications.
- Quantum Foundations QF5 for the selected ray/symmetry carriers and its physical-model interfaces. Consume only the agreed carriers; this roadmap proves the noncompact measurable and induced-representation results named here.
- Tau Ceti's pinned Lorentzian Clifford/Spin equivalence in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/ThreeOne.lean` and Hermitian-vector model in `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean` for the `Spin(3,1)≃SL(2,ℂ)` / Lorentz cover interface. The group-action and orbit proofs remain targets here.

The analytic operator domains and self-adjoint spectral calculus are supplied by OperatorTheory/SelfAdjointSpectralTheory and OperatorTheory/UnboundedOperators. [RelativisticQuantumFieldTheory RQFT0–RQFT2](../RelativisticQuantumFieldTheory/README.md#milestone-rqft0--conventions-test-functions-and-exact-solution-carriers) owns Lorentzian conventions, exact solution carriers, causal Green operators, Lorentz-spinor and classical-to-quantum field bridges; RQFT3–RQFT10 own operator-valued distributions, Wightman/Haag–Kastler axioms, spin-statistics, Shale implementability, perturbative renormalization and scattering. [LocalVariationalFieldTheory LVF1–LVF6](../LocalVariationalFieldTheory/README.md) owns finite-order Euler–Lagrange/Noether theory, stress-energy and classical momentum/current constructions. Neither supplier proves the measurable induced-representation results in this roadmap. No field theorem follows merely from a unitary representation of spacetime symmetry.

## Shared group C*-algebra and weak-support comparisons

Before the applications, define `σ≺ρ` by `kerρ⊆kerσ` for integrated
representations of the full group C*-algebra, and
`Supp(ρ)={σ irreducible:σ≺ρ}`. Compare this with coefficient weak
containment and the hull-kernel topology through D1's universal integrated
representations. Own the following comparisons here.

For a closed subgroup H≤G construct the nondegenerate strictly continuous
map `C*(H)→M(C*(G))` from its canonical multiplier unitaries. Prove
weak containment passes to restriction: if the extension of ρ annihilates
a multiplier y, then yx lies in kerρ for every x∈C*(G); kernel inclusion
and nondegeneracy imply the extension of σ also annihilates y. Prove
inflation preserves weak containment through the corresponding quotient
C*-map. If `ρ_t=U_t⁻¹ρU_t` converges pointwise strongly to π, prove
`kerρ⊆kerπ`: dominated convergence gives strong convergence of integrated
L¹ functions and their C*-norm density extends this to every algebra element.

For a continuous action of H on locally compact abelian N construct
`C*(N⋊H)≃C*(N)⋊H≃C₀(N̂)⋊H` from D1's universal covariant pairs,
comparing both integrated forms. Construct the abelian Fourier C*-map
using V11's character/Fourier conventions and CStarAlgebras' commutative
Gelfand theorem. Pin the action modulus by `μ_N(hA)=δ(h)μ_N(A)`;
the semidirect left Haar measure is `δ(h)⁻¹ dn dh`. The M4 Lorentz
action has |det h|=1, hence δ=1. Prove the Fourier conjugation uses
`h·χ(n)=χ(h⁻¹n)`. For each model orbit identify H/Hχ with that orbit
as an equivariant homeomorphism by the σ-compact-group open-mapping
argument, and identify its induced integrated representation with the
covariant pair of orbitwise multiplication and the induced H-action.
The orbit-homeomorphism assertion requires a locally compact orbit (in
particular a locally closed orbit in the dual); state that hypothesis in
the open-mapping argument. These are comparison targets, not assumed consequences of the abstract
crossed-product notation.

## M0. Smooth vectors, compact types and semisimple representation bridges

Use native `ContRepresentation ℂ G H` and
`TauCeti.ContRepresentation.IsUnitary`, with the additional explicit
strong-continuity condition `∀ v, Continuous (fun g ↦ π g v)`.
Topological irreducibility means H is nonzero and the only **closed** invariant
complex submodules are 0 and H. Use native `Subrepresentation`, its
underlying submodule and `TauCeti.ContRepresentation.subrepresentation` for
restrictions; this Hilbert-space condition is distinguished from algebraic
`Representation.IsIrreducible`. Prove strong-continuity transport to native
subrepresentations by the subtype topology; the native operator-norm-continuity
lemma requires a stronger hypothesis. Consume CompactGroups for finite-dimensional
compact irreducibles, characters and Peter–Weyl density, LieGroups for the Lie
algebra/exponential and enveloping differential operators, LieHighestWeight
for PBW, and UO-E03 for the analytic-vector operator criterion.

Own the extension of Peter–Weyl to arbitrary strongly continuous unitary Hilbert
representations of compact K. With Haar(K)=1, define
`P_τv=d_τ∫_K conjugate(χ_τ(k))π(k)v dk` by **vector-valued** Bochner integration,
then prove boundedness and construct the continuous linear operator. No operator-norm
continuity or Bochner integrability into B(H) is assumed. Prove self-adjointness,
idempotence, `P_τP_σ=0` for inequivalent types, strong convergence of finite-subset
sums to1, and `H_τ≅τ⊗Hom_K(τ,H)`. Normalize the multiplicity Hilbert product by
`⟨A,B⟩=tr(A*B)/d_τ`, so the evaluation `v⊗A↦Av` is isometric; prove
basis independence, positivity, completeness and the completed-tensor comparison
using VNA V2. Prove compact-type projections preserve the
Gårding space by compact-measure convolution of its test functions. K-finite vectors
are exactly the algebraic sum of the H_τ, including infinite multiplicity before
admissibility is proved. Admissible means every H_τ, equivalently every multiplicity
space Hom_K(τ,H), is finite-dimensional. Build the finite-carrier/unitary-intertwiner
comparison with `ContIntertwiningMap`; all finite-dimensional compact unitary models
are transported to native `EuclideanSpace ℂ (Fin d)`.

Define a `(𝔤_ℂ,K)`-module by a complex Lie-module action and a locally finite K
representation whose action on each finite-dimensional K-stable subspace is continuous
(hence smooth), their Ad(K)-compatibility and equality of that differentiated K-action
with the restricted 𝔨-action on those subspaces. Use native Lie/module/representation carriers. Its
infinitesimal equivalence is an isomorphism of these K-finite modules. For connected
K prove a U(𝔤_ℂ)-isomorphism is automatically K-equivariant by integration on finite
K-orbit spaces; do not identify the full Gårding space with the K-finite space.

1. For every strongly continuous unitary representation of a finite-dimensional
   Lie group, construct the dense invariant Gårding space by integrated
   `C_c∞(G)` functions and the smooth-vector submodule. Build the derived Lie
   action, mixed-word domains and the complexified enveloping-algebra action,
   with `X*=-X` for real Lie algebra elements. Prove the integration by parts,
   convolution and π(g)-transport laws on those domains. Construct the positive
   auxiliary Nelson operator `N=1−Σdπ(X_i)²`; prove essential self-adjointness,
   graph cores for its powers and enveloping-operator Sobolev bounds. Pin
   Nelson's Theorem3 comparison as a **sufficient one-way statement**:
   if v∈⋂_m dom(N̄^m) and `Σ_m ‖N̄^m v‖s^m/m!<∞` for some s>0, then
   `g↦π(g)v` is analytic in Hilbert norm in LieGroups' BCH analytic charts.
   Prove the shift/sign comparison with `ΣX_i²`, the density of such vectors,
   and norm convergence of the local orbit power series. Own the analytic
   domination/ordered-commutator estimates of Nelson Lemma6.2 and Corollary3.2,
   including the factorially weighted sum over all Lie-algebra words; a
   uniform bound by `c^k‖N̄^(k/2)v‖` is not asserted. This does not identify
   group-analytic vectors with N-analytic vectors. Define a complex enveloping
   element of order m to be elliptic when its scalar homogeneous principal
   symbol is nonzero at every nonzero real covector. Consume
   PseudodifferentialOperators P5/P6's local interior distributional regularity
   and cutoff Sobolev estimates on G for that symbol, and prove their
   representation-vector/weak matrix-coefficient adapters here. Fix the
   differential dictionary: `R_X f(g)=d/dt|₀ f(exp(tX)g)` is right invariant,
   and `dπ(X)π(f)=π(−R_X f)` for left Haar and left integrated action.
   The assignment X↦−R_X transports the enveloping Lie/involution laws;
   prove its sign/order comparison with the source's right-invariant algebra.
   For power cores use symmetry and ellipticity of N^m and self-adjoint
   maximality to identify the closure with N̄^m. Prove Nelson–Stinespring Theorem2.2
   on the Gårding domain: for an elliptic enveloping element L, the closure
   of dπ(L*) is the adjoint of dπ(L). In particular symmetric elliptic L
   is essentially self-adjoint. Prove its Corollary2.4 separately: if L is
   symmetric elliptic and dπ(M*M) commutes with dπ(L) on this domain, the
   same adjoint-closure identity holds for M. Own the elliptic estimates,
   resolvent and spectral-commutation argument that passes from the common
   domain to the closures. For a symmetric central Z the displayed
   commutation hypothesis follows from centrality; the corollary proves
   essential self-adjointness of dπ(Z), without asserting that arbitrary
   symmetric enveloping elements have this property. Prove the general covariance
   `π(g)dπ(Z)π(g)⁻¹=dπ(Ad(g)Z)` on the Gårding core. For Z fixed by Ad(G),
   hence for every central Z when G is connected, prove π(g) transports
   the Gårding core and dπ(Z), hence transports its closure and commutes
   with its spectral projections. After this closure theorem, use spectral
   cutoffs and the commutation/domain estimates to construct dense vectors
   `E_Z([−n,n])π(f)w`, f∈C_c∞(G), analytic for that particular operator,
   with UO-E03's factorial bounds. These remain Gårding vectors because
   the spectral cutoff commutes with π(f); prove their dense span.
   This consequence is not used circularly to prove the closure theorem.
   Consume VNA's commutant and SAST spectral calculus to prove the
   bounded unitary Schur lemma for topologically irreducible π; deduce that
   these Ad(G)-fixed central closures are scalars. Split an Ad(G)-fixed central element into
   its Hermitian real and imaginary parts and construct the resulting
   infinitesimal character.
2. For a connected semisimple G with finite center and maximal compact K,
   prove Harish-Chandra admissibility: every irreducible unitary π has finite
   K-multiplicities, with `dim H_τ ≤ C_π (dim τ)²`.
   First own the general Cartan structure theorem in this scope: construct
   an involution θ of 𝔤 with positive form `−B_𝔤(X,θY)`. Integrate it
   explicitly on Ad(G) and apply LieGroups Layer9's semisimple specialization:
   that supplier proves connectedness, compactness, maximality of its fixed
   subgroup and the decomposition, without assuming maximality first.
   Lift the involution through the finite central cover as described below.
   Consume the resulting Layer9 decomposition `K×𝔭≃G` and derive its deformation
   retraction to K. Prove conjugacy of maximal compact subgroups by the
   following symmetric-space fixed-point argument, owned here. Consume
   RiemannianGeometry R1's reductive-complement construction and completeness
   for the invariant metric from B|𝔭. The symmetry induced by θ identifies
   its Levi–Civita connection with the canonical symmetric-space connection;
   prove that equality using the symmetry and the metric/torsion characterization.
   compute `R(X,Y)Z=−[[X,Y],Z]` in R1's convention, so
   `⟨R(X,Y)Y,X⟩=B([X,Y],[X,Y])≤0`.
   Prove `G/K≃𝔭` from the Cartan diffeomorphism and hence simple connectedness.
   Consume R2's Jacobi/exponential comparison, R4.1 with κ=0 and
   R4.4's Cartan–Hadamard theorem. Own here the squared-distance consequence:
   off p, `Hess(½r²)=dr⊗dr+r Hess r≥g`; extend across p using smoothness
   of squared distance in the global exponential coordinates. For a compact subgroup L minimize
   `x↦∫_L d(x,l·o)² dl`: prove properness and strict convexity from that
   bound, existence by complete finite-dimensional closed-ball compactness,
   and uniqueness, consuming HopfRinow's complete closed-ball compactness.
   Haar invariance makes the minimizer L-fixed, so L lies
   in a conjugate of K; maximality gives equality for maximal compact L.
   Transport the construction to the given K and prove compatibility with
   finite central covers. Here 𝔭 is
   the minus-eigenspace and `𝔨=Lie(K)` the plus-eigenspace. Build the
   involution from a compatible compact real form, with the following
   compatibility targets owned here. Consume LieGroups Layer7's
   Lie-algebra compact-real-form construction and its conjugation τ,
   including the positive Hermitian form `H_τ(X,Y)=−B_ℂ(X,τY)`
   (linear in X) and its realification/Killing comparisons.
   Let σ be conjugation defining 𝔤. On the realification of 𝔤_ℂ put
   ω=στ and ρ=ω². Prove ω self-adjoint for the positive form defined by τ
   and ρ positive; ω itself need not be positive. Prove positive spectral
   powers of ρ preserve brackets by the product law for its eigenspaces.
   With φ=ρ^(1/4), prove τ′=φτφ⁻¹ commutes with σ, so
   θ=τ′|𝔤 is the required positive Cartan involution. Compare with
   [Knapp, Chapter VI, Lemma6.15, Theorem6.16 and Corollary6.18](https://www.math.stonybrook.edu/~aknapp/books/green/file4.pdf).
   Own the adjoint-group comparison in this scope: prove ker Ad=Z(G) for
   connected G, and `Ad(G)=Int(𝔤)=Aut(𝔤)₀` using the semisimple derivation
   theorem and generation by exponentials. Aut(𝔤) is a closed matrix
   subgroup by its bracket equations; its identity component is closed,
   so LieGroups Layer2 supplies the Lie-group structure. Prove
   `θ exp(ad X) θ⁻¹=exp(ad θX)`, hence conjugation by θ preserves
   this adjoint group and defines its smooth involution. Prove G→Ad(G)
   a smooth surjective local diffeomorphism with finite kernel Z(G), hence
   a finite covering homomorphism. Consume Layer9's
   polar decomposition there and lift the Cartan data through the
   finite central cover G→Ad(G), with its kernel Z(G).
   Prove the adjoint involution fixes
   the fundamental-group/deck data using its deformation retraction to the
   fixed subgroup, so it lifts to the chosen finite cover. Consume
   LieGroups Layer5's covering/lift construction and DifferentialGeometry
   2.3's smooth-cover adapter; export here the lifting criterion in terms
   of the image subgroup of π₁ using path lifting and endpoint independence.
   Prove the lifted map fixes the identity, is a homomorphism and squares
   to the identity by uniqueness of lifts on connected G and G×G.
   Apply Layer9
   directly to this lifted involution on G for connectedness, compactness,
   maximality of G^θ and the decomposition; identify its fixed subgroup with
   the preimage of the adjoint fixed subgroup using those decompositions.
   Finite center need not make G
   itself a faithful matrix group. LieGroups Layer9 consumes Cartan data;
   this general existence/comparison is an M0 target before that use.
   Pin `B_𝔤` as the Killing form of the **real** Lie algebra 𝔤. Use bases
   orthonormal for `−B_𝔤|𝔨` and `B_𝔤|𝔭`, not the Killing form of 𝔨
   considered as a separate Lie algebra. The central Casimir is
   `C=−ΣX_i²+ΣY_j²`; with `Δ_K=−ΣX_i²`, the positive comparison is
   `N=1−ΣX_i²−ΣY_j²=1−C+2Δ_K`. Prove these identities before admissibility.

   Own the symmetric-pair invariant and harmonic API needed for the algebraic
   proof. Identify polynomial functions on 𝔭_ℂ with its symmetric algebra
   through the nondegenerate Killing form. Consume LieGroups Layer9's maximal
   abelian 𝔞⊂𝔭, restricted roots and W=N_K(𝔞)/Z_K(𝔞); define invariant
   restriction using those carriers and prove
   `S(𝔭_ℂ)^K≅S(𝔞_ℂ)^W`. Prove polynomiality and the Kostant–Rallis
   separation `S(𝔭_ℂ)≅S(𝔭_ℂ)^K⊗H`, with H the joint kernel of the
   positive-degree invariant constant-coefficient differential operators.
   Prove graded/K-equivariant multiplication, finite K-multiplicity of H
   with a uniform `dim H_τ≤C(dim τ)²` bound, and the comparison with the
   coordinate representation of a regular semisimple K-orbit. Prove the
   invariant ring is finite over the restrictions of the leading symbols
   of `Z(U(𝔤_ℂ))`; equality/surjectivity of these restrictions is not assumed.
   Derive this finiteness through injective restriction to 𝔞, characteristic-
   polynomial invariants of the adjoint action and integrality of its
   coordinate functions over the restricted invariant algebra; prove the
   corresponding graded finite-module statement. Consume LieHighestWeight's PBW
   filtered/symmetric-algebra comparison and its Harish-Chandra center map through
   S(𝔥); it does not supply the symmetric-pair invariant theory.
   Consume Layer7's `pbwSymmetrization`, its permutation-average formula,
   `pbwSymmetrization_symbol`, `pbwSymmetrization_mem_center_iff` and filtered
   associated-center/invariant comparison, specialized to 𝔤_ℂ. This β is
   linear, not an algebra homomorphism. Own only the symmetric-pair bridge:
   use the Killing identification on all of 𝔤_ℂ, proving restriction of
   invariant polynomial functions to 𝔭_ℂ agrees with symmetric-algebra
   projection along 𝔨_ℂ. Define the 𝔭-degree filtration, prove the PBW
   vector-space factorization `β(S(𝔭_ℂ))⊗U(𝔨_ℂ)≃U(𝔤_ℂ)`, and prove
   `symbol_𝔭(β(f))=Res(f)` for the homogeneous adjoint invariants used above.
   These definitions, restriction maps and leading-symbol identities are M0
   targets before applying the algebraic admissibility theorem.

   Prove the resulting algebraic theorem: a finitely generated `(𝔤_ℂ,K)`
   module that is Z-finite has finite K-multiplicities with such a uniform
   bound. Z-finite means each vector's central-algebra orbit is finite-dimensional;
   for a finitely generated module prove equivalence to annihilation by a
   cofinite central ideal. Use PBW, harmonic separation and the finite module
   over the restricted central symbols, including finite generators and tensor
   multiplicity bounds; PBW or a scalar central character alone does not prove
   admissibility.

   Close the analytic bootstrap **without assuming π already admissible**.
   Item1 makes the center scalar for irreducible π and connected G. For a
   K-finite Gårding vector the displayed Cartan N is scalar on each of its
   finitely many compact types, so item1's one-way N-analytic criterion makes
   it group-analytic. This lemma applies before item3. Choose such a nonzero
   v using the compact projections and form `M=U(𝔤_ℂ)span(K·v)`. Prove M is
   finitely generated, K-locally finite, smooth, Z-finite and algebraically
   admissible by the preceding theorem. Prove its Hilbert closure G-invariant
   by the analytic power series; irreducibility makes that closure all H.
   Since P_τM is finite-dimensional and dense in H_τ, they are equal. This
   gives the claimed bound and the native continuous-intertwiner comparison. The group-theoretic instances used here are
   `(SL(2,ℝ),SO(2))`, `(SL(2,ℂ),SU(2))` with SL(2,ℂ) a real Lie group,
   and `(Spin₀(4,1),Spin(4))`. For the last pair use native
   `CliffordAlgebra.realCliffordSpinGroup 4 1`, with
   `CliffordAlgebra.realCliffordSpinGroupZero 4` as compact
   model. Native `realCliffordForm 4 1` is the negative of M5's ambient form;
   the same linear action preserves both. Consume SpinRepresentations Layer7's
   inherited topology/cover comparisons and its identity-component image
   theorem in indefinite signature. For its normalization comparison,
   timelike means native-negative, equivalently M5-positive: verify that
   norm-one even Clifford products have even timelike-reflection parity
   and even total reflection parity in that supplier's image theorem.
   Its `spinPQ p q` and native `CliffordAlgebra.realCliffordSpinGroup p q`
   both abbreviate `CliffordAlgebra.spinGroup (TauCeti.realCliffordForm p q)`;
   export their identity-on-elements comparison with the inherited topology.
   Prove the native group connected:
   its identity component covers connected SO₀(4,1), and both kernel elements
   lie in the connected compact Spin(4) subgroup. Its identity component is
   therefore the whole native carrier. Prove the maximal-compact inclusion
   and Lie-group adapters, including the signature/permutation and
   opposite-form even-Clifford comparisons for the compact model. The
   native positive-definite Spin(n) inclusion is not an indefinite-signature
   inclusion theorem. Supply the latter through the quadratic embedding
   and inherited-topology comparisons in SpinRepresentations Layer7,
   rather than inventing a
   separate Spin carrier. Construct all three Cartan decompositions from
   LieGroups and verify connectedness, finite center and maximal compactness.

   **M0.RealLorentzExport — concrete real Lie and Killing carriers.** For the `(SL(2,ℂ),SU(2))` example, use the finite-dimensional boundaryless real Lie-group structure supplied by LieGroups Layers0–3 and prove connectedness of SL(2,ℂ), for example by its SU(2)/positive-Hermitian polar decomposition. Identify its actual native `LeftInvariantDerivation I (Matrix.SpecialLinearGroup (Fin 2) ℂ)` with `RealSl2C := RestrictScalars ℝ ℂ (LieAlgebra.SpecialLinear.sl (Fin 2) ℂ)` by a real LieEquiv. Consume the LieRing/LieAlgebra restriction instances from `Mathlib.Algebra.Lie.BaseChange`. The existing derivation–tangent comparison is linear, under its finite-dimensional real, T2 and identity-interior hypotheses; verify those hypotheses for the constructed matrix-group model and prove the matrix bracket comparison needed for this LieEquiv. Prove `B_ℝ(X,Y)=8 Re(trace(XY))` on RealSl2C and its nondegeneracy, giving finite dimension and the actual `LieAlgebra.IsKilling ℝ` instance. Transport the form, finite dimension and Killing instance onto `LeftInvariantDerivation` itself using native `LieAlgebra.killingForm_of_equiv_apply` and `LieEquiv.isKilling`. An instance on the trace-zero matrix carrier alone is not the exported instance on the group's derivation carrier.

   Also construct the ordinary connected Lorentz group on `V_η=(Fin 1⊕Fin 3)→ℝ`, with `η=LieAlgebra.Orthogonal.indefiniteDiagonal (Fin 1) (Fin 3) ℝ` and `Q_η(x)=xᵀηx`. Consume native `TauCeti.QuadraticMap.specialOrthogonalGroup Q_η` and `specialOrthogonalToGeneralLinear`; identify its coordinate image in `Matrix.GeneralLinearGroup (Fin 1⊕Fin 3) ℝ` exactly with `AᵀηA=η`, `det A=1`, with the inherited topology. Take its identity component, denoted `SO₀(3,1)` in M4's convention, and give it the boundaryless real LieGroup structure from LieGroups2. This is the indefinite Gram matrix, not the standard positive-definite `Matrix.specialOrthogonalGroup` or the weightedSumSquares-one comparison. Identify its `LeftInvariantDerivation` by a real LieEquiv with native `LieAlgebra.Orthogonal.so' (Fin 1) (Fin 3) ℝ`; prove `B(X,Y)=2 trace(XY)` and nondegeneracy. Export finite dimension and `IsKilling ℝ` on both this matrix Lie algebra and the ordinary group's actual derivation carrier, using the same native equivalence-transport lemmas.

   Construct the smooth congruence homomorphism from SL(2,ℂ) on the native real Hermitian-matrix submodule, using `H(x)=[[x⁰+x¹,x²−ix³],[x²+ix³,x⁰−x¹]]`, with `det H(x)=η(x,x)`. Own the single signed continuous linear equivalence `Q_N:(Fin 4→ℝ)≃L[ℝ]V_η`, whose time-first coordinates are `x=(p₃,p₂,−p₁,p₀)` and whose inverse is `(x³,−x²,x¹,x⁰)`. Prove form preservation and `H(Q_N p)=realCliffordThreeOneVectorEquivHermitian p`, whose off-diagonal is `−p₁−ip₀`. Thus the +--- ordinary-group coordinates agree with M4's native time-last `diag(−1,−1,−1,+1)` convention and its negative-realCliffordForm determinant law. Prove the congruence homomorphism's real derivative is `X:H↦XH+HX†`, that it induces the stated Lie-algebra equivalence, that its group kernel is `{±I}`, and that its image is the identity component: connectedness puts the image there, and its locally invertible derivative makes it an open subgroup, hence all of that component. Prove the local two-sheeted cover charts and the smooth Lie-group quotient comparison `SL(2,ℂ)/{±I}≃SO₀(3,1)`, compatible with the Killing and derivation identifications. Transporting this same action back by Q_N is exactly M4's native Hermitian action, also compared with `TauCeti.realSpinThreeOneEquivSpecialLinear_action`; no second Lorentz-action convention is introduced. These finite-dimensional exports use only the native algebra/matrix inputs and LieGroups0–3/local quotient charts, not QF5, the Gårding/admissibility theorems or a representation classification. QF5 and other finite-dimensional Lorentz consumers use the exported actual carriers/instances downstream. The arbitrary connected semisimple finite-center scope of item2 remains unchanged.

3. A K-finite vector is one whose K-orbit spans a finite-dimensional complex
   subspace. Build its submodule, sum/scalar/restriction/intertwiner API and
   identify it with the algebraic sum of compact isotypic spaces. For the
   connected semisimple finite-center G and maximal compact K of item2,
   prove for every admissible unitary π that these vectors are smooth, analytic in the
   Hilbert norm and stable under the derived complexified Lie algebra and K.
   Smoothness follows by applying compact-type projections to Gårding vectors
   and finite-dimensionality. Use item2's already proved Cartan identity.
   On a finite K-isotypic space Δ_K is scalar and C is a finite-dimensional
   Hermitian operator preserving it; C need not be scalar for a general
   admissible π. Thus N is bounded there. Prove its power estimates and use
   item1's elliptic analytic-vector comparison to obtain Hilbert-norm
   analytic orbit maps. Construct the compatible `(𝔤_ℂ,K)`-module and prove that
   closed invariant Hilbert subspaces correspond to its algebraic submodules,
   by intersection with K-finite vectors and Hilbert closure. Prove the
   inverse laws, including the finite-isotypic closure argument and invariance
   under exponentials. Deduce topological irreducibility iff this module is
   irreducible. For irreducible unitary π,ρ prove infinitesimal equivalence
   yields a unitary group intertwiner: construct the invariant Hermitian
   comparison, use its polar decomposition and analytic-vector integration,
   and prove the converse. No bounded extension of an arbitrary algebraic
   intertwiner is assumed.
   **Unitarization and integration.** For an admissible `(𝔤_ℂ,K)`-module with
   a positive-definite invariant Hermitian form, construct its Hilbert
   completion and the strongly continuous unitary K-action. The real Lie
   algebra acts by skew-symmetric operators on the dense invariant algebraic
   K-finite domain. The Cartan formula above makes N a finite-dimensional
   Hermitian operator on each finite isotypic summand. Prove every algebraic
   vector is N-analytic and apply UO-E03 to its dense domain, then Nelson's
   Theorem5 to integrate the real Lie action to the simply connected group.
   For a nonfaithful Lie action apply that operator theorem to its image
   `𝔤/ker ρ`: choose a basis adapted to the kernel and its Killing-orthogonal
   ideal complement, prove θ-stability and that the zero summands leave the
   represented sum of squares unchanged, then pull back along LieGroups'
   simply connected quotient homomorphism. Treat the zero image/trivial
   representation directly. Verify all product domains, real linearity, brackets and basis sum-of-squares
   hypotheses; LieGroups' finite-dimensional Lie integration alone does not
   integrate these unbounded Hilbert operators. Prove uniqueness and agreement
   with the given K-action. Use the Cartan deformation to K and the represented
   period lattice to prove descent to the chosen finite-center G; prove this
   for each of the three group instances. Show the resulting K-finite module
   is the original module. For semidefinite forms first quotient the radical
   and prove stability/admissibility. M4/M5 must check these hypotheses for
   every separately metrized induced subquotient before calling it a unitary
   representation, including boundary and discrete/limit constituents.

4. Prove that these three groups are CCR. For f∈C_c∞(G), let P_R be the sum
   of compact K-types with nonnegative Δ_K-eigenvalue λ_τ≤R, **including λ_τ=0**.
   Prove there are finitely many such K-types by the compact highest-weight
   Casimir formula and lattice bounds.
   By admissibility P_R has finite rank. Prove
   `‖(1−P_R)π(f)‖ ≤ (1+R)⁻¹‖π((1+Δ_K)f)‖`
   from the compact spectral decomposition and the derived-convolution law;
   `(1+Δ_K)f` uses the right-invariant test-function derivatives fixed in item1,
   so π(f) is compact. Use density of C_c∞(G) in the full group C*-algebra and
   prove that an irreducible C*-algebra of compact operators equals K(H).
   Thus every irreducible group-algebra image is K(H). M2's factor/image
   comparison proves Kaplansky's implication CCR⇒every factor representation
   generates a type-I factor. M2 owns this direction for the second-countable
   group C*-algebras here; it feeds the little-group type-I hypotheses in M2
   and the direct-integral uses in M6. No Glimm converse is required for this step.
   Transport CCR to the finite central quotients SO₀(1,2), SO₀(3,1) and
   SO₀(4,1): normalized integration over the finite kernel makes pushforward
   onto C_c of the quotient surjective, so an irreducible representation of
   the quotient and its pullback have identical integrated images.

The proof-route sources are Harish-Chandra's
[*Representations of Semisimple Lie Groups II*](https://doi.org/10.1073/pnas.37.6.362)
and [*III: Characters*](https://doi.org/10.1073/pnas.37.6.366), together with
[*Representations of a semisimple Lie group on a Banach space I*](https://doi.org/10.1090/S0002-9947-1953-0056610-2)
as the expanded Banach-space reference. The Hilbert proof specified here uses
the explicit compact decomposition, symmetric-pair algebra and Nelson criteria.
For the algebraic admissibility proof see N. R. Wallach, *Real Reductive Groups I*
(1988), §§3.4.1–3.4.10, including the restricted central-symbol identity and
finite invariant quotient; [Kostant–Rallis (1971)](https://doi.org/10.2307/2373470)
supplies the symmetric-pair theorem. [Roe Goodman's *The Kostant–Rallis Theorem*](https://sites.math.rutgers.edu/~goodman/pub/cunytalk.pdf),
§9 Theorem12, states harmonic separation and multiplicity `dim τ^M`; M0 owns
its proof and the filtered/tensor estimates, not merely its invocation.
For the preliminary quasi-simple and unitary-equivalence statements see
[*Representations of a Semisimple Lie Group on a Banach Space*, PNAS37(3),170–173](https://doi.org/10.1073/pnas.37.3.170).
Nelson's [*Analytic Vectors*](https://doi.org/10.2307/1970331), Theorem3,
Corollary3.2, Lemma6.2 and Theorem5, supplies the one-way Laplacian and
unbounded-operator integration route, with descent proved here.
Nelson–Stinespring's
[*Representation of Elliptic Operators in an Enveloping Algebra*](https://doi.org/10.2307/2372913)
supplies Theorem2.2 and Corollary2.4's elliptic/central closure route; every domain/analytic comparison above
is an owned target. M4 and M5 consume this bridge before their noncompact
unitary-dual exhaustion proofs.

## M1. Systems of imprimitivity and induction

Consume [QuantumFoundations QF0–QF1 and QF5](../QuantumFoundations/README.md#milestone-qf5--rays-wigner-symmetry-and-projective-representations) for projective Hilbert-space/ray carriers, Wigner and Uhlhorn theorems, unitary/antiunitary alternatives, local lifts, normalized multipliers, and section-change/coboundary laws. This milestone adds the measurable system-of-imprimitivity and induced-model interface on those existing carriers; it does not reprove ray geometry or projective representation theory.

For a second-countable locally compact group `G` acting continuously on a Polish space `X` with its Borel sigma algebra, define a system of imprimitivity `(U,E)` on a separable complex Hilbert space: `U` is strongly continuous and unitary, `E` is a normalized projection-valued measure, and `U_g E(B) U_g⁻¹ = E(gB)`. Prove direct sums, reducing subspaces, intertwiners, unitary equivalence, and covariance under Borel equivariant maps. State the exact topology/measurability assumptions for each construction.

For a transitive space `X=G/H`, with H closed and a quasi-invariant measure class, prove Mackey's imprimitivity equivalence: every such system is unitarily equivalent to induction of a representation of H, and conversely. Construct the quotient bundle and measurable sections and prove independence from their choice. On `L²(G/H, μ; K)` give the induced action with the Radon–Nikodym square root and modular factors; prove unitarity, strong continuity, covariance and the intertwining equivalence. Show how this model agrees with D3 Green induction after the H3 correspondence-to-Hilbert-space comparison, including both modular functions. Include the one-point space, `H=G`, `X=G`, and compact quotient as normalization cases.

### Finite quotient spaces and almost-conjugate deck subgroups

Let `G` be a second-countable unimodular locally compact group and let `Γ ◁ Γ₀ ≤ G` be
lattices with finite quotient `Q=Γ₀/Γ`. For `H≤Q`, write `Γ_H` for its inverse image in `Γ₀`.
Give `Γ\G` its right-regular `G`-action and its finite left deck action by `Q`; these actions
commute. Use the quotient measures induced by one fixed Haar measure on `G`. Prove that left
translation by `Γ₀` preserves the quotient measure, using normalization of `Γ` and unimodularity
of `G`. The deck representation on functions is `(q·f)(Γx)=f(q⁻¹·Γx)`; prove it is unitary
and commutes with the right-regular `G` representation. For the finite
cover `p_H:Γ\G→Γ_H\G`, prove the measure formula
`∫_(Γ\G) f∘p_H = |H| ∫_(Γ_H\G) f`, and the normalized pullback
`J_H f=|H|^(−1/2) f∘p_H` is a unitary from `L²(Γ_H\G)` onto
`L²(Γ\G)^H`. Prove it intertwines the right-regular `G` actions. Establish the formula first for
compactly supported functions and then extend by density; identify the quotient measure
normalization explicitly so no invariant-measure assumption is smuggled in. Inversion converts
these right-quotient conventions to the `G/Γ` convention used by the general induced model.

For almost-conjugate subgroups `H₁,H₂≤Q`, consume
[InductionRestriction Layer 2.1](../RepresentationTheory/InductionRestriction/README.md#layer-21-almost-conjugacy-and-permutation-representations),
`Gassmann.almostConjugate_iff_permutation_equiv`, to identify almost-conjugacy with isomorphism
of the complex permutation representations `ℂ[Q/H₁]` and `ℂ[Q/H₂]` as `Q`-modules.
Equip each permutation module with the ℓ² inner product for which its coset basis is
orthonormal, transported to `EuclideanSpace ℂ (Q ⧸ H)`; prove the left-coset action is unitary.
For the resulting equivariant linear isomorphism `T`, prove `T*T` commutes with `Q`, and
unitarize it by `U=T(T*T)^(−1/2)`. Prove the inverse square root exists and commutes with `Q`,
so `U` is an equivariant unitary between these specified permutation Hilbert spaces. For every
unitary representation of finite `Q` on a Hilbert space `V`, construct a unitary
`V^H₁≃V^H₂` from this permutation-module intertwiner. Consume IR's underlying linear
Hom/invariants equivalence through `Rep.indResAdjunction` and `TauCeti.indTrivialIso`, and
prove its isometric normalization here: identify `V^H` with
`Hom_Q(ℂ[Q/H],V)` with Hilbert–Schmidt inner product
`⟨φ,ψ⟩_HS=Σ_(c∈Q/H)⟨φ(δ_c),ψ(δ_c)⟩`. Send `v∈V^H` to the equivariant
map `δ_(qH)↦[Q:H]^(−1/2)q·v`; the inverse is `[Q:H]^(1/2)` times evaluation at the identity
coset. Prove these are inverse isometries, and use precomposition with the inverse of the
unitarized permutation intertwiner to obtain the unitary between the two Hom spaces.
Prove that this unitary `W:V^H₁→V^H₂` commutes with the restrictions of every bounded
operator on `V` commuting with `Q`. In particular it sends each isotypic component
`V_π^H₁` onto `V_π^H₂`, where `V_π^H=range(P_π)∩V^H`, by commuting with the central character projection
`P_π=(dim π/|Q|)Σ_q conjugate(χ_π(q))·q`. Apply this to `V=L²(Γ\G)` and export the composite
`J_H₂⁻¹ ∘ W ∘ J_H₁ : L²(Γ_H₁\G)→L²(Γ_H₂\G)` as a unitary intertwining the two
right-regular `G` representations. This is the generic finite-index lattice-quotient adapter consumed by
FuchsianOrbifolds L9. It proves neither scalar Laplace isospectrality nor any spectral theorem.


For projective data, define normalized Borel multipliers `ω:G×G→𝕋`, twisted unitary representations, central extensions, Borel sections and their cocycles. Prove the equivalence between section changes and coboundaries. Establish the twisted imprimitivity theorem with explicit multiplier restriction/transport on H; distinguish a genuine representation of the central extension from an `ω`-representation. Own the Mackey–Weil converse for a normalized Borel circle cocycle on a
second-countable locally compact group: construct the central standard-Borel
group, its invariant measure and the locally compact second-countable group
topology with that Borel structure, and prove uniqueness and the continuous
kernel/projection comparisons. Supply the measurable-group reconstruction
lemma, rather than assert that the product topology makes a merely Borel
cocycle continuous. Prove its comparison with the locally sectioned extension
construction whenever that additional hypothesis holds.

For a continuous open surjective homomorphism q:E→G of Polish groups with
closed central kernel𝕋, prove existence of a normalized Borel section: the
closed fibers form a Borel closed-valued multifunction because q is open;
prove its Borel selection using countable nested balls in a complete compatible
metric. Supply this selection lemma here if the consumed uniformization API
only provides a universally measurable selector. Define the section multiplier
and prove its Borel cocycle and phase-change laws. If the extension has local
continuous sections, compare its Borel cocycle with QF5's locally continuous
extension convention. A global continuous section exists exactly when this
principal circle bundle is trivial; prove the section/trivialization comparison.
A genuine continuous representation lift further requires triviality of its
multiplier class. Never infer either lift merely from a trivial-looking Lie
algebra cocycle.

## M2. Regular Mackey machine

Let `G=N⋊H` be second-countable locally compact with N locally compact abelian. Use native Mathlib `PontryaginDual N` with its compact-open topology and circle-valued character carrier. Pin the dual action `h·χ(n)=χ(h⁻¹·n)` and the V11 Fourier/Pontryagin conventions. For the regular-action theorem assume a standard Borel orbit space Q, a Borel quotient map `q:N̂→Q` whose fibers are precisely the H-orbits, and a Borel section `s:Q→N̂` with `q∘s=id`. These are explicit hypotheses; in every model application prove them from its orbit parameters and chosen representatives. Prove that this smooth quotient implies regular embedding in Mackey's measure-class sense and that every ergodic invariant measure class is concentrated on one orbit. For irreducible exhaustion require `G` and all stabilizers second-countable locally compact and `N̂` standard Borel; prove the normal subgroup's metric-smooth/type-I hypotheses using its abelian character dual. The split untwisted classification uses ordinary little-group representations. For a specified global twist, using this character dual requires an explicit coboundary trivialization of its restriction to N; give its extension and little-group obstruction data. If that restriction is nontrivial, instead construct the actual projective normal-subgroup dual and establish its metric-smooth/type-I and regular-embedding hypotheses before applying the twisted theorem; ordinary characters are not its representation labels. Prove exhaustion under these regularity hypotheses, without a type-I requirement on little groups. Separately prove Mackey's sufficient type-I criterion: if every stabilizer's relevant twisted group algebra is type I, then G (or its specified twisted algebra) is type I. Here type I means every factor representation generates a type-I von Neumann algebra, using VNA's spatial type-I factor carrier. Own Kaplansky's direction for separable group C*-algebras: if every irreducible image equals K(H) (CCR), every factor representation generates a spatial type-I von Neumann factor. This is the implication consumed from M0's CCR result; HilbertModules H3's irreducible-image convention and VNA's factor carrier are compared in this direction. A converse is not used to prove the little-group hypotheses. Use type I where required by direct-integral disintegration and uniqueness in M6 and by the product theorem below. Mackey1958 Theorems8.1,8.4,9.1 and9.3 supply the proof route with these distinct hypotheses. For each χ construct the closed stabilizer `Hχ`. In the ordinary split semidirect product, χ extends genuinely to `N⋊Hχ` by `χ̃(n,h)=χ(n)`, because every h in Hχ fixes χ; prove the extension law explicitly. Thus the little-group datum for genuine representations is an ordinary genuine unitary representation of Hχ and its multiplier is trivial (up to the chosen coboundary). Do not assign arbitrary projective data here. Reserve nontrivial multipliers for a separately specified global twist/central extension or genuinely nonsplit extension, and give its cocycle, section, and restriction/transport data.

Under the stated regular-action hypotheses, prove that induction of `χ̃⊗τ` from `N⋊Hχ` to `N⋊H` is irreducible, that equivalence is exactly orbit transport plus equivalence of the transported genuine τ: for χ₂=h·χ₁, prove `Hχ₂=hHχ₁h⁻¹` and define `τ₁^h(k)=τ₁(h⁻¹kh)` on Hχ₂, then state the unitary intertwiner condition with τ₂, and that these exhaust irreducibles. Prove the exact regularity, separability and Borel-section hypotheses in each application; establish type I separately for the uses that require it. The irreducible regular Mackey classification above does not require G or
its little groups to be type I. Product decomposition and unique direct-integral
claims retain their stated type-I hypotheses; the orbit classification retains
its smooth quotient and Borel-section hypotheses. Prove the tensor-product theorem for irreducibles of `G₁×G₂` when both factors are second-countable and at least one is type I, for irreducible strongly continuous unitary representations on separable Hilbert spaces; prove the exterior tensor product is irreducible and every irreducible of the product is such a product. Explain that type-I disintegration is used for the converse, and do not claim the result for two non-type-I factors.

Also own the GCR orbit criterion before the model applications: under the
regular-action/Borel hypotheses above, assume every momentum orbit locally
closed and each little-group irreducible integrated image contains a nonzero
compact operator. Prove the induced irreducible image contains nonzero
compacts, using D1's invariant-ideal/subquotient exactness and D3's Green
imprimitivity on each orbit layer, with explicit compact operators from
localized slices and the little-group compact operators. Prove transport to
the ambient crossed product. Export this criterion for recursive application
to little groups as well as to M5's Poincaré fiber; no later-milestone
construction is required to prove it.

## M3. Euclidean, Galilei and Bargmann models

Define both `G_E=ℝ⁴⋊SO(3)` and its double cover `G̃_E=ℝ⁴⋊SU(2)`, with the covering action rotating the first three coordinates and fixing time. Use spatial/time characters `χ_(p,E)(a,t)=exp(i(−p·a+Et)/ℏ)` and physical
evolution at time t equal to the active symmetry at −t. Classify their genuine
representations separately by M2. At zero spatial momentum the stabilizers are respectively SO(3) and SU(2): the ordinary group has integer spin j, while the cover permits j∈(1/2)ℕ, with central −I acting as (−1)^(2j). At nonzero spatial momentum choose `(0,0,r,ε)`, r>0, ε∈ℝ. The stabilizers are SO(2) and its circle double cover inside SU(2). Parameterize the ordinary character by `e^(inφ)`, n∈ℤ, and the cover by
`e^(inθ)` where φ=2θ; its helicity is n/2 and central character is (−1)^n. Prove these orbit/stabilizer and induced Hilbert-space identifications, and exactly which cover representations descend to G_E. Consume QF5's locally continuous circle-extension classification and its SU(2) pushout for the projective SO(3) sector, transported through M1; half-integer spin is not a genuine SO(3) label and no global continuous section is assumed.
First prove `H²_lc(G̃_E,𝕋)=0`: use QF5's smoothing/Whitehead input to remove
rotation and mixed cocycle blocks; the remaining alternating forms on
ℝ³⊕ℝ have no SO(3)-invariant vectors, so their invariant2-form space is zero.
Integrate on the simply connected cover and prove period uniqueness. Thus the
ordinary Euclidean group's only extra ray-extension datum is QF5's spin class;
a general translation multiplier cannot be extended rotation-covariantly here. Prove the systems-of-imprimitivity comparison and distinguish these Euclidean/time-translation groups from the inhomogeneous Lorentz group.

Compare M1's spatially localized model
`L²(ℝ³;V_j)` with QF6's position/momentum operators and its Fourier transform.
With fixed time character ε, prove that this is an irreducible covariant
system for the Euclidean spatial action and irreducible rotation datum, while
its underlying unitary group representation is reducible. Decompose its
momentum realization over radii r>0 and the SO(2) or covering-circle characters
in the restriction of V_j, with radial measure r²dr up to the stated Haar
normalization; the origin has zero Lebesgue measure. Use these actual little-group
labels, rather than identifying the whole localized model with a zero-momentum
irreducible labelled only by (j,ε). Derive angular momentum as orbital plus the
differentiated spin action, with QF6's common Schwartz core and sign conventions.

**Galilei multiplication, multipliers and the Bargmann extension.** Fix ℏ>0,
spatial vectors a,v∈ℝ³ and R∈SO(3), with the SU(2) covering variant treated
separately. Set g=(R,v,a,t) acting on spacetime by
`(x,s)↦(Rx+vs+a,s+t)`, with left composition
`g₁g₂=(R₁R₂,v₁+R₁v₂,a₁+R₁a₂+t₂v₁,t₁+t₂)`.
Construct this topological Lie group and its rotation cover. In particular boosts
do not commute with time translations. Prove also that the proper Galilei
group has trivial center and its rotation cover has center {±1}; neither
has the central ℝ factor required by an abstract direct product with ℝ. Define
`τ(g₁,g₂)=v₁·R₁a₂+(t₂/2)|v₁|²` and prove normalization and the additive
2-cocycle identity by rotational dot-product invariance. Define the real central
extension `(z₁,g₁)(z₂,g₂)=(z₁+z₂+τ(g₁,g₂),g₁g₂)`; its mass-m character is
`z↦exp(imz/ℏ)`, and its quotient multiplier is `ω_m=exp(imτ/ℏ)`.
Prove these group, topology, section and representation comparisons using M1;
this extension has a global continuous section, separately from QF5's SO(3)
spin circle extension. The circle extension at a fixed m is the pushout by
that central character.

Own the Galilei-specific cohomology computation
`H²_lc(G̃_G,𝕋)≅ℝ`, with QF5's precise locally continuous extension convention.
Use QF5's local-exponent smoothing and smooth Lie-extension comparison, not
just regularity of a homomorphism between already constructed Lie groups.
Remove rotation/rotation cocycle terms using its scalar degree2 Whitehead
lemma, then rotation/radical mixed terms using its degree1 lemma for the
finite-dimensional radical dual. The remaining rotation-invariant alternating
forms on boosts⊕translations⊕time are exactly the multiples of the boost/
translation dot pairing. Verify the radical cocycle equation and show a
coboundary cannot change this pairing. This is a self-contained block-cochain
proof, not an assumption of the connected classification from a source table.
Prove integration and uniqueness using the simply connected rotation cover
and the explicit Bargmann extension, including all period conditions.
Every class is represented by exactly one globally continuous ω_m; prove the
comparison with H²_cont is an isomorphism here (a locally continuous phase
whose coboundary is globally continuous is itself globally continuous).
For the proper group
with SO(3) rotations, use the locally continuous extension convention of QF5:
the mass parameter and the independent two-valued spin-cover class give its
full circle-extension classification. Prove the rotation-cover descent and
kernel-character test; do not represent a nontrivial spin class by a globally
continuous section. The Lie brackets `[K_i,T_j]=δ_ij M` and `[K_i,S]=T_i`,
where T,S are spatial/time translation generators, prove the mass extension
is nonsplit and fix its normalization.

**Full genuine irreducible classification.** Split the real Bargmann group as
`N⋊H`, with `N=ℝ_z×ℝ³_a×ℝ_t` abelian and `H=ℝ³_v⋊SO(3)`, or its SU(2)
variant. Prove the normal-subgroup conjugation
`α_(R,v)(z,a,t)=(z+v·Ra+(|v|²/2)t,Ra+vt,t)`.
With characters `χ_(m,p,E)=exp(i(mz−p·a+Et)/ℏ)`, M2's inverse dual action is
`(R,v)·(m,p,E)=(m,Rp+mv,E+(Rp)·v+(m/2)|v|²)`.
Prove this topological Pontryagin comparison, the regular Borel orbit quotient
and explicit sections in every branch below. Classify the little groups by
M2 and the compact suppliers, proving induction, inequivalence and exhaustion.
Prove the proper Bargmann group and its rotation cover are type I by M2:
the SO(3)/SU(2), E(2) and E(3) stabilizers are type I, the latter two by
M2 again with their smooth radius orbits and compact stabilizers. This is
the hypothesis used by M6's Galilei direct-integral uniqueness.
For arbitrary separable strongly continuous unitary representations, use the
central ℝ spectral PVM and VNA disintegration to obtain a measurable mass-sector
decomposition; an irreducible has one scalar mass. Distinguish that decomposition
from further irreducible disintegration, whose type-I hypotheses must be checked.

| Mass/momentum branch | Orbit labels and stabilizer | Complete little-group labels |
| --- | --- | --- |
| m≠0 | U=E−|p|²/(2m)∈ℝ; representative (m,0,U); SO(3) or SU(2) stabilizer. | Spin j∈ℕ₀ for SO(3), j∈½ℕ₀ for SU(2). Thus genuine irreducibles have independent labels (m,U,j), including either sign of m. |
| m=0, |p|=r>0 | Representative (0,r e₂,0); energy varies through all ℝ along the orbit. Stabilizer ℝ²_transverse boosts⋊SO(2), or the covered rotation circle. | Zero transverse-boost covector: circle character/helicity s∈ℤ or ½ℤ. Nonzero transverse covector radius κ>0: trivial stabilizer for SO(2), and kernel {±1} with either central character for its circle cover. |
| m=0, p=0 | E∈ℝ is fixed; representative (0,0,E); stabilizer all H. | Zero boost-dual covector: SO(3)/SU(2) spin j. Nonzero boost-dual covector radius κ>0: SO(2)/covered-circle character s∈ℤ or ½ℤ. In both cases E is independent. |

Here e₂ is the last spatial basis vector in zero-based coordinates. For each
boost little group parameterize its abelian boost characters by
`v↦exp(ik·v/ℏ)`; use M3's preceding ordinary/covered-circle character enumeration
for the rotation labels. Prove the
orbit measures and induced Hilbert models in each row and the Borel sections
for the repeated E(2)/E(3) little-group problems. For the cover, prove exactly
which half-integral characters/spins and nonzero transverse-covector central
characters descend. An independent U or E distinguishes genuine Bargmann
representations. Multiplication by `exp(i c t/ℏ)` changes that energy constant
and leaves the ray action unchanged; state this separate equivalence when
classifying projective actions. Mass/spin labels alone are not a classification
of genuine irreducible Bargmann representations.

**Momentum model, domains and time reversal.** For m≠0 construct on
`L²(ℝ³;𝒱_j,d³p)` the genuine action
`(Π_(m,U,j)(z;R,v,a,t)ψ)(p)=exp(i(mz+(U+|p|²/(2m))t−p·a)/ℏ)
 D_j(R)ψ(R⁻¹(p−mv))`.
Prove its product law, unitarity, strong continuity and equality to the M2
induced model; do not infer irreducibility just from the displayed phase.
On the invariant 𝒱_j-valued Schwartz core use `P_iψ=p_iψ`,
`X_i=iℏ∂_(p_i)`, `V_i=P_i/m`, `H=|P|²/(2m)+U` and `K_i=mX_i`.
Writing T_a, S_t and B_v for the respective one-parameter subgroups, pin
`Π(T_a)=exp(−ia·P/ℏ)`, `Π(S_t)=exp(itH/ℏ)` and
`Π(B_v)=exp(iv·K/ℏ)`; physical evolution is Π(S_(−t)).
The momentum Fourier transform is
`(F_ℏψ)(p)=(2πℏ)^(−3/2)∫exp(−ip·x/ℏ)ψ(x)dx`.
Prove it sends QF6's position to iℏ∂_p and its physical momentum −iℏ∂_x
to multiplication by p; QF6's displayed units have ℏ=1. Prove `[X_i,V_j]=iℏδ_ij/m`,
`[K_i,P_j]=iℏmδ_ij` and `[K_i,H]=iℏP_i` on that core.
In the positive Stone convention `dΠ(X)=iX̂/ℏ`, prove the bracket rule
`[X̂,Ŷ]=−iℏ[X,Y]^` from the derived representation, compatibly with
M0's −R_X dictionary. Its generator table is `K_i↦K_i`, `T_i↦−P_i`,
`S↦H`, `M↦m Id`; this table gives precisely the physical commutators above.
Consume QF6/SAST/UO for the closed observables and prove the core/domain and
self-adjoint realization comparisons; a formal commutator is not a closure result.

Construct the antiunitary compact-spin structure J_j on 𝒱_j commuting with D_j
and satisfying `J_j²=(−1)^(2j)`. With `Aψ(p)=J_jψ(−p)`, prove
`AΠ_(m,U,j)(g)A⁻¹=Π_(−m,−U,j)(g)` in these specified models.
Define time reversal on the extension by
`θ(z;R,v,a,t)=(−z;R,−v,a,−t)` and prove its automorphism law and
`Π_(m,U,j)(θg)=Π_(−m,−U,j)(g)`; thus A also implements this automorphism
on the fixed model, with `θ²=id` and `A²=(−1)^(2j)`.
Fix this zero-shift lift of time reversal: the alternatives
`θ_λ(z;g)=(−z+λt;R,−v,a,−t)` give internal energy `−U+mλ` instead.
State the central-character reversal and internal-energy sign alongside the
mass sign; complex conjugation gives the corresponding antiunitary equivalence
for every genuine class after choosing its equivalent displayed model. Retain “negative mass describes an antiparticle”
as an interpretation of the source model; it is not an equivalence theorem
for arbitrary choices of the genuine labels.

Use [Brennich (1970), printed pp.138–140,144–146](https://www.numdam.org/item/AIHPA_1970__13_2_137_0/)
for the displayed multiplication, multiplier and class list, with the source's
ℏ=1 normalization translated explicitly. Its connected list cites earlier
Inönü–Wigner/Lévy-Leblond work; the block-cochain and M2 proofs specified here
provide the actual classification route. Distinguish its
ray-equivalence conventions from the genuine fixed-central-character targets.

## M4. Poincaré and Lorentz representations

Use the connected cover `ℝ⁴⋊SL(2,ℂ)`, with the verified action on Hermitian 2×2 matrices and kernel `{±I}`. Pin the Lorentz bilinear form as `q(p)=−p₀²−p₁²−p₂²+p₃²` (signature `diag(−1,−1,−1,+1)`). Define mass squared as the self-adjoint joint-calculus operator `q(P)`; define a real mass observable only on its nonnegative spectral sector. Translate any source expression with the opposite quadratic sign by an explicit signature conversion, never by changing labels silently.

Use zero-based finite coordinates in prototypes: indices0,1,2 are space and index3 is
time. Set c=1, fix ℏ>0 and the pairing
`⟨p,a⟩_η=−p₀a₀−p₁a₁−p₂a₂+p₃a₃`.
Identify the translation dual by
`χ_p(a)=exp(i⟨p,a⟩_η/ℏ)` in native `Circle`; prove this is a topological group
isomorphism from additive momentum space to the native Pontryagin dual.
For the positive `2π` character convention `χ_ξ(a)=exp(2πiΣξⱼaⱼ)`, the coordinates
are `ξ=(−p₀,−p₁,−p₂,p₃)/(2πℏ)`; give the Fourier-kernel/sign comparison with V11.
If U's native joint Stone generators are Aⱼ with `U(a)=exp(iΣaⱼAⱼ)`, define physical
`Pⱼ=−ℏAⱼ` for j<3 and `H=P₃=ℏA₃`, with their joint domains and PVM transport.
Thus `U(a)=exp(i(−Σ_{j<3}aⱼPⱼ+a₃H)/ℏ)` and mass squared is q(P).
Here U is the active spacetime symmetry action. Physical Schrödinger evolution
by t is `U(−t e₃)=exp(−itH/ℏ)`, agreeing with QF's dynamics register after
setting ℏ=1; it is not the positive-time active symmetry operator U(t e₃).
For the orientation e₀∧e₁∧e₂ define physical angular momentum on M0's
common core by `Ĵ₀=iℏ dU(J₁₂)`, `Ĵ₁=iℏ dU(J₂₀)` and
`Ĵ₂=iℏ dU(J₀₁)`, with the Stone self-adjoint closures. For a finite-helicity
null model prove `J·P/|P|=εℏℓ/2` and Pauli–Lubanski vector
`W=(ℏℓ/2)P`, with compatible core and closure/domain identities.

Use the **native** `realCliffordThreeOneVectorEquivHermitian`, whose matrix is
`[[p₃+p₂, −p₁−i p₀], [−p₁+i p₀,p₃−p₂]]`; its determinant is q(p), the negative
of native `realCliffordForm 3 1`. Define L(A) by transporting `X↦AXA†` through this
equivalence. Prove η-invariance, future-cone preservation and the dual-action identity
`χ_p(L(A)⁻¹a)=χ_{L(A)p}(a)`. These comparisons justify using Lorentz vector coordinates
as character labels. Choose representatives `(0,0,0,±m)` for timelike orbits with m>0,
`(0,0,κ,0)` for spacelike orbits with κ>0, `(0,0,1,1)` and its negative for the two
null orbits, and zero. The reference null energy1 is a representative choice, not an
invariant distinguishing different nonzero null orbits. Compute each stabilizer in the
native Hermitian model, including the explicit conjugacy from the spacelike SU(1,1)
stabilizer to SL(2,ℝ), and prove the orbit measures/Borel sections required by M2.

Positive energy means `spectrum(H)⊆[0,∞)`. Prove which induced models satisfy it by the
joint translation PVM: future timelike and future null sectors do; past and spacelike
sectors do not. The zero translation orbit has H=0 and admits every unitary Lorentz
little-group representation under this condition alone. State any further restriction
to the trivial zero-orbit/vacuum model explicitly in its application. Relate the
closed-forward-cone spectral condition to these orbit choices; positivity of H alone
does not identify a nonzero mass or a chosen spin.

Prove the full-spacetime localization obstruction in these carriers. For a nonzero representation Hilbert space,
a normalized PVM on ℝ⁴ covariant under all translations makes its translation
system an induction from the trivial subgroup by the H={1} case above. Hence the
translation representation is a multiple of the regular representation and its
joint spectrum is all of ℝ⁴. Use M4's pairing and Stone-generator comparison to
show its energy spectrum is ℝ, excluding a nonnegative-energy representation.
This obstruction concerns a sharp PVM on all spacetime; the spatial localization
systems at a fixed time have their separately specified covariance group.

Prove the decomposition into six orbit types for the dual action: future/past timelike nonzero orbits, spacelike nonzero orbits, future/past nonzero lightlike orbits, and the zero orbit. Compute stabilizers for chosen cover representatives: `SU(2)` for timelike, `SL(2,ℝ)` (equivalently `SU(1,1)`) for spacelike, `Δ≅ℂ⋊(ℝ/4πℤ)` for nonzero null, and `SL(2,ℂ)` at zero. Record orbit topology and measurable sections. M2 then supplies irreducibility, inequivalence and exhaustion under its exact hypotheses. Give the actual little-group duals used in the classification. For `SU(2)`, use highest weights `j∈½ℕ₀`. For `SL(2,ℝ)≅SU(1,1)`, use normalized induction from the upper triangular minimal parabolic with compact subgroup `K=SO(2)`: put `a_r=diag(r,r⁻¹)`, r>0, `M={±I}` and `n_x=[[1,x],[0,1]]`. Use `δ_P(a_r)=r²` and the inducing character `χ_(ε,ν)((−I)^j a_r n_x)=(−1)^(εj)r^ν`, ε∈{0,1}. The normalized character is `δ_P^(1/2)χ=(−1)^(εj)r^(1+ν)`, equivalently `δ_P^(1/2+ν/2)` on A, and induced functions satisfy `f(gp)=δ_P(p)^(−1/2)χ(p)⁻¹f(g)`. Relate Bargmann’s Casimir label by `q=(1−ν²)/4`. The principal family has ν∈iℝ with ν∼−ν; the complementary family is ε=0 and 0<|ν|<1, with ν=0 counted as the spherical principal member. Fix center action `(-1)^ε`. Give discrete series D_n^±, n≥2, and both limits D_1^±, with center action `(-1)^n`; include the trivial representation (center +1). Prove irreducibility, equivalences and endpoint composition from the normalized intertwining operators: at ν=0 the odd induced representation is reducible and its Hilbert completion is the direct sum of D_1^+ and D_1^-; state whether the even member is irreducible. At the complementary-series boundary |ν|=1 identify the trivial constituent and every other constituent/subquotient, rather than identifying the whole induced module with the trivial representation. Give any further reducibility points of nonunitary continuation only if used in a proof, and distinguish them from the unitary dual. Prove that the resulting irreducible list exhausts the SL(2,ℝ) unitary dual, using M0's admissible-module and unitary-equivalence bridge. These details are required for the spacelike little-group classification; a family name or Casimir does not settle endpoint composition.

For the null stabilizer use
`δ(w,θ)=[[e^(iθ/2),w e^(−iθ/2)],[0,e^(−iθ/2)]]`, θ∈ℝ/4πℤ.
Its product is `(w,θ)(w′,θ′)=(w+e^(iθ)w′,θ+θ′)`, so the action on ℂ is
`w′↦e^(iθ)w′`. Prove that it fixes the chosen rank-one null Hermitian matrix;
θ=2π is central −I. Translate a source coordinate φ with diagonal e^(iφ) by θ=2φ,
including the resulting `e^(2iφ)` action. At zero translation character list rotation
characters exp(iℓθ/2), ℓ∈ℤ, with central value (−1)^ℓ at θ=2π. For a nonzero ℂ-character
`w↦exp(i Re(conj(ζ)w))` with |ζ|=r>0, give its circular orbit, rotation stabilizer {0,2π},
both stabilizer characters and induced models. These nonzero-radius induced models are
the continuous-spin representations; distinguish them from the zero-radius helicity
models and prove the Mackey equivalences. This ℂ belongs to the Lorentz little group;
its character parameter is separate from the spacetime χ_p normalization.

For both rank-one groups, use the smooth normalized induced space of `F∈C∞(G)` satisfying the displayed right-covariance law, equivalently smooth sections of its associated complex line bundle over G/P. Its compact picture is `C∞(K/M)` with the prescribed M-character covariance. State the corresponding Fréchet topology; normalized intertwiners act on these spaces before Hilbert completion in the principal/complementary invariant forms. At a reducibility point distinguish the algebraic K-finite module, smooth Fréchet kernel/quotient and completed unitary constituent, and prove their comparison rather than assigning one Hilbert space to all three.

For the zero orbit, normalize SL(2,ℂ)'s principal and complementary series separately. Put `a_t=diag(e^(t/2),e^(−t/2))`, `m_θ=diag(e^(iθ),e^(−iθ))`, `N≅ℂ`, and `δ_P(a_t)=e^(2t)`. Define `χ_(m,λ)(m_θ a_t n_z)=e^(imθ)e^(λt)` and use the same right-covariant induction convention `f(gp)=δ_P(p)^(−1/2)χ(p)⁻¹f(g)`. Gel'fand–Naimark’s literal character for `diag(ζ⁻¹,ζ)`, `ζ=r e^(iφ)`, is `r^(iρ_GN)e^(−inφ)`; evaluate `ζ=e^(−t/2−iθ)` to obtain `m=n`, `λ=−iρ_GN/2`. Prove the function-action/intertwiner comparison separately from this character identity. Use minimal-parabolic principal labels (m,λ) with m∈ℤ, λ=iρ, ρ∈ℝ, Weyl equivalence (m,ρ)∼(−m,−ρ), and center character (−1)^m. State normalized induction and the equivalence relation. The complementary series is only m=0; use the real parameter s in the definite Weyl half 0<s<1, not the principal-series symbol ρ. Identify endpoint limits: s=0's spherical principal member and s=1's trivial subquotient, specifying for each whether the induced module is irreducible, reducible, or has the stated constituent. Use [Gel'fand–Naimark (1947), §8 Eqs.187–188,194 and the p457 footnote](https://www.mathnet.ru/eng/im3007), with complementary parameter `ρ_GN=2s`. Pin the left induced action as `π(g)F(x)=F(g⁻¹x)` and the big-cell section `g_z=[[z,−1],[1,0]]`. For `g=[[a,b],[c,d]]` derive the spherical noncompact-picture action
`π_λ(g)φ(z)=|a−cz|^(−2−2λ)φ((dz−b)/(a−cz))`.
Put `ε=[[0,1],[−1,0]]` and `α(g)=(g⁻¹)ᵀ=εgε⁻¹`. Prove that
`π_s(α(g))φ(z)=|bz+d|^(−2−2s)φ((az+c)/(bz+d))`
is precisely the source Eq.188; conjugation by π_s(ε) gives its equivalence
with our positive λ=s model. The literal complementary diagonal character has λ=−s,
whereas Eq.188's operator realization compares to λ=+s through this automorphism/intertwiner.
This operator comparison fixes the inducing
model independently of the literal diagonal-character identity above.
Transport the source Eq.187 invariant form, with kernel
`C|z−w|^(−2+2s)`, C>0, to this model, and prove positivity for 0<s<1.
At s=1, Eq.194 is `C|∫φ(z)d²z|²`: prove that integration is invariant,
its kernel is the zero-integral submodule, and the Hilbert quotient is trivial.
Construct the separately metrized zero-integral submodule and prove its
equivalence to the principal member `(m,ρ)=(2,0)` in the source footnote.
For the opposite boundary λ=−1 construct the trivial constant submodule,
its quotient and the contragredient/intertwiner comparison; prove that the
nontrivial quotient is the same principal member. Give the exact invariant
submodule/quotient sequences on the specified smooth induced-function
spaces, endpoint forms and their radicals, and both boundary intertwiner
kernels/images. Prove the interior λ∼−λ equivalence and its degeneration
at the boundary, and the full irreducible classification and exhaustion.
 Derive which little-group data yield massive spin, helicity, and continuous-spin models. Separate the two null-orbit time orientations and impose positive energy as an additional spectral restriction.

Prove the null little group Δ is type I by M2's criterion: its translation
dual has circle orbits and the origin, with compact closed stabilizers and
explicit Borel representatives. Also prove its irreducible images contain
nonzero compact operators by M2's orbit-slice GCR criterion,
applied here to these locally closed circles and the origin: their stabilizers
are finite or compact and their irreducible integrated images are compact.
This supplies GCR directly, without a type-I-to-GCR inference.
Transport type I and GCR to the ordinary null little group
E(2)=Δ/{±1}: pull back its factor and irreducible representations and use
the surjective finite-kernel C_c pushforward to compare their integrated images.
Together with compact SU(2) and M0's
SL(2,ℝ)/SL(2,ℂ) results, apply M2 to prove the connected Poincaré group and
its cover are type I. These are the hypotheses consumed by M6's Poincaré
direct-integral uniqueness and by the de Sitter contraction spectrum.

Determine the exact weak support of each finite-helicity null irreducible
`ρ_(ε,ℓ)`, with ε its energy orientation and Δ-character `exp(iℓθ/2)`:
`Supp ρ = {ρ} ∪ {inflate π_(ℓ,iν) : ν∈ℝ}`,
where π is this layer's normalized SL(2,ℂ) principal series, inflation
makes translations trivial, and `(m,ν)∼(−m,−ν)` is its Weyl equivalence.
Here `m_φ=δ(0,2φ)`, so η_ℓ(m_φ)=exp(iℓφ). The principal support
set depends on |ℓ| and is unchanged by ℓ↦−ℓ, while its explicit Mellin
intertwiner retains the signed character. For the ordinary quotient retain
precisely even ℓ. In particular prove that the zero-orbit part has no
supplementary or trivial terms, or principal terms with |m|≠|ℓ|;
the spherical principal endpoint ν=0 remains in the displayed family.
Use the following proof route, including its intermediate comparisons:

- Read off from the orbit model the subgroup identity
  `Res_H Ind_(NΔ)^(N⋊H)(χ⊗η_ℓ)=Ind_Δ^Hη_ℓ`.
  Restrict to H=SL(2,ℂ) and consume M1/D3 induction in stages through
  `Δ=MN⊂P=MAN`. The radial null-cone measure is proportional to
  `E dE dΩ`; `x=log E`, `g(x,ω)=e^x f(e^x,ω)` gives its unitary
  Mellin transform with Lebesgue frequency measure. Prove the resulting
  direct integral is the full principal family with fixed label m=ℓ,
  using the pinned normalized induction and character, not a guessed
  physical-helicity sign. Establish that this parameter family is closed
  in the full H-dual and its relative topology is the usual real parameter
  topology modulo Weyl. After this layer's SL(2,ℂ) classification, prove
  the two consumed assertions of
  [Fell (1961), §V, Theorem5.1](https://doi.org/10.1007/BF02545788):
  the principal subset is closed in the full dual, and its parametrization
  by `Z₁={(m,q):m≥0 integer,q∈ℝ,q≥0 if m=0}` is a homeomorphism.
  Build the compact-K-type operator field from the normalized induced
  coefficients, prove its continuity/norm and kernel-separation properties,
  and derive those topology assertions by Fell's operator-field argument.
  Match Fell's actual noncompact-picture operators with ours, including
  their inverse Möbius actions, to prove the frequency conversion ν=−q/2;
  comparing an operator multiplier directly with an inducing character
  does not establish that dictionary.
  For the disintegration do not assume induction commutes with a direct
  integral: diagonalize the commuting unitary right A-action by the radial
  Fourier transform and compute each H-action fiber explicitly. Use one
  fixed compact-picture Hilbert space of U(1)-covariant L² sections on
  SU(2), with ν↦π_ν(g) strongly continuous. Prove
  ν↦‖π_ν(a)‖ lower semicontinuous for every a∈C*(H). Lebesgue full
  support then gives `ker(∫π_ν dν)=∩_ν kerπ_ν`; with the proved closed
  parametrization this identifies the entire weak support, not just a.e. fibers.
- Construct the homogeneous helicity-line-bundle radial transport and prove
  `D_t f(p)=t⁻¹f(p/t)` unitary for the degree2 null-cone measure, commuting
  with H, and `D_t⁻¹ρ(a,h)D_t=ρ(ta,h)`. As t→0 prove strong convergence
  to the inflated H-restriction uniformly on compact group subsets, using
  compactness of the H-orbit of a fixed vector over compact H-sets. This
  proves every displayed zero-orbit principal member weakly contained in ρ.
- For the converse, the integrated orbit model annihilates the ideal
  `C₀(N̂∖(O_ε∪{0}))⋊H`. Identify the corresponding group C*-quotient
  as `B=C₀(O_ε∪{0})⋊H` and its invariant-open-orbit ideal as
  `I=C₀(O_ε)⋊H`, using D1's full crossed-product exactness and the
  translation Fourier transform. Consume D3's Green imprimitivity for
  `C₀(H/Δ)⋊H` and HilbertModules' ideal/representation transport: under
  this equivalence ρ|I corresponds to the one-dimensional character η_ℓ.
  An irreducible representation of B either restricts nontrivially and
  nondegenerately to I, or factors through B/I=C*(H); prove this ideal
  dichotomy directly. Prove the character's maximal kernel excludes every other nonzero-orbit irreducible,
  and use uniqueness of extension of a nondegenerate ideal representation
  to B to recover ρ. For a zero-orbit inflation, restriction to H and
  weak-containment preservation under restriction force its H-label into
  the closed principal family just computed.

Compare the Mellin realization with
[Banerjee (2018), §4](https://arxiv.org/abs/1801.10171), including its
rotation-action convention; record any confirmed phase/weight sign mismatch
as a source discrepancy, retaining the independent M4 character convention.
This weak-support theorem is about a fixed
Poincaré irreducible; M5 must separately prove its de Sitter family upper
bound before using this support as an exact contraction row.

Own the Lorentz multiplier specialization of QF5's generic smoothing and
Whitehead API: `H²_lc(SO₀(3,1),𝕋)≅ℤ/2`, using its semisimple Lie algebra,
π₁=ℤ/2 and the simply connected SL(2,ℂ) cover. Its nontrivial circle
extension is `(SL(2,ℂ)×𝕋)/⟨(−I,−1)⟩`; prove the pushout and absence of
a global continuous section by restriction to the SO(3) maximal compact.
Distinguish the literal two-component SO(3,1): prove its decomposition as
SO₀(3,1)×{±I₄}, its unitary circle-extension classification (again ℤ/2,
using absence of connected-component characters and trivial circle H² of the
cyclic component group), and its separate unitary/antiunitary ray alternatives. In the antiunitary
component case compute `H²(ℤ/2,𝕋_conjugation)≅ℤ/2`: for its unique
nonidentity element t, the normalized value ω(t,t) is ±1 and is unchanged by a coboundary,
recording the square of the antiunitary PT lift. Prove the mixed terms
vanish using the absence of connected Lorentz characters, and compare
this sign with the independent spin-extension class.
The spin extension does not make an unsupported claim about globally continuous
multipliers on either component group.

Prove that the represented translation quadratic polynomial on the Gårding domain has closure equal to the joint-calculus q(P): the latter is self-adjoint and extends the polynomial action, so M0's essential-self-adjointness/core comparison and maximality identify the two. Include the physical ℏ/sign conversion above in this equality.

Define parity and time reversal as automorphisms of the covered group and define their implementation on rays. Prove the unitary/antiunitary alternatives with the ray-space hypotheses; do not use the false inference that every group element has a square root. Give the explicit counterexample `−[[1,1],[0,1]]∈SL(2,ℂ)` and prove directly that it has no square root. Show a Euclidean spacetime group enlarged by time reversal can act antiunitarily. Consume M0's single Gårding/derived-action and central closure API. For each Hermitian Casimir polynomial C, pin its ordering, involution and scalar normalization, verify M0's elliptic-commutation hypothesis and transport its self-adjoint closure to the induced model. Give the actual orbit-coordinate differential formulas and domain comparisons. Construct C-analytic vectors with explicit bounds `‖Cⁿv‖ ≤ C_v R_vⁿ n!` using M0's post-closure spectral-cutoff/core estimates, and compute Casimir values on that common domain. The Lie-algebra matrix units are not an operator-domain argument.

**M4.SpatialLocalization — fixed-time covariant localization.** Use the connected covered Poincaré group `G_P=ℝ⁴⋊SL(2,ℂ)` and its fixed-time spatial subgroup `G_sp=ℝ³⋊SU(2)`, embedded with zero time translation. Let R(u) be the spatial restriction of M4's Hermitian Lorentz action, with its existing comparison to the M3 rotation carrier. Prove the continuous spatial subgroup embedding and write `(a,u)(b,v)=(a+R(u)b,uv)` and `(a,u)·x=a+R(u)x` on the standard Borel space `X=G_sp/SU(2)≃ℝ³`. For a strongly continuous unitary representation ρ on a complete complex Hilbert space H, define spatial sharp localizability by existence of a normalized SAST projection-valued measure P on X with `ρ(g)P(E)ρ(g)⁻¹=P(g·E)` for every g and Borel E. This definition requires neither boost covariance of one PVM on X nor a PVM on all of spacetime. It is the fixed-time spatial version used here of the one-particle Wightman localizability problem.

Prove the exact criterion, with no Hilbert-cardinality restriction: such a pair (ρ,P) exists iff `ρ≃Ind_(SU(2))^(G_sp)σ` for a strongly continuous unitary SU(2)-representation σ. On `L²(ℝ³,dx;K_σ)` give its canonical pair explicitly by `T_σ(a,u)f(x)=σ(u)f(R(u)⁻¹(x−a))` and `P_σ(E)f=1_E f`. Prove unitarity, strong continuity, normalization, strong countable additivity and covariance, and construct the inducing unitary as a unitary of both group and PVM data. Lebesgue measure is invariant, so this formula has no additional RN/modular factor; changes to an equivalent quotient measure consume M1's single square-root density transport. The zero Hilbert space is the σ=0 case; nonzero selected particle models below have nonzero H.

M1's general imprimitivity theorem is stated for separable Hilbert spaces. Own the following bounded spatial extension of that theorem, rather than silently applying it to arbitrary H. Consume [OperatorAlgebraDynamics D1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorAlgebraDynamics/README.md#d1-covariant-representations-and-full-crossed-products) for the integrated covariant representation, its L¹ norm bound, full crossed product, recovery of the pair and nondegenerate multiplier extensions. For this action prove `A_sp=C₀(ℝ³)⋊G_sp` separable: construct countably many dense coefficient functions and a countable precompact Borel ring covering G_sp; rational finite-range compactly supported coefficient-valued simple functions are L¹-dense by finite-Haar compact truncation and regularity, and D1's norm bound and compact-support density give a countable dense image in A_sp. Use CStarAlgebras' existing representation/approximate-unit vocabulary; no new crossed-product or PVM carrier is introduced.

Integrating a normalized PVM gives a nondegenerate C₀(X)-representation. Decompose its nondegenerate A_sp-representation into an arbitrary orthogonal Hilbert sum of cyclic reducing summands. Each is separable by the countable dense algebra. Prove the reducing projections commute with the recovered coefficient and group multiplier actions by the nondegenerate multiplier extension; use spectral uniqueness/bounded Borel approximation to show they also reduce P. Apply separable M1 on each summand. Assemble their inducing representations and pair intertwiners by the actual unitary `⊕_i L²(X;K_i)≃L²(X;⊕_i K_i)`: first on finite-component functions, then by density of Bochner L² simple functions and finite-coordinate approximations to their finitely many values. Do not interchange an uncountable sum and an integral without this argument. Conversely, construct the displayed canonical pair for arbitrary σ using finite simple-tensor density and the unitary norm-one bound for continuity. This retains the all-H criterion without claiming that M1's separable statement already supplies it.

The selected irreducible Poincaré orbit models, and their finite sums below, are separable by their explicit lcsc induced carriers (or cyclicity and separability of the group C*-algebra); retain that hypothesis in the measurable-field comparison, without restricting the preceding arbitrary-H criterion. For each selected positive-energy Poincaré model `π≃Ind_H^{G_P}τ`, compute `Res_{G_sp}π` by the explicit spatial restriction adapter below, retaining orbit measures, multiplicities and stabilizer representations, and apply the criterion to that restriction whether or not it is irreducible. State the resulting classification as an exact target: massive models of mass m>0 and spin j restrict to the Euclidean induced model with fiber `D_j`; a finite direct sum of positive-energy massless finite-helicity models is localizable iff its `Spin(2)` weight multiset is the restriction of a finite-dimensional unitary `SU(2)` representation. Thus helicity zero and the doubled ±1/2 pair are localizable, while a single nonzero helicity and the photon pair ±1 are not (every `SU(2)` module containing weight ±1 also contains weight 0). The massless continuous-spin models are not localizable, in either central-character sector of the covered Poincaré group. Use `Spin(2)=SU(2)∩Δ`, the spatial-direction stabilizer of the null representative, with `δ(0,θ)` for θ modulo 4π and inducing label `h_ind=ℓ/2`, character `exp(i h_ind θ)`. Keep M4's physical helicity dictionary `λ=ε_E ℏℓ/2`; the localization classification is invariant under reversal of all weight signs. The restricted little-group fiber has each inducing weight `h_ind∈ℤ` once in the sector where −I acts as +1, and each `h_ind∈ℤ+1/2` once in the sector where −I acts as −1. The diagonal boost a_t commutes with this Spin(2), so the same rotation-fiber decomposition holds on every nonzero radial momentum orbit. Prove the two decompositions from the induced little-group model, including their multiplicities. A unitary `SU(2)` representation decomposes as a Hilbert direct sum of finite-dimensional spin-j irreducibles. Central-character compatibility restricts j to nonnegative integers or positive half-odd integers respectively. Unbounded spins would force infinite multiplicity of weight 0 in the first sector or weight 1/2 in the second, since each such irreducible contains that weight once. Bounded spins cannot supply the unbounded required weights. Prove this obstruction using the restriction criterion, which allows arbitrary unitary K-representations. For the fiber-comparison step, first prove every Euclidean representation intertwiner intertwines the translation PVMs by spectral uniqueness. The criterion allows arbitrary unitary σ; an equivalence with the separable Poincaré model forces σ separable, since its Euclidean induced space contains an isometric copy of σ as constant fiber sections times a normalized indicator of a finite positive-volume annulus. Prove that elementary embedding before invoking measurable fields. After transporting both translation momentum spectral measures to their common Lebesgue measure class on `ℝ³\{0}`, apply [V4.0.Fields' early two-field decomposable-map and measure-change interface](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4831498b0ca6b0d69210ef2294ce1c92f028fbde/TauCetiRoadmap/VonNeumannAlgebras/README.md#L316-L339), then M1's transitive imprimitivity uniqueness on almost every radial sphere, to obtain equality of the Spin(2) fiber representations with their full multiplicities. Obtain a common full-measure radial set first for a countable dense rotation subgroup, then extend to all rotations by strong continuity. These are the momentum PVMs fixed by the translation representation, not a claim that an arbitrary group intertwiner preserves a chosen localization PVM. This M4 adapter uses the early V4.0.Fields/M1 interfaces, not the later M6 tensor-decomposition theorem. The multiplicity of weight 0, respectively 1/2, is exactly one, so any candidate SU(2) module is one copy of one spin representation, which cannot supply the unbounded required weights. Both sectors and their multiplicities follow from M4's own stabilizer construction. [Iverson–Mack (1970)](https://doi.org/10.1103/PhysRevD.2.2326) records the half-odd-integer sector's physical application; it is not the proof of this localization obstruction. Treat zero-momentum representations separately: the translation-trivial model is not equivalent to induction over all of ℝ³. Prove the double-coset decomposition and these fiber identifications under the stated positive-energy and orbit hypotheses. This is a one-particle localization theorem, not a local quantum field theory.

Own the following spatial restriction adapter on M1's normalized induced carriers. Reuse native `ContRepresentation.restrict` and `IsUnitary.restrict` for precomposition with the subgroup homomorphism; prove strong orbit continuity by composition with its continuous inclusion. In the massive case choose the rotation-equivariant positive standard boost `b_m(p)=sqrt(X(p,E_m(p))/m)` in the existing Hermitian model, where p∈ℝ³ and `E_m(p)=sqrt(m²+|p|²)`, so `b_m(R(u)p)=u b_m(p)u⁻¹` and the spatial rotation cocycle is u itself. For a null four-momentum `(p,E)=(rω,r)`, r>0, choose the Borel rotation section `k(ω)` of `SU(2)/Spin(2)` and `s(p)=k(ω)a_(log r)` sending the fixed null representative to p. The diagonal boost commutes with Spin(2), so the rotation cocycle is the compact-induction cocycle of the restricted little-group representation on every radius. Prove the Borel quotient/section identities, the actual polar-measure disintegration and the norm/density identities of these restriction unitaries. On a null radial sphere a supplied Spin(2)-intertwiner `C:K_τ≃K_σ` gives the fiber gauge `F(k(ω))↦σ(k(ω))C F(k(ω))`, converting compact induction to the σ-valued rotation model. Verify section independence and equivariance. This is the specific M4 restriction calculation, not an assumption of an unstated general subgroup theorem or the later M6 tensor decomposition. The explicit radial quotient and unitary constructions are proved here from the existing induction formulas; no general subgroup theorem is assumed for this step.

For every admitted selected particle model above, export a specified unitary `W:H_π≃L²(ℝ³;K_σ)` intertwining its spatial restriction with T_σ, and define its supplied localization by `P_π(E)=W⁻¹P_σ(E)W`. Construct W from the Mackey restriction/fiber equivalence, the actual positive square-root density change from the chosen momentum orbit measure to Lebesgue measure, and the scalar Plancherel unitary `ℱ_ℏ f(p)=(2πℏ)^(−3/2)∫exp(−ip·x/ℏ)f(x)dx`, initially on Schwartz vectors and extended by V11's Plancherel theorem, then componentwise to the finite spin fiber. Use its inverse to pass from momentum to the displayed position model. The null momentum origin is a null set in those models. Retain the physical translation character `exp(−ip·a/ℏ)` of M4; derive the Fourier sign and density normalization from it, rather than replacing the orbit measure by an unnormalized formula. The finite-helicity criterion is constructive: a matching SU(2) module and its Spin(2) fiber unitary give W and hence P_π. Zero-translation models on nonzero H are excluded: translation covariance would identify projections of disjoint translates of every bounded set, forcing those projections to vanish and then P(X)=0, contrary to normalization.

Export unitary transport of the full covariant pair `(ρ,P)↦(VρV⁻¹,VPV⁻¹)`, and the induction section/measure-change and spin-fiber intertwiners as intertwiners of both data. Preserve the freedom in the supplied inducing unitary/localization choice: arbitrary intertwiners of the spatial group representation need not preserve an independently chosen position PVM. In particular the earlier translation-PVM uniqueness argument concerns momentum. The supplied pair transport is the interface consumed by QF6b; normal states on the generated abelian von Neumann algebra, their operational event laws, real-Borel marginal pushforwards and simultaneous state transport remain QF's existing probability/model comparisons. They are not prerequisites for constructing this system. Keep M4's existing full-spacetime normalized sharp-PVM/positive-energy obstruction separate and unchanged; no field-locality or local-net theorem follows from spatial localization.

## M5. de Sitter dual, contractions and kinematics

Choose the connected group `G=SO₀(4,1)` with quadratic form `diag(−1,−1,−1,−1,+1)` on `ℝ⁵`, and its universal cover `G̃=Spin₀(4,1)→G` with kernel `{±1}`. Treat both central characters: univalent representations of `G` (the kernel acts trivially) and bivalent representations of `G̃` (the kernel acts by `−1`). Fix curvature radius `R>0`. The source uses the overall-opposite embedding signature `diag(+1,+1,+1,+1,−1)`; give the explicit sign conversion on vectors, Lie algebra generators, and quadratic generators. The source's `O(4,1)` denotes the disconnected full orthogonal group, whereas its `G` is the identity component and `G̃` its universal cover; keep these groups distinct.

Build the Lie algebra generators and commutators, the two algebraically independent central generators, and their closures on Gårding vectors. Use Dixmier's normalization: define `Ω` from Eq.(12), printed p.12, and `Ω′` from its enveloping-algebra formula on printed p.28; the scalar evaluation tables are on pp.27–28. Prove the exact conversion from the course's `I₁,I₂` (physical Dooley p.30) to these generators, including every factor of `R`, `i`, and the signature sign. Record the scalar values in Dixmier's convention as part of the classification data:

- `π_{p,0}`: `Ω=−p²−p+2`, `Ω′=0`, for integral `p≥1`;
- `π^{±}_{p,q}`: `Ω=−p²−p+2−q²+q`, `Ω′=(p²+p)(q²−q)`, for `p∈{1/2,1,3/2,…}` and `q=p,p−1,…` down to `1` when p is integral and `1/2` when p is half-integral;
- `ν_{0,σ}`: `Ω=2+σ`, `Ω′=0`, for real `σ>−2`;
- `ν_{p,σ}`: `Ω=−p²−p+2+σ`, `Ω′=−(p²+p)σ`, for integral `p≥1, σ>0`, and for half-integral `p∈{1/2,3/2,…}, σ>1/4`.

Also include the trivial representation separately. Prove these families are unitary, irreducible, pairwise inequivalent, and exhaustive for `G̃`; state which descend to `G` (integral p) and which are genuinely bivalent (half-integral p), and prove the `π^+_{p,q}`/`π^-_{p,q}` distinction and equivalences under the outer automorphism. Do not discard the non-spherical `p>0` continuous families, either sign of the discrete families, the half-integral central-character families, or the excluded strict-boundary values. For `σ=−2`, `σ=0`, `σ=1/4`, and the omitted integral `q=0` endpoint (distinguishing the separately listed `π_{p,0}`), determine from the explicit K-type coefficient positivity/vanishing recurrences whether the limit is reducible, an included subquotient, or absent; list all irreducible constituents and their central characters. For half-integral p the q-lattice ends at 1/2 and has no q=0 member. Reconcile Dixmier's corrected ranges with Takahashi's notation by a proved parameter dictionary, preserving the corrections Dixmier makes to the earlier Newton/Thomas tables. The spherical `p=0` family is a worked acceptance case within this complete classification, not a replacement for the other families.

Use [CompactGroups](../RepresentationTheory/CompactGroups/README.md) for the compact `Spin(4)` representation/K-type API and [LieGroups](../RepresentationTheory/LieGroups/README.md) for the group and Lie-algebra carriers; the induced realization, orbit measure, and quotient modular factor are M1 targets, while the K-type recurrences and all noncompact classification steps are owned here. For a common proof model, realize each family in the `K=Spin(4)`-type decomposition indexed by `Γ⊂(½ℕ₀)²`; derive the allowed lattice Γ from its parameters and central character. Prove positivity of the ladder-coefficient squares, irreducibility from the connected K-type graph, and equivalence/non-equivalence from Γ together with the two Casimir values. For each family, give the normalized-induction realization whenever available and prove its equivalence to the K-type model; for discrete or limit cases not realized by the same induction, construct the subquotient from the stated reducibility point. This supplies concrete proofs rather than invoking a classification theorem by name. Compute both Casimir closures and eigenvalues using M0's common smooth-vector domain, Hermitian/elliptic-commutation checks and central closure theorem; prove transport to the displayed K-type model. Give the resulting analytic-vector estimates for these differential operators through M0's spectral-cutoff/core API.

Use zero-based ambient indices a,b∈{0,1,2,3,4} and `ε=(−1,−1,−1,−1,+1)`.
Pin `J_ab=ε_b E_ab−ε_a E_ba` and `[A,B]=AB−BA`, with E_ab the matrix unit.
Take the de Sitter basepoint `R e₃` on `Q(x)=−R²`, so its stabilizer acts on
`e₃^⊥` with Lorentz signature. Identify M4's zero-based coordinates by
`j(0)=0,j(1)=1,j(2)=2,j(3)=4`: the last retained coordinate is time, corresponding
to M4's p₃. Put `L_μν=J_(jμ,jν)`, `P_μ^(R)=J_(jμ,3)/R`. Prove
`[P_μ^(R),P_ν^(R)]=+R⁻²L_μν` and the Lorentz/translation mixed brackets from
these matrices, then structure-constant convergence to the Poincaré brackets.
The fundamental tangent vector of P_μ at R e₃ is −e_(jμ). Define M4's
translation coordinate a by the Lie-algebra coefficient
`v(a)=Σ_μ a_μ J_(jμ,3)`, so its geometric tangent displacement at e₃ is
`−Σ_μ a_μ e_(jμ)`. Prove v is H-equivariant for M4's Lorentz action.
Use the coefficient a, rather than that displacement, in the zero-fiber
characters; the source-to-M4 coordinate permutation then preserves the
null-cone energy orientation. Contracting around the positive
ambient axis would instead give compact SO(4) stabilizer and Euclidean symmetry. Give local exponential-chart identifications, not a global group homomorphism.
The coefficient convention's geometric displacement is −a. Compare with
active geometric translations through `(a,A)↦(−a,A)`: it exchanges
`ρ_(ε,ℓ)` with `ρ_(−ε,ℓ)` and reverses physical helicity. Carry the
chosen convention through every contraction row, including the principal
two-sheet model's sheet assignment.

**Intrinsic contraction space.** Own the deformation-to-the-normal-cone group bundle
`DNC(G,H)` for the closed point stabilizer H=Stab(R e₃), for any R>0.
Prove H is connected (the de Sitter quadric is ℝ×S³ and simply connected)
and its preimage in the cover is SL(2,ℂ). The stabilizer of the unoriented
line ℝe₃ also contains parity and is not used here. Its
fiber at r>0 is G and at r=0 is `(𝔤/𝔥)⋊H`, with the quotient identified with M4's
translation space by the coefficient map v above. The zero-fiber law is
`(a,h)(b,k)=(a+h·b,hk)`. Use base [0,∞) with its subspace topology and r=1/R on positive fibers.
Choose the Ad(H)-invariant complement `𝔪=span{J_(a,3):a≠3}` to identify
𝔤/𝔥 with actual Lie-algebra vectors, then use chart
`(v,h,r)↦(exp_G(rv)h,r)`. Restrict this map to
`{(v,h,r):r‖v‖<c}` for a fixed Euclidean norm and sufficiently small c>0,
with the entire zero fiber included; no global exponential injectivity is
asserted. Obtain c from the local product diffeomorphism 𝔪×H→G near {0}×H,
and prove chart injectivity using the quotient slice in G/H.
Prove independence of the complement by the
transition maps. Consume LieGroupoidsPoisson G0 item0's topological
unit/arrow/operation interface. If using its smooth layer, first construct
DNC over ℝ and restrict to the nonnegative base; no boundaryless atlas on
[0,∞) is assumed. Prove the overlap, multiplication/inverse and
Hausdorff second-countable topology, and the zero-fiber semidirect-product law.
Construct this for both G and its cover; the zero fibers are the ordinary connected
Poincaré group and M4's SL(2,ℂ) cover. Prove the two-sheet cover and central-character
transport across r. Supply a continuous Haar system: with a fixed normalization it
is `r^(−4)dg` for r>0 and the quotient Lebesgue/Haar density on the zero fiber.
Prove the density Jacobian and compact-support integration continuity; the Lorentz
quotient action has determinant1 and both groups here are unimodular.

Consume OperatorAlgebraDynamics D5 for Haar-groupoid convolution, full completion,
disintegration and unit-space multipliers, and HilbertModules H5 for C₀(base)-algebras,
fibers and upper semicontinuous bundles. Own the central C₀(base) action and evaluation
comparison `A_r≅C*(G_r)` for `A=C*(DNC(G,H))`, with kernel the closed ideal generated
by functions vanishing at r. Prove evaluation surjectivity and this full-norm quotient
identity. Prove any stronger continuous-field property used; it is not supplied merely
by a group bundle's topology. Define intrinsic irreducible cluster limits by the Fell
topology on the irreducible spectrum of this single A, identifying its r-fiber with
`G_r`'s unitary dual. Pin the coefficient/neighborhood or positive-functional definition
and its equivalence with the C*-representation definition. Treat possible non-Hausdorff
multiple limits explicitly. Radius-dependent arbitrary Hilbert isometries do not define
this topology.

**Specified model limits.** In addition, use the displayed normalized induced or K-type
realizations to construct designated continuous Hilbert fields/common dense cores for
model convergence, using HilbertModules H5's Hilbert-field reconstruction.
Name each model's generating continuous sections and structural V_R; a K-type
list alone does not supply them. The specified principal hyperboloid and massless
dilation models below are mandatory cases. Every full-table row records whether
such a structural model has been constructed; intrinsic limits in other rows
must be proved directly from representations of A. For isometries V_R supplied by those structural realizations require
uniform-on-compact convergence of local matrix coefficients and prove extension from
that core. Define admissible changes by `V'_R=T_R V_R W`, where T_R is a
unitary intertwiner between the chosen R-fiber models and W is a fixed unitary
in the limiting representation's commutant; prove invariance by transporting
coefficients. For a fixed unitary intertwiner U:ρ≃ρ′ between equivalent
limit models also allow `V′_R=T_R V_R U⁻¹` and prove the transported statement
on the new limit Hilbert space. For varying W_R require strong convergence W_R→W and the same
commutant condition at the limit, and prove the required compact-uniform estimates. Prove the implication to the intrinsic Fell cluster statement through
compactly supported DNC test-function sections and the Haar-system comparison. A
reducible direct-sum/direct-integral model limit supplies its constituent Fell points;
Fell topology alone does not determine multiplicities or a unique reducible Hilbert
model. Use the shared definition of Supp(ρ), the weak support in Â; for
a direct integral this is the topological support, not just its almost-everywhere
chosen fibers. Prove the model/coefficient lower inclusion `Supp(ρ)⊆Lim π_R`,
where Lim means convergence of the entire sequence in Â, and `Lim⊆Clust`,
where Clust is the set of subsequential limits. A model theorem alone does not
exclude other clusters. For an exact row prove a separate upper inclusion,
for example `limsup_R ‖π_R(f)‖≤‖ρ(f)‖` for every f∈C_c(DNC), extended to A
by norm density, yielding `Clust⊆Supp(ρ)` by kernel containment. If that bound
fails, give the actual additional cluster points and their exclusion/completeness
argument; never infer the exact cluster set just from the selected model.
Retain Lim, Clust and each model decomposition separately in the full table.
Prove A is type I by factoring each factor representation through the scalar
central C₀(base) character and its corresponding type-I fiber; do not infer
this just from the topology of the bundle. Own the topology/comparison of Â with Prim(A). First prove every fiber
is GCR: its irreducible images contain nonzero compact operators. For r>0
use M0's CCR theorem. For the Poincaré fiber apply M2's GCR criterion
to the induced realizations: its momentum orbits are locally closed
(the null cones are not closed), and the listed little-group irreducibles
are GCR. Construct compact operators by localized orbit slices and compact
little-group operators. Each irreducible representation of A factors through
a fiber, so A is GCR. Prove that GCR irreducibles with the same primitive
kernel are unitarily equivalent and deduce Â≃Prim(A) with the hull-kernel/
Fell topology comparison. No CCR claim is made for the Poincaré fiber.
Prove A separable from the second-countable DNC Haar groupoid: construct a
countable I-norm dense family of compactly supported chart functions and
pass to its full C*-completion through OperatorAlgebraDynamics D4.
Consume CStarAlgebras C2's second countability of Prim(A) and lower
semicontinuity of `P↦‖a+P‖`; use the latter in the upper-bound/kernel
argument. Export a first-countable neighborhood basis. Sequences then
suffice for the table; retain nets only for separately proved generalizations.

Classify contraction behavior as a full-family target for π_(p,0), both signs
of every integral/half-integral π^±_(p,q), ν_(0,σ), every allowed ν_(p,σ),
the trivial representation and every boundary constituent. Carry the central
character throughout and use the exact ordinary/cover distinction. Parameterize
regimes by R_n→∞ and actual allowed labels, rather than only saying bounded
or diverging. After fixing the family tag and central character on a subsequence,
use joint limits in the extended real/discrete compactifications of p_n, q_n,
σ_n, their distances to each strict reducibility boundary, and
`p_n/R_n`, `q_n/R_n`, `σ_n/R_n²`, `Ω_n/R_n²`, `Ω'_n/R_n²`.
For principal induction also include the signed frequency λ_n and λ_n/R_n,
with the exact λ↔σ dictionary proved from the inducing operator. Prove
invariance of Lim and Clust under the Weyl equivalence λ↔−λ; the signed
frequency records a chosen realization, not a distinction of equivalent
unitary-dual points. Retain
mixed scales such as `p_n|λ_n|/R_n` and `p_nq_n/R_n` wherever lower invariants
lose the little-group parameter. Distinguish fixed discrete spin, unbounded
spin, finite nonzero scaled mass, zero scaled mass and infinite scales.
Refine this joint regime data wherever two paths with the same preliminary
limits yield different representation limits; no Casimir tuple alone defines
a row. Every parameter sequence must be accounted for, assembling oscillating
sequences from their convergent-regime subsequences.

For each resulting regime give two proved sets, Lim and Clust, and an exact
no-cluster/empty entry when applicable, with the lower and upper arguments
above. Give Poincaré orbit, little-group representation and energy orientation
for every point. For each constructed structural model give its direct sum/
integral, multiplicities and measure class, core and identifications, separately
from those intrinsic sets. The model list includes the principal two-sheet and
massless-dilation cases below; construct the analogous data for every additional
row claiming such a model. The requested deliverable is the complete set-valued
limit/cluster and model-decomposition table with exhaustiveness, not just a
collection of convergent Casimir examples. The course assertions and the two
selected model theorems alone do not provide its other outcomes.

Give the trivial-family row explicitly for both ordinary and covered groups.
For every sequence R_n→∞, the one-dimensional trivial representation of G
or G̃ has `Lim=Clust={1}` on the zero Poincaré fiber. Its specified model is
ℂ with identity action, with multiplicity1, zero translation orbit and trivial
Lorentz little-group representation; the covering center acts trivially.
Construct its continuous coefficient on the whole DNC group bundle. For each
compactly supported convolution section f, Haar-system continuity gives
`π_(R_n)(f)=∫_(G_(1/R_n)) f → ∫_(G_0) f=1_(G_0)(f)`.
Extend this scalar-character convergence to A by norm density and contractivity.
It supplies the lower inclusion and the exact norm upper bound above; use
the kernel argument to exclude every other irreducible cluster point.

As a concrete principal-series acceptance case, prove
[Primet (1983), §2, printed pp.13,15–16](https://www.numdam.org/item/PDML_1983___6D_A1_0/)
for the ordinary SO₀(1,4) group with SO(3) inducing type u. In the source convention
`χ_λ(a_t)=exp(iλt)`, fix source mass magnitude m>0 and `λ_r=−m/r`, r→0. In its fixed
two-sheeted mass-hyperboloid L² realization, under the displayed rescaling, prove the
local action tends to `ρ⁺_(m,u)⊕ρ⁻_(m,u₁)` where `u₁(k)=u(wkw)`. The source's statement
is pointwise almost everywhere in the hyperboloid variable and uniform on compact
group-variable sets for continuous L² vectors. Derive any Hilbert-norm/core convergence
needed here from actual integral bounds or weak convergence plus norm preservation;
a.e. convergence alone is not that assertion. Prove u₁≃u for SO(3), retaining the two
opposite time orbits. Derive the signature/tangent, parabolic-parameter, ℏ and Dixmier
family dictionary from the induced operators before applying the case to ν_(p,σ).
The source does not cover half-integral Spin types, complementary/discrete/boundary
families or all intrinsic Fell limits; these remain full-table targets above. The
mass magnitude is a source inducing parameter, distinct from Dixmier's spin label p.

As a second specified-model acceptance theorem, build the four-dimensional
massless conformal-extension/restriction contraction of
[Angelopoulos–Laoues (1998), Theorem2.5 and Propositions2.6,3.1–3.2](https://arxiv.org/abs/hep-th/9806100).
Start from each M4 null-orbit irreducible with energy orientation ε∈{+1,−1},
Δ rotation-character label ℓ∈ℤ and trivial action of its translation plane;
this excludes continuous-spin data. Set s=|ℓ|/2. Distinguish the signed
Spin(2) inducing label `h_ind=ℓ/2` from the Spin(4) second highest weight
`h_K(ε,ℓ)∈{−s,s}` defined by the compact generators below. Both are zero
when s=0. Compute the latter function from the actual extended operators,
proving `h_K(ε,ℓ)=εℓ/2` in the coefficient convention by the argument below;
a choice of source Cartan square roots alone is not that
module comparison. Construct its unitary extension
to the universal cover of SO₀(2,4), by the source's remaining differential
generators in Eq.(2.50), with the source real/skew/self-adjoint normalization
translated to M0/M4. Own this selected conformal Lie-algebra/operator construction,
its invariant dense analytic domain, adjoint/commutator identities and integration.
Construct the ε=−1 model as the complex conjugate of the ε=+1 model
with label −ℓ. Prove this restricts to the required M4 model, and compare
its differential generators with the source realization explicitly.
Supply the universal-conformal-cover adapter separately from M0's finite-center
compact-K theorem: use 𝔨=so(2)⊕so(4), the real Killing form and
`N=1−C+2Δ_𝔨`, compute the conformal C scalar on the Eq.(2.50) module,
and prove finite-dimensional joint H₀/Spin(4) weight spaces. These weight
spaces replace finite isotypic spaces for the noncompact preimage
K̃=ℝ×Spin(4). Prove their algebraic sum dense in the original M4 null-cone
Hilbert space, by the explicit radial/angular eigenfunction expansion and its
completeness, before using it as an analytic core. For angular completeness
consume CompactGroups' Peter–Weyl theorem on SU(2) and project to the
specified U(1)-covariant sections. Separate the actual H₀ radial equation,
compute its change of variable, parameter and normalization, and identify
its eigenfunctions with the Laguerre function basis from
[LaguerreJacobi A–B](https://github.com/weiscadence/TauCetiRoadmap/blob/86ae915518d82e35110047d89192510519fce2b3/TauCetiRoadmap/LaguerreJacobi/README.md).
That required supplier owns the polynomials, Rodrigues/orthogonality,
finite exponential moment and Hilbert-basis comparison. Use radial
`x=2E` and the unitary `g(x)=f(x/2)√x/2` from L²(E dE) to L²(dx),
and prove the operator reduction has Laguerre parameter α=2j+1 for
each angular type j. M5 owns the
model-specific unitary radial/angular comparison, not a second generic
Laguerre basis theorem.
Prove the sum-of-squares analytic bounds and apply Nelson's
Theorem5 directly to integrate on the simply connected conformal group.
No compactness of K̃ or unproved conformal-group representation theorem is assumed.
Prove the period/descent statement from its compact types, distinguishing the
universal cover from a finite twofold quotient. In the source H₀-angle
normalization the kernel over SO(2)×SO(4) is 2πℤ×{±1}. Compute the
characters of (2π,1), (0,−1), (2π,−1) and (4π,1) from the joint weights,
and identify the actual descended quotient. Restrict to the de Sitter
subgroup covering SO₀(1,4) and prove irreducibility.

In the target orthogonal highest-weight coordinates its Spin(4) types are
`(s+k,h_K)` for k∈ℕ₀, each with multiplicity1. Compare with the compact supplier's
SU(2)×SU(2) coordinates
`(j_L,j_R)=((s+k+h_K)/2,(s+k−h_K)/2)`.
Use K=Spin(4) over the stabilizer of e₄ and orient its negative Euclidean
space by e₀∧e₁∧e₂∧e₃. Identify J_ab with e_a∧e_b there. Fix the
self-dual left basis
`L=((J₀₁+J₂₃)/2,(J₀₂−J₁₃)/2,(J₀₃+J₁₂)/2)` and anti-self-dual right basis
`R=((J₀₁−J₂₃)/2,(J₀₂+J₁₃)/2,(−J₀₃+J₁₂)/2)`.
Prove both have cyclic su(2) brackets and commute with each other; integrate
these ordered bases to the fixed Spin(4)≃SU(2)_L×SU(2)_R map. The orthogonal
weight planes are `T₁=J₀₁=L₁+R₁`, `T₂=J₂₃=L₁−R₁`; define the real weights
by −i times the derived compact generators, with dominant coordinates
a≥|h_K| for (T₁,T₂). Translate the source's Spin(4) weight vector to
these coordinates through its chosen Cartan roots and positive chamber.
The inducing Spin(2) label and the second Spin(4) coordinate belong to
different representations; their numerical equality is not assumed.
For the conformal embedding take ambient form diag(−1,−1,−1,−1,+1,+1)
on e₀,…,e₅ and embed de Sitter by fixing e₅. Map the source's ordered
coordinates (x₋₁,x₀,x₁,x₂,x₃,x₄) to (x₁,x₂,x₃,x₄,x₀,x₋₁);
compare its generators by these matrices, including the compact time
rotation J₅₄. Distinguish the source
second weight from h_ind, the Δ rotation character ℓ/2 at each of M4's two
null representatives, and physical helicity J·P/|P|. The null stabilizer's
transverse rotation is `X₁₂↦J₀₁=T₁`, whereas `X₃₄↦J₂₃=T₂` is the other
compact plane. For `i dS(X₁₂)=h_ind` and `m_θ=exp(−θJ₀₁)`, the inducing
character is `exp(ih_ind θ)`, giving h_ind=ℓ/2. With the physical Stone
rotation convention the helicity is `λ=εℏℓ/2`.
Prove the target weight dictionary without identifying these two Cartan planes:
put `B=(J₁₂,J₂₀,J₀₁)` and `Π=(J₀₃,J₁₃,J₂₃)`. In the enveloping
algebra prove `Σ_k B_kΠ_k=Σ_i L_i²−Σ_i R_i²`; on the type (a,h_K)
its derived action is `−h_K(a+1)`. The conformal translations are
`T_k=J_(k,5)+Π_k`. For `W=exp(πJ₅₄)`, prove Ad(W) fixes B and Π
and negates J_(k,5). On the common conformal analytic core transport
`J·P=λ|P|` by U(W), obtaining the same equation for
`P′_k=iℏ dU(Π_k−J_(k,5))`. Adding gives
`−2ℏ²dU(Σ_k B_kΠ_k)=λ(|P|+|P′|)`.
The null-cone |P| is injective and both terms on the right are nonnegative.
Evaluate this identity on a nonzero compact-type vector to obtain
`sign h_K=sign(εℓ)`; with |h_K|=s this gives h_K=εℓ/2, including the
scalar case separately. Retain all common-core and closure justifications.
Translate the source's signed weight vector through its Cartan convention
and this computed module comparison, including the energy-dependent map
from its inducing representation; do not silently identify its two labels.
At h_K=0 the two signs give one scalar tower, not two copies. Compute the de Sitter
cover kernel on these types, obtaining `(−1)^(2s)`, and prove the actual compact
embedding and native Spin-cover comparisons used for this inference. The source's
conformal Casimirs at n=4 are C''=s² and C=3(s²−1); they are not the Dixmier
normalization. Compute the de Sitter ladder operators and Ω,Ω′ directly before
identifying these restrictions with the full M5 classification, including s=0.
Construct the complex-conjugation comparison of the M4 models
`(ε,ℓ)↦(−ε,−ℓ)` and the chosen conformal extensions above. Spin(4) types are
self-conjugate, so prove `h_K(−ε,−ℓ)=h_K(ε,ℓ)` as a consistency condition
on the computed dictionary. Prove these conjugate-pair de Sitter restrictions
are equivalent, by comparison on the differential operators; their compact types are self-conjugate
and the real Hermitian central generators have unchanged real eigenvalues.
Apply the proved K-type/ladder classification, or construct the actual
`(𝔤,K)` intertwiner and use M0's unitary bridge. Equality of Casimir values
alone is insufficient. Retain both specified contraction fields for this
single radius-dependent class and prove
`Supp(ρ_(+,ℓ))∪Supp(ρ_(−,−ℓ))⊆Lim`, including zero-momentum points in the closure
of those supports. Its exact upper bound must cover their joint support,
for example by ρ₊⊕ρ₋. Prove any further exclusion needed for the full row;
the two models alone do not exclude other cluster points. Equivalently, for
fixed target weight h_K the two fields have labels `(+,2h_K)` and
`(−,−2h_K)`, and both physical helicities equal ℏh_K. For fixed nonzero
ℓ, the two energy signs with the same ℓ have opposite target weights
and disjoint compact-type towers, hence inequivalent de Sitter restrictions.

On the fixed null-cone Hilbert space the source's unitary dilation is
`(Z_αφ)(x)=α φ(αx)`, α>0. With source de Sitter generators
`Y_μ=(P_μ−P̂_μ)/2` for its S₄⁺=SO₀(1,4) subgroup, its rescaling Φ_α fixes
Lorentz generators and sends
Y_μ to α(2−α)Y_μ. State conjugations on the invariant space of conformal
analytic vectors, and construct a dense invariant domain containing the
K̃-finite analytic vectors and their conformal translates. Prove invariance
under Z_α; the K̃-finite algebraic domain alone need not be dilation-invariant.
Prove on this domain
`Z_α⁻¹ d(P_μ)Z_α=α⁻¹d(P_μ)` and
`Z_α⁻¹ d(P̂_μ)Z_α=α d(P̂_μ)`, hence
`Z_α⁻¹d(Φ_αY_μ)Z_α=(1−α/2)(d(P_μ)−α²d(P̂_μ))→d(P_μ)`.
The source's other plus-sign choice belongs to SO₀(2,3), separately from this
SO₀(1,4) theorem.
Identify this basis, tangent sign and parameter with the DNC radius convention;
Z_α need not itself converge. The source proves this derived-operator limit.
For the stronger group/model limit required here, prove convergence of every
finite generator word on the common domain and uniform bounds
`‖A_(α,i₁)⋯A_(α,i_n)v‖≤C_v (2B)^n n!`, uniformly for 0<α≤1.
Each rescaled generator is a sum of at most two fixed conformal generators
with coefficients bounded by1. Expand into at most 2^n words and use the
fixed conformal analytic-word bounds. Use exponential series only for small
generator parameters with a positive radius common to a dense subspace:
on the algebraic sum of the joint weight spaces use the fixed finite set
`{P_μ,P̂_μ,L_μν}` and prove each generator shifts the level by a bounded amount, has uniformly
finite branching and has block norm at level k at most C(1+k).
Derive `‖word_n v‖≤C_v B^n n!` with one B independent of the starting
finite set of levels, absorbing its polynomial-in-n factor into C_v and
a fixed exponential enlargement of B. Thus the rescaled bound uses 2B and
series converge for |t|<1/(2B). N-entire vectors alone are not asserted
to be entire for the noncompact Lie generators. Extend strong
convergence to arbitrary compact parameter intervals by subdividing into
finitely many such pieces and using unitarity; finite products and the local
DNC charts then give uniform-on-compact group coefficient convergence. Then apply the DNC/Fell comparison proved above. These additional
steps supply the upgrade; generator convergence alone is not group convergence.
This theorem supplies specified massless helicity models in both energy
orientations. All other full-family regimes and the exact named-family
dictionary remain separate targets of the complete contraction table.

Before using Casimirs, pin source generators J_ab, signature and commutators, transcribe the course I₁,I₂ and Dixmier Ω,Ω′ definitions, then derive their conversion in the enveloping algebra with all R, i and signature factors. Prove flat Casimir convergence on the common core. A matching pair of central characters is only a necessary check. Keep literal Dooley p.30 claims beside corrected normalization and prove the full
source dictionaries and contraction regimes as targets with their stated hypotheses.

Reproduce the Bacry–Lévy-Leblond kinematical Lie-algebra classification under its actual assumptions: spatial isotropy, parity and time reversal as automorphisms, the noncompact inertial subgroup/causality condition. Derive the Jacobi constraints and list the resulting relativistic, absolute-time, static and contracted cases; identify Lie-algebra isomorphism versus distinct global covers/groups. The classification is conditional on those assumptions and does not claim all spacetime symmetry groups.

For the classified de Sitter representations, derive the two Casimir invariants `I₁,I₂`, fix their normalization in R, and compute their flat contraction to mass and spin Casimirs; keep literal course-note formulas and corrected convention separately. Consume M4.SpatialLocalization's exact fixed-time spatial covariance criterion, selected positive-energy classification and supplied covariant model pairs. Its full-spacetime sharp-PVM/positive-energy obstruction is the separate M4 theorem above. QF6b owns state-normality, operational probabilities and outcome pushforwards. This is a one-particle localization theorem, not a local quantum field theory.

## M6. Tensor products and source acceptance cases

For the selected induced representations construct the diagonal tensor product action, decompose it using the M2 orbit and stabilizer data, and prove the exact direct-integral or discrete-sum formula only under its type-I/separability hypotheses. State multiplicity spaces and measure classes; do not call a product representation irreducible without proof. Give Euclidean, Galilei, massive Poincaré and massless examples.

Source claims are acceptance cases, not authority for omitted assumptions. Preserve the following literal/corrected distinctions: (a) `ℝ⁴` has nontrivial continuous multiplier classes, represented by alternating bilinear forms; (b) M4's connected SO₀(3,1) has a nontrivial locally continuous spin circle-extension class, with its full two-component comparison proved separately; (c) the square-root argument excluding antiunitary ray actions fails for the explicit determinant-one matrix in M4; (d) mass is a real square root only on the nonnegative mass-squared sector; (e) a Euclidean spacetime group enlarged by time reversal may be represented antiunitarily; (f) conjugate genuine Bargmann classes have the simultaneous label reversal (m,U,j)↦(−m,−U,j), with M3's explicit realization and fixed time-reversal lift, while antiparticle language is interpretive; (g) the continuous multiplier of `ℝ` is cohomologically trivial under the normalized continuous convention and yields a lift. QF5 owns the translation-multiplier and connected-ray-component facts in (a),
(c) and (g); this milestone consumes them as source tests rather than creating
second owners. Each source assertion and its correction is an individually
labelled check in the grounding record, not a silent transcript repair.

Record these additional Dooley acceptance cases with their exact owners:

| Physical page | Literal statement or notation | Required comparison and owner |
| --- | --- | --- |
| 16, bibliography33 | Spacetime localization is attributed to “Mackey [31]”. | Entry31 names Wightman. M4 proves the normalized full-spacetime PVM obstruction under translation covariance and positive energy, separately from spatial localization. |
| 16–17 | Irreducible σ-representations of G₁×ℝ factor, and Galilei is such a product. | M2 proves the genuine product theorem with its type-I hypothesis; for σ-data prove factorization only when the multiplier is cohomologous to a factorwise product, since cross multipliers can obstruct it. M3 proves boosts fail to commute with time translations, so the Galilei group is not this direct product. |
| 17 | φ(t)=e^(itH)φ and ∂_tφ=iHφ. | M4 distinguishes positive-time active symmetry from physical evolution at inverse time; QF's e^(−itH) convention is recovered with ℏ=1. |
| 20 | (1/i)(y∂_x−x∂_y), and H multiplication by E. | M3's localized Euclidean model computes the positive Stone rotation generator as the negative of physical (Q×P)_z, with the spin term included for nonzero j; fixed time character gives H=E. |
| 19 | Rotation labels include j=1/4,3/4,… and half-integer genuine SO(3) types. | QF5's spin extension and M3's compact stabilizers give integer genuine SO(3) types and half-integer SU(2) types; dimension2j+1 excludes quarter labels. |
| 20 | All Euclidean irreducibles have labels (j,E), followed by an L²(ℝ³) localized model. | M3 retains both zero and nonzero momentum orbits and their distinct stabilizers, and decomposes the reducible underlying localized representation. |
| 22 | Mass/spin particle labels, boost x↦x−v_D t, and the faint (1/m)T=X_iV_i−V_iX_i. | M3 uses v=−v_D, pins [X_i,V_j]=iℏδ_ij/m on its common core, and preserves the uncertain source T glyph rather than identifying it silently with iℏ. Genuine class labels include internal energy; the corresponding scalar time-character shift leaves a ray action unchanged. |
| 23 | A* is “inverse transpose”; full E(3,1) has square roots. | M4's Hermitian action uses conjugate transpose A†. Its connected component uses QF5's continuous ray-component theorem; the disconnected full group has separate parity/time-reversal implementations. The displayed SL(2,ℂ) counterexample disproves the square-root premise even in the connected cover. |
| 24 | The displayed union of representative branches contains zero in overlapping branches. | M4 gives positive timelike/spacelike parameters and a separate zero branch. Repetition within a set union is harmless; only treating the overlapping branches as disjoint labelled representatives would fail injectivity. |
| 25 | P₁²+P₂²+P₃²−P₄² is said to equal the positive timelike c of p24. | M4 proves the left side is −q(P)=−c in the pinned convention. This is an internal sign error, not a change that can preserve both printed equations. |
| 25,27 | Period2π diagonal coordinate is mixed with a period4π null-group action e^(iθ/2). | M4 proves the conversion θ=2φ, the action e^(iθ) and stabilizer {0,2π}; retain the literal parameter mismatch. |
| 26 | Timelike/null energy spectra are open intervals; the SU(2) index starts at1. | M4's joint PVM gives closed spectra [m,∞), (−∞,−m], [0,∞), (−∞,0], and includes spin0. The omitted endpoint can be a spectral value without an eigenvector. Spacelike mass squared is negative and has no real mass square root; calling the discarded spacelike cases “anti-particles” supplies no representation theorem. |
| 29 | The pseudo-Euclidean radius-R locus is called a sphere; O(3,2) is called “inhomogeneous de Sitter”. | M5 proves the de Sitter quadric and its induced signature/topology. Distinguish the anti-de Sitter orthogonal group O(3,2) from an affine semidirect extension; no group is identified by this literal name. |
| 30 | J_ab and contractions omit signature factors. | M5's pinned matrix units, signature and commutators supply the actual Lorentz/de Sitter generators and the ordered enveloping/Casimir comparison. |

Preserve faint or overwritten glyphs as source uncertainties. None of these
comparisons authorizes filling an indeterminate facing scan with invented content.

## Source provenance and examples

The Dooley packet is `MathematicalFoundationsOfQuantumMechanics-Dooley.pdf`, SHA-256 `79251fa98f4b735d98579f97ea0a9b5a9930e7c9bedc197a360dbd16e618f1a9`; all 34 physical pages are acceptance context. Its source-specific entries are: Mackey theorem and multiplier discussion (physical pp. 16–20), Euclidean and Galilei groups (pp. 20–23), Poincaré orbits and little groups (pp. 23–28), de Sitter and kinematical classification (pp. 29–31), and bibliographic claims (pp. 32–34). The transcript index is private grounding evidence, not a substitute for the exact hypotheses above.

Grundling, *Mathematics of Quantum Mechanics notes*, is pinned at SHA-256 `d2cb7c97bcfdc2b8c4b4b78140896ad0345578ab473929ff92d865568a3e68d7` (225 physical pages). Its operator, Stone, compact rotation and tensor examples support the operator/compact suppliers: physical pp.122–140 have basic operator theory, pp.170–182 have Stone and self-adjoint extensions, and pp.211–225 have angular momentum, hydrogen, tensors, Weyl relations and rotation generators. The readable material supplies no Galilei, Poincaré, Lorentz or Mackey classification premise here; those targets use the Dooley packet and the named primary representation-theory sources. The faint facing halves of physical pp.222–225 remain indeterminate and carry no invented assertion. The complete transcript ledger, and the per-page image/transcript SHA pins, are in the private grounding packet.

Primary representation-theory references for the noncompact assertions are G. W. Mackey, [“Imprimitivity for Representations of Locally Compact Groups I,” *PNAS* 35 (1949), 537–545](https://doi.org/10.1073/pnas.35.9.537) and [“Unitary Representations of Group Extensions I,” *Acta Mathematica* 99 (1958), 265–311](https://doi.org/10.1007/BF02392428); V. Bargmann, [“Irreducible Unitary Representations of the Lorentz Group,” *Annals of Mathematics* 48 (1947), 568–640](https://doi.org/10.2307/1969129), with its q/K-weight normalization translated in M4; I. M. Gel'fand–M. A. Naimark, [“Unitary representations of the Lorentz group,” *Izv. Akad. Nauk SSSR Ser. Mat.* 11 (1947), 411–504](https://www.mathnet.ru/eng/im3007), especially §8 and the p457 endpoint footnote; V. Bargmann, [“On Unitary Ray Representations of Continuous Groups,” *Annals of Mathematics* 59 (1954), 1–46](https://doi.org/10.2307/1969831); R. Takahashi, [“Sur les représentations unitaires des groupes de Lorentz généralisés,” *Bull. Soc. Math. France* 91 (1963), 289–433](https://doi.org/10.24033/bsmf.1598); J. Dixmier, [“Représentations intégrables du groupe de De Sitter,” *Bull. Soc. Math. France* 89 (1961), 9–41](https://doi.org/10.24033/bsmf.1558); and H. Bacry–J.-M. Lévy-Leblond, [“Possible Kinematics,” *J. Math. Phys.* 9 (1968), 1605–1614](https://doi.org/10.1063/1.1664490). Wightman's primary localization discussion is [“On the Localizability of Quantum Mechanical Systems,” *Rev. Mod. Phys.* 34 (1962), 845](https://doi.org/10.1103/RevModPhys.34.845). These sources identify the classification problems; the chosen topology, cover, signature and operator domains are fixed by this README.
