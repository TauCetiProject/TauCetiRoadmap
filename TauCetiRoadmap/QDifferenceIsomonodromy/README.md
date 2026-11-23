# Roadmap: q-difference equations and isomonodromic deformations

**Summary.** This roadmap develops rational $q$-connections of arbitrary finite rank, their local analytic classification, and deformations that preserve their connection data. The algebra starts with a finite projective module and an invertible semilinear operator. On the projective line a rational $q$-connection is a vector bundle $E$ with a rational isomorphism $A:E\dashrightarrow \sigma_q^*E$, where $\sigma_q(z)=qz$. Choosing a rational frame gives the system $Y(qz)=A(z)Y(z)$.

The local classification includes resonance, nonsemisimple regular singular factors, and arbitrary rational slopes. It constructs the slope filtration and formal decomposition, then classifies analytic modules with a marked formal type by torsors for the $q$-Stokes sheaf on the elliptic curve $E_q=\mathbb C^\times/q^\mathbb Z$. The marked coefficient functor is represented by an affine space, and a quotient stack describes the same coefficient families with locally specified graded type. A second description of local analytic modules uses holomorphic bundles on $E_q$ with a specified rational anti-Harder–Narasimhan filtration.

The global comparison is an equivalence of categories over $\mathbb C$. Its data are the local analytic modules at $0$ and $\infty$ and a meromorphic isomorphism between their associated elliptic bundles. It is constructed by extending local maps, factoring a meromorphic transition matrix, and gluing objects and morphisms. In the regular singular case it gives the classification by local constant systems and the Birkhoff connection matrix. Relative connections over schemes and complex analytic spaces, including nonreduced bases, are defined with finite pole bounds. The relative targets include endpoint localization and completed base change, as well as specific analytic family theorems under stated bounds.

The global equivalence lifts coherent isomorphisms of connection data along a time groupoid to rational horizontal gauges. For several time directions, these gauges satisfy both the $q$-Lax equations and the square identities. For polynomial systems with separated spectral groups, factor reordering gives commuting discrete Schlesinger transformations in every rank and degree, on a nonempty Zariski-open set for each prescribed finite range of times.

## How to read the build

Layers 0 and 1 build the algebra and the geometry of bundle models, relative objects, and local lattices. Layer 2 constructs the elliptic curve and regular singular solutions. Layers 3 and 4 give the formal and analytic local classifications. Layer 5 reconstructs rational systems and all their horizontal maps from connection data. Layer 6 treats time transport and analytic families. Layer 7 starts with algebraic matrix refactorization and uses Layers 5 and 6 to interpret its gauges as connection-preserving transport. Each *Needs* line gives the suppliers for the corresponding target.

## Conventions

- **Base rings and ranks.** Difference algebra uses a commutative ring $R$ and a ring automorphism $\sigma$. The finite projective category includes rank zero. Cyclic-vector and polynomial-factorization theorems use positive rank. Geometric ranks may be locally constant.
- **The shift.** Write $\sigma_q f(z)=f(qz)$. Use a fixed complex $q$ with $|q|>1$ for the analytic classification and comparison. For $0<|r|<1$, show that $Y(rz)=A_r(z)Y(z)$ becomes $Y(qz)=A_r(qz)^{-1}Y(z)$ for $q=r^{-1}$. Algebraic targets state their own hypotheses, including infinite multiplicative order where used.
- **Matrices.** A system $\sigma_qY=AY$ has semilinear operator $\Phi_A=A^{-1}\sigma_q$. A horizontal matrix $H:A\to A'$ satisfies $(\sigma_qH)A=A'H$. An invertible horizontal matrix $G$ gives $A'=(\sigma_qG)AG^{-1}$. On bundles the fibre map of $A$ goes from $E_z$ to $E_{qz}$.
- **Endpoints.** At $0$ use $K=\mathbb C(\{z\})$, the field of meromorphic germs, and $\widehat K=\mathbb C((z))$. At $\infty$ first use $w=z^{-1}$ and write the system as $Z(q^{-1}w)=C(w)Z(w)$. For local classification use $Z(qw)=C(qw)^{-1}Z(w)$. A raw slope at infinity refers to the original action in coordinate $w$. For $A=cz^m$, the slopes at zero, at infinity before reversal, and at infinity after reversal are $m,-m,m$. The order of $\det A$ at infinity is taken before reversal.
- **Slopes and ramification.** Use the lower Newton polygon of the annihilator for $\Phi_A$, so $A=z^\mu C$ has slope $\mu$. To ramify by $z=u^r$, choose $p$ with $p^r=q$ and let $u\mapsto pu$. Record changes of root using descent.
- **Transport.** The time shift $T$ preserves $q$. For $Y(z,Tt)=B(z,t)Y(z,t)$ the compatibility equation is $A(z,Tt)B(z,t)=B(qz,t)A(z,t)$. Connection preservation specifies isomorphisms and their composition. Local lattices, formal markings, fundamental-solution normalizations, and time isomorphisms are separate data.

## Layer 0: Difference modules and coefficient fields

### 0.1 Semilinear difference modules and horizontal maps

Construct the category of $R$-modules $M$ with an invertible $\sigma$-semilinear map $\Phi_M$. A morphism $f:M\to N$ is $R$-linear and satisfies $f\Phi_M=\Phi_Nf$. Give its zero, direct sums, kernels and cokernels, and prove that forgetting $\Phi$ is faithful and reflects isomorphisms. The whole category is abelian. The finite projective subcategory has the exact structure induced by the underlying short exact sequences, and over a field the finite-dimensional subcategory is abelian. For $\sigma=\mathrm{id}$ recover modules with a linear automorphism. [RSZ13, §2.1.1][RSZ13]

*Needs.* Mathlib's semilinear `LinearMap` and `LinearEquiv`, module categories, and short exact sequences.

### 0.2 Tensor products, duals, internal Homs, and scalar change

Give finite projective difference modules a rigid symmetric monoidal structure. The unit is $(R,\sigma)$, the tensor operator sends $m\otimes n$ to $\Phi_Mm\otimes\Phi_Nn$, and the internal Hom operator sends $f$ to $\Phi_N f\Phi_M^{-1}$. The latter restricts to $\sigma\circ f\circ\Phi_M^{-1}$ on the dual. Construct horizontal evaluation and coevaluation, the exterior powers and determinant, and the determinant comparison for short exact sequences. Identify horizontal elements of the internal Hom with morphisms.

For $R\to S$ commuting with automorphisms $\sigma,\tau$, use $S\otimes_R M$ with operator $s\otimes m\mapsto\tau(s)\otimes\Phi_Mm$. Give the unit, composition and tensor comparisons and their coherence. This preserves finite projectivity and admissible short exact sequences for every such map because the underlying sequences split. Preservation of arbitrary kernels and short exact sequences uses flatness. Give restriction of scalars, preservation of finite projectivity for $S$ finite projective over $R$, and the rank formula for finite field extensions.

*Needs.* §0.1 and Mathlib's tensor product, exterior powers, and module change of rings.

### 0.3 Matrix presentations, gauge, and reversal

Over a field $K$, identify the category of matrix systems with arbitrary rectangular horizontal matrices with the category of finite-dimensional difference modules. Use a basis to write $\Phi=A^{-1}\sigma$. Show that horizontal maps compose by matrix multiplication and that the core is the gauge groupoid. Give the matrix rules for direct sum, tensor, dual (inverse transpose), determinant and scalar change. In particular, $\det A'=\sigma(\det G)\det A/\det G$. Over a general ring use local frames of the module and its twist. A localization used as a difference ring must be $\sigma$-stable. [S03, §1.1.2][S03]; [K16, Remark 1.8][K16].

Reversal sends $(M,\Phi)$ to $(M,\Phi^{-1})$, replaces $\sigma$ by $\sigma^{-1}$, and acts identically on horizontal maps. In matrices it sends $A$ to $\sigma^{-1}(A)^{-1}$. Construct the involutive exact symmetric monoidal equivalence and its compatibility with scalar change. For the $r$-shift, reversal sends $cz^m$ to $c^{-1}r^mz^{-m}$ and transports the singular support by multiplication by $r$.

*Needs.* §§0.1–0.2, bases, matrices, and determinants.

### 0.4 Rational, analytic, and formal coefficient fields

For $q\ne0$ construct the shift on $\mathbb C(z)$, $K$, $\widehat K$, and the meromorphic function field of $\mathbb C^\times$. Construct the equivariant embeddings $\mathbb C(z)\to K\to\widehat K$ by localization and Laurent expansion, and compare them with localization at infinity and reversal. The local shifts preserve valuation and are continuous for the formal valuation topology. If $q$ has infinite order, coefficient comparison gives constants $\mathbb C$ for the rational, analytic local and formal fields.

For $z=u^r$ and $p^r=q$, construct equivariant finite Galois extensions in the analytic and formal cases. The basis is $1,u,\ldots,u^{r-1}$ and the deck group is $\mu_r$. In the analytic case, group Laurent coefficients by exponent modulo $r$ and prove convergence of each grouped series. [RSZ13, §2.1.1][RSZ13]; [VPR07, §1][VPR07].

*Needs.* §0.2, Mathlib's `RatFunc` and `LaurentSeries`, Tau Ceti's meromorphic germs and pullback, FormalLaurentPuiseux Layers 1, 4 and 6, and ComplexKahlerGeometry §§3.2–3.3.

### 0.5 Skew Laurent operators and cyclic vectors

Use `SkewMonoidAlgebra R (Multiplicative ℤ)` with the action by powers of $\sigma$ for $D=R[\Phi,\Phi^{-1};\sigma]$. Its relation is $\Phi a=\sigma(a)\Phi$. Compare the nonnegative exponents with `SkewPolynomial R` and prove the universal property of adjoining the inverse of $\Phi$ using `liftNCRingHom`. The action is supplied explicitly. If a coefficient ring is fixed by $\sigma$, use its central action.

Identify all difference modules with left $D$-modules via $(a\Phi^j)m=a\Phi_M^j(m)$, with the finite projective or finite-dimensional condition on restriction to $R$. Compare reversal with $j\mapsto-j$. Over each field in §0.4 with constants $\mathbb C$, prove the cyclic vector theorem for infinite-order $q$ and rank $n>0$. The vectors $e,\Phi e,\ldots,\Phi^{n-1}e$ give a basis and a presentation $D/DP$, with $P$ monic of degree $n$ and with nonzero constant coefficient. Give the companion matrix construction and its inverse on cyclic presentations. [RSZ13, Lemma 2.1.1][RSZ13].

*Needs.* §§0.1–0.4 and Mathlib's skew monoid algebra product, coefficient inclusion and lifting API.

### Examples

- In rank one, $G=z^m$ sends $A=c$ to $q^mc$. Reversing the $r=1/2$ system with $A=z-1$ gives $q=2$ and $A^{\mathrm{rev}}=(2z-1)^{-1}$.
- For $q=1$, the identity on a two-dimensional space has no cyclic vector. Over $\mathbb C[x]$, multiplication by $x$ has a nonprojective cokernel.

### Dependencies

The matrix and operator descriptions use the intrinsic category and scalar change. The local fields use the existing analytic and formal coefficient carriers.

## Layer 1: Connections on bundles, lattices, and singularities

### 1.1 Rational difference connections and the generic fibre

Let $X$ be a smooth projective integral curve over a field $k$, with a $k$-automorphism $\sigma_X$. Use a finite locally free sheaf $E$ and a rational isomorphism $A:E\dashrightarrow\sigma_X^*E$. A regular horizontal map $f:E\to F$ satisfies $(\sigma_X^*f)A_E=A_F f$ as a rational equality. Form also the category with rational horizontal maps. Generic fibre is an equivalence from the latter category to difference modules over $k(X)$, via $\Phi=A^{-1}\sigma_X$. Construct the quasi-inverse from rational bases and trivial bundles, and give the comparisons for tensor, dual, determinant, and pullback. Specialize to $(\mathbb P^1_\mathbb C,z\mapsto qz)$. [K16, Definition 1.5][K16].

*Needs.* Layer 0, AlgebraicVectorBundles §§1.1–1.2 and 3.1–3.2, and AlgebraicCurves §§1.1–1.2 and Layer 12.

### 1.2 Bundle models and local lattices

Fix a generic module $V$. Identify bundle models with full $\mathcal O_{X,p}$-lattices $\Lambda_p\subset V$ at the closed points, standard in one rational basis outside a finite set. Reconstruct the bundle by gluing and show that a generic map extends regularly exactly when it carries each lattice into the corresponding lattice. For isomorphisms use equality of lattices. Transport $A$ to the maps from $\Lambda_p$ to the pullback lattices, and compare with completed lattices, finite changes and the tensor, dual and determinant lattice operations.

*Needs.* §1.1, AlgebraicCurves §§1.1–1.2, 5.7 and Layer 12.

### 1.3 Smith type and determinant divisor

At $p$ let $\nu_1\le\cdots\le\nu_n$ be the Smith exponents of $A$ between its two lattices. Prove independence of uniformizer and regular frames. All exponents vanish exactly at regular isomorphism points. A negative exponent records a pole of $A$ and a positive exponent a pole of its inverse. Construct the finite singular support and the determinant divisor with coefficient $d_A(p)=\sum_i\nu_i(p)$. Its degree is zero because $\sigma_X$ preserves bundle degree. Give the direct sum and dual rules and compatibility with pullback and regular gauges. [K16, Definition 1.6][K16].

*Needs.* §§1.1–1.2, Mathlib's DVR Smith normal form after clearing denominators, AlgebraicCurves §§3.1–3.2, and AlgebraicVectorBundles §3.2.

### 1.4 Modifications and transport along singular orbits

A rational isomorphism $G:E\dashrightarrow E'$ gives the modified connection with $A'=(\sigma_X^*G)AG^{-1}$. Compare this with finite changes of lattices in a fixed generic fibre, including compositions, inverses, and commutation of changes at disjoint points. On $\mathbb P^1_\mathbb C$ with the $q$-shift, set $r_G(p)=\operatorname{ord}_p\det G$ and prove
$$
d_{A'}(p)=d_A(p)+r_G(qp)-r_G(p).
$$
The determinant sum on any nonzero $q$-orbit, and the endpoint determinant orders, are invariant. Compare endpoint exponent shifts with analytic and formal isomorphisms. [K16, Definition 1.7 and Remark 1.8][K16].

*Needs.* §0.3 and §§1.2–1.3.

### 1.5 Elementary modifications at simple zeros and poles

At $a\ne 0$, let $A$ have a simple determinant zero, rank $n-1$, and a regular isomorphism at $a/q$. For $t=z-a$, enlarge $\Lambda_a$ by $t^{-1}$ times the lift of $\ker A(a)$, keeping the other lattices. Prove independence of the lift and check in a compatible frame that the gauge is $\operatorname{diag}(z-a,1,\ldots,1)$. The zero moves to $a/q$, the determinant ratio is $(qz-a)/(z-a)$, and the bundle degree increases by one. In the pole case use Smith type $(-1,0,\ldots,0)$ and shrink the lattice using the kernel of the principal part. The simple pole moves by the same shift and the bundle degree decreases by one. Construct the inverse changes, and track regularity and disjointness hypotheses at every step of a finite composition.

*Needs.* §§1.2–1.4 and the finite-length quotient description of degree.

### 1.6 Relative connections, base change, and descent

Over a base with unit $q$, put $X_S=\mathbb P^1_S$ and let $D$ be an effective Cartier divisor that stays effective Cartier under the allowed base changes. On either schemes or complex analytic spaces, use
$$
\mathcal O_X(*D)=\varinjlim_m\mathcal O_X(mD),\qquad
E(*D)=E\otimes\mathcal O_X(*D),\qquad A:E(*D)\xrightarrow{\sim}(\sigma_q^*E)(*D).
$$
The two directions of $A$ have locally finite pole bounds. Compare bounds via enlargements and compare the algebraic construction with restriction to the Cartier complement. Over an analytic base use the finite bound as part of the meromorphic data, including for nonreduced spaces. Both settings use finite locally free sheaves and all regular horizontal maps. The core gives the moduli groupoid. Use locally split short exact sequences for its underlying exact category.

Construct pullback, identity and composition comparisons, and compatibility with the exact structure, tensor, dual and determinant. For equations involving shifted bounds use $\sigma_q^*\mathcal O_X(*D)=\mathcal O_X(*\sigma_q^{-1}D)$ and the finite sum of the required divisors. For bounds pulled back from the base, prove fpqc descent on the algebraic side and open-cover descent on the analytic side. For $\tau=\sigma_q^{-1}$, reversal is $\tau^*(A^{-1})$ with bound $\tau^*D$. Compare reversal with pullback and enlargement. Define analytification over locally finite type complex schemes by applying coherent analytification at finite pole bounds. Use locally free kernels and quotients on the loci where relative modifications are made.

*Needs.* §§1.1–1.4, AlgebraicVectorBundles §§1.1–1.2 and 2.1–2.2, SchemeAndStackFoundations §§1.1 and 1.18, ComplexComparisonPartII §§C-1.1 and C0.1–C0.4, and [SPD, Lemmas 31.19.1 and 31.19.3][SPD].

### 1.7 Local conditions, markings, and modification groupoids

Let $Q$ be the core of the relative connection category, with a restriction $r:Q\to L$, and let $P\to L$ specify allowed data. Use $Q\times_L^hP$ for connections equipped with an isomorphism $r(E,A)\simeq p(\eta)$ for $\eta\in P$. A morphism is a pair of isomorphisms compatible with that identification. Construct the change-of-base and forgetting maps. Instantiate with a fixed determinant connection, a frame along a section, flags with locally free successive quotients, and specified analytic or formal endpoint types using §1.8. A marked fibre specifies the identification; the allowed-type groupoid retains its own automorphisms.

Construct $Q_{\mathrm{mer}}$ by allowing horizontal maps with finite relative pole bounds, using common enlargements and also bounding the inverse for isomorphisms. For decorated groupoids $Q_\alpha,Q_\beta$, use $Q_\alpha\times^h_{Q_{\mathrm{mer}}^\times}Q_\beta$ for their modifications. Prove the base-change and composition laws. Within a common localization a meromorphic gauge is a regular isomorphism exactly when it carries the source subsheaf onto the target. Over a field recover the criterion at all closed-point lattices. A modification rule gives a functor from source to target when the source projection of its groupoid is an equivalence. If the target projection is an equivalence too, the reverse rule gives the inverse functor.

*Needs.* §§1.1–1.6, SchemeAndStackFoundations §1.18, and [SPF, Lemma 8.5.6][SPF].

### 1.8 Relative endpoint localization and formal completion

Let $i_0:S\to X_S$ be the zero section, $I_0$ its ideal, and $z$ the transverse coordinate. Assume that locally on $S$ the pole bound fits into $m_0[0]+m_\infty[\infty]+D_{\rm fin}$ with $D_{\rm fin}$ disjoint from the endpoints and stable as a relative Cartier divisor under base change. Thus both $A$ and its inverse can be regularized by finite powers of the endpoint coordinate near either section.

On analytic bases use $i_0^{-1}\mathcal O_X[z^{-1}]$ and the corresponding localization of $i_0^{-1}E$. On both kinds of bases, form the finite jets $i_0^{-1}(\mathcal O_X/I_0^{m+1})$ and $i_0^{-1}(E/I_0^{m+1}E)$ with their transition maps. Take their inverse limits, then invert $z$. The $q$-shift acts on each construction. Give the comparison from analytic germs to the completed punctured module. At infinity use $w=z^{-1}$ and reverse the raw shift by the matrix rule in Conventions.

Prove analytic base change by scalar extension along the map of germ rings. For formal base change compare the pullbacks at each finite jet, take their limit, and then localize. Prove these comparisons in local frames, with the coherence for composites, and compare them with horizontal maps, tensor, determinant, and locally split short exact sequences. For a meromorphic horizontal isomorphism require endpoint regularization for it and its inverse. On the complex point recover $K$ and $\widehat K$. Use the resulting functors to specify local markings by §1.7.

*Needs.* §§0.1–0.4, 1.6–1.7, AlgebraicVectorBundles §§1.1–1.2, SchemeAndStackFoundations §§4.7–4.8, and ComplexComparisonPartII §§C-1.1 and C0.1–C0.4.

### Examples

- $\operatorname{diag}(t,t^{-1})$ has determinant one and Smith type $(-1,1)$. For $E=\mathcal O(d\infty)$ with $e_\infty=z^de_0$, a constant coefficient $c$ in the zero frame becomes $q^{-d}c$ in the infinity frame.
- Over $\mathbb C[\varepsilon]/(\varepsilon^2)$ the trivial connection has automorphisms $I+\varepsilon H$ for constant $H$. The rank-one system $A=1+\varepsilon$ is distinct from $A=1$ up to rational gauge. A gauge would give $h(qz)-h(z)=1$ in its first-order part, which is impossible by the constant Laurent coefficient.
- $\exp(1/z)$ has an essential singularity at zero. The moving pole $1/(z-s)$ cannot be regularized near $(0,0)$ by a power of $z$. Inverting $z$ in a finite jet kills the jet ring, whereas completing first gives $\mathcal O_S[[z]][z^{-1}]$ in the endpoint chart.

### Dependencies

Generic fibre, lattices, and Smith type precede modifications. Relative connections use the existing sheaf and descent carriers. Endpoint localization uses finite pole bounds and the finite-jet comparison, and gives the endpoint restriction functors used for the corresponding decorated groupoids.

## Layer 2: Elliptic quotients, theta functions, and regular singular systems

### 2.1 The multiplicative elliptic curve and equivariant bundles

Prove that the $q^\mathbb Z$-action on $\mathbb C^\times$ is free and properly discontinuous. The exponential map identifies $E_q$ with $\mathbb C/(2\pi i\mathbb Z+\log(q)\mathbb Z)$, a compact complex Lie group. Compare logarithm choices and the pullback and descent of holomorphic bundles. A holomorphic invertible matrix $B$ on $\mathbb C^\times$ defines a bundle $V_B$ by $(z,v)\sim(qz,B(z)v)$. Sections satisfy $s(qz)=B(z)s(z)$. Descend equivariant holomorphic and meromorphic maps and compare gauge, tensor, dual, determinant and exact sequences. Replacing the generator by $q^{-1}$ uses the factor $B(q^{-1}z)^{-1}$ for the same quotient. Identify $\mathcal M(E_q)$ with $\mathcal M(\mathbb C^\times)^{\sigma_q}$. [S03, §1.2][S03]; [VPR07, §2][VPR07].

*Needs.* §§0.3–0.4, ComplexManifolds Milestones 4 and 7, ComplexTori Milestones 1 and 3, and ComplexKahlerGeometry §§4.1 and 4.4.

### 2.2 Multiplicative theta, characters, and the q-logarithm

Convert the theta theory to
$$
\Theta_q(z)=\sum_{m\in\mathbb Z}q^{-m(m+1)/2}z^m,\quad
e_c(z)=\frac{\Theta_q(z)}{\Theta_q(z/c)},\quad
\ell_q(z)=\frac{z\Theta'_q(z)}{\Theta_q(z)}.
$$
For $c\in\mathbb C^\times$, prove $\sigma_q\Theta_q=z\Theta_q$, $\sigma_q e_c=ce_c$, and $\sigma_q\ell_q=\ell_q+1$. The series converges locally uniformly on $\mathbb C^\times$, and its zeros are the simple zeros $-q^\mathbb Z$. Compute the polar behavior of $\ell_q$ and the character shift $e_{qc}=(z/(qc))e_c$. Give the tensor comparison using the elliptic factor $e_ce_d/e_{cd}$. Right multiplication by an invertible matrix of elliptic functions is the freedom in a meromorphic fundamental solution. [S00, §1.1.2][S00]; [S03, §1.2.2][S03].

*Needs.* §§0.4, 2.1, and SpecialFunctionsTheta §§1.1–1.3, 4.1–4.2 and 5.1.

### 2.3 Constant systems and their Jordan factors

For $C=C_sC_u\in\mathrm{GL}_n(\mathbb C)$ in its multiplicative Jordan decomposition, use $e_c$ on the $c$-eigenspace of $C_s$ and $\exp(\ell_q\log C_u)$ on the unipotent part. The logarithm and exponential are finite nilpotent sums. The product $E_C$ is meromorphically invertible on $\mathbb C^\times$ and solves $\sigma_q E_C=CE_C$. Give conjugacy and direct-sum comparisons, and the tensor and dual comparisons with the elliptic character factors. [S00, §1.1.2][S00]; [S03, §1.2][S03].

*Needs.* §§0.3, 2.2, and Tau Ceti's multiplicative Jordan decomposition.

### 2.4 Regular singularity and convergent constant reduction

A local module is regular singular if it has a full $\mathbb C\{z\}$-lattice stable under $\Phi$ and $\Phi^{-1}$. Equivalently, some local meromorphic gauge makes $A$ and its inverse regular at zero. Prove reduction to an invertible constant $C$, including resonances and nontrivial Jordan blocks. Use shearing to shift eigenvalues by integral powers of $q$. For the nonresonant constant reduction of $A=C+\sum_{m\ge1} A_m z^m$, assume all operators $X\mapsto q^m XC-CX$ for $m\ge1$ are invertible. For the gauge from $C$ to $A$, solve with $H_0=I$
$$
q^m H_mC-CH_m=\sum_{j=1}^m A_j H_{m-j}.
$$
Prove convergence by a majorant estimate and local invertibility. Give uniqueness with that normalization, and the regular singular subcategory's closure under direct sums, tensor, dual, subobjects, and quotients. [S00, §§1.1.1, 1.1.3–1.1.4, 1.3][S00]; [S03, §§1.2 and 2.1][S03].

*Needs.* Layer 0, §2.3, and convergent Laurent expansions and finite-dimensional estimates.

### 2.5 The regular singular category and resonant morphisms

For constant systems $C,D$, classify horizontal maps by finite Laurent sums $H=\sum_m H_m z^m$ with $q^mH_m C=DH_m$. Only finitely many $m$ contribute by eigenvalue comparison. With these morphisms the constant systems are equivalent to the regular singular category. Produce a quasi-inverse and the tensor and exact comparisons. If eigenvalues are chosen in $1\le|c|<|q|$, maps between these normalized systems are constant. Account for normalization and the induced comparisons on tensor products. [S03, Lemma 2.1.3.2 and §2.1][S03].

*Needs.* §§0.3–0.4 and 2.4.

### Examples

- For $C=\left(\begin{smallmatrix}1&1\\0&1\end{smallmatrix}\right)$ the fundamental solution is $\left(\begin{smallmatrix}1&\ell_q\\0&1\end{smallmatrix}\right)$. From $c$ to $qc$ the map $z$ is horizontal.
- At $q=2$, $\Theta_q(3z)\Theta_q(5z)/(\Theta_q(z)\Theta_q(15z))$ is an elliptic function with distinct zero and pole orbits.

### Dependencies

The elliptic quotient and theta theory supply the global solutions of the local constant models. The slope-zero characterization of regular singularity is proved in Layer 3.

## Layer 3: Local slopes and formal types

### 3.1 Newton polygons and degree

For a cyclic presentation $D/DP$, with $P=\sum_i a_i\Phi^i$, take the lower convex hull of the upward rays at $(i,v_0(a_i))$. Define $r_M(\mu)$ as the horizontal length at slope $\mu$, with empty support for the zero module. Prove independence of cyclic presentation and invariance under translation by multiplication of the operator by a unit. Prove additivity in short exact sequences, convolution for tensor products, and the sign rule for duals. Show
$$
\sum_\mu r_M(\mu)=\operatorname{rank}M,\qquad
\deg M=\sum_\mu\mu r_M(\mu)=v_0(\det A).
$$
The denominator of $\mu$ divides $r_M(\mu)$. Ramification of degree $r$ multiplies slopes by $r$ and preserves their multiplicities. Reversal at a fixed valuation negates slopes. The annihilator of the module and the scalar operator on solutions have opposite slopes under the companion-system comparison. In [VPR07, §1.3][VPR07] the opposite shift and the polygon using $-v_0$ together give the same slopes as used here. [RSZ13, §2.2.1 and Theorem 2.2.1][RSZ13].

*Needs.* §§0.1–0.5 and Laurent valuations.

### 3.2 Analytic slope filtration and formal decomposition

Call a nonzero module pure of slope $\mu$ if its only slope is $\mu$. Construct the unique finite filtration $M_{\le\mu}$ with pure quotients in strictly increasing slope order. Characterize $M_{\le\mu}$ by the separation of slopes of the submodule and quotient at $\mu$. Use convergent factorization at the least slope and formal factorization at all slopes. Show that every map is strict and that the associated graded functor is exact, faithful, and compatible with tensor, internal Hom, and dual. Over $\widehat K$ give the natural direct-sum decomposition by maximal pure submodules, identified with the completed associated graded. For pure modules, analytic-to-formal scalar extension is fully faithful and every pure formal module has an analytic model. Prove regular singularity exactly in the all-zero slope case. [RSZ13, §§2.2.2–2.3, Theorem 2.2.4][RSZ13]; [VPR07, Proposition 1.3 and Corollaries 1.5–1.6][VPR07].

*Needs.* §3.1, Layer 0's subobjects and scalar changes, and Layer 2's regular singular classification.

### 3.3 Pure normal forms

For integral slope $\mu$, give the normal form $A=z^\mu C$, with $C$ determined up to similarity after normalizing eigenvalues in the fundamental annulus. For slope $a/r$ in lowest terms, fix $p^r=q$, use $z=u^r$, and restrict scalars on the rank-one system $Y(pu)=cu^aY(u)$. This gives a simple rank-$r$ module $E(r,a,c)$ whose isomorphism type for the fixed root is determined by $r,a$ and the class of $c^r$ in $\mathbb C^\times/q^\mathbb Z$. The indecomposables of this slope are $E(r,a,c)\otimes U_m$, where $U_m$ is one unipotent Jordan block of rank $m$. Give the direct-sum classification, its uniqueness up to permutation and isomorphism, the Hom calculation, and the tensor and dual comparisons. The rank and degree of the indecomposable are $rm$ and $am$. [RSZ13, §2.2.2][RSZ13]; [VPR07, Proposition 1.3 and Corollaries 1.5–1.7][VPR07].

*Needs.* §§3.1–3.2, Layer 2's constant classification and Layer 0's restriction of scalars.

### 3.4 Ramification and finite descent

Use the analytic and formal Galois extensions in §0.4. Descend a ramified module with a semilinear $\mu_r$-action commuting with $\Phi$ by taking invariants. Prove the comparison $K_r\otimes_K N^{\mu_r}\simeq N$, all-morphism descent, and compatibility with tensor, exact sequences and slope filtrations. Give comparisons for iterated ramification using compatible roots. Changing $p$ to $\zeta p$ on a module with descent maps $D_\zeta$ changes the semilinear operator to $D_\zeta\Phi$ and preserves the descended module. [VPR07, Proposition 1.9][VPR07]; [RSZ13, Theorem 2.2.1(iv)][RSZ13]; [S24, §§1.4 and 2.3.2][S24].

*Needs.* §§0.2, 0.4, 3.1–3.3 and Tau Ceti's finite Galois descent for vector spaces.

### 3.5 Difference cohomology and extensions

Define $\Gamma^0(M)$ and $\Gamma^1(M)$ as the kernel and cokernel of $\Phi_M-1$ over $\mathbb C$. Use native $\operatorname{Ext}^1_D$ in the category of all left $D$-modules. For finite-dimensional $N$, put $P_N=D\otimes_K N$, using the right $K$-action on $D$, and prove exactness of
$$
0\to P_N\xrightarrow{\delta_N}P_N\xrightarrow{\epsilon_N}N\to0,\qquad
\delta_N(d\otimes v)=d\Phi\otimes\Phi_N^{-1}v-d\otimes v,\quad
\epsilon_N(d\otimes v)=dv.
$$
Verify balancing with the skew relation, injectivity by the extreme Laurent coefficient, and exactness by telescoping finite Laurent sums. The $P_N$ are free over $D$. Applying Hom identifies precomposition by $\delta_N$ with $f\mapsto\Phi_M f\Phi_N^{-1}-f$. Use this presentation to compare $\operatorname{Ext}^1_D(N,M)$ with $\Gamma^1(N^\vee\otimes M)$ and with extensions having finite-dimensional middle term. The cocycle from a $K$-linear splitting $s$ is $(\Phi_Es-s\Phi_N)\Phi_N^{-1}$ valued in $M$. Compare the change of splitting, inverse construction, connecting maps, zero class and Baer sum.

For a pure analytic module of slope $\mu<0$, prove $\Gamma^0=0$ and $\dim_\mathbb C\Gamma^1=-\mu\operatorname{rank}M$, using the coefficient or $q$-Borel calculation and finite descent. For positive slopes give both vanishings, and for slope zero give Euler characteristic zero with the resonant terms. In the formal case give vanishing of both groups at nonzero slope. Thus for pure $P_i,P_j$ of ranks $r_i,r_j$ and slopes $\mu_i<\mu_j$,
$$
\operatorname{Hom}(P_j,P_i)=0,\qquad
\dim_\mathbb C \operatorname{Ext}^1(P_j,P_i)=r_i r_j(\mu_j-\mu_i).
$$
The reverse extensions split by the slope filtration. [RSZ13, Proposition 2.1.3, Theorem 3.1.1, §§3.1–3.2 and Appendix A.7][RSZ13].

*Needs.* §§0.1–0.5 and 3.1–3.4, Layer 2, Mathlib's derived-category Ext and Tau Ceti's projective presentation and Baer sum comparisons.

### 3.6 Laurent-polynomial models of pure modules

Let $R=\mathbb C[z,z^{-1}]$. For pure $P$ of slope $a/r$ define its Laurent model inside $P$ by the elements with finite-dimensional complex orbit span under $z^a\Phi^r$. Use the pure normal forms and generalized eigenspaces to prove that it is finite free over $R$, preserved by $\Phi$ and $\Phi^{-1}$, and recovers $P$ after extending to $K$. Give the comparison of all maps of pure modules with the Laurent models, the tensor, dual and split direct-sum comparisons, and compatibility with ramification and descent. A matrix for the model lies in $\mathrm{GL}_n(R)$ and has determinant $cz^d$. In the convention of [VPR07, Definition 1.8][VPR07], the orbit operator is $z^{-a}(\Phi^{-1})^r$, whose inverse differs from $z^a\Phi^r$ by a constant factor.

*Needs.* §§3.1–3.4 and Laurent polynomial and generalized eigenspace theory.

### 3.7 Pure elliptic bundles and their cohomology

Descend the pure Laurent model to a holomorphic bundle $V(P)$ on $E_q$. Give the faithful tensor comparison on pure blocks and their split sums. Its rank is the module rank, and the bundle degree for slope $\mu$ and rank $r$ is $r\mu$. Derive the sign from the theta line and extend it to rational slopes using ramification and determinant. Prove $H^0(E_q,V(P))=0$ for $\mu<0$ by the section equation. Use the Dolbeault comparison and the Cauchy–Riemann index to prove $\chi(V(P))=\deg V(P)$ and $H^2=0$. Compare the difference extension cokernel with $H^1$ of the negative-slope Hom bundle for integral gaps. [VPR07, §2, Lemma 2.1 and Theorem 2.5][VPR07]; [RSZ13, §§6.2–6.3][RSZ13].

*Needs.* §§2.1–2.2, 3.1–3.6, ComplexKahlerGeometry §§2.5, 4.1, 5.10 and 7.6–7.8, and PseudoholomorphicCurveAnalysis §§6.3–6.4 and 7.2.

### 3.8 Pure modules and semistable elliptic bundles

For each $\mu\in\mathbb Q$, prove that $V$ is an exact equivalence between the pure local category of slope $\mu$ and the semistable elliptic bundles of that slope, with zero objects and all maps. Semistability is the bound $\deg W/\operatorname{rank}W\le\mu$ for nonzero subbundles. For full faithfulness apply the finite-orbit characterization to the holomorphic section equation in the Hom model.

For essential surjectivity, first prove that an indecomposable degree-zero bundle is a degree-zero line tensored with a bundle filtered by copies of the trivial line. Use the filtration argument of [A57, Lemmas 2, 5, 6′ and 8–11][A57] after twisting by a line of degree one. For an indecomposable of slope $t/n$ in lowest terms, pull back by the cyclic degree-$n$ isogeny. The deck group permutes the isomorphism types of the indecomposable summands transitively: it acts on the central primitive idempotents of $\operatorname{End}(\pi^*V)/\operatorname{rad}$, and Reynolds averaging gives a surjection from the invariant endomorphism ring to the invariant quotient. A second orbit would give a nontrivial idempotent in a quotient of the local ring $\operatorname{End}(V)$. Rank and degree are constant along this action, so all pulled-back summands have integral slope $t$.

Twist those summands to degree zero. Realize the line factors by constant characters and the filtered factors by unipotent constant matrices. For the latter, split the pulled-back filtration on $\mathbb C^\times$ using $H^1(\mathbb C^\times,\mathcal O)=0$, then remove nonconstant Laurent coefficients successively by division by $p^k-1$ on each superdiagonal. Undo the twist. The intrinsic finite-orbit Laurent model is stable under the deck group and descends to a finite projective, hence free, module over the Laurent polynomial ring. Negative-slope Hom vanishing gives semistability of the pure images. Decompose a semistable bundle to obtain essential surjectivity on its fixed slope. Construct unit and counit and compare tensor and dual across slopes. Extend the comparison of $\operatorname{Ext}^1(P_j,P_i)$ with $H^1(\operatorname{Hom}(V(P_j),V(P_i)))$ to rational slopes by equivariant descent. [VPR07, Theorems 2.3 and 2.5][VPR07]; [M19, §10.1.3][M19].

*Needs.* §§2.1–2.5 and 3.1–3.7, ArtinAlgebras §§0.1–0.4 and 0.6, SemisimpleAlgebras Layers 0–2, ComplexKahlerGeometry §§2.3, 2.5, 4.1, 5.10 and 7.8, and finite descent along the isogeny.

### Examples

- $A=\left(\begin{smallmatrix}0&z\\1&0\end{smallmatrix}\right)$ has cyclic operator $\Phi^2-q^{-1}z^{-1}$, slope $1/2$ twice, and degree one. Ramifying by degree two preserves rank and gives slope one.
- From $\operatorname{diag}(1,z)$ to $\left(\begin{smallmatrix}1&1\\0&z\end{smallmatrix}\right)$ the upper unipotent gauge solves $z\sigma_q f-f=1$. Its formal solution is $-\sum_{m\ge0}q^{m(m-1)/2}z^m$, with radius zero. In the reverse slope order the extension splits.
- The trivial rank-one module has both difference cohomology spaces of dimension one. For ranks $1,2$ and slopes $0,1/2$ the increasing-slope extension space has dimension one.
- The degree-one theta bundle has a nonzero section from the trivial bundle. The local pure modules of slopes zero and one have zero Hom. The elliptic bundle of slope $1/2$ above has rank two and degree one.

### Dependencies

Newton and slope theory use cyclic operators and convergent factorization. Pure models use regular singular normal forms and finite descent. The elliptic comparison uses the pure Laurent models and the cited bundle cohomology and decomposition results.

## Layer 4: q-Stokes data and local analytic classification

### 4.1 Marked formal type

Fix distinct rational slopes $\mu_1<\cdots<\mu_k$ and pure analytic modules $P_i$ of ranks $r_i$. Let $M_0=\bigoplus_iP_i$. The marked objects are local analytic modules $M$ with an isomorphism $g:\operatorname{gr} M\to M_0$. A marked map satisfies $g'\operatorname{gr}(f)=g$. It is an isomorphism, unique when it exists. Write $F(M_0)$ for the classes, pointed by $(M_0,\mathrm{id})$.

For a commutative $\mathbb C$-algebra $R$, define $F(M_0)(R)$ using finite projective filtered difference modules over $R\otimes_\mathbb C K$ with the successive quotients identified with $R\otimes_\mathbb C P_i$. Use the given filtration in this functor. Prove its naturality in $R$ and construct the change of marking action. [RSZ13, Definition 2.3.1, §3.1.2 and Appendices A.3 and A.6][RSZ13].

*Needs.* §§0.2, 3.2 and 3.5.

### 4.2 Birkhoff–Guenther normal form and representability

For integral slopes choose systems $z^{\mu_i}C_i$ for the graded factors and write $A_0$ for the block diagonal matrix. Each marked class has a unique Birkhoff–Guenther matrix $A_U$, with diagonal $A_0$ and upper blocks $U_{ij}$ supported at exponents $\mu_i\le\ell<\mu_j$. Construct the unique change to this form with identity diagonal in compatible filtered frames.

Show that the coefficient functor of §4.1 for arbitrary rational slopes is represented by a scheme isomorphic to affine space of dimension
$$
N=\sum_{i<j}r_i r_j(\mu_j-\mu_i).
$$
Use the successive extension computation of §3.5 and compare the normal forms with scalar extension on all $R$. For integral slopes the normal-form coefficients are coordinates. Relate choices of coordinates via their common marked class. For two steps compare the extension parameter with Baer sum. For more than two steps retain the upper triangular gauge multiplication, which has cross terms. [RSZ13, Theorems 3.1.4 and 3.3.5, Propositions 3.3.1 and 3.3.4, and Appendix A.6][RSZ13].

*Needs.* §§3.3–3.5 and 4.1, and Mathlib's affine-space functor of points.

### 4.3 Meromorphic summation and admissible directions

For integral slopes and the models of §4.2 there is a unique upper block unipotent formal gauge $\widehat F$ from $A_0$ to $A_U$. For $c\in E_q$ exclude the directions for which there are $i<j$ and eigenvalues $\alpha$ of $C_i$ and $\beta$ of $C_j$ with $c^{\mu_i}\alpha\equiv c^{\mu_j}\beta\bmod q^\mathbb Z$. Prove that these directions form a finite set. For every other $c$, construct the unique upper block unipotent gauge $F_c$ from $A_0$ to $A_U$ meromorphic on $\mathbb C^\times$, with the $(i,j)$ block's poles on $-c q^\mathbb Z$ of order at most $\mu_j-\mu_i$. Use the theta multiplier and block recurrences, and check the bound under multiplication and inversion. If $A_U,A_V$ have the same graded model, their corresponding gauge is $F_{V,c}F_{U,c}^{-1}$. [S24, Theorem 3.1 and Lemma 3.2][S24]; [RSZ13, Chapters 5–6][RSZ13].

*Needs.* §§2.2, 3.6 and 4.2.

### 4.4 The q-Stokes sheaf and its cocycle

For $\pi:\mathbb C^\times\to E_q$, define the group sheaf $\Lambda_I(A_0)$ on $U\subset E_q$ by holomorphic upper block unipotent matrices $S$ on $\pi^{-1}(U)$ satisfying $(\sigma_qS)A_0=A_0S$. The $(i,j)$ block satisfies $\sigma_qS_{ij}=z^{\mu_i-\mu_j}C_i S_{ij}C_j^{-1}$ in the integral model. For admissible directions put $U_c=E_q\setminus\{-c\}$ and use $S_{cd}=F_c^{-1}F_d$ on $U_c\cap U_d$. Verify its cocycle, the comparison under changes of trivialization, covering refinement, and its pointed torsor class in $H^1(E_q,\Lambda_I(A_0))$. Show that the sheaf is the sheaf of automorphisms of the split filtered elliptic bundle acting identically on the graded pieces. [S24, after Corollary 3.4][S24]; [RSZ13, §4.4][RSZ13].

*Needs.* §§2.1, 3.7, 4.2–4.3, and SchemeAndStackFoundations §§1.15 and 2.3.

### 4.5 The gap filtration and realization of Stokes classes

Filter the sheaf by vanishing of blocks of gap less than $\delta>0$. The successive additive quotient at gap $\delta$ consists of the horizontal Hom blocks of that gap. The commutator adds the gap bounds, giving a finite central filtration. For a block $(i,j)$ use the Hom bundle of rank $r_i r_j$ and degree $r_i r_j(\mu_i-\mu_j)$. It has $H^0=H^2=0$, and $H^1$ of dimension $r_i r_j(\mu_j-\mu_i)$ identified with the difference extension space.

For integral slopes prove that the torsor map is a bijection: realize torsors by lifting successively through the gap quotients using the additive cohomology comparison, and recover a marked analytic gauge from equality of torsor classes. Compare the resulting affine coordinates with the Birkhoff–Guenther coordinates and identify the split module with the trivial torsor. [RSZ13, Theorem 4.4.1 and §§6.2–6.3][RSZ13]; [S24, Theorem 3.5 and §3.2.2][S24].

*Needs.* §§3.5, 3.7 and 4.2–4.4, SchemeAndStackFoundations §§1.15 and 2.3, and TopologicalSheafCohomology §§1.1–1.3.

### 4.6 Birkhoff–Malgrange–Sibuya correspondence for rational slopes

Use pure Laurent models $B_i$ for the graded factors. Define $\Lambda_I(A_0)$ by the same horizontal upper block condition for $A_0=\operatorname{diag}(B_i)$. Choose a common denominator $r$ and $p^r=q$, and pull back by $z=w^r$. The resulting slopes are integral and $E_p\to E_q$, $[w]\mapsto[w^r]$, is a degree-$r$ unramified cover with deck group $\mu_r$. Prove that ramification identifies the marked classes and the torsor classes downstairs with the respective invariant classes upstairs, and makes the classification maps commute. This gives the pointed bijection
$$
F(M_0)(\mathbb C)\simeq H^1(E_q,\Lambda_I(A_0)).
$$
Prove compatibility with changes of roots, common denominators and refinement. [S24, Propositions 3.9–3.11 and Theorem 3.13][S24].

For descent of a marked class invariant under the generator $j$ of $\mu_r$, the marked gauge $G:B\to B^j$ is unique. The iterates $G_0=I$, $G_{k+1}=G_k^jG$ satisfy $G_r=I$. The average $H=r^{-1}\sum_{k=0}^{r-1}G_k$ remains upper block unipotent and satisfies $H^jG=H$. Consequently $(\sigma_pH)BH^{-1}$ has invariant coefficients. For the torsors give the comparison of cocycles using the finite central filtration and its additive quotients.

*Needs.* §§3.4, 3.6, 3.8 and 4.3–4.5, and descent along the finite analytic cover.

### 4.7 Morphisms, changes of marking, and the quotient stack

Prove naturality of the classification under graded isomorphisms $h:M_0\to N_0$, using $g\mapsto hg$ and conjugation of the Stokes sheaf. Over $\mathbb C$, forgetting the marking gives the action groupoid of $\operatorname{Aut}(M_0)$ on $F(M_0)(\mathbb C)$, with automorphism groups given by the stabilizers. For integral-slope modules, descend their Laurent normal forms with the increasing slope filtration. Prove the exact, fully faithful tensor comparison with filtered holomorphic bundles using all filtration-preserving maps. [S09, §2.3.2, Theorem 2.4 and Lemma 2.5][S09].

For coefficient families, put $B=\operatorname{End}_{\rm diff}(M_0)$ and $G(R)=(R\otimes_\mathbb C B)^\times$. Prove that this is the automorphism functor of the scalar-extended graded object using flatness over $\mathbb C$, and represent it by the open locus where left multiplication has invertible determinant. The marking action is algebraic by naturality in $R$. Using horizontal maps preserving the filtration, form the groupoid of coefficient families whose graded object is fppf locally the specified one. Show that it is the quotient stack $[F(M_0)/G]$ by sending a family to its graded-marking torsor and equivariant classifying map, and descending the marked family in the other direction. Give the pullback comparisons and check coherence. Globally trivialized graded type gives the objectwise action groupoid. The torsor description includes nontrivial graded forms. [RSZ13, §3.1.2 and Appendices A.5–A.6][RSZ13]; [SPQ, Proposition 95.15.3][SPQ].

*Needs.* §§4.1–4.6, Mathlib's action category, and SchemeAndStackFoundations §§1.18 and 1.21.

### Examples

- For ranks $(1,1)$ and slopes $(0,3)$ the upper block has three coefficients. For ranks $(1,1,1)$ and slopes $(0,1,2)$ there are four coefficients, and the product in the $(1,3)$ block contains the cross term $S_{12}S'_{23}$.
- With ranks $(1,1)$ and slopes $(0,1)$ the marked parameters $u=1,2$ are related by a change of marking. Over the dual numbers $u=0,\varepsilon$ are distinct with the same reduction. For a single slope the marked classes form a point and the unmarked groupoid retains the full automorphism group.
- For $A_0=\operatorname{diag}(1,az)$ the forbidden direction is $a^{-1}\bmod q^\mathbb Z$. For ranks $(1,2)$ and slopes $(0,1/2)$ the marked space has dimension one, whereas the ramified space for $r=2$ has dimension two before taking invariants.

### Dependencies

Layer 3 supplies the local extension calculation and pure Laurent models. The analytic torsor comparison is over $\mathbb C$. The quotient stack uses the coefficient functor over $R\otimes_\mathbb C K$ and algebraic descent.

## Layer 5: Global connection data and reconstruction

### 5.1 Laurent models for mixed local modules and extension of maps

Let $R=\mathbb C[z,z^{-1}]$. Call a finite free difference module over $R$ globally pure of slope $\mu$ if its localizations are pure of slope $\mu$ at zero and raw slope $-\mu$ at infinity. Form the category of Laurent modules with a specified finite filtration by globally pure quotients in increasing slope order at zero. Prove that localization at zero is an equivalence with the local analytic category for all rational slopes, with all horizontal maps preserving the specified filtration. Give the comparison of models and their morphisms, the quasi-inverse and the tensor and exact comparisons. At infinity use the reversed shift: a normalized Laurent matrix $D(w)$ gives the original-shift model $B_\infty(z)=D(1/(qz))^{-1}$. [VPR07, §4, Lemma 4.2, Theorem 4.3 and Observations 4.5][VPR07].

For rational $A$ and Laurent model $B$, extend a local horizontal meromorphic map $H$ from zero by iterating $H(qz)=B(z)H(z)A(z)^{-1}$. This gives a unique meromorphic map on $\mathbb C$. At infinity the analogous map extends to $\mathbb P^1\setminus\{0\}$. Include maps of arbitrary ranks and compare their compositions and inverses where defined.

*Needs.* §§0.3–0.4, 3.2–3.6 and 4.1–4.2, and meromorphic continuation by the identity principle.

### 5.2 Meromorphic Birkhoff factorization

For $R\in\mathrm{GL}_n(\mathcal M(\mathbb C^\times))$ construct
$$
R=F_\infty^{-1}F_0,\qquad
F_0\in\mathrm{GL}_n(\mathcal M(\mathbb C)),\quad
F_\infty\in\mathrm{GL}_n(\mathcal M(\mathbb P^1\setminus\{0\})).
$$
Glue a holomorphic bundle on $\mathbb P^1$ across a small annulus on which $R$ and $R^{-1}$ are holomorphic. Apply projective GAGA and choose a rational frame of its generic fibre. Extend the two frame matrices across $\mathbb C^\times$ using $R$. Show that two factorizations differ by the same rational gauge on the left, since meromorphic functions extending over both endpoints are rational. Include the rank-zero, scalar, and direct-sum cases. [S00, §§2.2–2.3][S00]; [S03, proof of Proposition 3.1.1.3][S03].

*Needs.* ComplexManifolds Milestones 5 and 7, ComplexComparisonPartII §§C1.9 and C2.2, and the function field of $\mathbb P^1$.

### 5.3 Local analytic modules and filtered elliptic bundles

On $E_q$ use holomorphic bundles with a finite subbundle flag whose nonzero graded quotients are semistable of strictly increasing rational slopes. For any rational $\mu$, take the filtration step of largest slope $\le\mu$, or zero if there is none. The zero bundle has the empty flag. Use all filtration-preserving holomorphic maps. This specified filtration is the rational anti-Harder–Narasimhan filtration in [M19, §§1.5.1 and 10.1.3][M19].

Prove the exact symmetric monoidal equivalence with local analytic difference modules. Descend the Laurent model of §5.1 and its filtration. Model comparisons and their coherence come from the uniqueness of extension of horizontal maps. For full faithfulness, apply §4.7 after ramifying to integral slopes, then descend the maps. For essential surjectivity, realize the semistable graded quotients by §3.8. Local filtered splittings compatible with the graded identifications form a torsor under the sheaf in §4.4. Compare the cocycle of the Laurent model with this torsor using summation and descent in §§4.3–4.6, and reconstruct the filtered bundle from the resulting local module. Give unit, counit and their triangular identities. [S09, Theorem 2.4 and Lemma 2.5][S09]; [VPR07, Theorems 2.3 and 2.5][VPR07]; [RSZ13, Theorem 4.4.1][RSZ13].

Compare strictness, kernel, image and cokernel with the local category. On Laurent models, the torsion support of the cokernel of a horizontal map is finite and $q$-invariant in $\mathbb C^\times$, hence empty. This yields exactness after passage to bundles for the local short exact sequences. Give tensor filtration by adding slopes and dual filtration by negating slopes. Denote the endpoint functors by $V_0,V_\infty$, using the same $z$-coordinate on $\mathbb C^\times$ for the descended bundles. In Laurent frames, a meromorphic map from $V_0(L_0)$ to $V_\infty(L_\infty)$ corresponds to a matrix $R$ satisfying $(\sigma_qR)B_0=B_\infty R$.

*Needs.* §§2.1, 3.2, 3.8, 4.3–4.7 and 5.1, and finite analytic descent.

### 5.4 Rational modules and their connection data

Define the category of triples $(L_0,\varphi,L_\infty)$ with endpoint local analytic modules and a meromorphic isomorphism $\varphi:V_0(L_0)\dashrightarrow V_\infty(L_\infty)$ of the underlying bundles. A map to $(L'_0,\varphi',L'_\infty)$ is a pair of local horizontal maps with $\varphi' V_0(f_0)=V_\infty(f_\infty)\varphi$. The corresponding description by §5.3 keeps the filtrations on the endpoint bundles. The endpoint maps preserve their respective filtrations, while the gluing isomorphism is meromorphic between the underlying bundles.

Construct the $\mathbb C$-linear exact tensor equivalence with all finite-dimensional rational $q$-difference modules. From a rational system extend the local gauges to Laurent models by §5.1 and form the connection isomorphism on the overlap. In the other direction, choose Laurent models $B_0,B_\infty$ and a lift $R$ of $\varphi$. With $R=F_\infty^{-1}F_0$ from §5.2, reconstruct
$$
A=(\sigma_qF_0)B_0 F_0^{-1}
  =(\sigma_qF_\infty)B_\infty F_\infty^{-1}.
$$
The two expressions extend meromorphically over the endpoints and agree on the overlap. For a map of triples, use the factorizations $F_j,N_j$ of source and target to glue $H=N_0 f_0 F_0^{-1}=N_\infty f_\infty F_\infty^{-1}$ to a rational horizontal map. This comparison includes rectangular maps. Prove its inverse by localization, then compare choices, tensors and exact sequences, and identify the endpoint functors of the equivalence with localization. [VPR07, Theorem 4.3][VPR07]; [S03, the Birkhoff factorization used in Proposition 3.1.1.3][S03].

*Needs.* §§5.1–5.3 and Layer 0.

### 5.5 Birkhoff connection matrices in the regular singular case

Specialize to modules regular singular at both endpoints. Use constant matrices $C_0,C_\infty$ for the Laurent models expressed in the original $z$-shift; at infinity the constant in the reversed local system is $C_\infty^{-1}$. The gluing matrix satisfies $M(qz)C_0=C_\infty M(z)$. Maps are pairs of the endpoint Laurent horizontal maps subject to $M'f_0=f_\infty M$. For the fundamental solutions $Y_j=F_jE_{C_j}$ define
$$
P=Y_\infty^{-1}Y_0=E_{C_\infty}^{-1}M E_{C_0}.
$$
Show that $P$ descends to a meromorphic matrix on $E_q$. Track resonance, shearing and the changes $Y_j\mapsto Y_jD_j$, which give $P\mapsto D_\infty^{-1}PD_0$. Give the tensor comparison including the elliptic character factors. The classification data in these coordinates include the local constant systems and the allowed endpoint maps. [S03, Proposition 3.1.1.3 and §3.2.1][S03].

*Needs.* §§2.2–2.5 and 5.4.

### 5.6 Forgetful functors and comparison of decorated modifications

Compare bundle models, lattice families, rational modules, connection data, the endpoint filtered bundles, and the regular singular presentation by fundamental solutions. Identify the morphisms carried by the functors. Use the theta section from §3.7 to show that passing from the local module to its underlying elliptic bundle is in general non-full. Compare the change-of-marking groupoid of §4.7 with forgetting a formal marking.

For decorated groupoids $Q_\alpha,Q_\beta$ over the complex point, use the equivalence $D$ of §5.4 to compare $Q_\alpha\times^h_G Q_\beta$ with $Q_\alpha\times^h_C Q_\beta$, where $G$ and $C$ are the cores of rational modules and of connection data. The functor sends a horizontal isomorphism $B$ to $D(B)$ and keeps the decorated source and target. Use full faithfulness to construct its inverse and preserve unit, composition and inverse. Restrict the global equivalence to marked endpoint conditions using the natural comparisons of endpoint localization and formal type.

*Needs.* §§1.1–1.2, 1.7–1.8, 3.7, 4.7 and 5.3–5.5.

### Examples

- For $A=z-a$, $a\ne0$, the endpoint slopes after normalization are zero and one. A rank-two extension $0\to\mathcal O\to V\to L\to0$ for a degree-one line $L$, if nontrivial, has stable underlying bundle of slope $1/2$. Its specified filtration has slopes zero and one, and the pure object with underlying bundle $V$ has only the slope $1/2$.
- At $q=2$, the constant systems $1$ and $3$ have $P=1$ if the same fundamental solution is used at both endpoints of each system. They are not rationally gauge equivalent, since $3\notin2^\mathbb Z$.

### Dependencies

The Laurent models and Stokes realization supply the endpoint functors. Meromorphic factorization and gluing prove the global equivalence on objects and every horizontal map. This layer's classifications are over $\mathbb C$.

## Layer 6: Connection-preserving deformation and time transport

### 6.1 Transport along a time groupoid

Let $\mathcal T$ be a small groupoid, $M_t$ rational modules, and $D$ the equivalence of §5.4. A coherent transport of connection data is a choice of isomorphism $b_g:D(M_t)\to D(M_{t'})$ for each $g:t\to t'$, with identity and composition laws. Full faithfulness gives its unique horizontal lift $B_g$ once $b_g$ has been specified. Compare the groupoids of coherent transports and their natural isomorphisms. If the input specifies only the connection data, use a quasi-inverse and its comparisons to reconstruct both objects and transport. Give restriction and pullback along time functors and keep the actions of time stabilizers by automorphisms.

For relative connections use the meromorphic isomorphisms of §1.7 and their base-change laws. State the lift for a relative comparison functor wherever it is fully faithful and has coherent base-change comparisons. Lifting the objects themselves uses a relative equivalence on the chosen domain. Decorated transports use the modification comparison in §5.6 over the complex point.

*Needs.* §§0.1–0.3, 1.6–1.7 and 5.4–5.6, and functor categories.

### 6.2 Commuting time directions and q-zero curvature

Let $T_i$ be commuting bijections on the time set, and let $A(z,t)$ be the systems on a rank-$n$ component. Show that the $B_i(z,t)\in\mathrm{GL}_n(\mathbb C(z))$ define transport on the $\mathbb Z^r$ action groupoid exactly when
$$
A(z,T_i t)B_i(z,t)=B_i(qz,t)A(z,t),\qquad
B_j(z,T_i t)B_i(z,t)=B_i(z,T_j t)B_j(z,t).
$$
Use $B_{-i}(z,t)=B_i(z,T_i^{-1}t)^{-1}$ to construct transport along any word. Prove independence of the word for a given displacement and the cocycle $B_{k+\ell}(z,t)=B_k(z,T_\ell t)B_\ell(z,t)$. For other groups impose the relations in the presentation. For birational actions use equality in the function field and restrict each finite family of paths to a common domain. Compare time-dependent gauges and reversal of the spatial shift, which changes $A$ to $A(q^{-1}z,t)^{-1}$ and keeps $B_i$ and $T_i$. [B04, Introduction (3q)–(7q)][B04].

For an algebraic or analytic parameter space $S$ with commuting automorphisms $T_i$, formulate the two equations using $B_i:E\dashrightarrow T_i^*E$, the equation $(\sigma_q^*B_i)A=(T_i^*A)B_i$, and $(T_i^*B_j)B_i=(T_j^*B_i)B_j$. Use a common finite pole bound and the pullback comparisons in each equation. Pull back along $f:S'\to S$ to transport from $f^*E$ to $(T_i\circ f)^*E$. When $S'$ has time actions $T'_i$, use equivariance $fT'_i=T_i f$ to identify the targets.

More generally, use a groupoid object $\mathcal T_1\rightrightarrows\mathcal T_0$ in the respective base category. For source and target $s,t$, assume their pullbacks of $q$ agree. Give transport by a finite-pole horizontal isomorphism $B:s^*E\dashrightarrow t^*E$ on $\mathcal T_1$, with unit and $m^*B=(\operatorname{pr}_1^*B)(\operatorname{pr}_2^*B)$ for composable pairs $(h,g)$ with $m(h,g)=hg$. Construct pullback to the inverse-image groupoid along a map to $\mathcal T_0$ and compare its matrix form.

*Needs.* §§0.3, 1.6–1.7 and 6.1, SchemeAndStackFoundations §§1.14 and 1.18, and ComplexComparisonPartII §C-1.1.

### 6.3 Bundle models, framings, and uniqueness of transport

Given a rational transport and bundle models, prove that it is a regular bundle isomorphism exactly when it takes each source lattice onto its target lattice. In general use the modification of §1.4 and its determinant divisor formula. For $q$ of infinite order, choose $z_0\in\mathbb C^\times$ whose orbit avoids both singular supports. Two rational horizontal maps with the same value at $z_0$ coincide, by propagation around the orbit and finiteness of the zero set of a nonzero rational function. This gives uniqueness for transport respecting a specified framing, conditional on existence. For one time arrow, the nonempty set of horizontal isomorphisms is a right torsor for source automorphisms and a left torsor for target automorphisms. Give the conditions for a lift to preserve prescribed determinant, local type, and flags.

*Needs.* §§1.2–1.7 and 6.1–6.2.

### 6.4 Testing rational gauge equivalence with connection matrices

For regular singular systems at both endpoints, fix the choices in §5.5 for two systems $A,A'$. A rational horizontal gauge $B$ with $Y'_j=BY_j$ gives $P'=P$. Conversely, assume $P'=P$ and that both endpoint ratios $Y'_jY_j^{-1}$ and their inverses extend meromorphically over their respective endpoints. They agree on the overlap and glue to an invertible rational horizontal gauge. Under changes $Y'_j=BY_jD_j$, use $P'=D_\infty^{-1}PD_0$. Account for choices of local constants and resonant maps by the endpoint conditions. For arbitrary slopes use the triples of §5.4 for the transport criterion. [S03, §3.1][S03].

*Needs.* §§2.3–2.5, 5.2, 5.4–5.6 and 6.1.

### 6.5 Analytic parameter dependence of a local constant reduction

On a complex manifold $S$, assume $A(z,s)$ is jointly holomorphic near $\{0\}\times S$, $C(s)=A(0,s)$ is invertible, and each operator $X\mapsto q^mXC(s)-C(s)X$ is invertible for $m\ge1$. Near each $s$ construct the unique jointly holomorphic gauge $H$ with $H(0,s)=I$ and $(\sigma_qH)C=AH$, on a common positive-radius $z$-disk. Apply the recurrence in §2.4 with Cauchy bounds. On relatively compact parameter neighborhoods, the inverse operators are $O(|q|^{-m})$ for large $m$, and finitely many small $m$ are controlled by nonresonance. Prove local openness of the nonresonance locus and naturality under holomorphic pullback. The proof allows Jordan blocks and repeated eigenvalues. For an input with the contracting shift, apply reversal to the whole family and compare the recurrence for the same normalized gauge. [S00, §§1.1.1 and 1.1.3][S00].

*Needs.* §2.4, finite-dimensional holomorphic families, Cauchy estimates, and ComplexKahlerGeometry §3.1.

### 6.6 Gluing endpoint gauges with uniform pole bounds

Let $S$ be a complex manifold. For two relative systems in matrix form, assume jointly meromorphic horizontal gauges on the two endpoint charts whose restrictions agree on $\mathbb C^\times\times S$. Assume their glued matrix and its inverse have entries in $\mathcal O(D)$ and $\mathcal O(D')$, respectively, for finite flat relative effective Cartier divisors $D,D'$ on $\mathbb P^1\times S$. Prove that locally on $S$ both matrices are rational in $z$ with holomorphically varying coefficients. Choose a fixed affine chart containing the supports near a parameter, use a monic polynomial $p(z,s)$ defining $D$, and show that $pB$ is polynomial in $z$ of bounded degree with holomorphic coefficients. Apply the same argument to the inverse using $D'$. Use Weierstrass preparation to obtain the divisors with multiplicities and allow collisions. Compare changes of chart, base change, composition, inversion and the relative modification of §1.7. This theorem takes joint gauges and uniform pole bounds as inputs.

*Needs.* §§1.6–1.7 and 5.2, ComplexKahlerGeometry §§3.1–3.2 and 4.1, ComplexManifolds Milestone 7, and ComplexComparisonPartII §C0.4 for the analytification comparison.

### 6.7 Analytically trivialized families and continuous-time equations

Suppose $B(z,s_0)=I$ and $A(z,s)B(z,s)=B(qz,s)A(z,s_0)$, with the hypotheses of §6.6. Give the transport on the pair groupoid by $B(z,s')B(z,s)^{-1}$. In local coordinates set $\Omega_i=(\partial_iB)B^{-1}$. Show rationality in $z$ and
$$
\partial_i A=\Omega_i(qz,s)A-A\Omega_i(z,s),\qquad
\partial_i\Omega_j-\partial_j\Omega_i=[\Omega_i,\Omega_j].
$$
Give the coordinate, base-point, pullback, time-dependent gauge and spatial reversal comparisons. Conversely, assume a solution of the displayed equations integrates to a normalized fundamental matrix satisfying the joint meromorphic and finite-pole conditions of §6.6. Show that $B(qz,s)^{-1}A(z,s)B(z,s)$ has all parameter derivatives zero and hence equals its value at $s_0$. This proves the horizontal transport statement on a connected neighborhood.

*Needs.* §§6.1–6.2 and 6.5–6.6, holomorphic differentiation, and uniqueness of the normalized fundamental matrix.

### Examples

- For $A=I_2$ and two identity time shifts, the constant gauges $I+E_{12},I+E_{21}$ satisfy the spatial equations. Their different products show that they fail the time square.
- For $q=2$, take $B=z^2/(z^2-s)$, $A=4(z^2-s)/(4z^2-s)$ and $\Omega=1/(z^2-s)$. Check $AB=B(2z,s)$ and the compatibility derivative. The pole bounds $z^2-s=0$ and $2[0]$ satisfy §6.6 even at the collision. The moving divisor meets the zero section, so the endpoint hypothesis of §1.8 fails there.
- For $B=(I+sE_{12})(I+tE_{21})$ the coefficient $\Omega_t$ is $\left(\begin{smallmatrix}s&-s^2\\1&-s\end{smallmatrix}\right)$ and $\Omega_s=E_{12}$. Differentiating and taking the commutator give the same matrix $\left(\begin{smallmatrix}1&-2s\\0&-1\end{smallmatrix}\right)$.

### Dependencies

The global comparison supplies the transport of individual systems. Relative transport uses finite pole bounds and pullback laws. The family results use parameter estimates, jointly meromorphic endpoint data, and a normalized trivialization in the stated domains.

## Layer 7: Discrete Schlesinger transformations of polynomial systems

Let $n,d\ge1$ and $L\in\mathrm{GL}_n(\mathbb C)$. Fix $d$ labelled spectral groups $S_i=\{a_{i,\alpha}\mid 1\le\alpha\le n\}\subset\mathbb C^\times$ whose distinct labels belong to distinct $q^\mathbb Z$-orbits. The algebraic statements use any nonzero infinite-order $q$, with no semisimplicity assumption on $L$. For the analytic interpretation use the convention $|q|>1$ or reverse the contracting shift on the rational system.

### 7.1 Reordering linear matrix factors

For disjoint $n$-element spectral sets, prove that each permutation of the monic linear factors of $\prod_{i=1}^d(zI-X_i)$ has a unique refactorization with spectra in the permuted order on a nonempty Zariski-open set. The factors depend rationally on the initial ones. In the two-factor case solve $Y\Lambda-\Lambda X=I$ by invertibility of the Sylvester operator from spectral separation. On $\det\Lambda\ne0$ set $S=X+\Lambda^{-1}=\Lambda^{-1}Y\Lambda$ and $T=Y-\Lambda^{-1}=\Lambda X\Lambda^{-1}$. Verify
$$
(zI-X)(zI-Y)=(zI-S)(zI-T).
$$
Show uniqueness by comparing factorizations with the same ordered spectra, using disjoint determinant supports and the value at infinity. Prove rationality, inverse and composition laws for adjacent swaps, and comparison with conjugation and products of blocks.

For $A=L\prod_i(zI-C_i)$ with the specified spectra, a monic right factor for group $i$ comes from the kernel lines of $A(a_{i,\alpha})$. If the matrix $V$ of their generators is invertible, the factor is $zI-B_i$ with $B_i=V\operatorname{diag}(a_{i,\alpha})V^{-1}$. Prove independence of generator scaling and uniqueness and rationality of the factor and monic quotient by matrix polynomial division. [B04, Lemmas 3.2–3.4, 3.11, 4.2–4.3 and Proposition 4.8][B04].

*Needs.* §0.3, matrix polynomials, and Mathlib's generalized eigenspaces, determinant and adjugate, and finite-dimensional linear algebra.

### 7.2 Gauge shifting one spectral group

Write $A=L D_i(z)(zI-B_i)$ by §7.1 and put $R_i(z)=I-z^{-1}B_i$. Prove
$$
A^{(i)}(z)=R_i(qz)A(z)R_i(z)^{-1}=(zI-q^{-1}B_i)L D_i(z).
$$
This has the same degree and leading coefficient $L$, and moves exactly group $i$ by $a_{i,\alpha}\mapsto q^{-1}a_{i,\alpha}$. At the endpoints verify $A^{(i)}(0)=q^{-1}B_i A(0)B_i^{-1}$ and $R_i(\infty)=I$. Compute $R_i^{-1}=z(zI-B_i)^{-1}$, its determinant divisor, and the Smith types of $R_i$: $(-1,\ldots,-1)$ at zero, $(0,\ldots,0,1)$ at each $a_{i,\alpha}$, and zero at infinity. Match these to the lattice modification and the induced determinant change. Refactor $A^{(i)}$ in the prescribed order to define the rational step $T_i$. [B04, Introduction (3q)–(7q) and Remark 4.14][B04].

*Needs.* §§0.3, 1.3–1.5 and 7.1.

### 7.3 Commuting transformations on finite time ranges

For every integer $N\ge0$, construct a nonempty Zariski-open subset of the initial factor space on which the iterates $C_i(k)$ exist uniquely for $\max_j|k_j|\le N$. They are rational in the initial factors and have $\operatorname{Sp} C_i(k)=q^{-k_i}S_i$. Set $C_j=C_j(k)$, $C'_j=C_j(k+e_i)$ and require the step equation whenever its indices are in range, with products in increasing index order:
$$
\left(\prod_{j=i}^{d}(zI-q^{-1}C_j)\right)L
\left(\prod_{j=1}^{i-1}(zI-C_j)\right)
=
\left(\prod_{j=i+1}^{d}(zI-q^{-1}C'_j)\right)L
\left(\prod_{j=1}^{i}(zI-C'_j)\right).
$$
Prove path independence and invertibility, commutation as birational maps between the indicated spectral types, and the simultaneous shift $C_i(k+\mathbf1)=q^{-1}L^{-1}C_i(k)L$.

Use the twisted sequence $zI-Q_j$ with $Q_{j+d}=qLQ_jL^{-1}$ and unique refactorization. The semigroup automorphism on monic polynomials of degree $m$ is $P(z)\mapsto q^m L P(q^{-1}z)L^{-1}$. On a finite time range require every denominator in the selected finite forward and backward refactorizations to be nonzero. To prove nonemptiness, triangularize $L$ and take the initial $C_i$ diagonal in that basis. The twisted factors stay triangular under adjacent refactorization: the Sylvester operator preserves triangular matrices, and its solution there has diagonal entries given by inverses of differences of distinct spectral labels after shifting. Thus every required $\Lambda$ is invertible at this initial point. Prove compatibility of the finite constructions by restriction and uniqueness. [B04, Introduction (7q), §4(a)–(c), Proposition 4.8, Theorem 4.9 and Remark 4.14][B04].

*Needs.* §§7.1–7.2, finite-dimensional triangularization, and nonempty Zariski-open loci for rational maps.

### 7.4 The q-Schlesinger equations

For $A_k=L\prod_j(zI-C_j(k))$, let $zI-B_i(k)$ be its monic right factor of group $i$. Prove
$$
\begin{aligned}
B_i(k)-B_i(k+e_j)&=B_j(k)-B_j(k+e_i),\\
B_j(k+e_i)B_i(k)&=B_i(k+e_j)B_j(k),\\
B_i(k+\mathbf1)&=q^{-1}L^{-1}B_i(k)L,\qquad
\operatorname{Sp}B_i(k)=q^{-k_i}S_i .
\end{aligned}
$$
For $R_i(z,k)=I-z^{-1}B_i(k)$ the first two equations are the coefficients of $z^{-1}$ and $z^{-2}$ in the transport square. Together with §7.2 the square gives flat transport. Compare $C_i(k)=B_i(k+e_{i+1}+\cdots+e_d)$ and prove the converse reconstruction for generic initial data on its domain. Use a finite time range containing all auxiliary shifted indices for this comparison and then restrict to the desired indices. Give the negative time gauge $R_i(z,k-e_i)^{-1}$ and compatibility with changing the time origin. [B04, Introduction (3q)–(7q), §4 and Remark 4.14][B04].

*Needs.* §§0.3, 6.2 and 7.1–7.3.

### 7.5 Birational lattice action and preservation of connection data

Assemble the $T_i$ into a $\mathbb Z^d$-action by birational maps between the labelled spectral spaces, sending $a_{i,\alpha}$ to $q^{-k_i}a_{i,\alpha}$ at displacement $k$. Products of the $R_i$ give path-independent gauges $R_k$ with
$$
R_{k+\ell}(z,t)=R_k(z,T_\ell t)R_\ell(z,t).
$$
Via §§5.4 and 6.1 they give coherent isomorphisms of the connection data, including all endpoint analytic invariants. For the contracting shift, make this comparison after reversing the rational system, with the same gauge and time shifts. For $|q|=1$ of infinite order the algebraic action is defined on the stated domains. Prove the endpoint spectral scaling $q^{-\sum_i k_i}$ at zero and preservation of $L$. In the sum-zero sublattice the zero spectrum and $\det A(0)$ are fixed. On each finite time range provide uniform bounds on the poles of both gauge directions from zero and the finitely many shifted roots. Compare this family with §6.6.

*Needs.* §§5.4, 6.1–6.2, 6.6 and 7.2–7.4.

### Examples

- In rank one, $A=\lambda\prod_j(z-a_j)$ and $R_i=(z-a_i)/z$. The step changes the single factor to $z-q^{-1}a_i$. For degree one, $C(k)=q^{-k}L^{-k}C(0)L^k$ for every integer $k$.
- For a noncommuting rank-two, degree-two check, use $q=2$ and
  $$
  L=\begin{pmatrix}1&1\\0&1\end{pmatrix},\quad
  C_1=\begin{pmatrix}3&1\\0&5\end{pmatrix},\quad
  C_2=\begin{pmatrix}7&0\\2&11\end{pmatrix}.
  $$
  The first right factor has $B_1=\frac17\left(\begin{smallmatrix}27&24\\2&29\end{smallmatrix}\right)$. Check both spatial equations and the square. Both orders of the two steps give $C'_1=\left(\begin{smallmatrix}3/2&-1/2\\0&5/2\end{smallmatrix}\right)$ and $C'_2=\left(\begin{smallmatrix}5/2&-3\\1&13/2\end{smallmatrix}\right)$, in agreement with $2^{-1}L^{-1}C_iL$.

### Dependencies

Refactorization and the polynomial action use the algebra and lattice calculations. Coherent connection preservation uses the comparison over $\mathbb C$. The Zariski-open domain is constructed for each finite range of times.

## Downstream consumers

Specific $q$-isomonodromic systems can use Layer 1 for singularity types and modifications, Layers 3–4 for endpoint data, and §§5.4 and 6.1–6.2 for connection-preserving transport. Polynomial systems in the domain of Layer 7 can use its transformations and finite-time existence theorem. A relative problem uses §§1.6–1.8 for its underlying groupoids and endpoint data, §4.7 for fixed graded-type coefficient families, and §§6.5–6.7 when the stated analytic family hypotheses hold. A comparison over a general parameter base has its own existence, base-change and regularity hypotheses.

## Scope and ownership

This roadmap owns the $q$-specific structures on semilinear algebra, bundle models and their modifications, local classification, global comparison, and the transport and polynomial transformations specified above. Its analytic classification and global comparison allow resonance, nonsemisimple factors, and arbitrary rational slopes. The separated spectral type is the domain of the polynomial transformation theorem. Individual $q$-Painlevé equations, stability conditions and the geometry of particular moduli surfaces, cluster realizations, tau functions, confluence and difference Galois density lie outside this scope. The differential theory in [PainleveEquations](../PainleveEquations/README.md) is the counterpart for ordinary connections. The present roadmap uses the indicated algebraic, analytic and geometric suppliers directly.

## Exact supplier contracts

### From Mathlib and Tau Ceti

| Supplier | Contract used here |
| --- | --- |
| [Mathlib semilinear equivalences][ml-linear] and [module scalar change][ml-scalars] | `LinearMap` and `LinearEquiv` implement semilinearity with a `RingHomInvPair` for the inverse. `ModuleCat` supplies tensor operations, scalar restriction and extension, and the scalar change comparisons for §0.2. |
| [Mathlib skew monoid algebras][ml-skew], [lifting][ml-lift], and [skew polynomials][ml-skewpoly] | `single_mul_single`, `singleOneRingHom`, `of` and `liftNCRingHom` supply the carrier and universal map. §0.5 supplies the action, its module comparison, and the cyclic-vector theorem. |
| [Mathlib rational functions][ml-rat] and [Laurent series][ml-laurent] | Use `RatFunc` and `LaurentSeries`, the fraction-field, coefficient and valuation structures, and the rational-to-formal embedding. §0.4 supplies the analytic intermediate field comparison and equivariance. |
| [Tau Ceti meromorphic germs][tc-germ], [pullback][tc-pullback] and [stalk comparison][tc-stalk] | `TauCeti.meromorphicGerms ℂ 0` carries the field of one-variable germs. Pullback along the local biholomorphism $z\mapsto qz$ gives the shift. The holomorphic stalk and its fraction field give the valuation and regularity comparisons. |
| [Mathlib derived Ext][ml-ext], [Tau Ceti projective presentations][tc-ext] and [Baer sum][tc-baer] | Use `CategoryTheory.Abelian.Ext` and the short exact sequence class. `TauCeti.homCokernelEquivExt` consumes the explicit left-$D$ presentation of §3.5 and identifies the cokernel with Ext compatibly with pushout. |
| [Tau Ceti finite Galois descent][tc-galois] | Invariants span after scalar extension and the canonical comparison is injective. §§0.4 and 3.4 identify the field action and prove horizontality and the corresponding functorial comparisons. |
| [Tau Ceti Jordan decomposition][tc-jordan] | `LinearMap.GeneralLinearGroup.jordanDecomposition` and its specification give commuting semisimple and unipotent factors, applied to the constant model in §2.3. |
| [Tau Ceti finite locally free sheaves][tc-bundle], [pullback][tc-bundle-pull] and [determinant][tc-det] | Use `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, with fixed rank when specified, the canonical pullback, and the rankwise determinant. [Monoidal pullback][tc-monoidal] gives the unit, tensor and composition comparisons for relative connections. |
| [Tau Ceti Krull–Schmidt input][tc-ks] and [local endomorphism rings][tc-localend] | Use the finite Artinian-linear decomposition and local endomorphism inputs after verifying Hom finiteness and idempotent splitting for holomorphic bundles. |
| [Mathlib affine space][ml-affine] and [action groupoids][ml-action] | `AffineSpace.homOverEquiv` supplies the functor of points. `ActionCategory` supplies the action groupoid and stabilizers. Layers 3–4 supply the comparison with difference modules. |
| [Mathlib generalized eigenspaces][ml-eigenspace] and [triangularization inputs][ml-triangular] | Use the spanning result and the behavior under intertwiners for the Sylvester map. §7.1 adds the factorization, and §7.3 applies triangularization to $L$. |

### From other roadmaps

| Roadmap | Sections and supplied structures |
| --- | --- |
| [FormalLaurentPuiseux](../FormalLaurentPuiseux/README.md) | Layers 1, 4 and 6 give coefficient fields, substitution, bounded-denominator levels, the degree-$r$ basis and valuation rescaling, and formal Galois ramification. |
| [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) | §§1.1–1.2 give pullback and tensor coherence, §§2.1–2.2 supply exactness and base change with their stated hypotheses, and §§3.1–3.2 give exterior powers and determinants. |
| [AlgebraicCurves](../AlgebraicCurves/README.md) | §§1.1–1.2, 3.1–3.2, 5.7 and Layer 12 give the function field, local DVRs and completions, divisors, and their degrees on curves. |
| [ComplexManifolds](../ComplexManifolds/README.md) and [ComplexTori](../ComplexTori/README.md) | ComplexManifolds Milestones 3–5 and 7 give the sphere, analytic quotients, gluing, and bundle descent. ComplexTori Milestones 1 and 3 give the full lattice quotient and finite isogeny comparisons used in §§2.1, 3.8 and 4.6. |
| [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) | §§2.3 and 2.5 give planar $\bar\partial$ solvability and Dolbeault comparison. §§3.1–3.3 give analytic germs, the regularity and Laurent comparisons, and parameter analysis and Weierstrass preparation. §§4.1 and 4.4 give bundle and section sheaf comparisons. §§5.10 and 7.6–7.8 supply finite-dimensional cohomology, duality, degree and degree-zero characters on an elliptic curve. |
| [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md) and [SemisimpleAlgebras](../RepresentationTheory/SemisimpleAlgebras/README.md) | ArtinAlgebras §§0.1–0.4 and 0.6 give Fitting, Krull–Schmidt and the categorical radical. SemisimpleAlgebras Layers 0–2 give the radical quotient, matrix blocks and their central idempotents over $\mathbb C$. §3.8 applies these to deck descent. |
| [PseudoholomorphicCurveAnalysis](../PseudoholomorphicCurveAnalysis/README.md) | §§6.2–6.4 compare the kernel and cokernel of the Cauchy–Riemann operator with the analytic ones. §7.2 gives real index $r\chi_{\rm top}+2\deg V$, which yields $\chi(V)=\deg V$ on $E_q$. |
| [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) | §§1.1–1.3, 4.1–4.2 and 5.1 give theta convergence, quasi-periodicity, zeros and the logarithmic derivative. §2.2 converts them to the multiplicative convention. |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) | §§1.1, 1.14–1.16, 1.18, 1.21 and 2.3 give sheaf descent, groupoid objects, torsors, stacks, 2-fibre products, quotient stacks and nonabelian $H^1$. §§4.7–4.8 give jets and completion. §1.8 uses finite locally free frames for the relative completion comparison, with the supplier's Noetherian hypotheses retained for general coherent completion. |
| [TopologicalSheafCohomology](../TopologicalSheafCohomology/README.md) | §§1.1–1.3 give Čech refinement and its comparison with derived cohomology on a compact Hausdorff base for the additive Stokes quotients. |
| [ComplexComparisonPartII](../ComplexComparisonPartII/README.md) | §§C-1.1 and C0.1–C0.4 give possibly nonreduced complex analytic spaces, fibre products, analytic module sheaves and coherent analytification. §§C1.9 and C2.2 give projective GAGA for the bundle gluing and rational frame in §5.2. |

## References

- **S00.** J. Sauloy, *Systèmes aux q-différences singuliers réguliers : classification, matrice de connexion et monodromie*, Ann. Inst. Fourier **50** (2000), 1021–1071. [Published text][S00]
- **S03.** J. Sauloy, *Galois theory of fuchsian q-difference equations*, Ann. Sci. ENS **36** (2003), 925–968. [Published text][S03]
- **VPR07.** M. van der Put and M. Reversat, *Galois theory of q-difference equations*, Ann. Fac. Sci. Toulouse **16** (2007), 665–718. The slope comparison is in §3.1. [Published text][VPR07]
- **S09.** J. Sauloy, *Équations aux q-différences et fibrés vectoriels holomorphes sur la courbe elliptique ℂ×/q^ℤ*, Astérisque **323** (2009), 397–429. [Published text][S09]
- **RSZ13.** J.-P. Ramis, J. Sauloy, and C. Zhang, *Local analytic classification of q-difference equations*, Astérisque **355** (2013). [Published text][RSZ13]
- **S24.** J. Sauloy, *Classification analytique locale des équations aux q-différences de pentes arbitraires*, Ann. Fac. Sci. Toulouse **33** (2024), 647–679. §4.6 uses the average of the $r$ distinct iterates in Proposition 3.11. [Published text][S24]
- **B04.** A. Borodin, *Isomonodromy transformations of linear systems of difference equations*, Ann. Math. **160** (2004), 1141–1182. Layer 7 uses the refactorization theorem and its multiplicative version in Remark 4.14. [Published article](https://annals.math.princeton.edu/2004/160-3/p08) · [Preprint][B04]
- **K16.** A. Knizel, *Moduli spaces of q-connections and gap probabilities*, IMRN **2016**, 6921–6954. Layer 1 uses the numbering of arXiv:1506.06718v2. [Published article](https://doi.org/10.1093/imrn/rnv366) · [Preprint][K16]
- **A57.** M. F. Atiyah, *Vector bundles over an elliptic curve*, Proc. London Math. Soc. **7** (1957), 414–452. See pp. 420–423 and 427–428 for §3.8. [Published text][A57]
- **M19.** T. Mochizuki, *Doubly periodic monopoles and q-difference modules*, arXiv:1902.03551v1 (2019), §§1.5.1 and 10.1.2–10.1.3. [Preprint][M19]
- **SPF, SPQ, SPD.** The Stacks Project, [Stacks in groupoids][SPF], [Quotients by group actions][SPQ], and [Relative effective Cartier divisors][SPD].

[S00]: https://www.numdam.org/item/AIF_2000__50_4_1021_0/
[S03]: https://www.numdam.org/item/10.1016/j.ansens.2002.10.001/
[VPR07]: https://www.numdam.org/item/AFST_2007_6_16_3_665_0/
[S09]: https://www.numdam.org/item/AST_2009__323__397_0/
[RSZ13]: https://www.numdam.org/item/AST_2013__355__R1_0/
[S24]: https://afst.centre-mersenne.org/articles/10.5802/afst.1784/
[B04]: https://arxiv.org/abs/math/0209144v2
[K16]: https://arxiv.org/abs/1506.06718v2
[A57]: https://math.berkeley.edu/~nadler/atiyah.classification.pdf
[M19]: https://arxiv.org/abs/1902.03551v1
[SPF]: https://stacks.math.columbia.edu/tag/02ZH
[SPQ]: https://stacks.math.columbia.edu/tag/04UV
[SPD]: https://stacks.math.columbia.edu/tag/056P

[ml-linear]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Module/Equiv/Defs.lean
[ml-scalars]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Category/ModuleCat/Pseudofunctor.lean
[ml-skew]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean
[ml-lift]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean
[ml-skewpoly]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewPolynomial/Basic.lean
[ml-rat]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/FieldTheory/RatFunc/Basic.lean
[ml-laurent]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/RingTheory/LaurentSeries.lean
[ml-ext]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean
[ml-affine]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/AlgebraicGeometry/AffineSpace.lean
[ml-action]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/CategoryTheory/Action.lean
[ml-eigenspace]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/LinearAlgebra/Eigenspace/Basic.lean
[ml-triangular]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean
[tc-germ]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Meromorphic/Germ.lean
[tc-pullback]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Meromorphic/Pullback.lean
[tc-stalk]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Geometry/Manifold/Complex/StructureSheaf/MeromorphicGerm.lean
[tc-ext]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Homology/Ext/Presentation.lean
[tc-baer]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Homology/Ext/BaerSum.lean
[tc-galois]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/RepresentationTheory/GaloisDescent/Span.lean
[tc-jordan]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/LinearAlgebra/JordanChevalley/Multiplicative.lean
[tc-bundle]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean
[tc-bundle-pull]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/Functoriality.lean
[tc-det]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/Determinant/LocallyConstantRank.lean
[tc-monoidal]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/Modules/Pullback/Monoidal/Basic.lean
[tc-ks]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/CategoryTheory/Preadditive/KrullSchmidt.lean
[tc-localend]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/CategoryTheory/Preadditive/Indecomposable.lean
